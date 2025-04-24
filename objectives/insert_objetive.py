from database.connection import DatabaseConnection
from mysql.connector import Error
import sys
import time
from colorama import Fore, Style

def animate_objetive():
    print("\n")
    texto = "Insertando registro de objetivo"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def insert_objetive(date, obj_calories, obj_steps, obj_moviment, obj_dream, user):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO objetives_day (date, obj_calories, obj_steps, obj_moviment, obj_dream, id_user_create, id_user_update)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        values = (date, obj_calories, obj_steps, obj_moviment, obj_dream, user, user)
        cursor.execute(query, values)
        conn.commit()
        animate_objetive()
        print("\nRegistro de objetivo insertado con éxito")
        conn.close()

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()