from database.connection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_objetive_day_from_db():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT date, obj_calories, obj_steps, obj_moviment, obj_dream FROM objetives_day ORDER BY id DESC limit 1"
    cursor.execute(query)

    columns = ["Fecha Objetivo", "Objetivo Calorias", "Objetivo Pasos", "Objetivo Movimiento", "Objetivo Sueño"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    conn.close()

    return print('\n' + df, end='\n')

def fetch_objetive_day():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT date, obj_calories, obj_steps, obj_moviment, obj_dream FROM objetives_day ORDER BY id DESC limit 1"
    cursor.execute(query)

    data = cursor.fetchall()
    conn.close()

    return data