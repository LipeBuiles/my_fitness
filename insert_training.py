from colorama import Fore, Style
from conection import connect_to_database
from mysql.connector import Error
import sys
import time
    
def animate_login():
    print("\n")
    texto = "Insertando registro de entrenamiento"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def insert_training(id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO training (id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
        values = (id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG)
        cursor.execute(query, values)
        conn.commit()
        insert_id = cursor.lastrowid
        animate_login()
        print("\nRegistro de entrenamiento insertado con éxito")
        conn.close()
        return insert_id

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()

