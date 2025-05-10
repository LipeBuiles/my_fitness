from database.connection import DatabaseConnection
from colorama import Fore, Style
import sys
import time
import utils.loaders as Loader

def delete_dream(id_health):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "DELETE from dream WHERE id_health = %s"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('sueño')

    except Exception as e:
        print(f"Error: {e}")
    
    finally:
        conn.close()
        
def search_id_train(id_health):
    try:
        conn = DatabaseConnection().connect_to_database()
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
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        
        query = "DELETE FROM cadence WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('cadencia')

        query = "DELETE FROM heart_rate WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('frecuencia cardiaca')

        query = "DELETE FROM pace WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('ritmo')

        query = "DELETE FROM pace_for_km WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('ritmo por km')

        query = "DELETE FROM stride_cm WHERE id_training = %s;"
        values = (id_training,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('longitud de zancada')

        query = "DELETE FROM training WHERE id_health = %s;"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('entrenamiento')

    except Exception as e:
        print(f"Error: {e}")

    finally:
        conn.close()

def delete_health(id_health):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "DELETE FROM health WHERE id = %s;"
        values = (id_health,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.delete_record('fitness')

    except Exception as e:
        print(f"Error: {e}")
    
    finally:
        conn.close()