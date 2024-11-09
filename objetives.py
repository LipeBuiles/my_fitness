import json

def fetch_create_objtives():
    while True:
        try:
            date = input("Ingrese la fecha (YYYY-MM-DD): ")
            year, month, day = map(int, date.split('-'))
            if year < 0 or month < 0 or month > 12 or day < 0 or day > 31:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese la fecha en formato YYYY-MM-DD.")
    while True:
        try:
            obj_calories = int(input("Ingrese el objetivo de las calorias: "))
            if obj_calories < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            obj_steps = int(input("Ingrese el objetivo de los pasos: "))
            if obj_steps < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            obj_moviment = int(input("Ingrese el objetivo de los minutos de movimiento: "))
            if obj_moviment < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            obj_dream = float(input("Ingrese el objetivo de las horas de sueño: "))
            if obj_dream < 0:
                raise ValueError
            break    
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número real.")
    
    with open('logged_in_user.json', 'r') as f:
        data = json.load(f)
        user = data['id']

    return date, obj_calories, obj_steps, obj_moviment, obj_dream, user
        
    
