from colorama import Fore, Style
from database.connection import DatabaseConnection
from mysql.connector import Error
from users.read_users import read_users
from tabulate import tabulate
from utils.loaders import Loader

def delete_user(id_user):
    try:
        conn = DatabaseConnection().connect_to_database()
        cursor = conn.cursor()
        query = "UPDATE users set state = '3' WHERE id = %s"
        cursor.execute(query, (id_user,))
        conn.commit()
        loader = Loader()
        loader.delete_record(f'usuario con id {id_user}')
        conn.close()
    except Error as e:
        print(f"\nError al eliminar datos: {e}")

    finally:
        cursor.close()
