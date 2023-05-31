import face_recognition
import glob
import cv2
import os
class New_Face():
    def __init__(self,image):
        self.image = image
        self.known_face_encodings = []
        self.known_face_names = []
    def get_new_face(self):
        images_path = "images/*"
        images_path = glob.glob(os.path.join(images_path, "*.*"))
        for img_path in images_path:
            img = cv2.imread(img_path)
            rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            basename = os.path.dirname(img_path)
            (filename) = os.path.split(basename)[-1]
            encodings = face_recognition.face_encodings(rgb_img)
            if len(encodings) > 0:
                img_encoding = encodings[0]
            self.known_face_encodings.append(img_encoding)
            self.known_face_names.append(filename)
        file_for_encode = open('src/dataset1.txt','w')
        file_for_encode.write(str(self.known_face_encodings).replace('array','').replace('(' , '').replace(')' , ''))
        file_for_encode.close()
        file_for_names = open('src/names.txt','w')
        for i in self.known_face_names:
            file_for_names.write(i+'\n')
            file_for_names.close()
