from colorama import Fore, Back, Style
from dreams. menu_dreams import menu_dreams
from fitness.menu_fitness import menu_fitness
from objectives.menu_objetives import menu_objetives
from users.menu_users import menu_users
from utils.loaders import Loader
from utils.options import Options

def principal_menu():

    clear = Options()
    clear.clear_console()

    while True:
        try:
            while True:

                menu = Options()
                menu.display_menu()

                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        print(menu_users())
                    case '2':
                        print(menu_fitness())
                    case '3':
                        print(menu_dreams())
                    case '4':
                        print(menu_objetives())

                    case '5':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("Opción no válida, por favor intente de nuevo.")
        except KeyboardInterrupt:
                clear.clear_console()
                print(f"{Back.WHITE}{Fore.RED}\n\nCtrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    principal_menu()