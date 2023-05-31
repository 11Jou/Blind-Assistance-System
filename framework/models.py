import cv2
import io, os
from googletrans import Translator
import face_recognition
import numpy as np
import pandas as pd
import ast
from PIL import Image
from pickle import load
import tensorflow
import keras
from keras.utils import img_to_array , pad_sequences
from keras.applications.mobilenet import preprocess_input
from keras.models import load_model
import torch
import torchvision
from torch.autograd import Variable
from torchvision import transforms
from google.cloud import vision

trans = Translator()
class Feature:
    def __init__(self,image):
        self.image = image
# Describe Scene
    def extract_feature(self ,filename,model):
        image = Image.open(filename)
        image = image.resize((224,224))
        image = img_to_array(image)
        image = image.reshape((1,image.shape[0],image.shape[1],image.shape[2]))
        image = preprocess_input(image)
        feature = model.predict(image,verbose=1)
        return feature
    
    def predict_caption(self , model, image, tokenizer, max_length):
        in_text = 'startseq'
        for i in range(max_length):
            sequence = tokenizer.texts_to_sequences([in_text])[0]
            sequence = pad_sequences([sequence], max_length)
            yhat = model.predict([image, sequence], verbose=0)
            yhat = np.argmax(yhat)
            word = self.idx_to_word(yhat, tokenizer)
            if word is None:
                break
            in_text += " " + word
            if word == 'endseq':
                break
        return in_text
    
    def idx_to_word(self , integer, tokenizer):
        for word, index in tokenizer.word_index.items():
            if index == integer:
                return word
        return None

    def describe_scene(self):
        image_path = self.image
        model = load_model('src/Describe Scene.h5')
        tokenizer = load(open("src/tokenizers.p","rb"))
        mobilenet_model = tensorflow.keras.applications.MobileNetV2()
        mobilenet_model = keras.models.Model(inputs=mobilenet_model.inputs,outputs=mobilenet_model.layers[-2].output)
        photo = self.extract_feature(image_path, mobilenet_model)
        img = Image.open(image_path)
        img = img.resize((224,224))
        description = self.predict_caption(model, photo, tokenizer, 28)
        text = description[9:-7]
        textEn = text
        text = trans.translate(text , dest = 'ar').text
        return text, textEn
#------------------------------------------------------------------
# Face Detection
    def face_detection(self):
        image_path = self.image
        file = open("src/names.txt","r")
        names = file.read()
        names_list = []
        file1 = open('src/dataset1.txt','r')
        text = file1.read()
        encoder = ast.literal_eval(text)
        for line in names.split('\n'):
            names_list.append(line)
        img2 = cv2.imread(image_path)
        rgb_img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
        face_locations = face_recognition.face_locations(rgb_img2)
        face_encodings = face_recognition.face_encodings(rgb_img2, face_locations)
        name = {}
        name2 = {}
        width = img2.shape[1]
        for (top, right, bottom, left), face_encoding in zip(face_locations, face_encodings):
            matches = face_recognition.compare_faces(encoder, face_encoding)
            face_distance = face_recognition.face_distance(encoder, face_encoding)
            best_match_index = np.argmin(face_distance)
            if matches[best_match_index]:
                location = (right + left) // 2
                name2[names_list[best_match_index]] = self.position2(location,width)
                name[trans.translate(names_list[best_match_index] , dest = 'ar').text] = self.position(location,width)
                return name , name2
            else: 
                name = 'New Person'
                name2 = "وجه جديد"
                return name2, name
        return   'لا يوجد اشخاص في هذه المنطقة' ,'There is no people here' 
            #-----------------------------------------------------------------------
