from conection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_fitness_from_db():
    # Conectar a la base de datos SQLite
    conn = connect_to_database()
    cursor = conn.cursor()

    # Leer todos los registros de la tabla user ordenados por id DESC
    query = "SELECT date, calories, steps, distance, moviment, in_training FROM health ORDER BY id DESC"
    cursor.execute(query)

    # Obtener los nombres de las columnas
    columns = ["Fecha", "Calorias", "Pasos", "Distancia", "Movimiento", "En entrenamiento"]

    # Almacenar los registros en un DataFrame de pandas
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    

    # Cerrar la conexión a la base de datos
    conn.close()

    # Retornar el DataFrame mostrando tipo tabla
    return print('\n' + df)
