print("Wait a few seconds")
print("The models will be intialize")
from models import Feature
import json
from googletrans import Translator
import socket
from picamera2 import Picamera2, Preview
import time
#--------------------------------------------------------------
class_names={0:'0.5 coin ',1:'0.5 egyption pound ',2:'1 egyption pound',
    3:'1 egyption pound coin ',4:'10 egyption pound',5:'10 egyption pound new',6:'100 egyption pounds',
    7:'20 egyption pounds',8:'200 egyption pounds',9:'5 egyption pounds',0:'50 egyption pounds'}

class_food=['Baked Potato','Burger','Crispy Chicken','Donut','Fries','Hot Dog','Pizza','Sandwich',
 'Taco','Taquito','apple','banana','beetroot','bell pepper','cabbage',
 'capsicum','carrot','cauliflower','chilli pepper','corn',
 'cucumber','eggplant','garlic','ginger',
 'grapes','jalepeno','kiwi','lemon','lettuce','mango','onion',
 'orange','paprika','pear','peas','pineapple',
 'pomegranate','potato','raddish','soy beans','spinach',
 'sweetcorn','sweetpotato','tomato','turnip','watermelon']
#--------------------------------------------------------------
trans = Translator()
picam2 = Picamera2()
camera_config = picam2.create_still_configuration(main={"size": (1920, 1080)}, lores={"size": (640, 480)}, display="lores")
picam2.configure(camera_config)
picam2.start_preview(Preview.QTGL)
picam2.start()
# Create Server to recevice action from client
HEADER = 64
FORMAT = 'utf-8'
port = 8080
SERVER = socket.gethostbyname(socket.gethostname())
addr = (SERVER,port)
server_sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
server_sock.bind(addr)
def client(conn , address):
    print("Connected to {}".format(address))
    connected = True
    while connected:
        msg = conn.recv(HEADER).decode(FORMAT)
        if len(msg) > 0 :
            message = start(msg)
            print(message)
            encoded_message = json.dumps(message)
            conn.send(bytes(encoded_message , FORMAT))
        else:
            connected = False
    conn.close()
def start_server():
    server_sock.listen(1)
    print("Wait For Connection .... {}".format(SERVER))
    while True:
        con , address = server_sock.accept()
        client(con , address)
#-------------------------------------------------------------------
def start(feature):
    picam2.capture_file("test.jpg")
    if feature == "1" or feature == "2":
        features_object = Feature("test.jpg")
        output1 , output2 = features_object.face_detection()
        if feature == "1":
            output = output1
        else:
            output = output2 
    elif feature == "3" or feature == "4":
        features_object = Feature("test.jpg")
        output1 , output2 = features_object.describe_scene()
        if feature == '3':
            output = output1
        else:
            output = output2
    elif feature == "5" or feature == "6":
        features_object = Feature("test.jpg")
        output = features_object.cash_detection()
        if feature == '5':
            output = class_names[output]
            output = trans.translate(output , dest = 'ar').text
        else:
            output = class_names[output]
    elif feature == "7" or feature == "8":
        features_object = Feature("test.jpg")
        output1, output2 = features_object.object_detection()
        if feature == "7":
            output = output1
        else:
            output = output2
    elif feature == "9" or feature == '10':
        features_object = Feature("test.jpg")
        output = features_object.read_text()
    elif feature == "11" or feature == "12":
        features_object = Feature("test.jpg")
        output = features_object.food_detection()
        if feature == "11":
            output = class_food[output]
            output = trans.translate(output, dest='ar').text
        else:
            output = class_food[output]
    else:
        output = ''
    return output
start_server()