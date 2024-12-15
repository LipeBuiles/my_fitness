from conection import connect_to_database
import json
from datetime import datetime

def get_logged_in_user_id():
    try:
        with open('logged_in_user.json', 'r') as f:
            data = json.load(f)
            return data['id']
    except FileNotFoundError:
        print("No hay ningún usuario logueado.")
        return None

def update_fitness(id_health):
    conn = connect_to_database()
    cursor = conn.cursor()
    query = "SELECT * FROM health WHERE id = %s"
    values = (id_health,)
    cursor.execute(query, values)
    data = cursor.fetchall()
    
    date = data[0][1].strftime('%Y-%m-%d')
    calories = data[0][2]
    steps = data[0][3]
    distance = data[0][4]
    moviment = data[0][5]
    in_training = data[0][6]

    new_date = input(f"La fecha actual es {date}. Ingrese la nueva fecha (YYYY-MM-DD) o enter para conservar la actual: ")
    if new_date == "":
        new_date = date

    new_calories = input(f"Las calorias actuales son {calories}. Ingrese las nuevas calorias o enter para conservar las actuales: ")
    if new_calories == "":
        new_calories = calories

    new_steps = input(f"Los pasos actuales son {steps}. Ingrese los nuevos pasos o enter para conservar los actuales: ")
    if new_steps == "":
        new_steps = steps

    new_distance = input(f"La distancia actual es {distance}. Ingrese la nueva distancia o enter para conservar la actual: ")
    if new_distance == "":
        new_distance = distance
        
    new_moviment = input(f"El movimiento actual es {moviment}. Ingrese el nuevo movimiento o enter para conservar el actual: ")
    if new_moviment == "":
        new_moviment = moviment

    new_in_training = input(f"El estado de entrenamiento actual es {in_training}. Ingrese el nuevo estado de entrenamiento:\n0. Sin entrenamiento\n1. Con entrenamiento\no enter para conservar el actual: ")
    if new_in_training == "":
        new_in_training = in_training

    id_user_update = int(get_logged_in_user_id())
    update_date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    
    query = "SELECT * FROM training WHERE id_health = %s"
    values = (id_health,)
    cursor.execute(query, values)
    data = cursor.fetchall()

    id_training = data[0][0]
    id_type_training = data[0][2]
    km_distance = data[0][3]
    kcal_active = data[0][4]
    kcal_total = data[0][5]
    pace = str(data[0][6])
    steps = data[0][7]
    heart_rate_AVG = data[0][8]

    new_id_type_training = input(f"El entrenamiento actual es {id_type_training}. Ingrese el nuevo entrenamiento o enter para conservar el actual: ")
    if new_id_type_training == "":
        new_id_type_training = int(id_type_training)
    else:
        new_id_type_training = int(new_id_type_training)

    new_km_distance = input(f"La distancia en km actual es {km_distance}. Ingrese la nueva distancia en km o enter para conservar la actual: ")
    if new_km_distance == "":
        new_km_distance = km_distance
        
    new_kcal_active = input(f"Las calorias activas actuales son {kcal_active}. Ingrese las nuevas calorias activas o enter para conservar las actuales: ")
    if new_kcal_active == "":
        new_kcal_active = kcal_active

    new_kcal_total = input(f"Las calorias totales actuales son {kcal_total}. Ingrese las nuevas calorias totales o enter para conservar las actuales: ")
    if new_kcal_total == "":
        new_kcal_total = kcal_total

    new_pace = input(f"El ritmo actual es {pace}. Ingrese el nuevo ritmo o enter para conservar el actual: ")
    if new_pace == "":
        new_pace = pace
    
    new_steps = input(f"Los pasos actuales son {steps}. Ingrese los nuevos pasos o enter para conservar los actuales: ")
    if new_steps == "":
        new_steps = steps
        
    new_heart_rate_AVG = input(f"La frecuencia cardiaca promedio actual es {heart_rate_AVG}. Ingrese la nueva frecuencia cardiaca promedio o enter para conservar la actual: ")
    if new_heart_rate_AVG == "":
        new_heart_rate_AVG = heart_rate_AVG

    query = "SELECT * FROM cadence WHERE id_training = %s"
    values = (id_training,)
    cursor.execute(query, values)
    data = cursor.fetchall()

    cadence_AVG = data[0][2]
    cadence_max = data[0][3]

    new_cadence_AVG = input(f"La cadencia promedio actual es {cadence_AVG}. Ingrese la nueva cadencia promedio o enter para conservar la actual: ")
    if new_cadence_AVG == "":
        new_cadence_AVG = cadence_AVG

    new_cadence_max = input(f"La cadencia máxima actual es {cadence_max}. Ingrese la nueva cadencia máxima o enter para conservar la actual: ")
    if new_cadence_max == "":
        new_cadence_max = cadence_max

    query = "SELECT * FROM heart_rate WHERE id_training = %s"
    values = (id_training,)
    cursor.execute(query, values)
    data = cursor.fetchall()

    heart_rate_AVG = data[0][2]
    heart_rate_max = data[0][3]
    ligth_pace = data[0][4]
    intensive_pace = data[0][5]
    aerobic_pace = data[0][6]
    anaerobic_pace = data[0][7]
    vo2_max = data[0][8]

    new_heart_rate_AVG = input(f"La frecuencia cardiaca promedio actual es {heart_rate_AVG}. Ingrese la nueva frecuencia cardiaca promedio o enter para conservar la actual: ")
    if new_heart_rate_AVG == "":
        new_heart_rate_AVG = heart_rate_AVG

    new_heart_rate_max = input(f"La frecuencia cardiaca máxima actual es {heart_rate_max}. Ingrese la nueva frecuencia cardiaca máxima o enter para conservar la actual: ")
    if new_heart_rate_max == "":
        new_heart_rate_max = heart_rate_max
        
    new_ligth_pace = input(f"El ritmo ligero actual es {ligth_pace}. Ingrese el nuevo ritmo ligero o enter para conservar el actual: ")
    if new_ligth_pace == "":
        new_ligth_pace = ligth_pace

    new_intensive_pace = input(f"El ritmo intenso actual es {intensive_pace}. Ingrese el nuevo ritmo intenso o enter para conservar el actual: ")
    if new_intensive_pace == "":
        new_intensive_pace = intensive_pace

    new_aerobic_pace = input(f"El ritmo aeróbico actual es {aerobic_pace}. Ingrese el nuevo ritmo aeróbico o enter para conservar el actual: ")
    if new_aerobic_pace == "":
        new_aerobic_pace = aerobic_pace

    new_anaerobic_pace = input(f"El ritmo anaeróbico actual es {anaerobic_pace}. Ingrese el nuevo ritmo anaeróbico o enter para conservar el actual: ")
    if new_anaerobic_pace == "":
        new_anaerobic_pace = anaerobic_pace

    new_vo2_max = input(f"El VO2 máx actual es {vo2_max}. Ingrese el nuevo VO2 máx o enter para conservar el actual: ")
    if new_vo2_max == "":
        new_vo2_max = vo2_max

    query = "SELECT * FROM pace WHERE id_training = %s"
    values = (id_training,)
    cursor.execute(query, values)
    data = cursor.fetchall()

    pace = data[0][2]
    pace_max = data[0][3]

    new_pace = input(f"El ritmo actual es {pace}. Ingrese el nuevo ritmo o enter para conservar el actual: ")
    if new_pace == "":
        new_pace = pace

    new_pace_max = input(f"El ritmo máximo actual es {pace_max}. Ingrese el nuevo ritmo máximo o enter para conservar el actual: ")
    if new_pace_max == "":
        new_pace_max = pace_max

    query = "SELECT * FROM stride_cm WHERE id_training = %s"
    values = (id_training,)
    cursor.execute(query, values)
    data = cursor.fetchall()

    stride_AVG = data[0][2]
    stride_max = data[0][3]

    new_stride_AVG = input(f"La zancada promedio actual es {stride_AVG}. Ingrese la nueva zancada promedio o enter para conservar la actual: ")
    if new_stride_AVG == "":
        new_stride_AVG = stride_AVG

    new_stride_max = input(f"La zancada máxima actual es {stride_max}. Ingrese la nueva zancada máxima o enter para conservar la actual: ")
    if new_stride_max == "":
        new_stride_max = stride_max

    # # query = "SELECT * FROM pace_for_km WHERE id_training = %s"
    # # values = (id_training,)
    # # cursor.execute(query, values)
    # # data = cursor.fetchall()

    # query = "UPDATE health SET date = %s, calories = %s, steps = %s, distance = %s, moviment = %s, in_training = %s, id_user_update = %s, update_date = %s WHERE id = %s"
    # values = (new_date, new_calories, new_steps, new_distance, new_moviment, new_in_training, id_user_update, update_date, id_health)
    # cursor.execute(query, values)
    # conn.commit()

    # query = "UPDATE training SET id_type_training = %s, km_distance = %s, kcal_active = %s, kcal_total = %s, pace = %s, steps = %s, heart_rate_AVG = %s WHERE id_health = %s"
    # values = (new_id_type_training, new_km_distance, new_kcal_active, new_kcal_total, new_pace, new_steps, new_heart_rate_AVG, id_health)
    # cursor.execute(query, values)
    # conn.commit()

    # query = "UPDATE cadence SET cadence_AVG = %s, cadence_max = %s WHERE id_training = %s"
    # values = (new_cadence_AVG, new_cadence_max, id_training)
    # cursor.execute(query, values)
    # conn.commit()

    # query = "UPDATE heart_rate SET heart_rate_AVG = %s, heart_rate_max = %s, ligth_pace = %s, intensive_pace = %s, aerobic_pace = %s, anaerobic_pace = %s, vo2_max = %s WHERE id_training = %s"
    # values = (new_heart_rate_AVG, new_heart_rate_max, new_ligth_pace, new_intensive_pace, new_aerobic_pace, new_anaerobic_pace, new_vo2_max, id_training)
    # cursor.execute(query, values)
    # conn.commit()

    # query = "UPDATE pace SET pace = %s, pace_max = %s WHERE id_training = %s"
    # values = (new_pace, new_pace_max, id_training)
    # cursor.execute(query, values)
    # conn.commit()

    # query = "UPDATE stride_cm SET stride_AVG = %s, stride_max = %s WHERE id_training = %s"
    # values = (new_stride_AVG, new_stride_max, id_training)
    # cursor.execute(query, values)
    # conn.commit()

    conn.close()
    
    print("Registro de fitness actualizado con éxito")
