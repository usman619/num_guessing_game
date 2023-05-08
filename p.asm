;PROJECT: Number Guessing Game.
;GROUP MEMBERS
;Muhammad Abdul Nafay (P190117)
;Muhammad Usman (P190116)
[org 0x0100]

jmp start
msg0: db 'WELCOME TO THE NUMBER GUESSING GAME !'
l0: dw 37
by: db 'CREATED BY:'
b0: dw 11
name1: db 'Muhammad Abdul Nafay'
n1: dw 20
Rollno1: db '19P-0117'
name2: db 'Muhammad Usman'
n2: dw 14
Rollno2: db '19P-0116'
r: dw 8

I1: db '----INSTRUCTIONS----'
IL1: dw 20
I2: db '-- Type numbers in series and avoid spaces '
IL2: dw 43
I3: db '-- Range is from 0 to 999 '
IL3: dw 25
I4: db "-- 1    --->   TYPE   --->  '001' "
I5: db "-- 50   --->   TYPE   --->  '050' "
I6: db "-- 150  --->   TYPE   --->  '150' "
IL456: dw 33
I7: db '-- You have only 10 attempts to guess.'
IL7: dw 38
msg1: db 'The Secret Number was: '
l1: dw 23
msg2: db 'Your Number: '
l2: dw 13
msg3: db 'High'
l3: dw 4
msg4: db 'Very High'
l4: dw 9
msg5: db 'Extremely High'
l5: dw 14
msg6: db 'Low'
l6: dw 3
msg7: db 'Very Low'
l7: dw 8
msg8: db 'Extremely Low'
l8: dw 13
msg9: db 'CONGRATULATION ! You got it !'
l9: dw 29
msg10: db 'Attempts Taken: '
l10: dw 16
msg11: db 'Now your turn to guess...'
l11: dw 25
msg12: db 'YOU LOST !'
l12: dw 10
msg13: db "Press 'ENTER' to continue. "
l13: dw 27
msg14: db 'OUT OF BOUNDS'
l14: dw 13
guess: dw 0
limit: dw 10
attempts: dw 0
found: dw 0
loc: dw 0
iloc: dw 0
temp: dw 0

;**** Secret Number ****

  secretNO: dw 600

;***********

check:            ;check's wheather the player guessed the secretNO correctly or not
  PUSH ax
  PUSH bx
  PUSH cx
  PUSH dx

  mov dx, 0
  mov ax, [secretNO]
  cmp [guess], ax
  je FOUND
  ja greater
  jb smaller

greater:
  mov bx, [guess]
  sub bx, [secretNO]
  cmp bx, 50
  jb G1
  cmp bx, 300
  jb G2
  cmp bx, 999
  jb G3

GE:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    inc dx
    add [attempts], dx
    mov cx, 0x04 ;red color
    PUSH cx
    mov ax, msg14

    PUSH ax
    PUSH word [l14]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

G1:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    inc dx
    add [attempts], dx
    mov cx, 0x0E ;yellow color
    PUSH cx
    mov ax, msg3
    PUSH ax
    PUSH word [l3]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

G2:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    inc dx
    add [attempts], dx
    mov cx, 0x0C ;light red
    PUSH cx
    mov ax, msg4
    PUSH ax
    PUSH word [l4]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

G3:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov dx, 0
    inc dx
    add [attempts], dx
    mov cx, 0x04 ;red color
    PUSH cx
    mov ax, msg5
    PUSH ax
    PUSH word [l5]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

smaller:
    mov bx, [secretNO]
    sub bx, [guess]
    cmp bx, 50
    jb S1
    cmp bx, 300
    jb S2
    cmp bx, 999
    jb S3

SE:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    inc dx
    add [attempts], dx
    mov cx, 0x04 ;yellow
    PUSH cx
    mov ax, msg14
    PUSH ax
    PUSH word [l14]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

S1:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov dx, 0
    inc dx
    add [attempts], dx
    mov cx, 0x0E
    PUSH cx
    mov ax, msg6
    PUSH ax
    PUSH word [l6]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

S2:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov dx, 0
    inc dx
    add [attempts], dx
    mov cx, 0x0C
    PUSH cx
    mov ax, msg7
    PUSH ax
    PUSH word [l7]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

