from database.connection import DatabaseConnection
from tabulate import tabulate
import pandas as pd

def fetch_dreams_from_db():
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT h.date as date, d.ligth, d.deep, d.REM, d.awake, d.heart_rate, d.total_dream FROM dream d INNER JOIN health h ON d.id_health = h.id ORDER BY date desc"
    cursor.execute(query)

    columns = ["Fecha", "Ligero", "Profundo", "REM", "Despierto", "Ritmo Cardiaco", "Total Sueño"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    
    # Remove "0 days " from the time columns
    for col in ["Ligero", "Profundo", "REM", "Total Sueño"]:
        df[col] = df[col].astype(str).str.replace("0 days ", "")
    
    df = tabulate(df, headers='keys', tablefmt='github', showindex=False)
    df = df.replace('|', '\033[92m|\033[0m')  # Replace '|' with green-colored '|'
    conn.close()

    return print('\n' + df)


def fetch_dreams():
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT ligth, deep, REM, awake, heart_rate, total_dream FROM dream ORDER BY id DESC"
    cursor.execute(query)

    columns = ["Ligero", "Profundo", "REM", "Despierto", "Ritmo Cardiaco", "Total Sueño"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    
    # Remove "0 days " from the time columns
    for col in ["Ligero", "Profundo", "REM", "Total Sueño"]:
        df[col] = df[col].astype(str).str.replace("0 days ", "")
    
    df.index.name = 'ID'
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=True)
    conn.close()

    return print('\n' + df)

def fetch_dreams_df():
    conn = DatabaseConnection().connect_to_database()
    cursor = conn.cursor()

    query = "SELECT id, ligth, deep, REM, awake, heart_rate, total_dream, id_health FROM dream ORDER BY id DESC"
    cursor.execute(query)

    columns = ["ID", "Ligero", "Profundo", "REM", "Despierto", "Ritmo Cardiaco", "Total Sueño", "id_health"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    
    # Remove "0 days " from the time columns
    for col in ["Ligero", "Profundo", "REM", "Total Sueño"]:
        df[col] = df[col].astype(str).str.replace("0 days ", "")
    
    conn.close()

    return df

def fetch_dreams_id():
    df = fetch_dreams_df()
    df = tabulate(df, headers='keys', tablefmt='github', showindex=False)
    df = df.replace('|', '\033[92m|\033[0m')  # Replace '|' with green-colored '|'
    return print('\n' + df)
    
