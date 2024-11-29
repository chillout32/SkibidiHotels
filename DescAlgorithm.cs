namespace skibidihotels;

public class DescAlgorithm
{
    static void QuickSort(int[] data, int left, int right)
    {
        int pivot = data[(left + right) / 2];
        int leftSide = left;
        int rightSide = right;

        while (leftSide < rightSide)
        {
            while ((data[leftSide] < pivot) && (leftSide <= rightSide)) leftSide++;

            while ((data[rightSide] > pivot) && (rightSide <= leftSide)) rightSide++;
        }
    }
}