S3:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov dx, 0
    inc dx
    add [attempts], dx
    mov cx, 0x04
    PUSH cx
    mov ax, msg8
    PUSH ax
    PUSH word [l8]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 160
    mov [loc], bx

    POP dx
    POP cx
    POP bx
    POP ax
    ret

FOUND:
    CALL clrscreen
    mov cx, 1
    mov [found], cx
    mov cx, 1968
    mov [loc], cx
    mov cx, 0x82
    PUSH cx
    mov ax, msg9
    PUSH ax
    PUSH word [l9]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 492
    mov [loc], bx

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov cx, 0x07
    PUSH cx
    mov ax, msg10
    PUSH ax
    PUSH word [l10]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 32
    mov [loc], bx

    mov ax, [attempts]
    PUSH ax
    mov bx, [loc]
    PUSH bx
    CALL printnum

    POP dx
    POP cx
    POP bx
    POP ax
    ret

clrscreen:        ;clear's the whole screen
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nloc

        pop  di
        pop  ax
        pop  es
        ret

print:            ;parameters (location, color, message)
      push bp
      push sp
      mov bp, sp
      push es
      push ax
      push bx
      push cx
      push dx
      push di
      push si

      xor  di, di
      xor ax, ax

      mov  ax, 0xb800
      mov  es, ax
      mov si, [bp+10]; msg1
      mov di, [bp+6]; BX
      mov ah, [bp+12]
      mov  al, [si]
      mov cx, [bp+8]; l1

      sentence:
          mov  al, [si]
          stosw
          inc si
          loop sentence

      pop si
      pop di
      pop dx
      pop cx
      pop bx
      pop ax
      pop es
      pop sp
      pop bp
      ret 8

printnum:
        push bp
        mov  bp, sp
        push es
        push ax
        push bx
        push cx
        push dx
        push di

        ; first, let's split digits and push them onto the stack

        mov ax, [bp+6]   ; number to print
        mov bx, 10       ; division base 10
        mov cx, 0        ; total digit counter

        nextdigit:
              mov dx, 0    ; zero out
              div bx       ; divides ax/bx .. quotient in ax, remainder in dl
              add dl, 0x30 ; convert to ASCII
              push dx      ; push to stack for later printing
              inc cx       ; have another digit
              cmp ax, 0    ; is there something in quotient?
              jnz nextdigit

        ;now let's do the printing

          mov ax, 0xb800
          mov es, ax

          mov di, [bp+4]

          nextpos:
              pop dx          ; digit to output. Already in ASCII
              mov dh, 0x03    ; why is this inside the loop here?
              mov [es:di], dx
              add di, 2
              loop nextpos    ; cx has already been set, use that

          pop di
          pop dx
          pop cx
          pop bx
          pop ax
          pop es
          pop bp
          ret 2

start:
    call clrscreen

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si
    xor di, di

    mov cx, 0x85 ;purple color
    PUSH cx
    mov ax, msg0; message
    PUSH ax
    PUSH word [l0]; length
    mov bx, 360
    PUSH bx; location
    CALL print

    mov cx, 0x0C
    PUSH cx
    mov ax, by; message
    PUSH ax
    PUSH word [b0]; length
    mov bx, 706
    PUSH bx; location
    CALL print

