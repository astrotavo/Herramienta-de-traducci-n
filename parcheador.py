import os
import shutil
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from PIL import Image, ImageTk
import pygame
import webbrowser
import sys

if getattr(sys, 'frozen', False):
    carpeta_script = os.path.dirname(sys.executable)
else:
    carpeta_script = os.path.dirname(os.path.abspath(__file__))

volumen = 0.5

def elegir_ruta():
    carpeta = filedialog.askdirectory(title="selecciona la carpeta del juego")
    if carpeta:
        exe_objetivo = os.path.join(carpeta, "FNF - Vs. RetroSpecter.exe")
        if not os.path.isfile(exe_objetivo):
            messagebox.showerror(
                "Error en la ruta",
                "Error: selecciona la carpeta donde está 'FNF - Vs. RetroSpecter.exe'"
            )
            return
        entrada.delete(0, tk.END)
        entrada.insert(0, carpeta)

def crear_carpeta_si_no_existe(ruta):
    carpeta = os.path.dirname(ruta)
    if carpeta and not os.path.isdir(carpeta):
        os.makedirs(carpeta, exist_ok=True)

def parchear():
    ruta_objetivo = entrada.get().strip()
    carpeta_parche = os.path.join(carpeta_script, "parche")
    for widget in frame_mensajes.winfo_children():
        widget.destroy()
    if not ruta_objetivo:
        tk.Label(frame_mensajes, text="pone la ruta del juego primero", fg="red", bg="#1e1e1e").pack()
        return
    exe_objetivo = os.path.join(ruta_objetivo, "FNF - Vs. RetroSpecter.exe")
    if not os.path.isfile(exe_objetivo):
        messagebox.showerror(
            "Error en la ruta",
            "Error: selecciona la carpeta donde está 'FNF - Vs. RetroSpecter.exe'"
        )
        return
    if not os.path.isdir(carpeta_parche):
        tk.Label(frame_mensajes, text="no se encontró la carpeta 'parche'", fg="red", bg="#1e1e1e").pack()
        return
    exitos = 0
    errores = []
    for raiz, _, archivos in os.walk(carpeta_parche):
        for archivo in archivos:
            origen = os.path.join(raiz, archivo)
            relativa = os.path.relpath(origen, carpeta_parche)
            destino = os.path.join(ruta_objetivo, relativa)
            try:
                if os.path.isfile(destino):
                    backup = destino + ".bak"
                    crear_carpeta_si_no_existe(backup)
                    shutil.copy2(destino, backup)
                else:
                    crear_carpeta_si_no_existe(destino)
                shutil.copy2(origen, destino)
                exitos += 1
            except Exception as e:
                errores.append(f"error al copiar {relativa}: {e}")
    if exitos:
        tk.Label(frame_mensajes, text=f"listo ({exitos} archivos reemplazados)", fg="green", bg="#1e1e1e").pack()
    for err in errores:
        tk.Label(frame_mensajes, text=err, fg="red", bg="#1e1e1e").pack()

def ajustar_volumen(delta):
    global volumen
    volumen = max(0.0, min(1.0, volumen + delta))
    pygame.mixer.music.set_volume(volumen)
    mostrar_volumen()

def mostrar_volumen():
    for widget in frame_mensajes.winfo_children():
        widget.destroy()
    porcentaje = int(volumen * 100)
    tk.Label(frame_mensajes, text=f"volumen: {porcentaje}%", fg="white", bg="#1e1e1e").pack()

def tecla_presionada(event):
    if event.keysym in ("plus", "equal"):
        ajustar_volumen(0.1)
    elif event.keysym == "minus":
        ajustar_volumen(-0.1)

ventana = tk.Tk()
ventana.title("parcheador Retrospecter")
ventana.geometry("854x480")
ventana.configure(bg="#1e1e1e")

ruta_fondo = os.path.join(carpeta_script, "cosas", "fondo.jpg")
if os.path.isfile(ruta_fondo):
    imagen_fondo = Image.open(ruta_fondo).resize((854, 480))
    fondo = ImageTk.PhotoImage(imagen_fondo)
    tk.Label(ventana, image=fondo).place(x=0, y=0, relwidth=1, relheight=1)

ruta_musica = os.path.join(carpeta_script, "cosas", "musica.ogg")
if os.path.isfile(ruta_musica):
    pygame.mixer.init()
    pygame.mixer.music.load(ruta_musica)
    pygame.mixer.music.set_volume(volumen)
    pygame.mixer.music.play(-1)

iconos = [
    ("astrotavo.png", "https://twitter.com/Astrotavo9199", "traductor y coder"),
    ("ackuro.png", "https://x.com/ackuro_art", "artista del fondo")
]

imagenes_iconos = []
canvas_iconos = tk.Canvas(ventana, bg="#1e1e1e", highlightthickness=0, bd=0)
canvas_iconos.place(x=0, y=ventana.winfo_height()-50)

tooltip = tk.Label(ventana, text="", bg="#333333", fg="white", font=("Segoe UI", 9), padx=5, pady=2)
tooltip.place_forget()

def mostrar_tooltip(event, texto):
    tooltip.config(text=texto)
    tooltip.place(x=event.x_root - ventana.winfo_rootx() + 10, y=event.y_root - ventana.winfo_rooty() - 25)

def ocultar_tooltip(event):
    tooltip.place_forget()

def colocar_iconos():
    canvas_iconos.delete("all")
    imagenes_iconos.clear()
    x = 10
    y = 20
    for archivo, link, descripcion in iconos:
        ruta_icono = os.path.join(carpeta_script, "cosas", archivo)
        if os.path.isfile(ruta_icono):
            img = Image.open(ruta_icono).resize((40,40))
            photo = ImageTk.PhotoImage(img)
            imagenes_iconos.append(photo)
            item = canvas_iconos.create_image(x, y, image=photo, anchor="w")
            canvas_iconos.tag_bind(item, "<Button-1>", lambda e, url=link: webbrowser.open(url))
            canvas_iconos.tag_bind(item, "<Enter>", lambda e, t=descripcion: mostrar_tooltip(e, t))
            canvas_iconos.tag_bind(item, "<Leave>", ocultar_tooltip)
            x += 50
    canvas_iconos.place(x=0, y=ventana.winfo_height()-50, width=x, height=50)

ventana.after(100, colocar_iconos)
ventana.bind("<Configure>", lambda e: colocar_iconos())

tk.Label(
    ventana,
    text="¿Cuál es la ruta del juego que deseas parchear?",
    bg="#1e1e1e",
    fg="white",
    font=("Segoe UI", 11, "bold")
).pack(pady=(12, 5))

frame_entrada = tk.Frame(ventana, bg="#1e1e1e")
frame_entrada.pack(pady=5)

entrada = ttk.Entry(frame_entrada, width=60)
entrada.pack(side="left", padx=(0, 5))

ttk.Button(frame_entrada, text="Buscar", command=elegir_ruta).pack(side="left")
ttk.Button(ventana, text="Enviar", command=parchear).pack(pady=10)

frame_mensajes = tk.Frame(ventana, bg="#1e1e1e")
frame_mensajes.pack(pady=10)

ventana.bind("<Key>", tecla_presionada)
ventana.mainloop()
