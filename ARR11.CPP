/* 
    @content:
*/
#include<iostream.h>
#include<conio.h>
int a[100];
extern int SUM(int i1);

int main(){
    char tl;
    int n;
    L0:
        clrscr();
        cout<<"\n         Nhap n: "; cin>>n;
        for(int i=0;i<n;++i){
            cin>>a[i];
        }

        cout<<"\n         result = "<<SUM(n);

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}