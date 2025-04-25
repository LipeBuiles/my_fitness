from users.insert_user import insert_user
from users.read_users import user_exists
from users.update_user import update_user, list_users, get_user
from colorama import Fore, Back, Style
import time
from users.delete_user import delete_user

class UserOptions:
    def add_user(self):
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

        # Assuming insert_user is a function that inserts the user into the database
        insert_user(name, user_name, email, password, state)

    def update_user(self):
        print("")
        print(list_users())
        id_user = int(input("\nIngrese el id del usuario a editar: "))
        user = get_user(id_user)
        if user is not None:
            update_user(*user)

    def delete_user(self):
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
            return
        else:
            confirm = input(f"\n¿Está seguro de que desea eliminar el usuario con ID {id_user}? (s/n): ")
            if confirm.lower() == 's':
                delete_user(id_user)
            else:
                print(f"{Back.WHITE}{Fore.BLUE}\nEliminación cancelada.{Style.RESET_ALL}")
                time.sleep(2)
                return