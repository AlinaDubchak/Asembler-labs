
.386
.model flat, stdcall

option casemap :none
include \masm32\include\masm32rt.inc

.data?

    MsgBoxText db 256 dup(?)
    
    buffD db 32 dup(?)
    buffE db 32 dup(?)
    buffF db 32 dup(?)
    buffNegativeD db 32 dup(?)
    buffNegativeE db 32 dup(?)
    buffNegativeF db 32 dup(?)
    
.data

    MsgBoxCaption db "Lab #1 Dubchak", 0
    MsgBoxTextPattern db 9, "Birthday = %s", 10,9, "Number of the score book = %s", 10,10, "Positives:", 9,9,9, "Negatives:", 10,10, 
    "A = %li" ,9,9,9, "-A = %li", 10, "B = %li", 9,9,9, "-B = %li", 10, 
    "C = %li", 9,9, "-C = %li", 10, "D = %s", 9,9,9, "-D = %s", 10, 
    "E = %s", 9,9,9, "-E = %s", 10, "F = %s", 9,9, "-F = %s", 0

    A db 26
    A1 dw 26
    A2 dd 26
    A3 dq 26

    negativeA db -26
    negativeA1 dw -26
    negativeA2 dd -26
    negativeA3 dq -26

    B dw 2608
    B1 dd 2608
    B2 dq 2608

    negativeB dw -2608
    negativeB1 dd -2608
    negativeB2 dq -2608

    C1  dd 26082004
    C2 dq 26082004

    negativeC dd -26082004
    negativeC1 dq -26082004

    D dq 0.020
    negativeD dq -0.020

    D1 dd 0.020
    negativeD1 dd -0.020

    E dq 1.997
    negativeE dq -1.997
    
    F dq 19970.907
    negativeF dq -19970.907

    F1 dt 19970.907
    negativeF1 dt -19970.907

    DateOfBirthday db "26082004", 0
    NumberScoreBook db "1306", 0


.code
Main:
    invoke FloatToStr2, D, addr buffD
    invoke FloatToStr2, E, addr buffE
    invoke FloatToStr2, F, addr buffF
    
    invoke FloatToStr2, negativeD, addr buffNegativeD
    invoke FloatToStr2, negativeE, addr buffNegativeE
    invoke FloatToStr2, negativeF, addr buffNegativeF
    
    invoke wsprintf, addr MsgBoxText, addr MsgBoxTextPattern, addr DateOfBirthday, addr NumberScoreBook,
    A2, negativeA2, B1, negativeB1, C1, negativeC, offset buffD,
    offset buffNegativeD, offset buffE, offset buffNegativeE, offset buffF, offset buffNegativeF
    
    invoke MessageBox, 0, addr MsgBoxText, addr MsgBoxCaption, 0
    invoke ExitProcess, 0
end Main
