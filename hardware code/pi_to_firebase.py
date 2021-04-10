import RPi.GPIO as GPIO 
GPIO.setwarnings(False) 
GPIO.setmode(GPIO.BOARD) 
GPIO.setup(10, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(11, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

from datetime import datetime
from picamera import PiCamera
from time import sleep
import os

import pyrebase

firebaseConfig = {
    'apiKey': "AIzaSyDUKxkxr5CoFY6H1pJfXbC6My3c4W-jWFo",
    'authDomain': "vatsal-project-df2d5.firebaseapp.com",
    'databaseURL': "https://vatsal-project-df2d5.firebaseio.com",
    'projectId': "vatsal-project-df2d5",
    'storageBucket': "vatsal-project-df2d5.appspot.com",
    'messagingSenderId': "1063047828000",
    'appId': "1:1063047828000:web:8600b73dc0477b92d7a245"
}

firebase = pyrebase.initialize_app(firebaseConfig)

storage = firebase.storage()

camera = PiCamera()

while True: 
  try:
    if GPIO.input(10) == GPIO.HIGH:
        print("food pushed")
        now = datetime.now()
        dt = now.strftime("%d%m%Y%H:%M:%S")
        food = dt+".jpg"
        camera.capture(food)
        print(food+" saved")
        storage.child(food).put(food)
        print("Image sent")
        os.remove(food)
        print("File Removed")
        sleep(2)
    elif GPIO.input(11) == GPIO.HIGH:
        print("barcode pushed")
        now = datetime.now()
        dt = now.strftime("%d%m%Y%H:%M:%S")
        barcode = dt+".jpg"
        camera.capture(barcode)
        print(barcode+" saved")
        storage.child(barcode).put(barcode)
        print("Image sent")
        os.remove(barcode)
        print("File Removed")
        sleep(2)
  except:
        camera.close()
	
