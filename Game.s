.equ SWI_Exit, 0x11
.text

swi 0x206              @clear display
ldr r3,=AA                 @mapped 0-> w and 1-> b
mov r4,#1
mov r5,#1


p:
cmp r5,#9            @r5 -> x
beq exit_print
cmp r4,#9            @ r4 -> y
beq r
q: mov r0,r4
mov r1,r5
mov r6,#32
mov r7,#4
sub r8,r0,#1         @r8 = x-1
sub r9,r1,#1         @r9 = y-1
mov r11,r8
mul r8,r9,r6
mul r9,r11,r7
add r10,r8,r9
ldr r2,[r3,r10]
swi 0x205

add r4,r4,#1
b p

r:mov r4,#1
add r5,r5,#1
b p

exit_print:



Game:                  @mapped 0-> w and 1-> b


swi 0x203
cmp r0,#0
beq Game
bl decode
sub r1,r0,#1          @ x = r1
L: swi 0x203
cmp r0,#0
beq L
bl decode
sub r2,r0,#1          @ y = r2
G: swi 0x203
cmp r0,#0
beq G
bl decode
sub r3,r0,#1


ldr r4,=AA
mov r6,#32
mov r7,#4
mov r8,r2
mov r9,r1
mov r11,r8
mul r8,r9,r6
mul r9,r11,r7
add r10,r8,r9
str r3,[r4,r10]


@ r1 has x     r2 has y







mov r0,r2
mov r2,r1


bl check_right

bl check_left

mov r3,r0
mov r0,r2
mov r2,r3
bl check_down

bl check_up

bl check_diagonal_dw2

bl check_diagonal_dw1

bl check_diagonal_up1

bl check_diagonal_up2

ldr r3,=AA                 @mapped 0-> w and 1-> b
mov r4,#1
mov r5,#1


ph:
cmp r5,#9            @r5 -> x
beq exit_print1
cmp r4,#9            @ r4 -> y
beq rh
qh: mov r0,r5
mov r1,r4
mov r6,#32
mov r7,#4
sub r8,r0,#1         @r8 = x-1
sub r9,r1,#1         @r9 = y-1
mov r11,r8
mul r8,r9,r6
mul r9,r11,r7
add r10,r8,r9
ldr r2,[r3,r10]
swi 0x205

add r4,r4,#1
b ph

rh:mov r4,#1
add r5,r5,#1
b ph

exit_print1:

bl score


b Game




check_right:                 @mapped 0-> w and 1-> b
@mov r0,#2                                 @let y = 2
@mov r2,#3                                 @let x = 3
mov r8,#32
ldr r1,=AA
mul r3,r2,r8
add r1,r1,r3
mov r8,#4
mov r6,#0                                        @flag = 0
add r7,r0,#1                        @i= y+1
cmp r0,#7
bge exitr1
mul r3,r0,r8
ldr r4,[r1,r3]
add r3,r3,#4
ldr r5,[r1,r3]
cmp r5,#2
beq exitr1
cmp r4,r5
beq exitr1

Loopr1: cmp r7,#7             @r7 is i
       beq exitr1
       add r7,r7,#1
       add r3,r3,#4
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopr1
       mov r6,r7                  @flag=i
          add r7,r0,#1           @r7 is j
Loopr2: cmp r7,r6
       beq exitr1
       mul r3,r0,r8
       ldr r4,[r1,r3]
       mul r3,r7,r8
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopr2

exitr1: mov pc,lr



check_left:
@mov r0,#5                                 @let y = 2
@mov r2,#3                                 @let x = 3
mov r8,#32
ldr r1,=AA
mul r3,r2,r8
add r1,r1,r3
mov r8,#4
mov r6,#0                                                                                           @flag = 0
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
exitl2: mov pc,lr


check_down:                  @mapped 0-> w and 1-> b
@mov r0,#0                    @x=3
@mov r2,#2                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
add r7,r0,#1                 @i= x+1
cmp r0,#6
bge exitd1
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
add r3,r3,#32
ldr r5,[r1,r3]
cmp r5,#2
beq exitd1
cmp r4,r5
beq exitd1

Loopd1: cmp r7,#7             @r7 is i
       beq exitd1
       add r7,r7,#1
       add r3,r3,#32
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopd1
       mov r6,r7             @flag=i
          add r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
Loopd2: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitd1
       add r3,r3,#32
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopd2

exitd1: mov pc,lr


check_up:                  @mapped 0-> w and 1-> b
@mov r0,#6                    @x=6
@mov r2,#2                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
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

exitu1: mov pc,lr



