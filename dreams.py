from read_health import fetch_health

def read_data_dream():
    while True:
        try:
            ligth = input("Ingrese el tiempo de sueño ligero (HH:mm:ss): ")
            hours, minutes, seconds = map(int, ligth.split(':'))
            if hours < 0 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese el tiempo en formato HH:mm:ss.")
            
    while True:
        try:
            deep = input("Ingrese el tiempo de sueño profundo (HH:mm:ss): ")
            hours, minutes, seconds = map(int, deep.split(':'))
            if hours < 0 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese el tiempo en formato HH:mm:ss.")
    while True:
        try:
            REM = input("Ingrese el tiempo de sueño REM (HH:mm:ss): ")
            hours, minutes, seconds = map(int, REM.split(':'))
            if hours < 0 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese el tiempo en formato HH:mm:ss.")
    while True:
        try:
            awake = int(input("Ingrese las veces que se desperto: "))
            if awake < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            heart_rate = int(input("Ingrese su ritmo cardiaco: "))
            if heart_rate < 0:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    while True:
        try:
            total_dream = input("Ingrese el tiempo total de sueño (HH:mm:ss): ")
            hours, minutes, seconds = map(int, total_dream.split(':'))
            if hours < 0 or minutes < 0 or minutes >= 60 or seconds < 0 or seconds >= 60:
                raise ValueError
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese el tiempo en formato HH:mm:ss.")
    while True:
        try:
            fetch_health()
            id_health = int(input("Ingrese el ID del registro de salud al que pertenece el sueño: "))
            break
        except ValueError:
            print("Entrada no válida. Por favor, ingrese un número entero.")
    
    return ligth, deep, REM, awake, heart_rate, total_dream, id_health