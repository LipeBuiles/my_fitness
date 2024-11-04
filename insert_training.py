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

def animate_login_cadence():
    print("\n")
    texto = "Insertando registro de cadencia"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def animate_login_heart_rate():
    print("\n")
    texto = "Insertando registro de ritmo cardiaco"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def animate_login_pace():
    print("\n")
    texto = "Insertando registro de ritmo"
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

def animate_login_pace_for_km():
    print("\n")
    texto = "Insertando registro de ritmo"
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


def insert_candence(id_training, cadence_AVG, cadence_max):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO cadence (id_training, cadence_AVG, cadence_max)
                   VALUES (%s, %s, %s)"""
        values = (id_training, cadence_AVG, cadence_max)
        cursor.execute(query, values)
        conn.commit()
        animate_login_cadence()
        print("\nRegistro de cadencia insertado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_heart_rate(id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO heart_rate (id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
        values = (id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max)
        cursor.execute(query, values)
        conn.commit()
        animate_login_heart_rate()
        print("\nRegistro de ritmo cardiaco insertado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_pace(id_training, pace, pace_max):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO pace (id_training, pace, pace_max)
                   VALUES (%s, %s, %s)"""
        values = (id_training, pace, pace_max)
        cursor.execute(query, values)
        conn.commit()
        animate_login_pace()
        print("\nRegistro de ritmo insertado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_pace_for_km(id_training, *pace_for_km):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        for km in range(len(pace_for_km)):
            query = """INSERT INTO pace_for_km (id_training, km, pace)
                        VALUES (%s, %s, %s)"""
            values = (id_training, km + 1, pace_for_km[km])
            cursor.execute(query, values)
        conn.commit()
        animate_login_pace_for_km()
        print("\nRegistro de ritmo por km insertado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()