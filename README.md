# Ruoyi Image Management System

A comprehensive image management system with paired white/black list link management, built with Java and MySQL.

## Overview
Ruoyi is an image management system designed to manage images with paired white list and black list links. It features side-by-side display and editing of link pairs, visual image previews with placeholders, and one-to-one relationship enforcement between link pairs.

## Features
- Manage images with paired white list and black list links
- Side-by-side display and editing of link pairs
- Visual image previews with placeholders
- One-to-one relationship enforcement between link pairs
- Easy addition and deletion of link pairs

## Prerequisites
- Java 17 (OpenJDK recommended)
- MySQL 8+
- Git

## Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/chanhengseang3/ruoyi.git
   cd ruoyi
   ```
2. **Install dependencies:**
   - Ensure Java 17 and MySQL 8+ are installed and running.
   - Install Git if not already installed.
3. **Database setup:**
   - Create a new MySQL database (e.g., `image_manage`).
   - Import the schema:
     ```bash
     cd sql
     mysql -u <your_mysql_user> -p <your_database_name> < image_manage.sql
     ```

## Configuration
- Configure your database connection and other sensitive settings in `application-dev.yml` or environment variables. **Do not commit credentials to version control.**
- Example configuration keys:
  - `spring.datasource.url`
  - `spring.datasource.username`
  - `spring.datasource.password`

## Build & Run
1. **Build the project:**
   ```bash
   ./build.sh
   ```
2. **Run the application:**
   ```bash
   ./run.sh
   ```
3. **Access the application:**
   - Open [http://localhost](http://localhost) in your browser.

## Default Login
- The default admin credentials for testing/demo purposes are:
  - **Username:** admin
  - **Password:** admin123
- **Change the default password after first login in production environments.**

## Development
- Follow standard Java/Spring Boot development practices.
- Pull requests and issues are welcome.

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## License
This project is licensed under the MIT License.

## Contact
For questions or support, please contact [maintainer](mailto:chanheng.sng3@gmail.com)
