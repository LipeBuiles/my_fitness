from database.connection import DatabaseConnection
from mysql.connector import Error
import utils.loaders as Loader
    
def insert_fitness(date, calories, steps, distance, moviment, in_training, id_user_create, id_user_update):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO health (date, calories, steps, distance, moviment, in_training, id_user_create, id_user_update)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
        values = (date, calories, steps, distance, moviment, in_training, id_user_create, id_user_update)
        cursor.execute(query, values)
        conn.commit()
        insert_id = cursor.lastrowid
        loader = Loader.Loader()
        loader.insert_record("fitness")
        conn.close()
        return insert_id

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()

