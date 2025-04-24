from colorama import init, Fore, Back, Style
from users.recovey_user import RecoveryUser
from mysql.connector import Error
import bcrypt
import getpass
import json
import random
import string

class UserManager:
    def __init__(self, db_connection):
        self.connection = db_connection

    def verify_password(self, stored_password, provided_password):
        return bcrypt.checkpw(provided_password.encode('utf-8'), stored_password.encode('utf-8'))

    def block_user(self, user_name):
        try:
            cursor = self.connection.cursor()
            query = "UPDATE users SET state = '2' WHERE user_name = %s"
            cursor.execute(query, (user_name,))
            self.connection.commit()
            print(Fore.WHITE + Back.RED + "\nEl usuario ha sido bloqueado después de 3 intentos fallidos." + Style.RESET_ALL)
        except Error as e:
            print(Fore.RED + f"\nError al bloquear el usuario: {e}")
        finally:
            cursor.close()

    def login_user(self, user_name):
        try:
            cursor = self.connection.cursor()
            query = "SELECT id, password, state FROM users WHERE BINARY user_name = %s"
            cursor.execute(query, (user_name,))
            result = cursor.fetchone()

            if result:
                id, stored_password, state = result
                match state:
                    case '0':
                        print(Fore.YELLOW + "\nEl usuario está inactivo y no puede iniciar sesión." + Style.RESET_ALL)
                        return False

                    case '1':
                        attempts = 0
                        while attempts < 3:
                            password = getpass.getpass("\nIngrese su contraseña: ")
                            if self.verify_password(stored_password, password):
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
                                    self.block_user(user_name)
                                    return False

                    case '2':
                        print(Fore.WHITE + Back.RED + "\nEl usuario está bloqueado. No se permite el inicio de sesión." + Style.RESET_ALL + "\n")
                        recovery = RecoveryUser(self.connection)
                        recovery.change_password_with_code(user_name, input("Ingrese su correo electrónico: "))
                        return False

                    case '3':
                        print(Fore.WHITE + Back.RED + "\nEl usuario no fue encontrado en el sistema." + Style.RESET_ALL)
                        return False
            else:
                print(Fore.WHITE + Back.RED + "\nUsuario no encontrado." + Style.RESET_ALL)
                return False
        except Error as e:
            print(f"\nError durante el proceso de login: {e}")
        finally:
            cursor.close()

    def generate_verification_code(self, length=6):
        return ''.join(random.choices(string.ascii_uppercase + string.digits, k=length))
