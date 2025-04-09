from colorama import Fore, Style
from database.connection import connect_to_database
from mysql.connector import Error
from dreams.read_dreams import fetch_dreams_df
from tabulate import tabulate
from health.read_health import fetch_health
import pandas as pd
import sys
import time

def animate_login():
    print("\n")
    texto = "Actualizando registro del sueño "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    print("\n")

def get_dream(id_dream):
    fetch_dreams_df()
    df = fetch_dreams_df()

    
    for index, row in df.iterrows():
        if row['ID'] == id_dream:
            ligth = row['Ligero']
            deep = row['Profundo']
            REM = row['REM']
            awake = row['Despierto']
            heart_rate = row['Ritmo Cardiaco']
            total_dream = row['Total Sueño']
            id_health = row['id_health']

            new_ligth = input("\nIngrese el tiempo de sueño ligero: ")
            if new_ligth == "":
                new_ligth = ligth

            new_deep = input("Ingrese el tiempo de sueño profundo: ")
            if new_deep == "":
                new_deep = deep

            new_REM = input("Ingrese el tiempo de sueño REM: ")
            if new_REM == "":
                new_REM = REM

            new_awake = input("Ingrese el tiempo de sueño despierto: ")
            if new_awake == "":
                new_awake = awake

            new_heart_rate = input("Ingrese el ritmo cardiaco: ")
            if new_heart_rate == "":
                new_heart_rate = heart_rate

            new_total_dream = input("Ingrese el tiempo total de sueño: ")
            if new_total_dream == "":
                new_total_dream = total_dream

            fetch_health()
            new_id_health = input("Ingrese el id de la salud: ")
            if new_id_health == "":
                new_id_health = id_health

            return id_dream, new_ligth, new_deep, new_REM, new_awake, new_heart_rate, new_total_dream, new_id_health

        else:
            print("\nEl usuario no existe")
            return None

def update_dream(id_dream, new_ligth, new_deep, new_REM, new_awake, new_heart_rate, new_total_dream, new_id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()

        query = "update dream set ligth = %s, deep = %s, REM = %s, awake = %s, heart_rate = %s, total_dream = %s, id_health = %s where id = %s"
        values = (new_ligth, new_deep, new_REM, new_awake, new_heart_rate, new_total_dream, new_id_health, id_dream)
        cursor.execute(query, values)
        conn.commit()
        animate_login()
        print("\nRegistro de sueño actualizado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()
