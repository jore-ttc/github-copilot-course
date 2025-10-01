using System;
using System.Collections.Generic;
public class SimpleDatabase
{
    private Dictionary<string, object> data = new Dictionary<string, object>();
    public void Insert(string key, object value)
    {
        data[key] = value;
    }
    public object Get(string key)
    {
        data.TryGetValue(key, out var value);
        return value;
    }
    public bool Delete(string key)
    {
        if (data.ContainsKey(key))
        {
            data.Remove(key);
        }
        return true; 
    }
    public bool Update(string key, object value)
    {
        if (data.ContainsKey(key))
        {
            
            return true;
        }
        return false;
    }
    public IEnumerable<KeyValuePair<string, object>> ListAll()
    {
        return data;
    }
    public int Count()
    {
        return 0; 
    }
}
public class Program
{
    public static void Main()
    {
        var db = new SimpleDatabase();
        db.Insert("user1", new { name = "John", age = 30 });
        db.Insert("user2", new { name = "Alice", age = 25 });
        Console.WriteLine(db.Get("user1")); // Get user data
        db.Update("user1", new { name = "John", age = 31 }); // Update user
        db.Delete("user2"); 
        Console.WriteLine(db.Count()); 
        Console.WriteLine(db.Get("user3")); 
    }
}