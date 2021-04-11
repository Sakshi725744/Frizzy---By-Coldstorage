from tensorflow.keras.models import load_model
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing import image

def model_predict(img_path, model):
    img = image.load_img(img_path, target_size=(224, 224))

    # Preprocessing the image
    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)

    preds = model.predict(x)
    result = np.argmax(preds)
    return result

#def main():
MODEL_PATH = 'model.h5'
file_path = 'sample_model4.jpg'
model = tf.keras.models.load_model(MODEL_PATH)
result = model_predict(file_path, model)
print(result)