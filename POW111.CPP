/* 
    @content: ham asm co 1 doi so
*/
#include<iostream.h>
#include<conio.h>
extern int pow(int i1, int i2);

int main(){
    int n,a;
    char tl;
    L0:
        clrscr();
        cout<<"\n         Nhap a: "; cin>>a;
        cout<<"\n         Nhap n: "; cin>>n;

        cout<<"\n         result = "<<pow(a,n);

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}