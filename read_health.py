from conection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_health():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT id, date, calories, steps, distance, moviment, in_training FROM health ORDER BY id DESC"
    cursor.execute(query)

    columns = ["ID", "date", "Calorias", "Pasos", "Distancia", "Movimiento", "En entrenamiento"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    

    conn.close()

    return print('\n' + df)
