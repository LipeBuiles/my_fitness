from datetime import datetime

class OptionsFitness:
    def collect_fitness_data(self):
        while True:
            date_str = input("\nIngrese la fecha del registro (YYYY-MM-DD): ")
            try:
                date = datetime.strptime(date_str, "%Y-%m-%d").date()
            except ValueError:
                print("Formato de fecha incorrecto. Por favor, use el formato YYYY-MM-DD.")
                continue
            try:
                calories = int(input("Ingrese las calorias: "))
            except ValueError:
                print("Por favor, ingrese un número entero para las calorías.")
                continue
            try:
                steps = int(input("Ingrese los pasos: "))
            except ValueError:
                print("Por favor, ingrese un número entero para los pasos.")
                continue
            try:
                distance = float(input("Ingrese la distancia: "))
                if len(str(int(distance))) > 5 or len(str(distance).split('.')[1]) > 2:
                    raise ValueError
            except ValueError:
                print("Por favor, ingrese una distancia válida con hasta 5 dígitos en la parte entera y 2 dígitos en la parte decimal.")
                continue
            try:
                moviment = int(input("Ingrese el movimiento: "))
            except ValueError:
                print("Por favor, ingrese un número entero para el movimiento.")
                continue
            in_training = input("""Ingrese si esta en entrenamiento: \n
                                    0. Sin entrenamiento
                                    1. Con entrenamiento
                                    """)
            break
        return {
            "date": date,
            "calories": calories,
            "steps": steps,
            "distance": distance,
            "moviment": moviment,
            "in_training": in_training
        }