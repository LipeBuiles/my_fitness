from menu import principal_menu
from conection import connect_to_database, login_user

if __name__ == "__main__":
    conn = connect_to_database()
    if conn:
        input_user_name = input("\nIngrese su nombre de usuario: ")
        
        if login_user(conn, input_user_name):
            conn.close()
            principal_menu()
