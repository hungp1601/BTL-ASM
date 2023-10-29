#include<iostream.h>
#include<conio.h>
#include<iomanip.h>


extern void COPYTEP();
extern int CN2();
extern void OMEM();
extern void VeDOS();


void main()
{
    char tl;
    int cn; /*chuc nang*/

    clrscr();
    cout << "\n          Truong Dai hoc Mo Ha Noi";
    cout << "\n          KHOA CONG NGHE THONG TIN";
    cout << "\n          -----------o0o----------";
    cout << "\n\n\n           BAI TAP LON MON LTHT";
    cout << "\n\n\n     Cac SV thuc hien:";
    cout << "\n      1. Pham Viet Hung      Lop: 1910A01";
    cout << "\n      2. Vu Van Khang        Lop: 1910A02";
    cout << "\n      3. Nguyen Ngoc Tu      Lop: 1910A02";
    cout << "\n      4. Tran Thi Anh        Lop: 1910A01";
    cout << "\n\n\n     Co tiep tuc CT (c/k)?";
    tl = getch();

    if (tl == 'c') {
    L1:
        clrscr();
        cout << "\n            CAC CHUC NANG CUA BTL";
        cout << "\n            ---------***----------";
        cout << "\n\n     1. copy tep";
        cout << "\n       2. Tinh cap so cong";
        cout << "\n       3. So luong o mem";
        cout << "\n       4. Ve DOS";
        cout << "\n\n     Hay chon: ";
        cin >> cn;

        switch (cn) {
        case 1: {
            COPYTEP();
            break;
        }
        case 2: {
            CN2();
            break;
        }
        case 3: {
            OMEM();
            break;
        }
        case 4: {
            VeDOS();
            break;
        }
        default:
            cout << "\n     Vao sai roi, cao to oi!";
        }

        cout << "\n     Co thuc hien CN khac(c/k): ";
        tl = getch();
        if (tl == 'c') {
            goto L1;
        }
    }

}
