from insert_user import insert_user
import os
import platform

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_users():

    clear_console()

    print("\nSeleccione una opción:\n")
    print("1. Ver los usarios")
    print("2. Crear los usuarios")
    print("3. Editar los usuarios")
    print("4. Eliminar los usuarios")
    print("5. Salir\n")

    while True:
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                print("1")

            case '2':
                name = input("Ingrese el nombre del usuario: ")
                user_name = input("Ingrese el nombre de usuario: ")
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