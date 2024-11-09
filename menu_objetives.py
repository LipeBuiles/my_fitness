import platform
import os
import time
import sys
from objetives import fetch_create_objtives
from insert_objetive import insert_objetive

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_objetives():
    
    clear_console()
        
    while True:

        print("\nMenú de gestión de sueño, las opciones son las siguientes:\n")
        print("1. Ver el detalle de mis objetivos")
        print("2. Crear un nuevo objetivo")
        print("2. Editar valores de mis objetivos")
        print("3. Regresar al menú principal")
        print("4. Salir\n")

    
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                break
            case '2':
                data = fetch_create_objtives()
                insert_objetive(*data)
            case '3':
                break
            case '4':
                break
            case '5':
                from menu import principal_menu
                principal_menu()
            case '6':
                print("\nSaliendo...")
                time.sleep(3)
                sys.exit()

            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    menu_objetives()