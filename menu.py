from menu_users import menu_users

def principal_menu():

    while True:

        print("\nBienvenido a la aplicación, este es el menú princial con las siguientes opciones:\n")
        print("1. Gestión de usuarios")
        print("2. Gestión de registros")
        print("3. Regresar al menú principal")
        print("4. Salir\n")

        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                print(menu_users())
            case '2':
                print("Gestión de salud")
            case '3':
                print("Saliendo...")
                break
            case _:
                print("Opción no válida, por favor intente de nuevo.")

if __name__ == "__main__":
    principal_menu()