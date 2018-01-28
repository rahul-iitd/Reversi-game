.equ SWI_Exit, 0x11
.text

check_up:                  @mapped 0-> w and 1-> b
mov r0,#6                    @x=6
mov r2,#2	               @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0			 @flag = 0
sub r7,r0,#1                 @i= x-1
cmp r0,#1
ble exitu1
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
sub r3,r3,#32
ldr r5,[r1,r3]
cmp r5,#2
beq exitu1
cmp r4,r5
beq exitu1

Loopu1: cmp r7,#0             @r7 is i
       beq exitu1
       sub r7,r7,#1
       sub r3,r3,#32
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopu1
       mov r6,r7             @flag=i
	   sub r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
Loopu2: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitu1       
       sub r3,r3,#32
       str r4,[r1,r3]
       sub r7,r7,#1
       b Loopu2

exitu1:
ldr r9,[r1,#104]
ldr r10,[r1,#136]
ldr r11,[r1,#168]
swi SWI_Exit
.data
AA:	.word 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,1,2,2,2,2,2, 2,2,0,2,2,2,2,2, 2,2,0,2,2,2,2,2, 2,2,1,2,2,2,2,2, 2,2,2,2,2,2,2,2

.end
