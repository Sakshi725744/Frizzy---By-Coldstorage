import cv2
import numpy as np 
from pyzbar import pyzbar 
import base64
import hashlib
import hmac
import requests

def decoder(image):
    gray_img = cv2.cvtColor(image,0)
    barcode = pyzbar.decode(gray_img)
    barcodeData = barcode[0].data.decode("utf-8")
    return(barcodeData)

img = cv2.imread('sample2.jpg')
img = cv2.resize(img, (256, 256))
barcode_data = decoder(img)

# import requests

product_code = barcode_data
auth_key = "Ht02T3l6b1Gp2Zt5"
# url = "https://www.digit-eyes.com/gtin/v2_0/?upcCode=8430294019785&language=en&app_key=/0RqFjq0w5Kl&signature=2iaSwxsN67Q08MAWcvNGBYkyWso="

def make_auth_token(upc_string, auth_key):
    sha_hash = hmac.new(auth_key, upc_string, hashlib.sha1)
    return str(base64.b64encode(sha_hash.digest()))

signature = make_auth_token(bytes(product_code,'utf-8'),bytes(auth_key,'utf-8'))
signature = signature.split("'")[1]
url = "https://www.digit-eyes.com/gtin/v2_0/?upcCode=" + product_code + "&language=en&app_key=/8UkVI56LBrZ&signature=" + signature

params1 = {"field_names":"description"}
params2 = {"field_names":"ingredients"}

r1 = requests.get(url=url, params=params1)
r2 = requests.get(url=url, params=params2)
product_name = r1.json()['description']
expiry = r2.json()['ingredients']

index = expiry.find("Best before")
expiry = expiry[index+12:index+22] 
print(product_name)
print(expiry)