// Example 1: Python to C# Translation
// Ask Copilot Chat: "Help translate this Python code to idiomatic C#"
// Original Python code:
/*
def process_data(data, threshold=0.5, max_iterations=100):
    results = []
    for i in range(max_iterations):
        filtered = [x for x in data if x > threshold]
        if not filtered:
            break
        min_val = min(filtered)
        max_val = max(filtered)
        normalized = [(x - min_val) / (max_val - min_val) for x in filtered]
        results.extend(normalized)
        threshold *= 1.1
    return results
*/

// C# version needs translation of:
// 1. List comprehensions (using LINQ)
// 2. extend() method (using AddRange)
// 3. Python's range() function (using a for loop)
public static List<double> ProcessData(List<double> data, double threshold = 0.5, int maxIterations = 100)
{
    // Ask Copilot Chat: "Complete this C# translation"
}

// Example 2: Translating messy Python code
// Ask Copilot Chat: "Help translate and clean up this Python code in C#"
// Original Python code:
/*
def messyCalculation(x,y,z,flag=False):
    if flag==True:
        temp=x+y
        if temp>10:
         result=temp*z
        else:
            if z!=0:
             result=temp/z
            else:
                result=temp
*/

public static double CalculateValues(double x, double y, double z, bool flag = false)
{
    // Ask Copilot Chat: "Complete this clean C# translation"
}

// Example 3: Optimizing algorithms across languages
// Ask Copilot Chat: "Help translate and optimize this Python code in C#"
// Original Python code:
/*
def find_duplicates(items):
    duplicates = []
    for i in range(len(items)):
        for j in range(len(items)):
            if i != j and items[i] == items[j] and items[i] not in duplicates:
                duplicates.append(items[i])
    return duplicates
*/

public static List<T> FindDuplicates<T>(List<T> items)
{
    // Ask Copilot Chat: "Complete this optimized C# version"
}
