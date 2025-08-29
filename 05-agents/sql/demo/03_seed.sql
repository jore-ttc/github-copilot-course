-- This script seeds the database with initial data for testing.

BEGIN TRANSACTION;

DECLARE @UserID1 INT;
DECLARE @UserID2 INT;

-- Seed Users
EXEC sp_SaveUser @Name = 'Alice Johnson', @Email = 'alice.j@example.com', @UserID = @UserID1 OUTPUT;
EXEC sp_SaveUser @Name = 'Bob Williams', @Email = 'bob.w@example.com', @UserID = @UserID2 OUTPUT;

-- Seed Accounts for Alice
EXEC sp_SaveAccount @UserID = @UserID1, @AccountType = 'Checking', @Balance = 1500.00;
EXEC sp_SaveAccount @UserID = @UserID1, @AccountType = 'Savings', @Balance = 5000.00;

-- Seed Accounts for Bob
EXEC sp_SaveAccount @UserID = @UserID2, @AccountType = 'Checking', @Balance = 250.75;

COMMIT TRANSACTION;

-- Verify the data
EXEC sp_GetAllUsers;
EXEC sp_GetUserAccounts @UserID = @UserID1;
EXEC sp_GetUserAccounts @UserID = @UserID2;
GO
