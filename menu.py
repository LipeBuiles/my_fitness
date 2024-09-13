def principal_menu():

    print("\nSeleccione una opción:\n")
    print("1. Gestión de usuarios")
    print("2. Gestión de registros")
    print("3. Salir\n")

    while True:
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                print("Gestión de usuarios")
            case '2':
                print("Gestión de registros")
            case '3':
                print("Saliendo...")
                break
            case _:
                print("Opción no válida, por favor intente de nuevo.")

    

if __name__ == "__main__":
    principal_menu()