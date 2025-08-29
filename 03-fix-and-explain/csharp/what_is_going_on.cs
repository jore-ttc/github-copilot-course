// Ask Copilot Chat: "/explain this code"

// Explanation 1: What is recursion?
public static int Factorial(int n)
{
    if (n == 0)
    {
        return 1;
    }
    return n * Factorial(n - 1);
}

// Explanation 2: What is LINQ?
public static void LinqExample(List<string> words)
{
    var shortWords = words.Where(w => w.Length < 5).OrderBy(w => w).ToList();
    // Ask: "Explain what the 'Where' and 'OrderBy' methods do here."
}

// Explanation 3: What is asynchronous programming?
public static async Task<string> FetchDataAsync(string url)
{
    using (var client = new HttpClient())
    {
        // Ask: "Explain what 'async' and 'await' do."
        return await client.GetStringAsync(url);
    }
}

// Explanation 4: What is a Generic?
public class Box<T>
{
    public T Content { get; set; }
    // Ask: "Explain what <T> means in this context."
}

// Explanation 5: What is object-oriented inheritance?
public class Animal
{
    public virtual void MakeSound()
    {
        Console.WriteLine("Some generic sound");
    }
}

public class Dog : Animal
{
    public override void MakeSound()
    {
        Console.WriteLine("Bark");
    }
    // Ask: "Explain the 'virtual' and 'override' keywords."
}
