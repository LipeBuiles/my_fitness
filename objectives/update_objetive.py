from colorama import Fore, Style
from database.connection import connect_to_database
from mysql.connector import Error
from objectives.read_objetive_day import fetch_objetive_day
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

    data = fetch_objetive_day()[0]
    date = data[0]
    obj_calories = data[1]
    obj_steps = data[2]
    obj_moviment = data[3]
    obj_dream = data[4]

    while True:
        try:
            new_date = input("Ingrese la fecha (YYYY-MM-DD): ")
            if new_date == "":
                new_date = date
                break
            else:
                year, month, day = map(int, new_date.split('-'))
                if year < 0 or month < 0 or month > 12 or day < 0 or day > 31:
                    raise ValueError
                break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese la fecha en formato YYYY-MM-DD.")
    while True:
        try:
            new_obj_calories_input = input("Ingrese el nuevo objetivo de las calorias: ")
            if new_obj_calories_input == "":
                new_obj_calories = obj_calories
                break
            new_obj_calories = int(new_obj_calories_input)
            if new_obj_calories < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_steps = input("Ingrese el nuevo objetivo de los pasos: ")
            if new_obj_steps == "":
                new_obj_steps = obj_steps
                break
            new_obj_steps = int(new_obj_steps)
            if new_obj_steps < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_moviment = input("Ingrese el nuevo objetivo de los minutos de movimiento: ")
            if new_obj_moviment == "":
                new_obj_moviment = obj_moviment
                break
            new_obj_moviment = int(new_obj_moviment)
            if new_obj_moviment < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            new_obj_dream = input("Ingrese el nuevo objetivo de las horas de sueño: ")
            if new_obj_dream == "":
                new_obj_dream = obj_dream
                break
            new_obj_dream = float(new_obj_dream)
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
