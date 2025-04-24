import os
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from colorama import Fore, Style
import getpass
import bcrypt
from mysql.connector import Error
import random

class RecoveryUser:
    def __init__(self, connection):
        self.connection = connection

    def generate_verification_code(self):
        return str(random.randint(100000, 999999))

    def send_verification_email(self, email, code):
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

    def change_password_with_code(self, user_name, email):
        try:
            cursor = self.connection.cursor()
            query = "SELECT email FROM users WHERE user_name = %s"
            cursor.execute(query, (user_name,))
            email_db = cursor.fetchone()

            if email_db and email_db[0] == email:
                code = self.generate_verification_code()
                self.send_verification_email(email, code)

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
                        self.connection.commit()
                        print(Fore.GREEN + f"Contraseña actualizada exitosamente. El usuario {user_name} ha sido desbloqueado." + Style.RESET_ALL)
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