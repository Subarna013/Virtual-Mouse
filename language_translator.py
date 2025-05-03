#cd "C:\Users\babym\OneDrive\Desktop"
#python language_translator.py
from tkinter import *
from tkinter import ttk
from tkinter import *
#from googletrans import Translator, LANGUAGES
from deep_translator import GoogleTranslator


def change(text="Type", src="english", dest="hindi"):
    translated = GoogleTranslator(source=src, target=dest).translate(text)
    return translated

def data():
    s = combo_sor.get().lower()
    d = combo_dest.get().lower()
    msg = Sor_txt.get(1.0, END)
    textget = change(text=msg, src=s, dest=d)
    dest_txt.delete(1.0, END)
    dest_txt.insert(END, textget)







root = Tk()
root.title("Translator")
root.geometry("500x700") 
root.config(bg='red') 

lab_txt= Label(root, text="Translator", font=("Times New Roman", 40, "bold"))
lab_txt.place(x=100, y=40, height= 50, width=300)

frame= Frame(root).pack(side=BOTTOM)

lab_txt= Label(root, text="Source Text", font=("Times New Roman", 20, "bold"), fg="Black", bg="Red")
lab_txt.place(x=100, y=100, height= 20, width=300)

Sor_txt= Text(frame,font=("Times New Roman", 20, "bold"), wrap= WORD)
Sor_txt.place(x=10, y=130, height= 150, width=480)

#list_text=list(LANGUAGES.values())
list_text=['english', 'hindi', 'french', 'spanish', 'german', 'italian', 'portuguese', 'russian', 'chinese', 'japanese', 'korean']


combo_sor= ttk.Combobox(frame, value=list_text)
combo_sor.place(x=10, y=300, height= 40, width=100)
combo_sor.set("english")

button_change= Button(frame, text= "Translate", relief=RAISED, command=data)
button_change.place(x=180, y=300, height= 40, width=100)

combo_dest= ttk.Combobox(frame, value=list_text)
combo_dest.place(x=330, y=300, height= 40, width=150)
combo_dest.set("english")

lab_txt= Label(root, text="Dest Text", font=("Times New Roman", 20, "bold"), fg="Black", bg="Red")
lab_txt.place(x=100, y=360, height= 20, width=300)

dest_txt= Text(frame,font=("Times New Roman", 20, "bold"), wrap= WORD)
dest_txt.place(x=10, y=400, height= 150, width=480)


root.mainloop()

