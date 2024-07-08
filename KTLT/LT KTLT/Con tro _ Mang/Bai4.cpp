#include <iostream>
using namespace std;
void TaoMaTran(int**& a, int& n, int& m)
{
	cout << "Nhap so hang: ";
	cin >> n;
	cout << "Nhap so cot: ";
	cin >> m;
	a = new int* [n];
	int sum = 1;
	for (int i = 0; i < n; i++)
	{
		a[i] = new int[m];
		a[0][0] = 1;
		a[0][1] = 1;
		for (int j = 0; j < m; j++)
		{
			if ((i == 0 && j == 0) || (i == 0 && j == 1)) continue;
			sum *= 2;
			a[i][j] = sum;
		}
	}
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			cout << a[i][j] << " ";
		}
		cout << endl;
	}
	cout << endl;
}
int main()
{
	int** a = NULL;
	int n, m;
	
	TaoMaTran(a, n, m);
	
	for (int i = 0; i < n; i++)
	{
		delete[] a[i];
	}
	delete[] a;
	return 0;
}