@R3
M=0;
@R4
M=0;
@R0
D=M;
@END 
D;JEQ
@temp
M=D;

(LOOP)
	@R1
	D=D-M;
	@REMAINDER
	D;JLT
	@R3
	M=M+1;
	@ZERO
	D;JEQ
	@LOOP
	0;JMP

(REMAINDER)
	@R1
	D=D+M;
	@R4
	M=D;
	
(ZERO)
	@temp
	D=M;
	@R0
	M=D;

(END)
	@END
	0;JMP



