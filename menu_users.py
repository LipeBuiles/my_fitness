import platform
import os
from read_users import fetch_users_from_db
from insert_user import insert_user

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_users():
    
    clear_console()

    while True:


        print("\nMenú de gestión de usuarios, las opciones con las siguientes:\n")
        print("1. Ver los usarios")
        print("2. Crear los usuarios")
        print("3. Editar los usuarios")
        print("4. Eliminar los usuarios")
        print("5. Salir\n")

    
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                fetch_users_from_db()

            case '2':
                name = input("\nIngrese el nombre completo del usuario: ")
                user_name = input("Ingrese el nombre personalizado para iniciar sesón: ")
                email = input("Ingrese el correo electrónico: ")
                password = input("Ingrese la contraseña: ")
                state = input("""Ingrese el estado del usuario: \n
                              0. Inactivo
                              1. Activo
                              2. Bloqueado
                              """)
                
                insert_user(name, user_name, email, password, state)
                
            case '3':
                print("3")
            case '4':
                print("4")
            case '5':
                print("Saliendo...")
                break

            case _:
                print("Opción no válida, por favor intente de nuevo.")