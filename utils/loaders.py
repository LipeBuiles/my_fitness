from rich.console import Console
from rich.progress import Progress, SpinnerColumn, TextColumn, track
from rich.text import Text
import time
import os
import sys


class Loader:
    def loading(self):
        """
        Simulates a loading animation for the login process.
        """
        print("")
        console = Console()
        with Progress(
            SpinnerColumn(),
            TextColumn("[progress.description]{task.description}"),
            console=console,
        ) as progress:
            task = progress.add_task("[cyan]Ingresando...", total=None)
            time.sleep(2)  # Simulates loading time
            progress.remove_task(task)

        console.print("[green]¡Inicio de sesión exitoso!")

    def exit(self):
        """
        Displays a farewell message with an effect and exits the application.
        """
        print("")
        console = Console()
        farewell_message = Text("Saliendo de la aplicación. ¡Hasta luego!", style="bold red")
        with Progress() as progress:
            _ = progress.add_task(farewell_message, total=None)
            time.sleep(3)
            console.clear()
        if os.path.exists("logged_in_user.json"):
            os.remove("logged_in_user.json")
        time.sleep(2)
        sys.exit()

    def insert_record(self, record_name):
        """
        Displays a message indicating that a record is being inserted.

        Args:
            record_name (str): The name of the record to concatenate to the message.
        """
        console = Console()

        for step in track(range(100), description=f"Procesando {record_name} \n"):
            time.sleep(0.05)

        console.print(f"[green]Registro de {record_name} insertado exitosamente.")
        time.sleep(2)

        print("\n")

    def update_record(self, record_name):
        """
        Displays a message indicating that a record is being updated.

        Args:
            record_name (str): The name of the record to concatenate to the message.
        """
        console = Console()

        for step in track(range(100), description=f"Procesando {record_name} \n"):
            time.sleep(0.05)

        console.print(f"[green]Registro de {record_name} actualizado exitosamente.")
        time.sleep(2)

    def delete_record(self, record_name):
        """
        Displays a message indicating that a record is being deleted.

        Args:
            record_name (str): The name of the record to concatenate to the message.
        """
        console = Console()

        for step in track(range(100), description=f"Procesando {record_name} \n"):
            time.sleep(0.05)

        console.print(f"[green]Registro de {record_name} eliminado exitosamente.")
        time.sleep(2)