#include<iostream.h>
#include<conio.h>
#include<iomanip.h>


int n;
// extern int giaithua();

// void main(){
//     char tl;
//     L0:
//         clrscr();
//         cout<<"\n Vui long nhap so n: ";
//         cin>>n;
//         int res = giaithua();
//         cout<<"\n giai thua cua" <<n<<" la:"<<res;
//         cout<<"\n Gia tri bieu thuc n!/(n+3) la:"<<setprecision(5)<< (float)(res/(float)(n+3))<<"\n";
//         cout<<"\n Ban co muon tiep tuc (c/k)?";
//     tl = getch();
//     if(tl=='c') goto L0;
// }
extern int sum3so();

int x,y,z;
void main(){
    cin>>x>>y>>z;
    cout<<"ket qua : "<<sum3so()<<"\n";

}   