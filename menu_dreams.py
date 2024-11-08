import platform
import os
from dreams import fetch_dream
from insert_dream import insert_dream

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
                break
            case '2':
                dream = fetch_dream()
                insert_dream(*dream)
            case '3':
                break
            case '4':
                break
            case '5':
                from menu import principal_menu
                principal_menu()
            case '6':
                break

            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    menu_dreams()