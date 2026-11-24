// Nand to Tetris Capstone: Make the Computer Draw a Box
// Personal number K = 80
// Start row = 80; height = 20 rows; width = 16 pixels (one word).
// Draw while any key is pressed; clear when no key is pressed.

(START)
    @KBD
    D=M
    @DRAW
    D;JNE
    @CLEAR
    0;JMP

(DRAW)
    @18944       // SCREEN + 32*80 = 16384 + 2560
    D=A
    @ROW_PTR
    M=D
    @20
    D=A
    @ROWS_LEFT
    M=D

(DRAW_LOOP)
    @ROW_PTR
    A=M
    M=-1
    @32
    D=A
    @ROW_PTR
    M=D+M
    @ROWS_LEFT
    MD=M-1
    @DRAW_LOOP
    D;JGT
    @START
    0;JMP

(CLEAR)
    @18944
    D=A
    @ROW_PTR
    M=D
    @20
    D=A
    @ROWS_LEFT
    M=D

(CLEAR_LOOP)
    @ROW_PTR
    A=M
    M=0
    @32
    D=A
    @ROW_PTR
    M=D+M
    @ROWS_LEFT
    MD=M-1
    @CLEAR_LOOP
    D;JGT
    @START
    0;JMP
