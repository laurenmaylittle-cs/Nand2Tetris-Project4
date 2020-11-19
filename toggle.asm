(START)      // Loop program
@KBD
D=M
@BLACK
D;JNE
@WHITE
D;JEQ

(MAIN_LOOP)
	@KBD
	D=M

	@colour
	M=0

	@CHANGE_SCREEN
	D;JEQ // if keyboard = 0, goto CHANGE_SCREEN

	@CHANGE_BLACK
	0;JMP // else, goto CHANGE_BLACK
@MAIN_LOOP
0;JMP

(CHANGE_BLACK)
@colour
M=-1

(CHANGE_SCREEN)
	// if @colour = -1 screen changes to black,
	// if @colour = 0, screen changes to white

	@SCREEN
	D=A
	@screen
	M=D // screen = SCREEN

	(LOOP)
		@colour
		D=M
		@screen
		A=M
		M=D // MEM[MEM[screen]] = color

		@screen
		M=M+1 // MEM[screen] += 1

		@24576 // SCREEN + (512*256) // SCREEN = 16384
		D=A
		@screen
		D=D-M // D = 24576 - screen
	@LOOP
	D;JGT
        // if D > 0 goto LOOP

@MAIN_LOOP
0;JMP