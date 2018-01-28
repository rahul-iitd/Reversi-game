.equ SWI_Exit, 0x11
.text

check_left:
mov r0,#5                                 @let y = 2
mov r2,#3                                 @let x = 3
mov r8,#32                                         
ldr r1,=AA
mul r3,r2,r8
add r1,r1,r3
mov r8,#4
mov r6,#0													  @flag = 0
sub r7,r0,#1                        @i= y+1
cmp r0,#1
ble exitl2
mul r3,r0,r8
ldr r4,[r1,r3]
sub r3,r3,#4
ldr r5,[r1,r3]
cmp r5,#2
beq exitl2
cmp r4,r5
beq exitl2

Loopl1: cmp r7,#0             @r7 is i
       beq exitl2
       sub r7,r7,#1
       sub r3,r3,#4
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopl1
       mov r6,r7                  @flag=i
Stepl2: sub r7,r0,#1           @r7 is j
Loopl2: cmp r7,r6
       beq exitl2
       mul r3,r0,r8
       ldr r4,[r1,r3]
       mul r3,r7,r8
       str r4,[r1,r3]
       sub r7,r7,#1
       b Loopl2

exitl2:
ldr r1,=AA
ldr r9,[r1,#108]
ldr r10,[r1,#112]
swi SWI_Exit
.data
AA:    .word 2,2,1,2,2,2,2,2, 2,2,0,2,2,2,2,2, 2,2,0,2,2,2,2,2, 2,2,1,0,0,1,2,2, 2,2,1,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2

.end