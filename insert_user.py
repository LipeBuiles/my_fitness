from colorama import Fore, Style
from mysql.connector import Error
import bcrypt
import sys
import time
from conection import connect_to_database
    
def animate_login():
    print("\n")
    texto = "Insertando usuario "
    iteraciones = 50
    delay = 0.05
    puntos = 0

    for _ in range(iteraciones):
        sys.stdout.write(Fore.BLUE + f'\r{texto}{"." * puntos}' + Style.RESET_ALL)
        sys.stdout.flush()
        time.sleep(delay)
        puntos += 1
    
    print("\n")

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
        animate_login()
        print("\nUsuario insertado con éxito")
        conn.close()

    except Error as e:
        print(f"\nError al insertar datos: {e}")

    finally:
        cursor.close()
