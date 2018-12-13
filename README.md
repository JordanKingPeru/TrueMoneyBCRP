# True Money repositorio

## Problema general:
Identificación del problema:
- Conocimiento empirico de los elementos de seguridad de los billetes y monedas.
- Deficiente difusión de información relacionado a las novedades de billetes y monedas .
- Valoración empírica sobre riesgos de estafas de billetes y monedas falsas. 

## Satisfacción

Solución del problema identificado y cómo se siente el ususario. 

- Conocer de forma clara y precisa los elementos de seguridad de los billetes y monedas. 
- Central de noticias sobre las novedades de billetes y monedas:
- Toma de decisión sobre riesgos de estafas basados en estadísticas: (1) Días de semana y horas más frecuentes de personas estafadas, (2) distritos con indicadores de estafas elevadas, (3)entre otros.

## Funcionalidad del aplicativo

Describe la base tecnológica de la solución propuesta.

- Comprobar: Guía interactiva para que el usuario identifique, compruebe y valide los elementos de seguridad de los billetes y monedas de manera interactiva. Incluye interacciones con la cámara para: (1) Identificar la versión del billete, (2) Verificar la existencia de la marca de agua, (3) Verificar la superposición perfecta del número que representa el valor del billete en la esquina superior izquierda de su anverso, (4) Verificar el efecto de cambio de color del número que representa el valor del billete y se ubica en la parte central izquierda de su anverso, (5) En el reverso de los billetes, capturar una foto  a tavés del zoom de la cámara identificar los detalles perfectos de los billetes. (6) A través de la Realidad Aumentada aplicada en la cámara se identificará la ubicación de los elementos de seguridad de los billetes.
- Historias: Centralizar las noticias de diferentes medios de comunicación en internet sobre los acontecimientos y novedades de los billetes y monedas. Asimismo, informar sobre hechos históricos resaltantes sobre los billetes y las monedas.
- Estadísticas: Dotar de información sobre estafas relacionados a billetes y monedas para que el usuario pueda tomar decisiones y medir el riesgo respecto a características generales como día de la semana, hora de día, ubicación a nivel distrital.


import cv2
from blend_modes import blend_modes
import numpy as np

#combinando dos imagenes
img1 = cv2.imread('f50jk.jpg',-1)
img2 = cv2.imread('shakibeca.jpg',-1)

imgt1 = cv2.resize(img1,(270,230))
#imgt1 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
cv2.imshow('dst',imgt1)
cv2.waitKey(0)
imgt2 = cv2.resize(img2,(230,230))
imgt2 = cv2.cvtColor(imgt2, cv2.COLOR_BGR2GRAY)
#cv2.imshow('dst',imgt2)
#cv2.waitKey(0)

#negativo
#imgt1i = cv2.bitwise_not(imgt1)

#flip
imgt1i = cv2.flip(imgt1,1)
imgt1i = cv2.flip(imgt1i,-1)
cv2.imshow('dst',imgt1i)
cv2.waitKey(0)

#image_fusion = cv2.addWeighted(imgt1,0.5,imgt1i,0.5,0)
#image_fusion = cv2.add(imgt1,imgt1i)
#img1f = cv2.imread('shakota.jpg',-1).astype(float)

#grabar las imagenes

#cv2.imwrite('img1.jpg',imgt1)
#cv2.imwrite('img2.jpg',imgt1i)
#img1f = cv2.imread('img1.jpg',-1).astype(float)
#img2f = cv2.imread('img2.jpg',-1).astype(float)

#b_channel, g_channel, r_channel = cv2.split(img1f)
#alpha_channel = np.ones(b_channel.shape, dtype=b_channel.dtype) * 50 #creating a dummy alpha channel image.
#img1f = cv2.merge((b_channel, g_channel, r_channel, alpha_channel))

#b_channel, g_channel, r_channel = cv2.split(img2f)
#alpha_channel = np.ones(b_channel.shape, dtype=b_channel.dtype) * 50 #creating a dummy alpha channel image.
#img2f = cv2.merge((b_channel, g_channel, r_channel, alpha_channel))

#image_fusion = blend_modes.addition(img1f,img2f,0.5)
#image_fusion = cv2.gemm(imgt1,imgt1i,1.0,none)
image_fusion = cv2.addWeighted(imgt1,0.5,imgt1i,0.5,0)
contrast = 55
f = 131*(contrast + 127)/(127*(131-contrast))

