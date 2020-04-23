#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern void f(int * arr1, int * arr2, int size, int * arr3);

int main()
{
	int size = 0;
	scanf ("%d", &size);
	
	int * arr1 = malloc(size * sizeof(int));
	int * arr2 = malloc(size * sizeof(int));
	
	srand(time(0));
	for(int i = 0; i < size; ++i)
	{
		arr1[i] = rand();
		printf("%d ", arr1[i]);
	}
	printf("\n");
	for(int i = 0; i < size; ++i)
	{
		arr2[i] = rand();
		printf("%d ", arr2[i]);
	}
	printf("\n");
	
	int * arr3 = malloc(size * 2 * sizeof(int));
	
	f(arr1, arr2, size, arr3);
	
	for(int i = 0; i < size * 2; ++i)
	{
		printf("%d ", arr3[i]);
	}
	printf("\n");
	
	return 0;
}
