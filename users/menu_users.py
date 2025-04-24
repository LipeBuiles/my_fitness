import time
import platform
import os
from users.update_user import *
from users.read_users import fetch_users_from_db, user_exists
from users.insert_user import insert_user
from users.delete_user import *
from colorama import Fore, Back, Style
from utils.loaders import Loader

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_users():
    clear_console()

    while True:
        try:
            while True:
                print("\nMenú de gestión de usuarios, las opciones son las siguientes:\n")
                print("1. Ver los usuarios")
                print("2. Crear los usuarios")
                print("3. Editar los usuarios")
                print("4. Eliminar los usuarios")
                print("5. Regresar al menú principal")
                print("6. Salir\n")

                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        fetch_users_from_db()

                    case '2':
                        name = input("\nIngrese el nombre completo del usuario: ")
                        user_name = input("Ingrese el nombre personalizado para iniciar sesión: ")
                        while True:
                            try:
                                email = input("Ingrese el correo electrónico: ")
                                if "@" not in email or "." not in email:
                                    raise ValueError("Correo electrónico no válido")
                                break
                            except ValueError as e:
                                print(e)
                                continue
                        
                        password = input("Ingrese la contraseña: ")
                        while True:
                            try:
                                state = input("""Ingrese el estado del usuario: \n
                                                  0. Inactivo
                                                  1. Activo
                                                  2. Bloqueado
                                                  """)
                                if state not in ['0', '1', '2']:
                                    raise ValueError("Estado no válido")
                                break
                            except ValueError as e:
                                print(e)
                                continue
                        
                        insert_user(name, user_name, email, password, state)
                        
                    case '3':
                        print("")
                        print(list_users())
                        id_user = int(input("\nIngrese el id del usuario a editar: "))
                        user = get_user(id_user)
                        if user is not None:
                            update_user(*user)
                    case '4':
                        print("")
                        print(list_users())
                        while True:
                            try:
                                id_user = int(input("\nIngrese el id del usuario a eliminar: "))
                                if id_user <= 0:
                                    raise ValueError("El ID debe ser un entero positivo mayor a 0")
                                break
                            except ValueError as e:
                                print("El ID debe ser un entero positivo mayor a 0")
                                continue
                        if not user_exists(id_user):
                            print(f"{Back.WHITE}{Fore.BLUE}\nEl usuario no existe{Style.RESET_ALL}")
                            time.sleep(2)
                            continue
                        else:
                            confirm = input(f"\n¿Está seguro de que desea eliminar el usuario con ID {id_user}? (s/n): ")
                            if confirm.lower() == 's':
                                delete_user(id_user)
                            else:
                                print(f"{Back.WHITE}{Fore.BLUE}\nEliminación cancelada.{Style.RESET_ALL}")
                                time.sleep(2)
                                continue
                    case '5':
                        from menu import principal_menu
                        principal_menu()
                    case '6':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("\nOpción no válida, por favor intente de nuevo.")
        except KeyboardInterrupt:
            clear_console()
            print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    menu_users()