image_fusion = cv2.addWeighted(image_fusion,f,image_fusion,0,127*(1-f))
image_fusion = image_fusion[:, :, 2]#100 canal 1.. 50 canal 2
contrast = 20
image_fusion = cv2.addWeighted(image_fusion,f,image_fusion,0,127*(1-f))
contrast = 30
image_fusion = cv2.addWeighted(image_fusion,f,image_fusion,0,127*(1-f))
contrast = 30
image_fusion = cv2.addWeighted(image_fusion,f,image_fusion,0,127*(1-f))
#crop image
image_fusion1 = image_fusion[0:100, 0:270] # y,x
image_fusion2 = cv2.flip(image_fusion1,1)
image_fusion2 = cv2.flip(image_fusion2,-1)
image_fusion = np.concatenate((image_fusion1, image_fusion2), axis=0)
#result image
cv2.imshow('result',image_fusion)
cv2.waitKey(0)
cv2.destroyAllWindows()


##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################
##############################################################################################################################


import requests
import base64
import json

headers = {
    'Content-Type': 'application/json',
}

params = (
    ('key', 'AIzaSyAzHbMXGH6GKPRGhNaSp6ikWHrQlpz9Zw8'),
)


#convertir las imagenes a binario. base64
with open("seriev.jpg", "rb") as image_file:
    encoded_string_seriev = base64.b64encode(image_file.read())
    

with open("serieh.jpg", "rb") as image_file:
    encoded_string_serieh = base64.b64encode(image_file.read())    
#generar los JSON

seriev_data = {
  "requests": [
    {
      "image": {
        "content": encoded_string_seriev.decode('ascii')
      },
      "features": [
        {
          "type": "TEXT_DETECTION"
        }
      ]
    }
  ]
}


serieh_data = {
  "requests": [
    {
      "image": {
        "content": encoded_string_serieh.decode('ascii') 
      },
      "features": [
        {
          "type": "TEXT_DETECTION"
        }
      ]
    }
  ]
}

with open('seriev.json', 'w') as outfile:
    json.dump(seriev_data, outfile)    
    
with open('serieh.json', 'w') as outfile:
    json.dump(serieh_data, outfile)    

#print(encoded_string_seriev)    
#print(encoded_string_serieh)    

#leer las imagenes y convertirlas a base 64

#serie uno
#----------
data = open('seriev.json', 'rb').read()
response = requests.post('https://vision.googleapis.com/v1/images:annotate', headers=headers, params=params, data=data)
jsonresponse = response.json()
serie_vertical = jsonresponse['responses'][0]['textAnnotations'][0]['description']
serie_vertical = serie_vertical.replace('O','0')
serie_vertical = serie_vertical.replace('\n','')
print("serie vertical: " + serie_vertical)

#serie dos
#----------
data = open('serieh.json', 'rb').read()
response = requests.post('https://vision.googleapis.com/v1/images:annotate', headers=headers, params=params, data=data)
jsonresponse = response.json()
serie_horizontal = jsonresponse['responses'][0]['textAnnotations'][0]['description']
serie_horizontal = serie_horizontal.replace('O','0')
serie_horizontal = serie_horizontal.replace('\n','')
print("serie horizontal: " + serie_horizontal)


#coinciden:
if serie_horizontal == serie_vertical:
    print("las series son IGUALES")
else:
    print("las series son DIFERENTES")

#verificar con el bcrp. no disponible.

#algoritmo de distancias.
import requests
r = requests.post(
    "https://api.deepai.org/api/image-similarity",
    files={
        'image1': open('img1.jpg', 'rb'),
        'image2': open('img2.jpg', 'rb'),
    },
    headers={'api-key': 'cfa96194-a402-44e8-b67a-1e3f33ff80df'}
)

distancia_json = r.json()
distancia = distancia_json['output']['distance']
print("La distancia de las caras son:" + str(distancia))
#algoritmo con el numero 100.

#BCR servicio que no responden.

#import requests
#url = 'http://ec2-34-220-86-67.us-west-2.compute.amazonaws.com/billetes'
#payload = {}
#headers = {}
#response = requests.request('GET', url, headers = headers, data = payload, allow_redirects=False, timeout=None)
#print(response.text)

#https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
#https://stackoverflow.com/questions/39308030/how-do-i-increase-the-contrast-of-an-image-in-python-opencv/41075028