check_diagonal_dw2:                  @mapped 0-> w and 1-> b
@mov r0,#3                    @x=3
@mov r2,#2                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
add r7,r0,#1                 @i= x+1
cmp r0,#6
bge exitdd2
cmp r2,#6
bge exitdd2
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
add r3,r3,#36
ldr r5,[r1,r3]
cmp r5,#2
beq exitdd2
cmp r4,r5
beq exitdd2
mov r7,#1
Loopdd21: cmp r7,#7             @r7 is i
       beq exitdd2
       add r9,r0,r7
       cmp r9,#8
       beq exitdd2
       add r9,r2,r7
       cmp r9,#8
       beq exitdd2
       add r7,r7,#1
       add r3,r3,#36
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopdd21
       mov r6,r7             @flag=i
       @add r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
       mov r7,#1
Loopdd22: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitdd2
       add r3,r3,#36
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopdd22

exitdd2: mov pc,lr



check_diagonal_dw1:                  @mapped 0-> w and 1-> b
@mov r0,#2                    @x=3
@mov r2,#7                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
add r7,r0,#1                 @i= x+1
cmp r0,#6
bge exitdd1
cmp r2,#0
ble exitdd1
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
add r3,r3,#28
ldr r5,[r1,r3]
cmp r5,#2
beq exitdd1
cmp r4,r5
beq exitdd1
mov r7,#1
Loopdd11: cmp r7,#7             @r7 is i
       beq exitdd1
       add r9,r0,r7
       cmp r9,#8
       beq exitdd1
       add r9,r2,r7
       cmp r9,#0
       beq exitdd1
       add r7,r7,#1
       add r3,r3,#28
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopdd11
       mov r6,r7             @flag=i
       @add r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
       mov r7,#1
Loopdd12: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitdd1
       add r3,r3,#28
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopdd12

exitdd1: mov pc,lr


check_diagonal_up1:                  @mapped 0-> w and 1-> b
@mov r0,#7                   @x=3
@mov r2,#2                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
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

exitdu1: mov pc,lr

check_diagonal_up2:                  @mapped 0-> w and 1-> b
@mov r0,#7                   @x=3
@mov r2,#6                    @y=2
mov r8,#32

ldr r1,=AA
mov r6,#0                    @flag = 0
add r7,r0,#1                 @i= x+1
cmp r0,#0
ble exitdu2
cmp r2,#0
ble exitdu2
mul r3,r0,r8
mov r8,#4
mul r4,r2,r8
mov r8,#32
add r3,r3,r4
ldr r4,[r1,r3]
sub r3,r3,#36
ldr r5,[r1,r3]
cmp r5,#2
beq exitdu2
cmp r4,r5
beq exitdu2
mov r7,#1
Loopdu21: cmp r7,#7             @r7 is i
       beq exitdu2
       sub r9,r0,r7
       cmp r9,#0
       beq exitdu2
       add r9,r2,r7
       cmp r9,#0
       beq exitdu2
       add r7,r7,#1
       sub r3,r3,#36
       ldr r5,[r1,r3]
       cmp r4,r5
       bne Loopdu21
       mov r6,r7             @flag=i
       @add r7,r0,#1       @r7 is j

       mul r3,r0,r8
       mov r8,#4
       mul r4,r2,r8
       mov r8,#32
       add r3,r3,r4
       mov r7,#1
Loopdu22: ldr r4,[r1,r3]
       cmp r7,r6
       beq exitdu2
       sub r3,r3,#36
       str r4,[r1,r3]
       add r7,r7,#1
       b Loopdu22

exitdu2: mov pc,lr


decode:

cmp r0,#1
beq L1
cmp r0,#2
beq L2
cmp r0,#4
beq L3
cmp r0,#8
beq L4
cmp r0,#16
beq L5
cmp r0,#32
beq L6
cmp r0,#64
beq L7
cmp r0,#128
beq L8



L1: mov r0,#1
b exit_dec
L2: mov r0,#2
b exit_dec
L3: mov r0,#3
b exit_dec
L4: mov r0,#4
b exit_dec
L5: mov r0,#5
b exit_dec
L6: mov r0,#6
b exit_dec
L7: mov r0,#7
b exit_dec
L8: mov r0,#8

exit_dec:
mov pc,lr

score:
ldr r0,= AA
mov r3,#0
mov r4,#0
mov r5,#0
S: cmp r5,#64
   beq exit_score
   ldr r1,[r0]
   cmp r1,#0
   beq S1
   cmp r1,#2
   beq S2
   add r3,r3,#1              @counts 1
   add r0,r0,#4
   add r5,r5,#1
   b S

S1: add r4,r4,#1            @counts 0
    add r0,r0,#4
    add r5,r5,#1 
    b S

S2: add r0,r0,#4
    add r5,r5,#1
    b S

exit_score:
mov r0,#0
mov r1,#12
mov r2,r4                 @score of 0
swi 0x205
mov r0,#0
mov r1,#13
mov r2,r3                 @ score of 1
swi 0x205

mov pc,lr





swi SWI_Exit
.data
AA:    .word 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,0,1,2,2,2, 2,2,2,1,0,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2, 2,2,2,2,2,2,2,2

.end
