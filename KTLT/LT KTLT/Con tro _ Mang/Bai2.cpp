#include <iostream>
using namespace std;
void NhapMang(int*& a, int& n)
{
	cout << " Nhap so luong phan tu: ";
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
void DaoNguocMang(int* a, int n)
{
	int* left = a;
	int* right = a + n - 1;
	while (left <= right)
	{
		int temp = *left;
		*left = *right;
		*right = temp;
		left++, right--;
	}
}
int main()
{
	int n;
	int* a = NULL;

	NhapMang(a, n);
	XuatMang(a, n);

	cout << endl;
	cout << "---------Dao nguoc mang--------- " << endl;
	DaoNguocMang(a, n);
	XuatMang(a, n);
	cout << endl;

	delete[] a;
	return 0;
}