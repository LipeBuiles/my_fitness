import os
import platform
import json
from colorama import Fore, Style

class Options:

    @staticmethod
    def clear_console():
        current_os = platform.system()
        if current_os == "Windows":
            os.system("cls")
        else:
            os.system("clear")

    @staticmethod
    def display_menu():
        print("\nBienvenido a la aplicación, este es el menú principal con las siguientes opciones:\n")
        print("1. Gestión de usuarios")
        print("2. Gestión de registros de entrenamiento")
        print("3. Gestión de registros del sueño")
        print("4. Gestión de objetivos")
        print("5. Salir\n")

    @staticmethod
    def display_user_menu():
        print("\nBienvenido a la aplicación, este es el menú de gestión de usuarios con las siguientes opciones:\n")
        print("1. Listar usuarios")
        print("2. Crear usuario")
        print("3. Editar usuario")
        print("4. Eliminar usuario")
        print("5. Regresar al menú principal")
        print("6. Salir\n")

    @staticmethod
    def display_fitness_menu():
        print("\nBienvenido a la aplicación, este es el menú de gestión de registros de entrenamiento con las siguientes opciones:\n")
        print("1. Listar registros de entrenamiento")
        print("2. Crear registro de entrenamiento")
        print("3. Editar registro de entrenamiento")
        print("4. Eliminar registro de entrenamiento")
        print("5. Crear tipo de entrenamiento")
        print("6. Regresar al menú principal")
        print("7. Salir\n")

    @staticmethod
    def get_logged_in_user_id():
        try:
            with open('logged_in_user.json', 'r') as f:
                data = json.load(f)
                return data['id']
        except FileNotFoundError:
            print(Fore.RED + "No hay ningún usuario logueado." + Style.RESET_ALL)
            return None
        
    @staticmethod
    def display_sleep_menu():
        print("\nMenú de gestión de sueño, las opciones son las siguientes:\n")
        print("1. Ver los sueños registrados")
        print("2. Crear un registro de sueño")
        print("3. Editar un registro de sueño")
        print("4. Eliminar un registro de sueño")
        print("5. Regresar al menú principal")
        print("6. Salir\n")

    @staticmethod
    def display_goals_menu():
        print("\nMenú de gestión de objetivos, las opciones son las siguientes:\n")
        print("1. Ver el detalle de mis objetivos")
        print("2. Crear un nuevo objetivo")
        print("3. Editar valores de mis objetivos")
        print("4. Regresar al menú principal")
        print("5. Salir\n")