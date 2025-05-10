from colorama import Fore, Style
from database.connection import DatabaseConnection
from mysql.connector import Error
import sys
import time
from utils.loaders import Loader

def insert_dream(ligth, deep, REM, awake, heart_rate, total_dream, id_health):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = """INSERT INTO dream (ligth, deep, REM, awake, heart_rate, total_dream, id_health)
                   VALUES (%s, %s, %s, %s, %s, %s, %s)"""
        values = (ligth, deep, REM, awake, heart_rate, total_dream, id_health)
        cursor.execute(query, values)
        conn.commit()
        conn.close()
        loader = Loader()
        loader.insert_record("sueño")

    except Error as e:
        print(f"\nError al insertar datos: {e}")
        return None

    finally:
        cursor.close()

