from tqdm import tqdm
import time
from colorama import Fore, Style

class DataLoader:
    def __init__(self, input_data: str):
        self.input_data = input_data

    def load_insert_data(self) -> str:
        for i in tqdm(range(100)):
            time.sleep(0.01)
        return f"{Fore.GREEN}¡EL registro de {self.input_data} se ha cargado correctamente!{Style.RESET_ALL}"

    def load_delete_data(self) -> str:
        for i in tqdm(range(100)):
            time.sleep(0.01)
        return f"{Fore.GREEN}¡EL registro de {self.input_data} se ha eliminado correctamente!{Style.RESET_ALL}"

    def load_login_data(self) -> str:
        for i in tqdm(range(100)):
            time.sleep(0.01)
        return f"{Fore.GREEN}¡El usuario {self.input_data} ha iniciado sesión correctamente!{Style.RESET_ALL}"

    def load_create_user(self) -> str:
        for i in tqdm(range(100)):
            time.sleep(0.01)
        return f"{Fore.GREEN}¡El usuario {self.input_data} ha sido creado correctamente!{Style.RESET_ALL}"