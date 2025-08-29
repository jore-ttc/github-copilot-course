-- This script creates the database schema for the banking application.

-- Create the Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
);
GO

-- Create the Accounts table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    AccountType NVARCHAR(50) NOT NULL,
    Balance DECIMAL(18, 2) NOT NULL DEFAULT 0.00,
    CONSTRAINT FK_Accounts_Users FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
GO
