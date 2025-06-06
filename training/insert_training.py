from database.connection import DatabaseConnection
from mysql.connector import Error
import utils.loaders as Loader

def insert_training(id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO training (id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
        values = (id_health, id_type_training, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG)
        cursor.execute(query, values)
        conn.commit()
        insert_id = cursor.lastrowid
        loader = Loader.Loader()
        loader.insert_record("training")
        conn.close()
        return insert_id

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()


def insert_candence(id_training, cadence_AVG, cadence_max):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO cadence (id_training, cadence_AVG, cadence_max)
                   VALUES (%s, %s, %s)"""
        values = (id_training, cadence_AVG, cadence_max)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("cadencia")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_heart_rate(id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO heart_rate (id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
        values = (id_training, heart_rate_AVG, heart_rate_max, ligth_pace, intensive_pace, aerobic_pace, anaerobic_pace, vo2_max)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("ritmo cardiaco")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_pace(id_training, pace, pace_max):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO pace (id_training, pace, pace_max)
                   VALUES (%s, %s, %s)"""
        values = (id_training, pace, pace_max)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("ritmo")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_pace_for_km(id_training, *pace_for_km):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        for km in range(len(pace_for_km)):
            query = """INSERT INTO pace_for_km (id_training, km, pace)
                        VALUES (%s, %s, %s)"""
            values = (id_training, km + 1, pace_for_km[km])
            cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("ritmo por km")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_stride_cm(id_training, stride_cm, stride_max):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO stride_cm (id_training, stride_AVG, stride_max)
                   VALUES (%s, %s, %s)"""
        values = (id_training, stride_cm, stride_max)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("zancada")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

def insert_type_training(name):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO type_training (name)
                   VALUES (%s)"""
        values = (name,)
        cursor.execute(query, values)
        conn.commit()
        loader = Loader.Loader()
        loader.insert_record("tipo de entrenamiento")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()