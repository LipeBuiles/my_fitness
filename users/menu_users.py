from users.update_user import *
from users.read_users import fetch_users_from_db
from users.options_user import UserOptions
from users.delete_user import *
from colorama import Fore, Back, Style
from utils.loaders import Loader
from utils.options import Options

def menu_users():
    clear = Options()
    clear.clear_console()

    while True:
        try:
            while True:
                
                menu = Options()
                menu.display_user_menu()

                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        fetch_users_from_db()

                    case '2':
                        create_user = UserOptions()
                        create_user.add_user()

                    case '3':
                        update_user = UserOptions()
                        update_user.update_user()
                    case '4':
                        delete_user = UserOptions()
                        delete_user.delete_user()
                    case '5':
                        from menu import principal_menu
                        principal_menu()
                    case '6':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("\nOpción no válida, por favor intente de nuevo.")
        except KeyboardInterrupt:
            clear.clear_console()
            print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    menu_users()