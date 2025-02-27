import time
import sys
import platform
import os
from dreams import read_data_dream
from insert_dream import insert_dream
from read_dreams import fetch_dreams_from_db, fetch_dreams_id
from update_dream import get_dream, update_dream
from delete_dream import delete_dream, id_is_valid

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_dreams():
    
    clear_console()
        
    while True:

        print("\nMenú de gestión de sueño, las opciones son las siguientes:\n")
        print("1. Ver los sueños registrados")
        print("2. Crear un registro de sueño")
        print("3. Editar un registro de sueño")
        print("4. Eliminar un registro de sueño")
        print("5. Regresar al menú principal")
        print("6. Salir\n")

    
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
                print("\nSaliendo...")
                if os.path.exists("logged_in_user.json"):
                    os.remove("logged_in_user.json")
                time.sleep(3)
                sys.exit()

            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    menu_dreams()