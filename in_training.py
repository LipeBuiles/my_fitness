from list_type_training import fetch_type_training

def fetch_training(in_training):
    names = [item['name'] for item in fetch_type_training()]
    in_training_aux = in_training
    training_options = names
    while True:
        print("Seleccione el tipo de entrenamiento:")
        for idx, option in enumerate(training_options, start=1):
            print(f"{idx}: {option}")
        try:
            training_idx = int(input())
            if training_idx <= 1 or training_idx >= len(training_options):
                break
        except ValueError:
            print("Opción no válida. Por favor, seleccione una opción de la lista.")
    option = training_options[int(training_idx)-1]
    id_found = next((item['id'] for item in fetch_type_training() if item['name'] == option), None)

    while True:
        try:
            km_distance = float(input("Ingrese la distancia en km: "))
            if km_distance < 0 or len(str  
(km_distance).split('.')[0]) > 5 or len(str(km_distance).split('.')[1]) > 2:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número con hasta 5 dígitos enteros y 2 decimales.")

    while True:
        try:
            kcal_active = int(input("Ingrese las calorias activas: "))
            if kcal_active < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")

    while True:
        try:
            kcal_total = int(input("Ingrese las calorias totales: "))
            if kcal_total < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")

    while True:
        try:
            pace = input("Ingrese el ritmo (HH:mm:ss): ")
            hours, minutes, seconds = map(int, pace.split(':'))
            if hours < 0 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese el ritmo en formato HH:mm:ss.")

    while True:
        try:
            steps = int(input("Ingrese los pasos: "))
            if steps < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")

    while True:
        try:
            heart_rate_AVG = int(input("Ingrese el ritmo cardiaco promedio: "))
            if heart_rate_AVG < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")

    return id_found, km_distance, kcal_active, kcal_total, pace, steps, heart_rate_AVG

def fetch_cadence():
    while True:
        try:
            cadence_AVG = int(input("Ingrese la cadencia promedio: "))
            if cadence_AVG < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")
    while True:
        try:
            cadence_max = int(input("Ingrese la cadencia máxima: "))
            if cadence_max < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero positivo.")

    return cadence_AVG, cadence_max