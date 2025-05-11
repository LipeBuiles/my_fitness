from menu import principal_menu
from database.connection import DatabaseConnection
from users.manager_user import UserManager
import sentry_sdk
from dotenv import load_dotenv
import os

load_dotenv()

sentry_sdk.init(
    dsn=os.getenv('SENTRY_API_KEY'),
    send_default_pii=True,
)

if __name__ == "__main__":
    try:
        connection = DatabaseConnection()
        conn = connection.connect_to_database()
        if conn:
            input_user_name = input("\nIngrese su nombre de usuario: ")
            login = UserManager(conn)
            if login.login_user(input_user_name):
                close = connection.close_connection()
                principal_menu()
    except Exception as e:
        sentry_sdk.capture_exception(e)
        print("An unexpected error occurred. The issue has been reported.")
