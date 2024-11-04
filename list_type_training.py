from conection import connect_to_database

def fetch_type_training():
    conn = connect_to_database()
    cursor = conn.cursor()

    query = "SELECT * FROM type_training ORDER BY name ASC"
    cursor.execute(query)

    data = cursor.fetchall()

    training_list = [{"id": row[0], "name": row[1]} for row in data]

    conn.close()

    return training_list
