// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

  (MAIN_LOOP)
    @color
    M=0 // デフォルト白

    @KBD
    D=M
    @SKIP_BLACK
    D;JEQ  // D==0(デフォルト白)ならSKIP_BLACKへ

    @color
    M=-1   // 黒

    (SKIP_BLACK)
      @SCREEN
      D=A
      @addr
      M=D

      (LOOP)
        @addr
        D=M
        @KBD
        D=D-A
        @MAIN_LOOP
        D;JGE  // KBDのアドレスまで来たら MAIN_LOOP へ戻る

	// 色を取得
	@color
	D=M

	// 色を設定
        @addr
        A=M
        M=D

	// アドレスをカウントアップ
	@addr
        M=M+1

        @LOOP
        0;JMP

