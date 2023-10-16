#include<iostream.h>
#include<conio.h>

int main() {
    int a, b;
    char tl;
    L1: 
        clrscr(); // xóa màn hình 
        cout<<"So thu 1: "; cin>>a;
        cout<<"So thu 2: "; cin>>b;
        asm { // Khối lệnh asm
            mov ax, a
            mov bx, b 
            add ax,bx 
            mov a, ax
        }
        cout<<"\n Sum :"<<a;
        cout<<"\n Ban co muon tiep tuc CT (c/k)?";
        tl=getch();
        if (tl == 'c') goto L1;
    return 0;
}
