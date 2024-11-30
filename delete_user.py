from colorama import Fore, Style
from conection import connect_to_database
from mysql.connector import Error
from read_users import read_users
from tabulate import tabulate
import bcrypt
import sys
import time

def animate_login():
    print("\n")
    texto = "Eliminando usuario "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def delete_user(id_user):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = "UPDATE users set state = '3' WHERE id = %s"
        cursor.execute(query, (id_user,))
        conn.commit()
        animate_login()
        print("\nUsuario eliminado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()
