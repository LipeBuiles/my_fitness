from database.connection import DatabaseConnection
from mysql.connector import Error
import sys
import time
from colorama import Fore, Style
from utils.loaders import Loader

def insert_objetive(date, obj_calories, obj_steps, obj_moviment, obj_dream, user):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO objetives_day (date, obj_calories, obj_steps, obj_moviment, obj_dream, id_user_create, id_user_update)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        values = (date, obj_calories, obj_steps, obj_moviment, obj_dream, user, user)
        cursor.execute(query, values)
        conn.commit()
        conn.close()
        loader = Loader()
        loader.insert_record('Objetivo')

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()