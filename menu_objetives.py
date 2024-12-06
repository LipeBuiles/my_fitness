import platform
import os
import time
import sys
from objetives import fetch_create_objtives
from insert_objetive import insert_objetive
from read_objetive_day import fetch_objetive_day_from_db
from update_objetive import fetch_update_objetive, update_objetive

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
        print("3. Editar valores de mis objetivos")
        print("4. Regresar al menú principal")
        print("5. Salir\n")

    
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                fetch_objetive_day_from_db()
            case '2':
                data = fetch_create_objtives()
                insert_objetive(*data)
            case '3':
                print("Los datos del objetivo actual son los siguientes:\n")
                fetch_objetive_day_from_db()
                data = fetch_update_objetive()
                update_objetive(*data)
            case '4':
                from menu import principal_menu
                principal_menu()
            case '5':
                if os.path.exists("logged_in_user.json"):
                    os.remove("logged_in_user.json")
                print("\nSaliendo...")
                time.sleep(3)
                sys.exit()

            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    menu_objetives()