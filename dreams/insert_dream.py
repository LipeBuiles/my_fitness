from colorama import Fore, Style
from database.connection import connect_to_database
from mysql.connector import Error
import sys
import time
    
def animate_dream():
    print("\n")
    texto = "Insertando registro de sueño"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def insert_dream(ligth, deep, REM, awake, heart_rate, total_dream, id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO dream (ligth, deep, REM, awake, heart_rate, total_dream, id_health)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        values = (ligth, deep, REM, awake, heart_rate, total_dream, id_health)
        cursor.execute(query, values)
        conn.commit()
        animate_dream()
        print("\nRegistro de sueño insertado con éxito")
        conn.close()

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()

