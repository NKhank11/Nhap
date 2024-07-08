#include <iostream>
using namespace std;
void NhapMaTran(int**& a, int& n, int& m)
{
	cout << "Nhap so hang n: ";
	cin >> n;
	cout << "Nhap so cot m: ";
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
			cout << "Nhap phan tu a[" << i << "]" << "[" << j << "]= ";
			cin >> a[i][j];
		}
	}
}
void XuatMaTran(int** a, int n, int m)
{
	cout << "------- Noi dung ma tran -------" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < m; j++)
		{
			cout << a[i][j] << " ";
		}
		cout << endl;
	}
}
bool checkDongTang(int* a, int n)
{
	for (int i = 1; i < n; i++)
	{
		if (a[i] <= a[i-1] ) return 0;
	}
	return 1;
}
int d[100] = { 0 };
void checkDongTang(int** a, int n, int m)
{
	bool found = false;
	int k = 0;
	for (int i = 0; i < n; i++)
	{
		if (checkDongTang(a[i], m))
		{
			found = true;
			d[k] = i;
			k++;
		}
	}
	if (!found) cout << "\nMa tran khong co dong nao tang dan ";
	else
	{
		cout << "\nMa tran co dong tang dan, o dong co chi so: ";
		for (int i = 0; i < k; i++)
		{
			cout << d[i] << " ";
		}
	}
	cout << endl;
}
int main()
{
	int n, m;
	int** a = NULL;

	NhapMaTran(a, n, m);
	XuatMaTran(a, n, m);
	checkDongTang(a, n, m);

	for (int i = 0; i < n; i++)
	{
		delete[] a[i];
	}
	delete[] a;
	return 0;
}