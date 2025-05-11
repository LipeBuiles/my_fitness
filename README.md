# My Fitness

`My Fitness` is a Python application designed to track and analyze fitness performance statistics, potentially interfacing with data from Xiaomi fitness apps and storing information in a MySQL database.

## Features

*   User management
*   Tracking of fitness data (training, health, dreams, objectives)
*   Database interaction with MySQL
*   Error tracking with Sentry

## Technologies Used

*   Python
*   MySQL
*   Docker
*   **Python Libraries:**
    *   `mysql-connector-python` (for MySQL database connection)
    *   `pandas` & `numpy` (for data manipulation and analysis - based on typical fitness app needs and common libraries)
    *   `rich` & `tabulate` (for enhanced terminal output)
    *   `python-dotenv` (for managing environment variables)
    *   `sentry-sdk` (for error reporting)
    *   `bcrypt` (for password hashing)
    *   `colorama` (for colored terminal text)

## Prerequisites

*   Python 3.x
*   Pip (Python package installer)
*   MySQL Server
*   Docker (optional, for containerized deployment)
*   Git (for cloning the repository)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/LipeBuiles/my_fitness.git
cd my_fitness
```

### 2. Environment Variables

This project uses a `.env` file to manage sensitive information like API keys. Create a `.env` file in the root of the project directory and add the following, replacing placeholders with your actual values:

```env
SENTRY_API_KEY="your_sentry_dsn_here"
# Add other environment variables if needed, e.g., for database connection
# DB_HOST="localhost"
# DB_USER="your_db_user"
# DB_PASSWORD="your_db_password"
# DB_NAME="my_fitness_db"
```

### 3. Setup and Run

You can set up and run the project either locally using a Python virtual environment or using Docker.

#### Option A: Local Setup (Virtual Environment)

1.  **Create and Activate Virtual Environment:**

    *   **Linux/macOS:**
        ```bash
        python3 -m venv venv
        source venv/bin/activate
        ```
    *   **Windows (PowerShell):**
        ```powershell
        python -m venv venv
        .\venv\Scripts\Activate.ps1
        ```
    *   **Windows (Command Prompt):**
        ```cmd
        python -m venv venv
        .\venv\Scripts\activate.bat
        ```

2.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Run the Application:**
    ```bash
    python main.py
    ```

#### Option B: Docker Setup

1.  **Build the Docker Image:**
    Ensure Docker is running, then in the project root directory:
    ```bash
    docker build -t my_fitness_app .
    ```

2.  **Run the Docker Container:**
    To run the application using the Docker image and pass the environment variables from your `.env` file:
    ```bash
    docker run -it --rm --env-file .env my_fitness_app
    ```
    *(Note: Ensure your `DatabaseConnection` in `database/connection.py` is configured to use environment variables for database credentials if you plan to connect to an external/host MySQL server from within Docker. If MySQL is also running in Docker, you might need to set up Docker networking.)*

## Project Structure

```
my_fitness/
├── Dockerfile             # Defines the Docker image
├── main.py                # Main entry point of the application
├── menu.py                # Handles the user interface/menu
├── README.md              # This filereplac
├── requirements.txt       # Python dependencies
├── .env.example           # Example environment variables (optional, good practice)
├── database/              # Database related modules (e.g., connection.py)
│   └── connection.py
├── users/                 # User management modules
│   └── manager_user.py
├── dreams/                # Modules related to 'dreams' feature
├── fitness/               # Modules related to 'fitness' feature
├── health/                # Modules related to 'health' feature
├── objectives/            # Modules related to 'objectives' feature
├── training/              # Modules related to 'training' feature
└── utils/                 # Utility scripts or modules
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

Copyright (c) 2025 Lipe Builes.

This project is licensed under the **MIT License**. This is a permissive free software license originating at the Massachusetts Institute of Technology (MIT). For the full license text, please see [MIT License](https://choosealicense.com/licenses/mit/).