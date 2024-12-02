from conection import connect_to_database
from tabulate import tabulate
import pandas as pd

def fetch_dreams_from_db():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT ligth, deep, REM, awake, heart_rate, total_dream FROM dream ORDER BY id DESC"
    cursor.execute(query)

    columns = ["Ligero", "Profundo", "REM", "Despierto", "Ritmo Cardiaco", "Total Sueño"]

    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    
    # Remove "0 days " from the time columns
    for col in ["Ligero", "Profundo", "REM", "Total Sueño"]:
        df[col] = df[col].astype(str).str.replace("0 days ", "")
    
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    conn.close()

    return print('\n' + df)


def fetch_dreams():
    conn = connect_to_database()
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
    conn = connect_to_database()
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
    df = tabulate(df, headers='keys', tablefmt='fancy_grid', showindex=False)
    return print('\n' + df)
    
