import time
import sys
import platform
import os
from dreams.dreams import read_data_dream
from dreams.insert_dream import insert_dream
from dreams.read_dreams import fetch_dreams_from_db, fetch_dreams_id
from dreams.update_dream import get_dream, update_dream
from dreams.delete_dream import delete_dream, id_is_valid
from colorama import Fore, Back, Style
from utils.options import Options
from utils.loaders import Loader

def menu_dreams():
    
    clear = Options()
    clear.clear_console()

    while True:
        try:
            while True:
                menu = Options()
                menu.display_sleep_menu()

                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        fetch_dreams_from_db()
                    case '2':
                        dream = read_data_dream()
                        insert_dream(*dream)
                    case '3':
                        fetch_dreams_id()
                        id_dream = int(input("\nIngrese el id del sueño a editar: "))
                        dream = get_dream(id_dream)
                        if dream is not None:
                            update_dream(*dream)
                    case '4':
                        fetch_dreams_id()
                        id_dream = int(input("\nIngrese el id del sueño a eliminar: "))
                        if id_is_valid(id_dream) is not None:
                            delete_dream(id_dream)
                    case '5':
                        from menu import principal_menu
                        principal_menu()
                    case '6':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("Opción no válida, por favor intente de nuevo.")

        except KeyboardInterrupt:
            clear.clear_console()
            print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    menu_dreams()