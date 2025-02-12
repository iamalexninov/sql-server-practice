-- Create Database
CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- Create Tables
CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15),
    JoinDate DATE DEFAULT GETDATE(),
    MembershipStatus BIT DEFAULT 1, -- 1 = Active, 0 = Inactive
    MembershipType VARCHAR(20) CHECK (MembershipType IN ('Standard', 'Premium', 'Student')),
    LastUpdateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    BirthDate DATE,
    Nationality NVARCHAR(50),
    IsActive BIT DEFAULT 1
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200),
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    ISBN NVARCHAR(13) UNIQUE NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    AuthorID INT,
    CategoryID INT,
    PublicationYear INT,
    Publisher NVARCHAR(100),
    TotalCopies INT DEFAULT 0,
    AvailableCopies INT DEFAULT 0,
    Price DECIMAL(10,2),
    Location NVARCHAR(20),
    Status VARCHAR(20) DEFAULT 'Available' CHECK (Status IN ('Available', 'Unavailable', 'Under Maintenance')),
    LastUpdateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Loans (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATETIME DEFAULT GETDATE(),
    DueDate DATETIME,
    ReturnDate DATETIME,
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Returned', 'Overdue', 'Lost')),
    FineAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Fines (
    FineID INT IDENTITY(1,1) PRIMARY KEY,
    LoanID INT,
    Amount DECIMAL(10,2),
    Status VARCHAR(20) DEFAULT 'Unpaid' CHECK (Status IN ('Paid', 'Unpaid', 'Waived')),
    CreatedDate DATETIME DEFAULT GETDATE(),
    PaidDate DATETIME,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(50),
    ActionType VARCHAR(10),
    RecordID INT,
    OldValue NVARCHAR(MAX),
    NewValue NVARCHAR(MAX),
    ChangedBy NVARCHAR(50),
    ChangedDate DATETIME DEFAULT GETDATE()
);