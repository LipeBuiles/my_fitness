import time
import sys
import platform
import os
from menu_users import menu_users
from menu_fitness import menu_fitness

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def principal_menu():

    while True:
        clear_console()

        print("\nBienvenido a la aplicación, este es el menú princial con las siguientes opciones:\n")
        print("1. Gestión de usuarios")
        print("2. Gestión de registros")
        print("3. Salir\n")

        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                print(menu_users())
            case '2':
                print(menu_fitness())
            case '3':
                print("\nSaliendo...")
                time.sleep(3)
                sys.exit()
            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    principal_menu()