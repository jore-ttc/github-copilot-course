-- This script creates the stored procedures for the banking application.

-- =================================================================
-- User Procedures
-- =================================================================
GO

-- Procedure to Save (Create/Update) a User
CREATE PROCEDURE sp_SaveUser
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @UserID INT = NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF @UserID IS NOT NULL AND EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
    BEGIN
        -- Update existing user
        UPDATE Users
        SET Name = @Name, Email = @Email
        WHERE UserID = @UserID;
    END
    ELSE
    BEGIN
        -- Insert new user
        INSERT INTO Users (Name, Email)
        VALUES (@Name, @Email);
        SET @UserID = SCOPE_IDENTITY();
    END
END
GO

-- Procedure to Get a User by ID
CREATE PROCEDURE sp_GetUser
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT UserID, Name, Email FROM Users WHERE UserID = @UserID;
END
GO

-- Procedure to Get All Users
CREATE PROCEDURE sp_GetAllUsers
AS
BEGIN
    SET NOCOUNT ON;
    SELECT UserID, Name, Email FROM Users;
END
GO

-- Procedure to Delete a User
CREATE PROCEDURE sp_DeleteUser
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    -- The ON DELETE CASCADE constraint on Accounts table will handle deleting associated accounts.
    DELETE FROM Users WHERE UserID = @UserID;
END
GO

-- =================================================================
-- Account Procedures
-- =================================================================

-- Procedure to Save (Create/Update) an Account
CREATE PROCEDURE sp_SaveAccount
    @UserID INT,
    @AccountType NVARCHAR(50),
    @Balance DECIMAL(18, 2),
    @AccountID INT = NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the user exists
    IF NOT EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
    BEGIN
        -- Throw an error if the user doesn't exist
        RAISERROR ('User with ID %d does not exist.', 16, 1, @UserID);
        RETURN;
    END

    IF @AccountID IS NOT NULL AND EXISTS (SELECT 1 FROM Accounts WHERE AccountID = @AccountID)
    BEGIN
        -- Update existing account
        UPDATE Accounts
        SET UserID = @UserID, AccountType = @AccountType, Balance = @Balance
        WHERE AccountID = @AccountID;
    END
    ELSE
    BEGIN
        -- Insert new account
        INSERT INTO Accounts (UserID, AccountType, Balance)
        VALUES (@UserID, @AccountType, @Balance);
        SET @AccountID = SCOPE_IDENTITY();
    END
END
GO

-- Procedure to Get an Account by ID
CREATE PROCEDURE sp_GetAccount
    @AccountID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AccountID, UserID, AccountType, Balance FROM Accounts WHERE AccountID = @AccountID;
END
GO

-- Procedure to Get All Accounts for a specific User
CREATE PROCEDURE sp_GetUserAccounts
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AccountID, UserID, AccountType, Balance FROM Accounts WHERE UserID = @UserID;
END
GO

-- Procedure to Delete an Account
CREATE PROCEDURE sp_DeleteAccount
    @AccountID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Accounts WHERE AccountID = @AccountID;
END
GO
