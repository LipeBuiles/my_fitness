# My Fitness - AI Agent Context File

## Project Overview

**My Fitness** is a comprehensive Python-based fitness tracking application that manages users' health data, training records, sleep patterns, and fitness objectives. The application uses a MySQL database for data persistence and provides a console-based interface for data management.

## Architecture

### Main Components

1. **Entry Point**: `main.py` - Application initialization with user authentication
2. **Menu System**: `menu.py` - Main navigation and user interface
3. **Database Layer**: `database/` - MySQL connection and query management
4. **Feature Modules**: Organized by functionality (users, fitness, dreams, objectives, training, health)
5. **Utilities**: `utils/` - Common functions, UI helpers, and loaders

### Technology Stack

- **Language**: Python 3.11+
- **Database**: MySQL 8.0
- **Containerization**: Docker & Docker Compose
- **Error Tracking**: Sentry SDK
- **Environment Management**: python-dotenv
- **UI Enhancement**: colorama, rich, tabulate
- **Security**: bcrypt for password hashing
- **Data Processing**: pandas, numpy

## Database Schema

The application uses MySQL with the following main tables:

- **users**: User account management
- **fitness_records**: Training session data
- **dreams**: Sleep tracking information
- **objectives_day**: Daily fitness goals
- **health**: General health metrics
- **training_types**: Categories of training activities
- **audith_***: Audit tables for tracking data changes

### Key Relationships
- Users have multiple fitness records, dreams, and objectives
- Training records link to training types
- Audit tables track all CRUD operations for compliance

## Module Structure

### 1. Users Module (`users/`)
**Purpose**: Complete user lifecycle management
- `manager_user.py`: Authentication and session management
- `options_user.py`: User CRUD operations interface
- `insert_user.py`: User registration
- `read_users.py`: User listing and retrieval
- `update_user.py`: User profile modifications
- `delete_user.py`: User account removal
- `recovery_user.py`: Password recovery functionality
- `menu_users.py`: User management navigation

### 2. Fitness Module (`fitness/`)
**Purpose**: Training session and workout data management
- `menu_fitness.py`: Fitness data navigation
- `options_fitness.py`: Fitness operations interface
- `insert_fitness.py`: New training record creation
- `read_fitness.py`: Training data retrieval and display
- `update_fitness.py`: Training record modifications

### 3. Dreams Module (`dreams/`)
**Purpose**: Sleep pattern tracking and analysis
- `menu_dreams.py`: Sleep data navigation
- `dreams.py`: Sleep data input validation
- `insert_dream.py`: Sleep record creation
- `read_dreams.py`: Sleep data retrieval
- `update_dream.py`: Sleep record modifications
- `delete_dream.py`: Sleep record removal

### 4. Objectives Module (`objectives/`)
**Purpose**: Daily fitness goal setting and tracking
- `menu_objetives.py`: Goals management navigation
- `objectives.py`: Goal creation interface
- `insert_objetive.py`: New goal creation
- `read_objetive_day.py`: Daily objectives retrieval
- `update_objetive.py`: Goal modifications

### 5. Training Module (`training/`)
**Purpose**: Advanced training metrics and types management
- `in_training.py`: Real-time training data (cadence, heart rate, pace, stride)
- `insert_training.py`: Training metrics insertion
- Training type management functions

### 6. Health Module (`health/`)
**Purpose**: General health metrics and data cleanup
- `read_health.py`: Health data retrieval
- `delete_health.py`: Health data removal and cleanup functions

### 7. Utils Module (`utils/`)
**Purpose**: Common functionality and UI components
- `options.py`: Menu displays and console utilities
- `loaders.py`: Loading animations and exit sequences
- `loader.py`: Additional loading utilities

## Key Features

### Authentication & Session Management
- User login with username validation
- Session persistence using JSON files
- Secure password handling with bcrypt

### Data Management
- Full CRUD operations for all entities
- Data validation and error handling
- Audit trail for data changes
- Bulk data operations

### User Interface
- Colorful console interface using colorama
- Rich text formatting with rich library
- Interactive menus with input validation
- Loading animations and user feedback
- Keyboard interrupt protection

### Database Operations
- MySQL connection pooling
- Environment-based configuration
- Error handling and logging
- Transaction support
- Data backup and recovery scripts

## Configuration

