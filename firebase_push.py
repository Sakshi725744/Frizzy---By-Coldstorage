import pyrebase
import barcode_scanner

firebaseConfig = {
    "apiKey": "AIzaSyD0QRmiaH50L5zQO--adS4hNktPQNc8ru0",
    "authDomain": "frizzy-bb8c1.firebaseapp.com",
    "databaseURL": "https://frizzy-bb8c1-default-rtdb.firebaseio.com",
    "projectId": "frizzy-bb8c1",
    "storageBucket": "frizzy-bb8c1.appspot.com",
    "messagingSenderId": "369007911673",
    "appId": "1:369007911673:web:b4ca2df4ffde29ea7eb828",
    "measurementId": "G-MZ1ZPRNGKR"
  }

firebase = pyrebase.initialize_app(firebaseConfig)

storage = firebase.storage()

prod_name, exp_date = barcode_scanner.main()

yyyy = exp_date[6:]
mm = exp_date[3:5]
dd = exp_date[0:2]

exp_date = yyyy+"-"+mm+"-"+dd