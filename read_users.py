from conection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_users_from_db():
    # Conectar a la base de datos SQLite
    conn = connect_to_database()
    cursor = conn.cursor()

    # Leer todos los registros de la tabla user ordenados por id DESC
    query = "SELECT name, user_name, email, state FROM users ORDER BY id DESC"
    cursor.execute(query)

    # Obtener los nombres de las columnas
    columns = ["Nombre", "Usuario", "Correo Electronico", "Estado"]

    # Almacenar los registros en un DataFrame de pandas
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    

    # Cerrar la conexión a la base de datos
    conn.close()

    # Retornar el DataFrame mostrando tipo tabla
    return print('\n' + df)

def read_users():
    # Conectar a la base de datos SQLite
    conn = connect_to_database()
    cursor = conn.cursor()

    # Leer todos los registros de la tabla user ordenados por id DESC
    query = "SELECT* FROM users ORDER BY id DESC"
    cursor.execute(query)

    data = cursor.fetchall()
    columns = ["id", "Nombre", "Usuario", "Correo Electronico", "Contraseña", "Estado"]
    df = pd.DataFrame(data, columns=columns)
    df_str = df.to_string(index=False)
    
    


    # Cerrar la conexión a la base de datos
    conn.close()

    # Retornar el DataFrame mostrando tipo tabla
    return df, df_str