### Environment Variables (.env)
```
DB_HOST=localhost
DB_DATABASE=my_fitness_db
DB_USER=builes
DB_PASSWORD=python.1988***
SENTRY_API_KEY=your_sentry_dsn_here
```

### Docker Configuration
- MySQL 8.0 container with health checks
- phpMyAdmin for database administration
- Python application containerization
- Network isolation with custom Docker network
- Persistent data volumes

## Development Workflow

### Local Development
1. Set up virtual environment
2. Install dependencies from `requirements.txt`
3. Configure environment variables
4. Set up MySQL database
5. Run database migration scripts
6. Start application with `python main.py`

### Docker Development
1. Create Docker network: `docker network create my_fitness_network`
2. Start services: `docker-compose up -d`
3. Build application: `docker build -t python-my_fitness .`
4. Run application: `docker run -it --rm --name Python-Console --network my_fitness_network python-my_fitness`

## Error Handling & Monitoring

- **Sentry Integration**: Automatic error reporting and tracking
- **Database Error Handling**: Connection failures and query errors
- **Input Validation**: User input sanitization and validation
- **Graceful Degradation**: Fallback mechanisms for system failures
- **Keyboard Interrupt Protection**: Prevents accidental application termination

## Security Considerations

- **Password Security**: bcrypt hashing for user passwords
- **Environment Variables**: Sensitive data stored in .env files
- **Database Security**: Parameterized queries to prevent SQL injection
- **Session Management**: Secure session handling and cleanup
- **Docker Security**: Network isolation and minimal container privileges

## Data Flow

1. **User Authentication**: Login validation → Session creation
2. **Menu Navigation**: Main menu → Module selection → Operation selection
3. **Data Operations**: Input validation → Database operation → Result display
4. **Error Handling**: Exception capture → Sentry reporting → User notification
5. **Session Management**: Operation completion → Menu return or exit

## API/Interface Patterns

### Menu Pattern
All modules follow a consistent menu pattern:
- Display options
- Input validation
- Match/case operation routing
- Error handling with try/catch
- Keyboard interrupt protection

### Database Pattern
All database operations follow:
- Connection establishment
- Query execution with parameters
- Result processing
- Error handling
- Connection cleanup

### CRUD Pattern
All modules implement:
- Create: Data validation → Insertion → Confirmation
- Read: Query execution → Formatting → Display
- Update: ID validation → Data modification → Confirmation
- Delete: ID validation → Soft/Hard deletion → Confirmation

## Performance Considerations

- **Database Connections**: Connection pooling and proper cleanup
- **Memory Management**: Efficient data processing with pandas
- **User Experience**: Loading animations for long operations
- **Query Optimization**: Indexed queries and efficient data retrieval

## Maintenance & Monitoring

- **Audit Tables**: Complete change tracking for all operations
- **Backup Scripts**: Database backup and recovery procedures
- **Health Checks**: Docker container health monitoring
- **Error Reporting**: Automated error tracking with Sentry
- **Data Integrity**: Foreign key constraints and validation rules

## Future Enhancement Opportunities

1. **API Development**: REST API for mobile/web integration
2. **Data Visualization**: Charts and graphs for fitness metrics
3. **Integration**: Xiaomi fitness app data synchronization
4. **Analytics**: Advanced fitness analytics and recommendations
5. **Mobile App**: Mobile interface development
6. **Cloud Deployment**: Cloud-based deployment and scaling

## Development Guidelines for AI Agents

### Code Style
- Follow PEP 8 conventions
- Use descriptive variable names
- Implement proper error handling
- Add comprehensive documentation
- Use type hints where appropriate

### Database Operations
- Always use parameterized queries
- Implement proper transaction handling
- Follow the existing connection pattern
- Add appropriate error handling
- Update audit tables when applicable

### UI Components
- Follow existing menu patterns
- Use colorama for consistent styling
- Implement keyboard interrupt protection
- Provide user feedback for operations
- Validate all user inputs

### Module Development
- Follow the established module structure
- Implement complete CRUD operations
- Add proper navigation patterns
- Include comprehensive error handling
- Maintain consistency with existing modules

## Testing Recommendations

1. **Unit Testing**: Test individual functions and methods
2. **Integration Testing**: Test database operations and workflows
3. **User Acceptance Testing**: Test complete user workflows
4. **Security Testing**: Test authentication and authorization
5. **Performance Testing**: Test database performance and scalability

This context file provides comprehensive information for AI agents to understand, maintain, and extend the My Fitness application effectively.