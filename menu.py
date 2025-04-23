import time
import sys
import platform
import os
from users.menu_users import menu_users
from fitness.menu_fitness import menu_fitness
from dreams. menu_dreams import menu_dreams
from objectives.menu_objetives import menu_objetives
from utils.loaders import Loader
from colorama import Fore, Back, Style


def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def principal_menu():
    clear_console()
    while True:
        try:
            while True:
                

                print("\nBienvenido a la aplicación, este es el menú principal con las siguientes opciones:\n")
                print("1. Gestión de usuarios")
                print("2. Gestión de registros de entrenamiento")
                print("3. Gestión de registros del sueño")
                print("4. Gestión de objetivos")
                print("5. Salir\n")

                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        print(menu_users())
                    case '2':
                        print(menu_fitness())
                    case '3':
                        print(menu_dreams())
                    case '4':
                        print(menu_objetives())

                    case '5':
                        loader = Loader()
                        loader.exit()
                        if os.path.exists("logged_in_user.json"):
                            os.remove("logged_in_user.json")
                        time.sleep(2)
                        sys.exit()
                    case _:
                        print("Opción no válida, por favor intente de nuevo.")
        except KeyboardInterrupt:
                clear_console()
                print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    principal_menu()