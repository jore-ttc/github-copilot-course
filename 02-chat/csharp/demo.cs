// Use Copilot Chat to document this function
public double ComplexFunction(double a, double b, double c)
{
    if (a > 10)
    {
        if (b < 5)
        {
            return a * b - c;
        }
        else
        {
            return a / b + c;
        }
    }
    else
    {
        if (c == 0)
        {
            return a + b;
        }
        else
        {
            return a - b * c;
        }
    }
}

// Use Copilot Chat to refactor this code
public class DataItem
{
    public string Type { get; set; }
    public double Value { get; set; }
}

public List<double> RefactorMe(List<DataItem> data)
{
    var processedData = new List<double>();
    foreach (var item in data)
    {
        if (item.Type == "A")
        {
            if (item.Value > 100)
            {
                processedData.Add(item.Value * 0.8);
            }
        }
        else if (item.Type == "B")
        {
            if (item.Value < 50)
            {
                processedData.Add(item.Value * 1.2);
            }
        }
    }
    return processedData;
}

// Use Copilot Chat to explain this code
public int[,] ExplainThis(int[,] matrix)
{
    int rows = matrix.GetLength(0);
    int cols = matrix.GetLength(1);
    int[,] transposed = new int[cols, rows];
    for (int i = 0; i < cols; i++)
    {
        for (int j = 0; j < rows; j++)
        {
            transposed[i, j] = matrix[j, i];
        }
    }
    return transposed;
}