;printing name and Rollno
    mov cx, 0x0E ;yellow color
    PUSH cx
    mov ax, name1
    PUSH ax
    PUSH word [n1]
    mov bx, 1016
    PUSH bx
    CALL print

    mov cx, 0x06 ;orange color
    PUSH cx
    mov ax, Rollno1
    PUSH ax
    PUSH word [r]
    mov bx, 1188
    PUSH bx
    CALL print

    mov cx, 0x0E
    PUSH cx
    mov ax, name2
    PUSH ax
    PUSH word [n2]
    mov bx, 1502
    PUSH bx
    CALL print

    mov cx, 0x06
    PUSH cx
    mov ax, Rollno2
    PUSH ax
    PUSH word [r]
    mov bx, 1668
    PUSH bx
    CALL print

    mov cx, 0x09 ;Blue color
    PUSH cx
    mov ax, I1
    PUSH ax
    PUSH word [IL1]
    mov bx, 2136
    PUSH bx
    CALL print


    mov cx, 0x09
    PUSH cx
    mov ax, I2
    PUSH ax
    PUSH word [IL2]
    mov bx, 2432
    PUSH bx
    CALL print

    mov cx, 0x09
    PUSH cx
    mov ax, I7
    PUSH ax
    PUSH word [IL7]
    mov bx, 2592
    PUSH bx
    CALL print

    mov cx, 0x09
    PUSH cx
    mov ax, I3
    PUSH ax
    PUSH word [IL3]
    mov bx, 2752
    PUSH bx
    CALL print

    mov cx, 0x09
    PUSH cx
    mov ax, I4
    PUSH ax
    PUSH word [IL456]
    mov bx, 2912
    PUSH bx
    CALL print

    mov cx, 0x09
    PUSH cx
    mov ax, I5
    PUSH ax
    PUSH word [IL456]
    mov bx, 3072
    PUSH bx
    CALL print

    mov cx, 0x09
    PUSH cx
    mov ax, I6
    PUSH ax
    PUSH word [IL456]
    mov bx, 3232
    PUSH bx
    CALL print

    mov cx, 0x8A ;green color
    PUSH cx
    mov ax, msg13
    PUSH ax
    PUSH word [l13]
    mov bx, 3568
    PUSH bx
    CALL print

    mov ah, 0x1        ; input char is 0x1 in ah
    int 0x21

    CALL clrscreen

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov cx, 0x8B ;Sea Blue
    PUSH cx
    mov ax, msg11
    PUSH ax
    PUSH word [l11]
    mov bx, [loc]
    PUSH bx
    CALL print

    mov bx, 320
    mov [loc], bx

    xor di, di

    mov di, [limit]

loop:
    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov cx, 0x07
    PUSH cx
    mov ax, msg2
    PUSH ax
    PUSH word [l2]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 26
    mov [loc], bx

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    ;taking first digit
    mov ah, 1
    int 21h
    mov bl, al
    sub bx, 48
    mov ax, 0
    mov ax, bx
    mov bx, 100
    mul bx
    ;saving it
    mov [temp], ax

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    ;taking second digit
    mov ah, 1
    int 21h
    mov bl, al
    sub bx, 48
    mov ax, 0
    mov ax, bx
    mov bx, 10
    mul bx
    ;updating and saving it
    mov cx, [temp]
    add cx, ax
    mov [temp], cx

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    ;taking third digit
    mov ah, 1
    int 21h
    mov bl, al
    sub bx, 48
    ;updating and saving it
    mov cx, [temp]
    add cx, bx

    push cx
    mov si, [loc]
    push si
    call printnum

    mov [guess], cx; saving input to an address

    add si, 134
    mov [loc], si

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    CALL check
    mov ax, [found]
    cmp ax, 1
    je EXIT
    dec di
    cmp di, 0
    jne loop

    CALL clrscreen
    mov bx, 1668
    mov [loc], bx

    mov cx, 0x86
    PUSH cx
    mov ax, msg12
    PUSH ax
    PUSH word [l12]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 304
    mov [loc], bx

    mov cx, 0x04
    PUSH cx
    mov ax, msg1
    PUSH ax
    PUSH word [l1]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 46
    mov [loc], bx

    mov cx, [secretNO]
    push cx
    mov si, [loc]
    push si
    call printnum
    add bx, 282
    mov [loc], bx

    mov cx, 0x07
    PUSH cx
    mov ax, msg10
    PUSH ax
    PUSH word [l10]
    mov bx, [loc]
    PUSH bx
    CALL print
    add bx, 32
    mov [loc], bx

    mov ax, [attempts] ;total no.of attempts taken
    PUSH ax
    mov bx, [loc]
    PUSH bx
    CALL printnum

    xor ax, ax
    xor bx, bx
    xor cx, cx
    xor dx, dx
    xor si, si

    mov ah, 0x1        ; input char is 0x1 in ah
    int 0x21

    call clrscreen
    mov  ax, 0x4c00
    int  0x21

EXIT:
    int 0x21
