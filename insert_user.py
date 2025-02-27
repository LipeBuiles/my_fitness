import time
import sys
import bcrypt
from mysql.connector import Error
from conection import connect_to_database
from colorama import Fore, Style
from loader import DataLoader
from clear import clear_console

def hash_password(password):
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password.decode('utf-8')

def insert_user(name, user_name, email, password, state):
    try:
        conn = connect_to_database()
        cursor = conn.cursor()
        hashed_password = hash_password(password)
        query = """INSERT INTO users (name, user_name, email, password, state)
                   VALUES (%s, %s, %s, %s, %s)"""
        values = (name, user_name, email, hashed_password, state)
        cursor.execute(query, values)
        conn.commit()
        loader = DataLoader(user_name)
        print(loader.load_create_user())
        time.sleep(2)
        conn.close()
        clear_console()

    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()
