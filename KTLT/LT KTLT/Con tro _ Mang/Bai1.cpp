#include <iostream>
using namespace std;
void NhapMang(int*& a, int& n)
{
	cout << "Nhap so luong phan tu: ";
	cin >> n;
	a = new int[n];
	for (int i = 0; i < n; i++)
	{
		cout << "Nhap phan tu thu " << i + 1 << ": ";
		cin >> a[i];
	}
}
void XuatMang(int* a, int n)
{
	cout << "Noi dung cua mang la: ";
	for (int i = 0; i < n; i++)
	{
		cout << a[i] << " ";
	}
	cout << endl;
}
void XoaSoAm(int*& a, int& n)
{
	for (int i = 0; i < n; i++)
	{
		if (a[i] < 0)
		{
			for (int j = i; j < n - 1; j++)
			{
				a[j] = a[j + 1];
			}
			n--;
			i--;
		}
	}
}
int main() {
	int n;
	int* a = NULL;;

	NhapMang(a, n);
	XuatMang(a, n);

	cout << "---------Xoa cac so am trong mang---------- " << endl;
	XoaSoAm(a, n);
	XuatMang(a, n);

	delete[] a;
	return 0;
}