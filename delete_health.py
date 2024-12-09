from conection import connect_to_database
from colorama import Fore, Style
import sys
import time

def animate_delete():
    print("\n")
    texto = "Eliminando registro del sueño "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    print("\n")

def delete_dream(id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()

        query = "DELETE from dream WHERE id_health = %s"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        animate_delete()

    except Exception as e:
        print(f"Error: {e}")
    
    finally:
        conn.close()
        
def search_id_train(id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        query = "SELECT * FROM training WHERE id_health = %s;"
        values = (id_health,)
        cursor.execute(query, values)
        data = cursor.fetchall()
        conn.close()
        if data == []:
            return None
        return data[0][0]
    except Exception as e:
        print(f"Error: {e}")
    finally:
        conn.close()

def delete_all_data_trainig(id_training, id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        
        query = "DELETE FROM cadence WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de cadencia eliminado exitosamente")

        query = "DELETE FROM heart_rate WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de ritmo cardiaco eliminado exitosamente")

        query = "DELETE FROM pace WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de ritmo eliminado exitosamente pace")

        query = "DELETE FROM pace_for_km WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de ritmo por kilometro eliminado exitosamente")

        query = "DELETE FROM stride_cm WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de zancada eliminado exitosamente ")

        query = "DELETE FROM training WHERE id_health = %s;"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de entrenamiento eliminado exitosamente")

    except Exception as e:
        print(f"Error: {e}")

    finally:
        conn.close()

def delete_health(id_health):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()

        query = "DELETE FROM health WHERE id = %s;"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        print("Registro de salud eliminado exitosamente")

    except Exception as e:
        print(f"Error: {e}")
    
    finally:
        conn.close()