/* 
    @content: tính n giai thua với hàm asm không đối
*/
#include<iostream.h>
#include<conio.h>

extern int giaithua(int i);

int main(){
    int n;
    char tl;
    L0:
        clrscr();
        cout<<"\n         Nhap n: "; cin>>n;

        cout<<"\n         Giai thua cua "<<n<<" là: "<<giaithua(n);

    cout<<"\n Ban co muon tiep tuc CT (c/k)?";
    tl=getch();
    if(tl=='c'){
        goto L0;
    }
    return 0;
}