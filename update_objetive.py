from colorama import Fore, Style
from conection import connect_to_database
from mysql.connector import Error
from read_dreams import fetch_dreams_df
from tabulate import tabulate
from read_health import fetch_health
import pandas as pd
import sys
import time
import json

def animate_login_objetive_day():
    print("\n")
    texto = "Actualizando registro del objetivo del día "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    print("\n")

def fetch_update_objetive():
    while True:
        try:
            new_date = input("Ingrese la fecha (YYYY-MM-DD): ")
            if new_date == "":
                break
            year, month, day = map(int, new_date.split('-'))
            if year < 0 or month < 0 or month > 12 or day < 0 or day > 31:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese la fecha en formato YYYY-MM-DD.")
    while True:
        try:
            new_obj_calories = int(input("Ingrese el nuevo objetivo de las calorias: "))
            if new_obj_calories == "":
                break
            if new_obj_calories < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_steps = int(input("Ingrese el nuevo objetivo de los pasos: "))
            if new_obj_steps == "":
                break
            if new_obj_steps < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_moviment = int(input("Ingrese el nuevo objetivo de los minutos de movimiento: "))
            if new_obj_moviment == "":
                break
            if new_obj_moviment < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_dream = float(input("Ingrese el nuevo objetivo de las horas de sueño: "))
            if new_obj_dream == "":
                break
            if new_obj_dream < 0:
                raise ValueError
            break    
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número real.")

    with open('logged_in_user.json', 'r') as f:
        data = json.load(f)
        user = data['id']

    return new_date, new_obj_calories, new_obj_steps, new_obj_moviment, new_obj_dream, user

def update_objetive(date, obj_calories, obj_steps, obj_moviment, obj_dream, id_user_update):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = """UPDATE objetives_day
                   SET obj_calories = %s, obj_steps = %s, obj_moviment = %s, obj_dream = %s, id_user_update = %s
                   ORDER BY id DESC
                   LIMIT 1""" 
        values = (obj_calories, obj_steps, obj_moviment, obj_dream, id_user_update)
        cursor.execute(query, values)
        conn.commit()
        animate_login_objetive_day()
        print("\nRegistro de objetivo actualizado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al actualizar datos: {e}")
    finally:
        cursor.close()
