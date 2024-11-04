from datetime import datetime
from insert_fitness import insert_fitness
from read_fitness import fetch_fitness_from_db
import json
import os
import platform
import sys
import time
from in_training import fetch_training, fetch_cadence, fetch_heart_rate, fetch_pace, fetch_pace_for_km
from insert_training import insert_training, insert_candence, insert_heart_rate, insert_pace, insert_pace_for_km

def get_logged_in_user_id():
    try:
        with open('logged_in_user.json', 'r') as f:
            data = json.load(f)
            return data['id']
    except FileNotFoundError:
        print("No hay ningún usuario logueado.")
        return None

def clear_console():
    current_os = platform.system()
    if current_os == "Windows":
        os.system("cls")
    else:
        os.system("clear")

def menu_fitness():

    clear_console()

    while True:

        print("\nMenú de gestión de registros fitness, las opciones con las siguientes:\n")
        print("1. Ver los registros")
        print("2. Crear registros")
        print("3. Editar los registros")
        print("4. Eliminar los registros")
        print("5. Regresbreakar al menú principal")
        print("6. Salir\n")

    
        option = input("Selecciona una opción: ")
        
        match option:
            case '1':
                fetch_fitness_from_db()

            case '2':
                date_str = input("\nIngrese la fecha del registro (YYYY-MM-DD): ")
                try:
                    date = datetime.strptime(date_str, "%Y-%m-%d").date()
                except ValueError:
                    print("Formato de fecha incorrecto. Por favor, use el formato YYYY-MM-DD.")
                    continue
                try:
                    calories = int(input("Ingrese las calorias: "))
                except ValueError:
                    print("Por favor, ingrese un número entero para las calorías.")
                    continue
                try:
                    steps = int(input("Ingrese los pasos: "))
                except ValueError:
                    print("Por favor, ingrese un número entero para los pasos.")
                    continue
                try:
                    distance = float(input("Ingrese la distancia: "))
                    if len(str(int(distance))) > 5 or len(str(distance).split('.')[1]) > 2:
                        raise ValueError
                except ValueError:
                    print("Por favor, ingrese una distancia válida con hasta 5 dígitos en la parte entera y 2 dígitos en la parte decimal.")
                    continue
                try:
                    moviment = int(input("Ingrese el movimiento: "))
                except ValueError:
                    print("Por favor, ingrese un número entero para el movimiento.")
                    continue
                in_training = input("""Ingrese si esta en entrenamiento: \n
                              0. Sin entrenamiento
                              1. Con entrenamiento
                              """)
                
                id_user_create = int(get_logged_in_user_id())
                id_user_update = int(get_logged_in_user_id())
                inserted_id = insert_fitness(date, calories, steps, distance, moviment, in_training, id_user_create, id_user_update)

                if in_training == '1':
                    data_training = fetch_training(in_training)
                    data_cadence = fetch_cadence()
                    date_heart_rate = fetch_heart_rate()
                    date_pace = fetch_pace()
                    date_pace_for_km = fetch_pace_for_km()

                    inserted_id_training = insert_training(inserted_id, *data_training)
                    insert_candence(inserted_id_training, *data_cadence)
                    insert_heart_rate(inserted_id_training, *date_heart_rate)
                    insert_pace(inserted_id_training, *date_pace)
                    insert_pace_for_km(inserted_id_training, *date_pace_for_km)

            case '3':
                break

            case '4':
                break

            case '5':break
   
            case '6':
                print("Saliendo...")
                time.sleep(3)
                sys.exit()

if __name__ == "__main__":
    menu_fitness()
