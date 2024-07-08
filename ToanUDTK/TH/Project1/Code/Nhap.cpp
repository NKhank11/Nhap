#include <iostream>
using namespace std;
void gauss_elimination(int **a){
    // code
    
}
int main(){
    int **a = NULL;
    int n, m;
    cout << "Nhap so hang: ";
    cin >> n;
    cout << "Nhap so cot: ";
    cin >> m;
    a = new int*[n];
    for(int i = 0; i < n; i++){
        a[i] = new int[m];
    }
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            cout << "Nhap a[" << i << "][" << j << "]: ";
            cin >> a[i][j];
        }
    }
    return 0;
}