from menu import principal_menu
from database.connection import connect_to_database, login_user
import sentry_sdk

sentry_sdk.init(
    dsn="https://9114239bb338158dd03423b6237838f3@o4509120832667648.ingest.us.sentry.io/4509120834371584",
    send_default_pii=True,
)

if __name__ == "__main__":
    try:
        conn = connect_to_database()
        if conn:
            input_user_name = input("\nIngrese su nombre de usuario: ")
            
            if login_user(conn, input_user_name):
                conn.close()
                principal_menu()
    except Exception as e:
        sentry_sdk.capture_exception(e)
        print("An unexpected error occurred. The issue has been reported.")
