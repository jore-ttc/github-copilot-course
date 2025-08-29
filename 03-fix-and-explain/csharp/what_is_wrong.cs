// Ask Copilot Chat: "/fix this code" or "what is wrong with this code?"

// Bug 1: Off-by-one error in loop condition
public static void PrintNumbers(int n)
{
    for (int i = 0; i <= n; i++) // Loop should probably be i < n
    {
        Console.WriteLine(i);
    }
}

// Bug 2: Null reference exception
public static int GetNameLength(string name)
{
    // What if name is null?
    return name.Length;
}

// Bug 3: Incorrect logic for finding the maximum value
public static int FindMax(int[] numbers)
{
    if (numbers == null || numbers.Length == 0)
    {
        return -1; // Or throw an exception
    }
    int max = 0; // What if all numbers are negative?
    foreach (int num in numbers)
    {
        if (num > max)
        {
            max = num;
        }
    }
    return max;
}

// Bug 4: Floating point inaccuracy
public static bool AreEqual(double a, double b)
{
    return a == b; // Fails for numbers like 0.1 + 0.2 != 0.3
}

// Bug 5: Unhandled exception
public static int Divide(int a, int b)
{
    return a / b; // What if b is zero?
}
