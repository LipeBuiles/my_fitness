from dotenv import load_dotenv
from mysql.connector import Error
import bcrypt
import mysql.connector
import os

load_dotenv()

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST'),
            database=os.getenv('DB_DATABASE'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD')
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"\nError al conectar a la base de datos: {e}")
        return None

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
        print("\nUsuario insertado con éxito")
        conn.close()
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()
