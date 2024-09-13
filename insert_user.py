import mysql.connector
from mysql.connector import Error
import bcrypt
from dotenv import load_dotenv
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

def insert_user(connection, name, user_name, email, password, state):
    try:
        cursor = connection.cursor()
        hashed_password = hash_password(password)
        query = """INSERT INTO users (name, user_name, email, password, state)
                   VALUES (%s, %s, %s, %s, %s)"""
        values = (name, user_name, email, hashed_password, state)
        cursor.execute(query, values)
        connection.commit()
        print("\nUsuario insertado con éxito")
    except Error as e:
        print(f"\nError al insertar datos: {e}")
    finally:
        cursor.close()

if __name__ == "__main__":
    conn = connect_to_database()
    if conn:
        insert_user(conn, 'Juan Felipe Builes', 'elpinchepastel', 'elpinchepastel@gmail.com', 'Pactia.2015***', '1')
        conn.close()
