/* 
    @content:
*/
#include<iostream.h>
#include<conio.h>
extern int SUM(int i1, int far *i2);

int main(){
    char tl;
    int n, a[100];

    L0:
        clrscr();
        cout<<"\n         Nhap n: "; cin>>n;
        for(int i=0;i<n;++i){
            cin>>a[i];
        }

        cout<<"\n         result = "<<SUM(n, a);

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}