import time
import sys
import platform
import os
from read_fitness import fetch_fitness_from_db

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_fitness():
    
    clear_console()

    while True:

        print("\nMenú de gestión de registros fitness, las opciones con las siguientes:\n")
        print("1. Ver los registros")
        print("2. Crear resgistro")
        print("3. Editar los registros")
        print("4. Eliminar los registros")
        print("5. Regresbreakar al menú principal")
        print("6. Salir\n")

    
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                fetch_fitness_from_db()

            case '2':
                break

            case '3':
                break

            case '4':
                break

            case '5':break
   
            case '6':
                print("Saliendo...")
                time.sleep(3)
                sys.exit()

if __name__ == "__main__":
    menu_fitness()


# import json

# def get_logged_in_user_id():
#     try:
#         with open('logged_in_user.json', 'r') as f:
#             data = json.load(f)
#             return data['id']
#     except FileNotFoundError:
#         print("No hay ningún usuario logueado.")
#         return None