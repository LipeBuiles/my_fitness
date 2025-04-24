import os
import platform

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