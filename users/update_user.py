from colorama import Fore, Style
from database.connection import DatabaseConnection
from mysql.connector import Error
from users.read_users import read_users
from tabulate import tabulate
import bcrypt
from utils.loaders import Loader

def hash_password(password):
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password.decode('utf-8')

def list_users():
    list_users = read_users()
    list_users = list_users.drop(columns=['Contraseña'])
    df_str = tabulate(list_users, headers='keys', tablefmt='github', showindex=False)
    df_str = df_str.replace('|', '\033[92m|\033[0m')  # Replace '|' with green-colored '|'
    return df_str

def get_user(id_user):

    users = read_users()
    users['Estado'] = users['Estado'].apply(lambda state: '0' if state == 'Inactivo' else '1' if state == 'Activo' else '2' if state == 'Bloqueado' else state)
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

            new_user_name = input("Ingrese el nombre personalizado para iniciar sesión: ")
            if new_user_name == "":
                new_user_name = user_name

            new_email = input("Ingrese el correo electrónico: ")
            if new_email == "":
                new_email = email

            new_password = input("Ingrese la contraseña: ")
            if new_password == "":
                new_password = password
            else:
                new_password = hash_password(new_password)

            new_state = input("""Ingrese el estado del usuario: \n
                                0. Inactivo
                                1. Activo
                                2. Bloqueado
                                """)
            if new_state == "":
                new_state = state
            return id_user, new_name, new_user_name, new_email, new_password, new_state

    print("\nEl usuario no existe")
    return None

def update_user(id_user, new_name, new_user_name, new_email, new_password, new_state):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "update users set name = %s, user_name = %s, email = %s, password = %s, state = %s where id = %s and state != '3'"
        values = (new_name, new_user_name, new_email, new_password, new_state, id_user)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader()
        loader.update_record(new_name)
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()

