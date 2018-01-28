.equ SWI_Exit, 0x11
.text
decode:
mov r0,#1
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
swi SWI_Exit
.data
.end
