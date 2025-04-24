from database.connection import DatabaseConnection
from tabulate import tabulate
import pandas as pd

def fetch_users_from_db():
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT name, user_name, email, state FROM users WHERE state != '3' ORDER BY id DESC"
    cursor.execute(query)

    columns = ["Nombre", "Usuario", "Correo Electronico", "Estado"]

    data = cursor.fetchall()
    for i, row in enumerate(data):
        state = row[3]
        if state == '0':
            state = 'Inactivo'
        elif state == '1':
            state = 'Activo'
        elif state == '2':
            state = 'Bloqueado'
        data[i] = row[:3] + (state,)
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='github', showindex=False)
    df = df.replace('|', '\033[92m|\033[0m')  # Replace '|' with green-colored '|'

    conn.close()

    return print('\n' + df)

def read_users():
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT id, name, user_name, email, password, state FROM users WHERE state != '3' ORDER BY id DESC"
    cursor.execute(query)

    data = cursor.fetchall()
    state_mapping = {'0': 'Inactivo', '1': 'Activo', '2': 'Bloqueado'}
    data = [row[:5] + (state_mapping.get(row[5], row[5]),) for row in data]
    columns = ["id", "Nombre", "Usuario", "Correo Electronico", 'Contraseña', "Estado"]
    df = pd.DataFrame(data, columns=columns)
    
    conn.close()

    return df

def user_exists(user_id):
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT EXISTS(SELECT 1 FROM users WHERE id = %s)"
    cursor.execute(query, (user_id,))
    exists = cursor.fetchone()[0]

    conn.close()

    return bool(exists)