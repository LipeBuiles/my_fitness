from conection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_users_from_db():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT name, user_name, email, state FROM users WHERE state != '3' ORDER BY id DESC"
    cursor.execute(query)

    columns = ["Nombre", "Usuario", "Correo Electronico", "Estado"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    

    conn.close()

    return print('\n' + df)

def read_users():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT* FROM users WHERE state != '3' ORDER BY id DESC"
    cursor.execute(query)

    data = cursor.fetchall()
    columns = ["id", "Nombre", "Usuario", "Correo Electronico", "Contraseña", "Estado"]
    df = pd.DataFrame(data, columns=columns)
    df_str = df.to_string(index=False)

    conn.close()

    return df, df_str