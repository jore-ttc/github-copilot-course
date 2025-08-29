using System.Collections.Generic;

namespace csharp.demo;

// Defines the contract for a storage provider for the banking application.
public interface IBankStorage
{
    // User operations
    User SaveUser(User user);
    User? GetUser(string userId);
    bool DeleteUser(string userId);
    List<User> GetAllUsers();

    // Account operations
    Account SaveAccount(Account account);
    Account? GetAccount(string accountId);
    bool DeleteAccount(string accountId);
    List<Account> GetAllAccounts();
    List<Account> GetUserAccounts(string userId);
}
