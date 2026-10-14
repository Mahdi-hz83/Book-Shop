# Book Shop Management System

A desktop-based book shop management system developed using **C# and Windows Forms**, with a relational database designed to manage book shop data and related operations.

This project was developed as a university assignment to practice desktop application development, database design, and SQL-based data management.

## Overview

The application focuses on building a graphical desktop interface for a book shop, supported by a relational database schema.

The database design covers several areas of a book shop, including book information, customer records, shopping baskets, orders, inventory, and related entities.

## Features

The database schema includes structures for:

- **Book Management:** Book details such as ISBN, title, price, author, publisher, and publication year.
- **Customer Management:** Customer-related records and address information.
- **Shopping Basket:** Data structures for basket contents and book quantities.
- **Order Management:** Order-related records and relationships with books and customers.
- **Inventory Tracking:** Book quantities and registration-related records.
- **Relational Data Management:** Tables, primary keys, foreign keys, and constraints.

The availability of each feature in the graphical interface depends on its implementation in the Windows Forms application.

## Technology Stack

| Technology | Purpose |
|---|---|
| C# | Application logic |
| Windows Forms | Desktop graphical user interface |
| SQL | Database schema and data management |
| Relational Database | Persistent storage of book shop information |

## Database Design

The accompanying SQL script defines a database named `Book_Shop` and includes tables representing books, customers, shopping baskets, orders, credit card records, and other related entities.

The schema uses relational constraints to connect data across the application domain.

## Project Structure

```text
Book-Shop/
├── book_shop.sql
└── Database Project/
    └── 3-book.com/
        └── C# Windows Forms project files
```

- `book_shop.sql` — Database creation script, table definitions, and relational constraints.
- `3-book.com/` — Desktop application project files.

## Getting Started

### Prerequisites

- Windows
- Visual Studio with C# desktop development support
- A compatible database server
- The database provider and connection configuration required by the project

### 1. Clone the repository

```bash
git clone https://github.com/Mahdi-hz83/Book-Shop.git
cd Book-Shop
```

### 2. Set up the database

Open `book_shop.sql` using a compatible SQL client and execute the script against your database server.

Review the SQL statements and ensure the database and required tables are created successfully.

### 3. Open the application

1. Open the `Database Project/3-book.com/` directory.
2. Locate the Visual Studio solution (`.sln`) or C# project (`.csproj`) file.
3. Open it in Visual Studio.
4. Review and update the database connection settings to match your local environment.
5. Build and run the application.

The exact connection settings depend on the database provider and configuration used in the source code.

## Learning Objectives

This project demonstrates academic practice in:

- C# desktop application development
- Windows Forms and event-driven programming
- Relational database design
- SQL schema creation and constraints
- Connecting a graphical application to persistent data
- Modeling a book shop's data and business entities

## Potential Improvements

- Improve separation between the UI, business logic, and data-access layers.
- Standardize database and code naming conventions.
- Add input validation and consistent error handling.
- Secure database credentials through external configuration.
- Add automated tests and database setup documentation.
- Improve database normalization and integrity constraints.

## Author

**Mahdi Hosseinzadeh**

- GitHub: [@Mahdi-hz83](https://github.com/Mahdi-hz83)
- Repository: [Book-Shop](https://github.com/Mahdi-hz83/Book-Shop)

---

*An academic desktop application project built with C# Windows Forms and relational database concepts.*
