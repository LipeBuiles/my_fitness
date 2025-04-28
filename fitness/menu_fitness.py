from datetime import datetime
from training.in_training import fetch_training, fetch_cadence, fetch_heart_rate, fetch_pace, fetch_pace_for_km, fetch_stride_cm, fetch_type_training_add
from fitness.insert_fitness import insert_fitness
from training.insert_training import insert_training, insert_candence, insert_heart_rate, insert_pace, insert_pace_for_km, insert_stride_cm, insert_type_training
from fitness.read_fitness import fetch_fitness_from_db
from health.delete_health import search_id_train, delete_all_data_trainig, delete_dream, delete_health
from health.read_health import fetch_health
from fitness.update_fitness import update_fitness
import json
import os
import sys
import time
from utils.options import Options
from colorama import Fore, Back, Style
from utils.loaders import Loader

def get_logged_in_user_id():
    try:
        with open('logged_in_user.json', 'r') as f:
            data = json.load(f)
            return data['id']
    except FileNotFoundError:
        print(Fore.RED + "No hay ningún usuario logueado." + Style.RESET_ALL)
        return None

def menu_fitness():
    clear = Options()
    clear.clear_console()

    while True:
        try:
            while True:

                print("\nMenú de gestión de registros fitness, las opciones son las siguientes:\n")
                print("1. Ver los registros")
                print("2. Crear registros")
                print("3. Editar los registros")
                print("4. Eliminar los registros")
                print("5. Crear tipos de entrenamiento")
                print("6. Regresar al menú principal")
                print("7. Salir\n")

    
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
                            date_stride_cm = fetch_stride_cm()

                            inserted_id_training = insert_training(inserted_id, *data_training)
                            insert_candence(inserted_id_training, *data_cadence)
                            insert_heart_rate(inserted_id_training, *date_heart_rate)
                            insert_pace(inserted_id_training, *date_pace)
                            insert_pace_for_km(inserted_id_training, *date_pace_for_km)
                            insert_stride_cm(inserted_id_training, *date_stride_cm)

                    case '3':
                        id_health = int(input("Ingrese el id del registro de fitness a editar: "))
                        update_fitness(id_health)

                    case '4':
                        fetch_health()
                        id_health = int(input("Ingrese el id del registro a editar: "))
                        id_training = search_id_train(id_health)
                        if id_training is not None:
                            delete_dream(id_health)
                            delete_all_data_trainig(id_training, id_health)
                            delete_health(id_health)
                        else:
                            delete_dream(id_health)
                            delete_health(id_health)

                    case '5':
                        name_type_training = fetch_type_training_add()
                        insert_type_training(name_type_training)
                    
                    case '6':
                        from menu import principal_menu
                        principal_menu()
        
                    case '7':
                        loader = Loader()
                        loader.exit()
                    case _:
                        print("Opción no válida, por favor intente de nuevo.")

        except KeyboardInterrupt:
            clear.clear_console()
            print(f"\n\n{Fore.RED}Ctrl+C está deshabilitado. Use la opción 6 para salir.{Style.RESET_ALL}")

if __name__ == "__main__":
    menu_fitness()
