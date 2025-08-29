using System.Collections.Generic;
using System.Linq;

namespace csharp.demo;

// Implements the IBankStorage interface using an in-memory dictionary.
public class MemoryStorage : IBankStorage
{
    private readonly Dictionary<string, User> _users = new();
    private readonly Dictionary<string, Account> _accounts = new();
    private int _nextUserId = 1;
    private int _nextAccountId = 1;

    public User SaveUser(User user)
    {
        if (string.IsNullOrEmpty(user.Id))
        {
            user.Id = (_nextUserId++).ToString();
        }
        _users[user.Id] = user;
        return user;
    }

    public User? GetUser(string userId)
    {
        return _users.GetValueOrDefault(userId);
    }

    public bool DeleteUser(string userId)
    {
        if (_users.ContainsKey(userId))
        {
            _users.Remove(userId);
            // Also delete all associated accounts
            var accountIdsToDelete = _accounts.Values
                .Where(acc => acc.UserId == userId)
                .Select(acc => acc.Id!)
                .ToList();
            
            foreach (var accId in accountIdsToDelete)
            {
                _accounts.Remove(accId);
            }
            return true;
        }
        return false;
    }

    public List<User> GetAllUsers()
    {
        return _users.Values.ToList();
    }

    public Account SaveAccount(Account account)
    {
        if (string.IsNullOrEmpty(account.Id))
        {
            account.Id = (_nextAccountId++).ToString();
        }
        _accounts[account.Id] = account;
        return account;
    }

    public Account? GetAccount(string accountId)
    {
        return _accounts.GetValueOrDefault(accountId);
    }

    public bool DeleteAccount(string accountId)
    {
        return _accounts.Remove(accountId);
    }

    public List<Account> GetAllAccounts()
    {
        return _accounts.Values.ToList();
    }

    public List<Account> GetUserAccounts(string userId)
    {
        return _accounts.Values.Where(acc => acc.UserId == userId).ToList();
    }
}
