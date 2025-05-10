from datetime import datetime
from training.in_training import fetch_training, fetch_cadence, fetch_heart_rate, fetch_pace, fetch_pace_for_km, fetch_stride_cm, fetch_type_training_add
from fitness.insert_fitness import insert_fitness
from training.insert_training import insert_training, insert_candence, insert_heart_rate, insert_pace, insert_pace_for_km, insert_stride_cm, insert_type_training
from fitness.read_fitness import fetch_fitness_from_db, fetch_fitness
from health.delete_health import search_id_train, delete_all_data_trainig, delete_dream, delete_health
from health.read_health import fetch_health
from fitness.update_fitness import update_fitness, check_health_exists
from utils.options import Options
from colorama import Fore, Style
from utils.loaders import Loader
from fitness.options_fitness import OptionsFitness

def menu_fitness():
    clear = Options()
    clear.clear_console()

    while True:
        try:
            while True:
                
                options = Options()
                options.display_fitness_menu()
    
                option = input("Selecciona una opción: ")
                
                match option:
                    case '1':
                        fetch_fitness_from_db()

                    case '2':

                        data_insert = OptionsFitness()
                        data = data_insert.collect_fitness_data()

                        id_user_create = int(Options.get_logged_in_user_id())
                        id_user_update = int(Options.get_logged_in_user_id())
                        inserted_id = insert_fitness(*data.values(), id_user_create, id_user_update)

                        in_training = data['in_training']

                        if in_training == '1':

                            data_training = fetch_training()
                            inserted_id_training = insert_training(inserted_id, *data_training)

                            data_cadence = fetch_cadence()
                            insert_candence(inserted_id_training, *data_cadence)

                            date_heart_rate = fetch_heart_rate()
                            insert_heart_rate(inserted_id_training, *date_heart_rate)

                            date_pace = fetch_pace()
                            insert_pace(inserted_id_training, *date_pace)

                            date_pace_for_km = fetch_pace_for_km()
                            insert_pace_for_km(inserted_id_training, *date_pace_for_km)
                            
                            date_stride_cm = fetch_stride_cm()
                            insert_stride_cm(inserted_id_training, *date_stride_cm)

                    case '3':
                        fetch_fitness()
                        print("\n\n")
                        while True:
                            try:
                                id_health = int(input("Ingrese el id del registro de fitness a editar: "))
                                if check_health_exists(id_health):
                                    break
                                print(f"{Fore.RED}{Style.BRIGHT}Advertencia: No se encontró ningún registro de salud con el ID proporcionado.{Style.RESET_ALL}\n")
                            except ValueError:
                                print(f"{Fore.RED}{Style.BRIGHT}Error: Por favor, ingrese un número entero válido.{Style.RESET_ALL}\n")
                        update_fitness(id_health)

                    case '4':
                        fetch_health()
                        id_health = int(input("Ingrese el id del registro a eliminar: "))
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
