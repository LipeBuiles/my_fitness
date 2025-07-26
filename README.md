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

## Quick Start with Docker

If you want to get started quickly using Docker, run these commands in sequence:

```bash
# Create the Docker network
docker network create my_fitness_network

# Start database services
docker-compose up -d

# Build the Python application image
docker build -t python-my_fitness .

# Run the application
docker run -it --rm --name Python-Console \
  --network my_fitness_network \
  -v /$(pwd)/:/usr/src/app \
  python-my_fitness
```

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

This project uses Docker for containerization with MySQL database and custom network configuration.

1.  **Create Docker Network:**
    First, create a custom Docker network to allow communication between containers:
    ```bash
    docker network create my_fitness_network
    ```

2.  **Start Services with Docker Compose:**
    Start the MySQL database and other services defined in docker-compose.yml:
    ```bash
    docker-compose up -d
    ```

3.  **Build the Python Application Image:**
    Build the Docker image for the Python application:
    ```bash
    docker build -t python-my_fitness .
    ```

4.  **Run the Python Application:**
    Run the Python application in an interactive container connected to the network:
    ```bash
    docker run -it --rm --name Python-Console \
      --network my_fitness_network \
      -v /$(pwd)/:/usr/src/app \
      python-my_fitness
    ```

**Notes:**
- The application runs in interactive mode with volume mounting for development
- The custom network (`my_fitness_network`) enables communication between the Python app and MySQL database
- The volume mount allows real-time code changes without rebuilding the image

## Docker Compose Demo

Below is a sample `docker-compose.yml` file that can be used to quickly set up the My Fitness application environment:

```yaml
version: '3.8'
services:
  mysql8:
    image: mysql:8
    container_name: my_fitness_mysql
    command: --mysql-native-password=ON
    environment:
      MYSQL_ROOT_PASSWORD: demo_password
      MYSQL_DATABASE: my_fitness_db
      MYSQL_USER: my_fitness_user
      MYSQL_PASSWORD: my_fitness_password
    ports:
      - "3306:3306"
    networks:
      - my_fitness_network
    volumes:
      - mysql_data:/var/lib/mysql
    healthcheck:
      test: 
        - "CMD-SHELL"
        - "mysqladmin ping -u root -p$$MYSQL_ROOT_PASSWORD"
      interval: 5s
      timeout: 10s
      retries: 10
      start_period: 30s

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: my_fitness_phpmyadmin
    depends_on:
      mysql8:
        condition: service_healthy
    environment:
      PMA_HOST: my_fitness_mysql
    ports:
      - "8080:80"
    networks:
      - my_fitness_network

  # Python application (optional)
  app:
    build: .
    container_name: my_fitness_app
    depends_on:
      mysql8:
        condition: service_healthy
    environment:
      - DB_HOST=my_fitness_mysql
      - DB_DATABASE=my_fitness_db
      - DB_USER=my_fitness_user
      - DB_PASSWORD=my_fitness_password
    networks:
      - my_fitness_network
    volumes:
      - .:/app

networks:
  my_fitness_network:
    name: my_fitness_network

volumes:
  mysql_data:
```

### Connecting to MySQL using DataGrid

To connect to the MySQL database using DataGrid or any other database management tool, use the following connection details:

- **Host**: localhost
- **Port**: 3306
- **Database**: my_fitness_db
- **Username**: my_fitness_user (or root)
- **Password**: my_fitness_password (or demo_password for root)

Make sure the Docker containers are running before attempting to connect.

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
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
