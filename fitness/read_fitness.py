from database.connection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_fitness_from_db():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT date, calories, steps, distance, moviment, in_training FROM health ORDER BY id DESC"
    cursor.execute(query)

    columns = ["Fecha", "Calorias", "Pasos", "Distancia", "Movimiento", "En entrenamiento"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='github', showindex=False)
    df = df.replace('|', '\033[92m|\033[0m')  # Replace '|' with green-colored '|'
    
    conn.close()

    return print('\n' + df)
