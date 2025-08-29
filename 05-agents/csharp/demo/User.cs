namespace csharp.demo;

// Represents a user in the system.
public class User
{
    public string? Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }

    public User(string name, string email)
    {
        Name = name;
        Email = email;
    }
}
