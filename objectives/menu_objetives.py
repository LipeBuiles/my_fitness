import platform
import os
import time
import sys
from objectives.objectives import fetch_create_objtives
from objectives.insert_objetive import insert_objetive
from objectives.read_objetive_day import fetch_objetive_day_from_db
from objectives.update_objetive import fetch_update_objetive, update_objetive
from utils.options import Options
from colorama import Fore, Back, Style
from utils.loaders import Loader


def menu_objetives():

    clear = Options()
    clear.clear_console()    
        
    while True:
        try:
            while True:
                menu = Options()
                menu.display_goals_menu()
                
                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        fetch_objetive_day_from_db()
                    case '2':
                        data = fetch_create_objtives()
                        insert_objetive(*data)
                    case '3':
                        print("\nLos datos del objetivo actual son los siguientes:")
                        fetch_objetive_day_from_db()
                        print("\n")
                        data = fetch_update_objetive()
                        update_objetive(*data)
                    case '4':
                        from menu import principal_menu
                        principal_menu()
                    case '5':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("Opción no válida, por favor intente de nuevo.")

        except KeyboardInterrupt:
             clear.clear_console()
             print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    menu_objetives()