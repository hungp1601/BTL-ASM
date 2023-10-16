/* 
    @content:
*/
#include<iostream.h>
#include<conio.h>
extern int SUM();
int a[100], n;

int main(){
    char tl;
    L0:
        clrscr();
        cout<<"\n         Nhap n: "; cin>>n;
        for(int i=0;i<n;++i){
            cin>>a[i];
        }

        cout<<"\n         result = "<<SUM();

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}