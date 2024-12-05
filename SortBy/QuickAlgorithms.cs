namespace skibidihotels;

public class QuickAlgorithms
{
    public static void QuickSortStars(List<loadInHotels> data, int left, int right)
    {
        loadInHotels pivot = data[(left + right) / 2];
        int x = left;
        int q = right;

        while (x <= q)
        {
            while (data[x].stars > pivot.stars) x++;

            while (data[q].stars < pivot.stars) q--;

            if (x <= q)
            {
                loadInHotels temporary = data[x];
                data[x] = data[q];
                data[q] = temporary;
                x++;
                q--;
            }
        }

        if (left < q) QuickSortStars(data, left, q);
        if (x < right) QuickSortStars(data, x, right);
    }
}