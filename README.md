## Creación del ejecutable (.exe)

Este proyecto puede compilarse como un ejecutable independiente utilizando PyInstaller.
A continuación se detallan los pasos necesarios para realizar el proceso correctamente.

### 1. Instalación de dependencias

Antes de generar el ejecutable, asegúrese de tener instaladas las siguientes librerías:

pip install pillow pygame

Estas bibliotecas permiten la manipulación de imágenes (Pillow) y la reproducción de audio (Pygame).

### 2. Instalación de PyInstaller

PyInstaller se utiliza para empaquetar el código y sus dependencias en un solo archivo ejecutable:

pip install pyinstaller

### 3. Creación del ejecutable

En la terminal, diríjase a la carpeta donde se encuentra el archivo principal (por ejemplo, parcheador.py):

cd "C:\Ruta\de\la\carpeta"

Ejecute el siguiente comando para generar el ejecutable:

pyinstaller --noconsole --onefile --add-data "cosas;cosas" --add-data "parche;parche" --icon="C:\Ruta\del\icono.ico" parcheador.py

Descripción de los parámetros:
--noconsole  evita que se abra una ventana de consola al ejecutar el programa
--onefile    genera un único archivo .exe
--add-data   incluye carpetas necesarias dentro del ejecutable
--icon       establece el icono del programa
parcheador.py  es el archivo principal del proyecto

Nota: en sistemas Linux o macOS, reemplace el punto y coma (;) por dos puntos (:)
Por ejemplo: --add-data "cosas:cosas"

### 4. Ubicación del ejecutable

Una vez completado el proceso, el archivo generado se encontrará en la carpeta:

dist\parcheador.exe

Este archivo puede distribuirse junto con las carpetas “cosas” y “parche” o empaquetarse de forma independiente si se incluyeron con la opción --add-data.
