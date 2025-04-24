from database.connection import DatabaseConnection
from colorama import Fore, Style
import sys
import time

def animate_delete():
    print("\n")
    texto = "Eliminando registro del sueño "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    print("\n")

def id_is_valid(id_dream):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "SELECT EXISTS(SELECT 1 FROM dream WHERE id = %s);"
        values = (id_dream,)
        cursor.execute(query, values)
        result = cursor.fetchone()
        if not result[0]:
            print("\nEl registro no existe")
        else:
            print("\nRegistro encontrado")
            return 1

    except Exception as e:
        print(f"Error: {e}")

def delete_dream(id_dream):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()

        query = "DELETE from dream WHERE id = %s"
        values = (id_dream,)
        cursor.execute(query, values)

        conn.commit()
        animate_delete()
        print("\nRegistro eliminado exitosamente")
        conn.close()

    except Exception as e:
        print(f"Error: {e}")