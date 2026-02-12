# 🚌 BookMyBus – Bus Reservation System

## 📌 Project Overview
BookMyBus is a Spring Boot based Bus Reservation System that allows users to search buses, book tickets, and provide feedback. Admins can manage buses, routes, reservations, and view user feedback.

This project follows MVC architecture and demonstrates full-stack web development using Java technologies.

---

## 🛠️ Tech Stack

- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- Maven
- JSP (Java Server Pages)
- MySQL (or compatible relational database)

---

## 🏗️ Project Architecture

The project follows layered MVC architecture:

Controller → Service → Repository → Database

- **Controller Layer** – Handles HTTP requests
- **Service Layer** – Contains business logic
- **Repository Layer** – Interacts with database using JPA
- **Model Layer** – Entity classes mapped to database tables

---

## 📂 Project Structure

```
BookMyBus
│── src/main/java/com/demo
│   ├── controller
│   ├── service
│   ├── serviceimpl
│   ├── repository
│   ├── model
│   └── exception
│
│── src/main/webapp/WEB-INF/jsp
│
│── application.properties
│── pom.xml
```

---

## ✨ Features

### 👤 User Features
- User Registration & Login
- Search Buses
- Book Tickets
- View Reservations
- Submit Feedback

### 🔐 Admin Features
- Admin Login
- Add / Update / Delete Buses
- Manage Routes
- View Reservations
- View User Feedback

---

## ⚙️ How to Run the Project

### 1️⃣ Prerequisites
- Java 8 or above
- Maven
- MySQL
- IDE (IntelliJ / Eclipse / STS)

### 2️⃣ Configure Database
Update `application.properties` with your database details:

```
spring.datasource.url=jdbc:mysql://localhost:3306/your_database
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

### 3️⃣ Build Project

```
mvn clean install
```

### 4️⃣ Run Application

Run the main class:

```
BusResrvationSystemApplication.java
```

Or use:

```
mvn spring-boot:run
```

### 5️⃣ Access Application

Open browser:

```
http://localhost:8080/
```

---

## 🗄️ Database Entities

- Admin
- User
- Bus
- Route
- Reservation
- Feedback

---

## 📈 Future Enhancements

- Online Payment Gateway Integration
- Email Notification for Booking
- Seat Selection UI
- REST API Version
- JWT Authentication
- Deployment on Cloud (AWS / Azure)

---



## 👨‍💻 Author

Developed as a Java Spring Boot Web Application for learning and demonstration purposes.

---

⭐ If you found
