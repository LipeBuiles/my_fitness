import time
import sys
import os
import json
import mysql.connector
import getpass
import bcrypt
from mysql.connector import Error
from dotenv import load_dotenv
from colorama import init, Fore, Back, Style

init()
load_dotenv()

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST'),
            database=os.getenv('DB_DATABASE'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD')
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(Fore.RED + f"\nError al conectar a la base de datos: {e}")
        return None

def verify_password(stored_password, provided_password):
    return bcrypt.checkpw(provided_password.encode('utf-8'), stored_password.encode('utf-8'))

def block_user(connection, user_name):
    try:
        cursor = connection.cursor()
        query = "UPDATE users SET state = '2' WHERE user_name = %s"
        cursor.execute(query, (user_name,))
        connection.commit()
        print(Fore.WHITE + Back.RED + "\nEl usuario ha sido bloqueado después de 3 intentos fallidos." + Style.RESET_ALL)
    except Error as e:
        print(Fore.RED + f"\nError al bloquear el usuario: {e}")
    finally:
        cursor.close()

def animate_login():
    print("\n")
    texto = "Iniciando sesión "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def login_user(connection, user_name):
    try:
        cursor = connection.cursor()
        query = "SELECT id, password, state FROM users WHERE user_name = %s"
        cursor.execute(query, (user_name,))
        result = cursor.fetchone()
        
        if result:
            id, stored_password, state = result
            if state == '2':
                print(Fore.WHITE + Back.RED + "\nEl usuario está bloqueado. No se permite el inicio de sesión." + Style.RESET_ALL + "\n")
                return False

            if state == '0':
                print("\nEl usuario está inactivo y no puede iniciar sesión.")
                return False

            attempts = 0
            while attempts < 3:
                password = getpass.getpass("\nIngrese su contraseña: ")
                if verify_password(stored_password, password):
                    animate_login()
                    print("\nInicio de sesión exitoso")
                    
                    try:
                        with open('logged_in_user.json', 'w') as f:
                            json.dump({'id': id}, f)
                        print(Fore.GREEN + "ID del usuario guardado correctamente." + Style.RESET_ALL)
                    except Exception as e:
                        print(Fore.RED + f"Error al guardar el ID del usuario: {e}" + Style.RESET_ALL)
                    
                    return True
                else:
                    attempts += 1
                    print(Fore.RED + f"\nContraseña incorrecta. Intento {attempts} de 3. Si falla en 3 intentos, su cuenta será bloqueada." + Style.RESET_ALL)
                    if attempts == 3:
                        block_user(connection, user_name)
                        return False

        else:
            print("\nUsuario no encontrado.")
            return False
    except Error as e:
        print(f"\nError durante el proceso de login: {e}")
    finally:
        cursor.close()