/* 
    @content:
*/
#include<iostream.h>
#include<conio.h>
int a,n;
extern int pow();

int main(){
    char tl;
    L0:
        clrscr();
        cout<<"\n         Nhap a: "; cin>>a;
        cout<<"\n         Nhap n: "; cin>>n;

        cout<<"\n         result = "<<pow();

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}