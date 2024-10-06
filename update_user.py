from colorama import Fore, Style
from conection import connect_to_database
from mysql.connector import Error
from read_users import read_users
from tabulate import tabulate
import bcrypt
import sys
import time

def animate_login():
    print("\n")
    texto = "Actualizando usuario "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def hash_password(password):
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password.decode('utf-8')

def list_users():
    list_users = read_users()[0]
    df_str = tabulate(list_users, headers='keys', tablefmt='fancy_grid', showindex=False)
    return df_str

def get_user(id_user):

    users = read_users()[0]
    for index, user in users.iterrows():
        if user['id'] == id_user:
            name = user['Nombre']
            user_name = user['Usuario']
            email = user['Correo Electronico']
            password = user['Contraseña']
            state = user['Estado']

            new_name = input("\nIngrese el nombre completo del usuario: ")
            if new_name == "":
                new_name = name

            new_user_name = input("Ingrese el nombre personalizado para iniciar sesón: ")
            if new_user_name == "":
                new_user_name = user_name

            new_email = input("Ingrese el correo electrónico: ")
            if new_email == "":
                new_email = email

            new_password = input("Ingrese la contraseña: ")
            new_password = hash_password(new_password)
            if new_password == "":
                new_password = password

            new_state = input("""Ingrese el estado del usuario: \n
                                0. Inactivo
                                1. Activo
                                2. Bloqueado
                                """)
            if new_state == "":
                new_state = state
            break

    return id_user, new_name, new_user_name, new_email, new_password, new_state

def update_user(id_user, new_name, new_user_name, new_email, new_password, new_state):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()

        query = "update users set name = %s, user_name = %s, email = %s, password = %s, state = %s where id = %s"
        values = (new_name, new_user_name, new_email, new_password, new_state, id_user)
        cursor.execute(query, values)
        conn.commit()
        animate_login()
        print("\nUsuario actualizado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()

