from database.connection import DatabaseConnection
from colorama import Fore, Style
import sys
import time
from utils.loaders import Loader

def id_is_valid(id_dream):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "SELECT EXISTS(SELECT 1 FROM dream WHERE id = %s);"
        values = (id_dream,)
        cursor.execute(query, values)
        result = cursor.fetchone()
        if not result[0]:
            print(result)
            print("\nEl registro no existe")
        else:
            print("\nRegistro encontrado")
            return 1

    except Exception as e:
        print(f"Error: {e}")

def delete_dream(id_dream):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()

        query = "DELETE from dream WHERE id = %s"
        values = (id_dream,)
        cursor.execute(query, values)
        conn.commit()
        conn.close()

        loader = Loader()
        loader.delete_record("sueño")

    except Exception as e:
        print(f"Error: {e}")