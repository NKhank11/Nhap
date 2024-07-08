#include <iostream>
using namespace std;
void NhapMaTran(int**& a, int& n, int& m)
{
	cout << "Nhap so hang: ";
	cin >> n;
	cout << "Nhap so cot: ";
	cin >> m;
	a = new int* [n];
	for (int i = 0; i < n; i++)
	{
		a[i] = new int[m];
	}
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			cout << "Nhap a[" << i << "][" << j << "] = ";
			cin >> a[i][j];
		}
	}
}
void XuatMaTran(int** a, int n, int m)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << a[i][j] << " ";
		}
		cout << endl;
	}
}
void ThayThe(int**& a, int n, int m)
{
	//Neu khong co phan tu duong nao trong ma tran thi in ra -1 o cac phan tu
	int soDuong = -1;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			if (a[i][j] > 0) 
			{
				soDuong = a[i][j];
			}
			else if (a[i][j] < 0)
			{
				a[i][j] = soDuong;
			}
		}
	}
	for (int i = n - 1; i >= 0; i--)
	{
		for (int j = m - 1; j >= 0; j--)
		{
			if (a[i][j] > 0)
			{
				soDuong = a[i][j];
			}
			else if (a[i][j] < 0)
			{
				a[i][j] = soDuong;
			}
		}
	}
}
int main()
{
	int** a = NULL;
	int n, m;	

	NhapMaTran(a, n, m);
	cout << "---------Ma tran ban dau-------------" << endl;
	XuatMaTran(a, n, m);
	cout << endl;

	ThayThe(a, n, m);
	cout << "--------Ma tran sau khi thay doi--------" << endl;
	XuatMaTran(a, n, m);

	for (int i = 0; i < n; i++)
	{
		delete[] a[i];
	}
	delete[] a;

	return 0;
}