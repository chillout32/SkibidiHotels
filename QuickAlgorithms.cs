namespace skibidihotels;

public class QuickAlgorithms
{
    public static void QuickSortStars(List<loadInHotels> data, int left, int right)
    {
        loadInHotels pivot = data[(left + right) / 2];
        int leftSide = left;
        int rightSide = right;

        while (leftSide <= rightSide)
        {
            while (data[leftSide].stars > pivot.stars) leftSide++;

            while (data[rightSide].stars < pivot.stars) rightSide--;

            if (leftSide <= rightSide)
            {
                loadInHotels temporary = data[leftSide];
                data[leftSide] = data[rightSide];
                data[rightSide] = temporary;
                leftSide++;
                rightSide--;
            }
        }

        if (left < rightSide) QuickSortStars(data, left, rightSide);
        if (leftSide > right) QuickSortStars(data, leftSide, right);
    }
}