namespace csharp.demo;

public class Account
{
    public string? Id { get; set; }
    public string UserId { get; set; }
    public string AccountType { get; set; }
    public decimal Balance { get; set; }

    public Account(string userId, string accountType, decimal balance = 0)
    {
        UserId = userId;
        AccountType = accountType;
        Balance = balance;
    }
}
