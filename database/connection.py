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
from utils.loader import DataLoader
import smtplib
import random
import string
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from utils.loaders import Loader

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

def login_user(connection, user_name):
    try:
        cursor = connection.cursor()
        query = "SELECT id, password, state FROM users WHERE BINARY user_name = %s"
        cursor.execute(query, (user_name,))
        result = cursor.fetchone()
        
        if result:
            id, stored_password, state = result
            if state == '2':
                print(Fore.WHITE + Back.RED + "\nEl usuario está bloqueado. No se permite el inicio de sesión." + Style.RESET_ALL + "\n")
                change_password_with_code(connection, user_name, input("Ingrese su correo electrónico: "))

                return False

            if state == '0':
                print("\nEl usuario está inactivo y no puede iniciar sesión.")
                return False
            
            if state == '3':
                print("\nUsuario no encontrado.")
                return False

            attempts = 0
            while attempts < 3:
                password = getpass.getpass("\nIngrese su contraseña: ")
                if verify_password(stored_password, password):
                    loader = Loader()
                    loader.loading()
                    time.sleep(2)

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


def generate_verification_code(length=6):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=length))

def send_verification_email(email, code):
    sender_email = os.getenv('EMAIL_SENDER')
    sender_password = os.getenv('EMAIL_PASSWORD')
    receiver_email = email

    message = MIMEMultipart("alternative")
    message["Subject"] = "Código de verificación para cambiar la contraseña"
    message["From"] = sender_email
    message["To"] = receiver_email

    text = f"Su código de verificación es: {code}"
    part = MIMEText(text, "plain")
    message.attach(part)

    try:
        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
            server.login(sender_email, sender_password)
            server.sendmail(sender_email, receiver_email, message.as_string())
        print(Fore.GREEN + "Correo de verificación enviado correctamente." + Style.RESET_ALL)
    except Exception as e:
        print(Fore.RED + f"Error al enviar el correo de verificación: {e}" + Style.RESET_ALL)

def change_password_with_code(connection, user_name, email):
    try:
        cursor = connection.cursor()
        query = "SELECT email FROM users WHERE user_name = %s"
        cursor.execute(query, (user_name,))
        email_db = cursor.fetchone()
        
        if email_db and email_db[0] == email:
            code = generate_verification_code()
            send_verification_email(email, code)
     
            user_code = input("Ingrese el código de verificación enviado a su correo: ")
            if user_code == code:
                while True:
                    new_password = getpass.getpass("Ingrese su nueva contraseña: ")
                    confirm_password = getpass.getpass("Confirme su nueva contraseña: ")
                    if new_password == confirm_password:
                        break
                    else:
                        print(Fore.RED + "Las contraseñas no coinciden. Inténtelo de nuevo." + Style.RESET_ALL)
                hashed_password = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt())

                try:
                    query = "UPDATE users SET password = %s, state = '1' WHERE user_name = %s"
                    cursor.execute(query, (hashed_password, user_name))
                    connection.commit()
                    print(Fore.GREEN + f"Contraseña actualizada exitosamente. El usuario {user_name} ha sido desbloqueado." + Style.RESET_ALL)
                    conn = connect_to_database()
                    if conn:
                        login_user(conn, user_name)
                        from menu import principal_menu
                        principal_menu()
                except Error as e:
                    print(Fore.RED + f"Error al cambiar la contraseña: {e}" + Style.RESET_ALL)
            else:
                print(Fore.RED + "Código de verificación incorrecto." + Style.RESET_ALL)
        else:
            print(Fore.RED + "El correo electrónico no coincide con el registrado para el usuario." + Style.RESET_ALL)
    except Error as e:
        print(Fore.RED + f"Error al verificar el correo electrónico: {e}" + Style.RESET_ALL)
    finally:
        cursor.close()
