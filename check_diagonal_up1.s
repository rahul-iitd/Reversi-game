.equ SWI_Exit, 0x11
.text

check_diagonal_up1:                  @mapped 0-> w and 1-> b
mov r0,#7                   @x=3
mov r2,#2	               @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0			 @flag = 0
add r7,r0,#1                 @i= x+1
cmp r0,#0
ble exitdu1
cmp r2,#6
bge exitdu1
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
sub r3,r3,#28
ldr r5,[r1,r3]
cmp r5,#2
beq exitdu1
cmp r4,r5
beq exitdu1
mov r7,#1
Loopdu11: cmp r7,#7             @r7 is i
       beq exitdu1
       sub r9,r0,r7
       cmp r9,#0
       beq exitdu1
       add r9,r2,r7
       cmp r9,#8
       beq exitdu1
       add r7,r7,#1
       sub r3,r3,#28
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopdu11
       mov r6,r7             @flag=i
	@add r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
       mov r7,#1
Loopdu12: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitdu1       
       sub r3,r3,#28
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopdu12

exitdu1:
ldr r9,[r1,#176]
ldr r10,[r1,#204]
swi SWI_Exit
.data
AA:	.word 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,1,2,2, 2,2,2,2,0,2,2,2, 2,2,2,0,2,2,2,2, 2,2,1,2,2,2,2,2

.end
