# Harry Potter Character CRUD API

A comprehensive **RESTful CRUD API** for managing characters from the **Harry Potter universe**, built with **Spring Boot, Spring Data JPA, Hibernate, and PostgreSQL (Neon)**.  

This project demonstrates how to build a backend API that interacts with a relational database using a layered Spring Boot architecture.

---

# Table of Contents

- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Java – Spring ORM with JPA and Hibernate](#java--spring-orm-with-jpa-and-hibernate)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [Database Schema](#database-schema)
- [API Endpoints](#api-endpoints)
- [Testing the API](#testing-the-api)
- [Demo Video](#demo-video)
- [Author](#author)

---

# What is This Project?

This project is a **RESTful CRUD API** built using **Spring Boot, Spring Data JPA, and PostgreSQL**.

The API manages characters from the **Harry Potter universe** and demonstrates how to build a backend service that interacts with a relational database.

This API allows users to:

- Create new characters
- Retrieve characters
- Update existing characters
- Delete characters
- Filter characters by category
- Search characters by name

CRUD stands for:

- **Create** – Add new character records  
- **Read** – Retrieve character records  
- **Update** – Modify existing character records  
- **Delete** – Remove character records  

---

# Technology Stack

| Technology | Purpose |
|-----------|--------|
| Java | Programming language |
| Spring Boot | Framework for building the application |
| Spring Data JPA | ORM layer for database access |
| Hibernate | JPA implementation |
| PostgreSQL (Neon) | Relational database |
| Maven | Build and dependency management |

---

# Java – Spring ORM with JPA and Hibernate

This project uses **ORM (Object-Relational Mapping)** to interact with the database.

**JPA (Jakarta Persistence API)** defines standards for mapping Java objects to relational database tables.

**Hibernate** is the framework that implements JPA and automatically translates Java objects into SQL queries.

**Spring Data JPA** simplifies database access by providing built-in repository interfaces and automatic query generation.

---

# Installation & Setup

## Prerequisites

Before running the project, install the following:

- Java JDK  
- Git  
- Neon PostgreSQL database  
- VS Code or IntelliJ  

---

# Clone the Repository

```bash
git clone <repository-url>
cd <repository-folder>
```

---

# Build the Project

### Mac / Linux

```bash
./mvnw clean install
```

### Windows

```bash
mvnw.cmd clean install
```

This will:

- Download dependencies  
- Compile the project  
- Prepare the application to run  

---

# Database Configuration

This project uses **Neon**, a serverless PostgreSQL database hosted in the cloud.

Open the file:

```
src/main/resources/application.properties
```

Add your Neon database credentials:

```properties
spring.application.name=crud-api

spring.datasource.url=jdbc:postgresql://YOUR_HOST:5432/neondb?sslmode=require
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD

spring.jpa.hibernate.ddl-auto=update

logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
logging.level.org.hibernate.orm.jdbc.bind=TRACE
```

### Prevent credentials from being committed to Git

Run:

```bash
git update-index --skip-worktree src/main/resources/application.properties
```

This prevents your local database password from being pushed to GitHub.

---

# Running the Application

### Mac / Linux

```bash
./mvnw spring-boot:run
```

### Windows

```bash
mvnw.cmd spring-boot:run
```

The server will start at:

```
http://localhost:8080
```

---

# Project Architecture

This project follows a **layered architecture**:

```
HTTP Client
      |
Controller Layer
(CharacterApiController)
      |
Service Layer
(CharacterService)
      |
Repository Layer
(CharacterRepository)
      |
PostgreSQL Database
```

### Layers Explained

**Controller**

Handles HTTP requests and maps API endpoints.

**Service**

Contains business logic and application rules.

**Repository**

Communicates with the database using Spring Data JPA.

**Entity**

Represents database tables as Java classes.

---

# Database Schema

The API uses a table called **characters**.

| Column | Type | Description |
|------|------|------|
| character_id | SERIAL | Primary key |
| name | VARCHAR | Character name |
| description | TEXT | Character description |
| house | VARCHAR | Hogwarts house |
| blood_status | VARCHAR | Blood status |
| allegiance | VARCHAR | Character allegiance |
| image_url | VARCHAR | Image URL |

---

# API Endpoints

Base URL:

```
http://localhost:8080/api/characters
```

---

# 1 Get All Characters

```
GET /api/characters
```

Returns all characters stored in the database.

Example response:

```json
[
  {
    "characterId": 1,
    "name": "Harry Potter",
    "description": "The Boy Who Lived",
    "house": "Gryffindor",
    "bloodStatus": "Half-blood",
    "allegiance": "Order of the Phoenix",
    "imageUrl": "https://example.com/harry.jpg"
  }
]
```

---

# 2 Get Character by ID

```
GET /api/characters/{id}
```

Example:

```
GET /api/characters/1
```

Returns the character with the given ID.

---

# 3 Create a New Character

```
POST /api/characters
```

Example JSON request body:

```json
{
  "name": "Hermione Granger",
  "description": "One of the brightest witches of her age.",
  "house": "Gryffindor",
  "bloodStatus": "Muggle-born",
  "allegiance": "Order of the Phoenix",
  "imageUrl": "https://example.com/hermione.jpg"
}
```

Response: The created character with an auto-generated ID.

---

# 4 Update a Character

```
PUT /api/characters/{id}
```

Example:

```
PUT /api/characters/1
```

Updates the character with the given ID.

---

# 5 Delete a Character

```
DELETE /api/characters/{id}
```

Example:

```
DELETE /api/characters/1
```

Returns:

```
204 No Content
```

---

# 6 Get Characters by Category

```
GET /api/characters/category/{category}
```

Example:

```
GET /api/characters/category/Gryffindor
```

Returns characters belonging to the specified Hogwarts house.

---

# 7 Search Characters by Name

```
GET /api/characters/search?name=substring
```

Example:

```
GET /api/characters/search?name=har
```

Returns characters whose names contain the provided substring.

---

# Testing the API

The API was tested using:

- Postman
- Bruno
- EchoAPI

Example workflow:

1. Create a character using POST  
2. Retrieve all characters using GET  
3. Retrieve a specific character by ID  
4. Filter characters by house  
5. Search characters by name  
6. Update a character  
7. Delete a character  

---

# Crude API Video:

Video link:

```
https://uncg-my.sharepoint.com/:v:/r/personal/a_thapa_uncg_edu/Documents/CSC340-01/AyushaThapa_Assignment3_CRUDE_API%20Video.mov?csf=1&web=1&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=sO3JFu](https://uncg-my.sharepoint.com/:v:/g/personal/a_thapa_uncg_edu/IQBpBz3R21LlSb8VPB41ccgPAVuKFS8WZ63XcRMtvOVQeHk?e=FmYJlx&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D
```
# MVC Web Application Video:

Video link:

```
[https://uncg-my.sharepoint.com/:v:/g/personal/a_thapa_uncg_edu/IQCQ9zKlDkmEQaFi3Z8NF6oPAZK8JaMjTfFLhkxXQC4LwKg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=asyZxH](https://uncg-my.sharepoint.com/:v:/g/personal/a_thapa_uncg_edu/IQCQ9zKlDkmEQaFi3Z8NF6oPAZK8JaMjTfFLhkxXQC4LwKg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D&e=ySde2n)
```

Ensure sharing permission is set to **UNCG users**.

---

# Author

**Ayusha Thapa**  
CSC 340 – Software Engineering  
University of North Carolina at Greensboro