# Cash Detection 
    def cash_detection(self):
        im = self.image
        model = torchvision.models.mobilenet_v3_small(pretrained=True)
        num_ftrs = model.classifier[-1].in_features
        model.classifier[-1] = torch.nn.Linear(num_ftrs, 11)
        model.load_state_dict(torch.load('src/cash_mobv3.pth', map_location=torch.device('cpu')))
        model.eval()
        data_transforms = {
        'val':torchvision.transforms.Compose([transforms.Resize((150,150)),
                                transforms.ToTensor(),
                                transforms.Normalize([0.5, 0.5, 0.5],
                                    [0.5, 0.5, 0.5])])}
        img = Image.open(im)
        img_tens = data_transforms['val'](img)
        img_im = img_tens.unsqueeze(0) 
        uinput = Variable(img_im)
        out = model(uinput)
        out = out.data.cpu().numpy().argmax()    
        return out
#------------------------------------------------------------------------
#Object Detection 
    def object_detection(self):
        os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r"src/ServiceAccountToken.json"
        client = vision.ImageAnnotatorClient()
        image_path = self.image
        with io.open(image_path, 'rb') as image_file:
            content = image_file.read()
        image = vision.Image(content=content)
        response = client.object_localization(image=image)
        localized_object_annotations = response.localized_object_annotations
        objects = {}
        objects_arabic = {}
        img = cv2.imread(image_path)
        width = img.shape[1]
        if len(localized_object_annotations) !=0:
            for obj in localized_object_annotations:
                x1_normalized = float(str(obj.bounding_poly.normalized_vertices[0]).split('\n')[0][3:])
                x2_normalized = float(str(obj.bounding_poly.normalized_vertices[1]).split('\n')[0][3:])
                width_object = (x1_normalized * width + x2_normalized * width) // 2
                if obj.name not in objects:
                    objects[obj.name] = [self.position2(width_object,width)]
                    objects_arabic[trans.translate(obj.name , dest = 'ar').text] = [self.position(width_object,width)]
                else:
                    objects[obj.name].append(self.position2(width_object,width))
                    objects_arabic[trans.translate(obj.name , dest = 'ar').text].append(self.position(width_object,width))
            return objects_arabic , objects
        else:
            return 'لا يوجد أشياء في هذه المنطقة' , 'There is no objects here'
#-------------------------------------------------------------------
    def position(self , width_object, width):
        location = ''
        if width_object in range(0,int(width//3)) :
                location = "في اليسار"
        elif width_object in range(int(width//3),int(width // (3/2))) :
                location = "في الوسط"
        else:
                location = "في اليمين"
        return location
    
    def position2(self , width_object,width):
        location = ''
        if width_object in range(0,int(width//3)) :
                location = "in the left"
        elif width_object in range(int(width//3),int(width // (3/2))) :
                location = 'in the middle'
        else:
                location = 'in the right'
        return location
    def read_text(self):
        os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r"src/ServiceAccountToken.json"
        client = vision.ImageAnnotatorClient()
        image_path = self.image
        with io.open(image_path, 'rb') as image_file:
            content = image_file.read()
        image = vision.Image(content=content)
        response = client.text_detection(image=image)
        df = pd.DataFrame(columns=['locale', 'description'])
        texts = response.text_annotations
        if len(texts) != 0:  
            for text in texts :
                df = df.append(dict(locale=text.locale,description=text.description),ignore_index=True)
            desc = df['description'][0]
            return desc
        else:
            pass
#---------------------------------------------------------------------------------------------------
    def food_detection(self):
        model = torchvision.models.mobilenet_v3_large(pretrained=True)
        num_ftrs = model.classifier[-1].in_features
        model.classifier[-1] = torch.nn.Linear(num_ftrs, 46)
        model.load_state_dict(torch.load('src/food.pkl' , map_location="cpu"))
        model.eval()
        data_transforms = {'val':torchvision.transforms.Compose([transforms.Resize((150,150)),transforms.ToTensor(),transforms.Normalize([0.5, 0.5, 0.5],[0.5, 0.5, 0.5])])}
        img = Image.open(self.image)
        img_tens = data_transforms['val'](img)
        img_im = img_tens.unsqueeze(0) 
        uinput = Variable(img_im)
        out = model(uinput)
        out = out.data.cpu().numpy().argmax()    
        return out












