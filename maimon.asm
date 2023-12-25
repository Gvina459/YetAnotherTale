IDEAL
MODEL small
STACK 100h
DATASEG

	A1bol db 0
	
	Time dw 0
	
	Color2 db ?
	
	ColorB db 255
    
    startX dw 70
    endX dw 77
    
    startY dw 110
    endY dw 117
	
	BallSize dw 6, 6, 6, 9, 6
	
	BallX dw 112, 25, 25, 112, 25
    BallY dw 75, 75, 145, 144, 150
	BallVelocX dw -4, -4, -4, -1, -4
	BallVelocY dw -4, -4, -4, -1, -4

	stor   	 	dw      0      ;our memory location storage
	imgHeight dw 200  ;Height of image that fits screen
	imgWidth dw 320   ;Width of image that fits screen
	adjustCX dw ?     ;Adjusts register CX
	filename db 20 dup (?) ;Generates the file's name 
	filehandle dw ?  ;Handles the file
	Header db 54 dup (0)  ;Read BMP file header, 54 bytes
	Palette db 256*4 dup (0)  ;Enable colors
	ScrLine db 320 dup (0)   ;Screen Line
	Errormsg db 'Error', 13, 10, '$'   ;In case of not having all the files, Error message pops
	printAdd dw ?   ;Enable to add new graphics
	
	img db 'YetAT.bmp', 0
	img3 db 'tryfin2.bmp', 0   ;Openning image (bmp)
	img2 db 'GameOver.bmp', 0
	img4 db 'info.bmp', 0
	img5 db 'GGEZ.bmp', 0
	
	SoulArr1 db 0, 0fh, 0fh, 0fh,0, 0fh, 0fh, 0fh, 0, 0, 0fh, 1, 0fh, 0fh, 0fh, 1, 0fh, 0, 0fh, 1, 0fh, 0fh, 0fh, 0fh, 0fh, 1, 0fh, 0fh, 0fh, 1, 0fh, 0fh, 0fh, 1, 0fh, 0fh, 0fh, 0fh, 0fh, 1, 0fh, 1, 0fh, 0fh, 0fh, 0, 0fh, 0fh, 1, 0fh, 1, 0fh, 0fh, 0, 0, 0, 0fh, 0fh, 0fh,0fh, 0fh, 0, 0, 0, 0, 0, 0fh, 0fh, 0fh, 0, 0, 0, 0, 0, 0, 0, 0fh, 0, 0, 0, 0
	BallArr db 0, 0, 251, 251, 251, 0, 0, 0, 251, 251, 255, 251, 251, 0, 251, 251, 255, 255, 255, 251, 251, 251, 255, 255, 255, 255, 255, 251, 251, 251, 255, 255, 255, 251, 251, 0, 251, 251, 255, 251, 251, 0, 0, 0, 251, 251, 251,0, 0
	BallArr2 db 0,0, 0, 251, 251,251, 251,0, 0,0,0,0, 251, 255, 255,255, 255,251, 0,0,0,251, 255, 255, 255,255, 255,255, 251,0,251,255, 255, 251, 251,251, 251,255, 255,251,251,255, 255, 251, 251,251, 251,255, 255,251,251,255, 255, 251, 251,251, 251,255, 255,251,251,255, 255, 251, 251,251, 251,255, 255,251,0,251, 255, 255, 255,255, 255,255, 251,0,0,0, 251, 255, 255,255, 255,255, 0,0,0,0, 0, 251, 251,251, 251,0, 0,0

	Clock equ es:6Ch
	Clock2 equ es:6Ch
	
	bol db 0
	
	delay_Time dw 70
	delay_Time2 dw 0aaaah
	
	Hp_Count_Dig db 0
    Hp_Count_Tens db 2
    Display_Hp db 'Hp:', '$'
    Display_Hp_Count_Digits db '0','$'
    Display_Hp_Count_Tens db '2','$'
	
	a1 dw 0
	a2 dw 0
	
	count dw 0
	SCcount dw 0
	
	;C dw 0
	
	C1 dw 0
	C2 dw 0
	
	MDx1 dw 124
	MDy1 dw 67
	colorMD db 6
	
	MDx2 dw 124
	MDy2 dw 67
	colorMD2 db 31
	
	B23 dw 0
	B2s dw 0
	
	abc dw 0
	
	MovementBool dw 0
	
	advice1 db 'DONT MOVE!','$'
	advice2 db 'MOVE!!!!!' , '$'
	
	c23 db 0
	
	mult dw 16645 ; LCG multiplier (a)
    incr  dw 10139 ; LCG increment (c)
    modulus    dw 32768 ; LCG modulus (m)
    seed       dw 12345 ; Seed value
	Random db 0
	
	mult2 dw 16645 ; LCG multiplier (a)
    incr2  dw 10139 ; LCG increment (c)
    modulus2    dw 32768 ; LCG modulus (m)
    seed2       dw 12345 ; Seed value
	Random2 db 0
	
	FB1x dw 124
	FB1y dw 67
	FB2x dw 124
	FB2y dw 67
	FB3x dw 124
	FB3y dw 67
	
	;FBx dw 124, 124, 124
	;FBy dw 67, 67, 67
	;FBcolor db 255, 255, 255
	
	FB1color db 255
	FB2color db 255
	FB3color db 255
	
	FBool1 db 0
	FBool2 db 0
	FBool3 db 0
	
	T3 dw 0
	DeathBool dw 0
	HpCount dw 20
	
	T3num dw 20
	
	bool2 dw 0
	bool3 dw 0
	
	Fax dw 20, 20
	Fay dw 70, 70
	Facolor db 255, 255
	Fab dw 0
	
	Fax2 dw 20, 20
	Fay2 dw 70, 70
	Facolor2 db 255, 255
	Fab2 dw 0

p386
	
CODESEG
proc SwitchToGraphicsMode
    mov ax, 13h
    int 10h
    ret
endp SwitchToGraphicsMode

proc PrintBmp
	push cx
	push di
	push si
	push cx
	push ax
	xor di, di
	mov di, ax
	mov si, offset filename
	mov cx, 20
Copy:
	mov al, [di]
	mov [si], al
	inc di
	inc si
	loop Copy
	pop ax
	pop cx
	pop si
	pop di
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitMap
	call CloseFile
	
	pop cx
	ret
endp PrintBmp

;in proc PrintBmp
proc OpenFile
	mov ah,3Dh
	xor al,al ;for reading only
	mov dx, offset filename
	int 21h
	jc OpenError
	mov [filehandle],ax
	ret
OpenError:
	mov dx,offset Errormsg
	mov ah,9h
	int 21h
	ret
endp OpenFile

;in proc PrintBmp
proc ReadHeader
;Read BMP file header, 54 bytes
	mov ah,3Fh
	mov bx,[filehandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	ret
endp ReadHeader

;in proc PrintBmp
proc ReadPalette
;Read BMP file color palette, 256 colors*4bytes for each (400h)
	mov ah,3Fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	ret
endp ReadPalette

;in proc PrintBmp
proc CopyPal
; Copy the colors palette to the video memory
; The number of the first color should be sent to port 3C8h
; The palette is sent to port 3C9h
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h ;port of Graphics Card
	mov al,0 ;number of first color
	;Copy starting color to port 3C8h
	out dx,al
	;Copy palette itself to port 3C9h
	inc dx
PalLoop:
	;Note: Colors in a BMP file are saved as BGR values rather than RGB.	
	mov al,[si+2] ;get red value
	shr al,2 	; Max. is 255, but video palette maximal value is 63. Therefore dividing by 4
	out dx,al ;send it to port
	mov al,[si +1];get green value
	shr al,2
	out dx,al	;send it
	mov al,[si]
	shr al,2
	out dx,al 	;send it
	add si,4	;Point to next color (There is a null chr. after every color)
	loop PalLoop
	ret
endp CopyPal

;in proc PrintBmp
proc CopyBitMap
; BMP graphics are saved upside-down.
; Read the graphic line by line ([height] lines in VGA format),
; displaying the lines from bottom to top.
	mov ax,0A000h ;value of start of video memory
	mov es,ax	
	push ax
	push bx
	mov ax, [imgWidth]
	mov bx, 4
	div bl
	
	cmp ah, 0
	jne NotZero
Zero:
	mov [adjustCX], 0
	jmp Continue
NotZero:
	mov [adjustCX], 4
	xor bx, bx
    mov bl, ah
	sub [adjustCX], bx
Continue:
	pop bx
	pop ax
	mov cx, [imgHeight]	;reading the BMP data - upside down
	
PrintBMPLoop:
	push cx
	xor di, di
	push cx
	dec cx
	Multi:
		add di, 320
		loop Multi
	pop cx

    add di, [printAdd]
	mov ah, 3fh
	mov cx, [imgWidth]
	add cx, [adjustCX]
	mov dx, offset ScrLine
	int 21h
	;Copy one line into video memory
	cld	;clear direction flag - due to the use of rep
	mov cx, [imgWidth]
	mov si, offset ScrLine
	rep movsb 	;do cx times:
				;mov es:di,ds:si -- Copy single value form ScrLine to video memory
				;inc si --inc - because of cld
				;inc di --inc - because of cld
	pop cx
	loop PrintBMPLoop
	ret
endp CopyBitMap

;in proc PrintBmp
proc CloseFile
	mov ah,3Eh
	mov bx,[filehandle]
	int 21h
	ret
endp CloseFile

;enables graphics mode
;IN: X
;OUT: graphics mode enabled

proc Blocker1
	mov cx, 16 ;x left part
	mov dx, 66 ;y left part
	B1d:
		mov ah, 0ch
		mov al, [ColorB]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, 16 ;x
		cmp ax, 57 ;width
		jng B1d
		
		mov cx, 16 ;x
		inc dx
		
		mov ax, dx
		sub ax, 66 ;y
		cmp ax, 98 ;height
		jng B1d
	ret
endp Blocker1

proc Blocker2
	mov cx, 75 ;x left part
	mov dx, 66 ;y left part
	B2d:
		mov ah, 0ch
		mov al, [ColorB]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, 75 ;x
		cmp ax, 55 ;width
		jng B2d
		
		mov cx, 75 ;x
		inc dx
		
		mov ax, dx
		sub ax, 66 ;y
		cmp ax, 98 ;height
		jng B2d
	ret
endp Blocker2

proc ExplanationMark1
	
	mov cx, 40 ;x left part
	mov dx, 85 ;y left part
	EXP2:
		mov ah, 0ch
		mov al, [Color2]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, 40 ;x
		cmp ax, 04h ;width
		jng EXP2
		
		mov cx, 40 ;x
		inc dx
		
		mov ax, dx
		sub ax, 85 ;y
		cmp ax, 60 ;height
		jng EXP2
		
	mov cx, 40 ;initial x
	mov dx, 127 ;initial y
	
	EXP:
		mov ah, 0ch ;configuration
		mov al, 0
		mov bh, 00h ;page number
		int 10h ;execution
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, 40
		cmp ax, 04h
		jng EXP
		mov cx, 40
		inc dx
		mov ax, dx
		sub ax, 127
		cmp ax, 10
		jng EXP
	
	ret
endp ExplanationMark1

proc ExplanationMark2
	
	mov cx, 103 ;x left part
	mov dx, 85 ;y left part
	EXP3:
		mov ah, 0ch
		mov al, [Color2]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, 103 ;x
		cmp ax, 04h ;width
		jng EXP3
		
		mov cx, 103 ;x
		inc dx
		
		mov ax, dx
		sub ax, 85 ;y
		cmp ax, 60 ;height
		jng EXP3
		
	mov cx, 103 ;initial x
	mov dx, 127 ;initial y
	
	EXP4:
		mov ah, 0ch ;configuration
		mov al, 0
		mov bh, 00h ;page number
		int 10h ;execution
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, 103
		cmp ax, 04h
		jng EXP4
		mov cx, 103
		inc dx
		mov ax, dx
		sub ax, 127
		cmp ax, 10
		jng EXP4
	
	ret
endp ExplanationMark2

proc MiddleLine
	mov cx, 70 ;initial x
	mov dx, 66 ;initial y
	ML:
		mov ah, 0ch ;configuration
		mov al, [Color2]
		mov bh, 00h ;page number
		int 10h ;execution
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, 70
		cmp ax, 2
		jng ML
		mov cx, 70
		inc dx
		mov ax, dx
		sub ax, 66
		cmp ax, 98
		jng ML
	
	ret
endp MiddleLine

proc Draw_Ball1
	mov cx, [BallX+si] ;initial x
	mov dx, [BallY+si] ;initial y
	mov bx, 0
	
	Draw_Horizontal:
		mov ah, 0ch ;configuration
		mov al, [BallArr+bx]
		mov bh, 00h ;page number
		int 10h ;execution
		inc bx
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, [BallX+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal
		mov cx, [BallX+si]
		inc dx
		mov ax, dx
		sub ax, [BallY+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal
		
	ret
endp Draw_Ball1

proc Draw_Ball12
	mov cx, [BallX+si] ;initial x
	mov dx, [BallY+si] ;initial y
	
	Draw_Horizontal222:
		mov ah, 0ch ;configuration
		mov al, 0
		mov bh, 00h ;page number
		int 10h ;execution
		inc bx
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, [BallX+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal222
		mov cx, [BallX+si]
		inc dx
		mov ax, dx
		sub ax, [BallY+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal222
		
	ret
endp Draw_Ball12

proc Draw_Ball4
	mov cx, [BallX+si] ;initial x
	mov dx, [BallY+si] ;initial y
	mov bx, 0
	
	Draw_Horizontal4:
		mov ah, 0ch ;configuration
		mov al, [BallArr2+bx]
		mov bh, 00h ;page number
		int 10h ;execution
		inc bx
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, [BallX+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal4
		mov cx, [BallX+si]
		inc dx
		mov ax, dx
		sub ax, [BallY+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal4
		
	ret
endp Draw_Ball4

proc Draw_Ball13
	mov cx, [BallX+si] ;initial x
	mov dx, [BallY+si] ;initial y
	
	Draw_Horizontal5:
		mov ah, 0ch ;configuration
		mov al, 0
		mov bh, 00h ;page number
		int 10h ;execution
		inc bx
		inc cx ;cx=cx+1
		mov ax, cx
		sub ax, [BallX+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal5
		mov cx, [BallX+si]
		inc dx
		mov ax, dx
		sub ax, [BallY+si]
		cmp ax, [BallSize+si]
		jng Draw_Horizontal5
		
	ret
endp Draw_Ball13

proc NegVel
	Neg_VelocityX:
		neg [BallVelocX+si]
		neg [BallVelocY+si]
		
	Neg_VelocityY:
		neg [BallVelocY+si]
	
	ret
endp NegVel

proc BallBoundries1
	
	call Draw_Ball12
	mov ax, [BallVelocX+si] ;moves ball x axis
	add [BallX+si], ax
	mov ax, [BallVelocY+si] ; moves ball y axis
	add [BallY+si], ax
	call Draw_Ball1
	
	Boundries:
	
	cmp [BallY+si], 70 ;70 ;155 ;120 ;20
	jbe Neg_VelocityY
	
	cmp [BallY+si], 155
	jge Neg_VelocityY
	
	cmp [BallX+si], 115
	jge Neg_VelocityX
	
	cmp [BallX+si], 22
	jbe Neg_VelocityX
	
	cmp [BallX+8], 66
	jge Neg_VelocityX
	
	ret
endp BallBoundries1

proc HomingBall
		
		
	mov si, 6
	call Draw_Ball13
		
    Home_X:
		mov ax,[startX]
		cmp ax,[BallX+si]
		jnc Home_Left

    mov ax,[BallVelocX+si]
    add [BallX+si],ax
    mov ax,[startX]
    cmp ax,[BallX+si]
    jnc Same_X
    jmp Home_Y

    Home_Left:
		mov ax,[BallVelocX+si]
		add [BallX+si],ax
		mov ax,[startX]
		cmp ax,[BallX+si]
		jnc Same_X
		jmp Home_Y

    Same_X:
		mov [BallX+si],ax
		jmp Home_Y

    Home_Y:
		mov ax,[startY]
		cmp ax,[BallY+si]
		jc Home_Up
	
	mov ax,[BallVelocY+si]
    add [BallY+si],ax
    mov ax,[startY]
    cmp ax,[BallY+si]
    jc Same_Y
    jmp End_Homing
	
    Home_Up:
		mov ax,[BallVelocY+si]
		sub [BallY+si],ax
		mov ax,[startY]
		cmp ax,[BallY+si]
		jnc Same_Y
		jmp End_Homing

    Same_Y:
		mov [BallY+si],ax
		jmp End_Homing

    End_Homing:
		call Draw_Ball4
		
	Bounderis2:
	cmp [BallY+si], 69 ;70 ;155 ;120 ;20
	jbe Neg_VelocityY
	
	cmp [BallY+si], 155
	jge Neg_VelocityY
	
	;normal scenario white color

	
	cmp [BallX+si], 22
	jbe Neg_VelocityX
	
	cmp [BallX+8], 66
	jge Neg_VelocityX
			
			
        ret
endp HomingBall

proc ClearBall
	mov si, 0 
	call Draw_Ball12
	mov si, 2
	call Draw_Ball12
	mov si, 4
	call Draw_Ball12
	mov si, 6
	call Draw_Ball12
	mov si, 8
	call Draw_Ball12
	
	mov [BallX+8], 25
	mov [BallY+8], 150
	mov [BallVelocY+8], -4
	mov [BallVelocY+8], -4
	mov [BallX+0], 112
	mov [BallY+0], 75
	mov [BallX+2], 25
	mov [BallY+2], 75
	mov [BallX+4], 25
	mov [BallY+4], 145
	mov [BallX+6], 112
	mov [BallY+6], 144
	mov [BallVelocX+0], -4
	mov [BallVelocX+2], -4
	mov [BallVelocX+4], -4
	mov [BallVelocX+6], -1
	mov [BallVelocY+0], -4
	mov [BallVelocY+2], -4
	mov [BallVelocY+4], -4
	mov [BallVelocY+6], -1
	
	ret
endp ClearBall

proc delay  
	push cx
	mov cx, [delay_Time2]
outer_loop:
	push cx
	mov cx, [delay_Time]
inner_loop:
	loop inner_loop
	pop cx
	loop outer_loop
	pop cx
	inc [Time]
	cmp [Time], 255
	je resetTime
	cmp [T3], 0
	jne InvincibilityFrames
	cmp [a2], 1
	jge incA1
	cmp [a1], 255
	je Reseta1
	cmp [Time], 180
	jge incA1
	ret
endp delay

proc InvincibilityFrames
	dec [T3]
	ret
endp InvincibilityFrames

proc incA1
	inc [a1] ;Time delay between random
	ret
endp incA1

proc Reseta1
	mov [a1], 0
	
	ret
endp Reseta1

proc resetTime
	mov [Time], 0
	inc [a2]
	ret
endp resetTime

proc MovementDetectors
	
	mov cx, [MDx1] ;x ;124
	mov dx, [MDy1] ;y ;67
	MD:
		mov ah, 0ch
		mov al, [colorMD]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [MDx1] ;x ;124
		cmp ax, 4 ;width ;4
		jng MD
		
		mov cx, [MDx1] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [MDy1] ;y ;162
		cmp ax, 95 ;height ;1
		jng MD
	
	ret
endp MovementDetectors

proc MovementDetectorsOrange
	
	mov cx, [MDx2] ;x ;124
	mov dx, [MDy2] ;y ;67
	MD2:
		mov ah, 0ch
		mov al, [colorMD2]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [MDx2] ;x ;124
		cmp ax, 4 ;width ;4
		jng MD2
		
		mov cx, [MDx2] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [MDy2] ;y ;162
		cmp ax, 95 ;height ;1
		jng MD2
	
	ret
endp MovementDetectorsOrange

proc Movementdetectors2

	mov [colorMD], 0
	call MovementDetectors
	sub [MDx1], 3
	mov [colorMD], 6
	call MovementDetectors
	cmp [MDx1], 25
	jbe ClearMD
	jmp skip132
	
	ClearMD:
		mov [colorMD], 0
		call MovementDetectors
		inc [B23]
		mov [MDx1], 124
		mov [colorMD2], 6
		
	skip132:
		ret
endp Movementdetectors2

proc Movementdetectors2Orange
	
	mov [colorMD2], 0
	call MovementDetectorsOrange
	sub [MDx2], 3
	mov [colorMD2], 31
	call MovementDetectorsOrange
	cmp [MDx2], 25
	jbe ClearMD2
	jmp skip1324
	
	ClearMD2:
		mov [colorMD2], 0
		call MovementDetectorsOrange
		inc [abc]
		mov [MDx2], 124
		mov [colorMD2], 31
		
	skip1324:
		ret
endp Movementdetectors2Orange

proc FB1
	
	mov cx, [FB1x] ;x ;124
	mov dx, [FB1y] ;y ;67
	
	F1:
		mov ah, 0ch
		mov al, [FB1color]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB1x] ;x ;124
		cmp ax, 4 ;width ;4
		jng F1
		
		mov cx, [FB1x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [FB1y] ;y ;162
		cmp ax, 95 ;height ;1
		jng F1
	
	mov cx, [FB1x] ;x ;124
	mov dx, 90 ;y ;67
	Fbiopenup:
		mov ah, 0ch
		mov al, 0
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB1x] ;x ;124
		cmp ax, 4 ;width ;4
		jng Fbiopenup
		
		mov cx, [FB1x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, 90 ;y ;162
		cmp ax, 25 ;height ;1
		jng Fbiopenup
	
	ret
endp FB1

proc FB1mv
	
	cmp [FBool1], 1
	je skip13245
	mov [FB1color], 0
	call FB1
	sub [FB1x], 2
	mov [FB1color], 255
	call FB1
	cmp [FB1x], 21
	jbe ClearFB1
	jmp skip13245
	
	ClearFB1:
		mov [FB1color], 0
		call FB1
		mov [FB1color], 6
		inc [FBool1]
		
	skip13245:
		ret
		
endp FB1mv

proc FB2
	
	mov cx, [FB2x] ;x ;124
	mov dx, [FB2y] ;y ;67
	F3:
		mov ah, 0ch
		mov al, [FB2color]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB2x] ;x ;124
		cmp ax, 4 ;width ;4
		jng F3
		
		mov cx, [FB2x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [FB2y] ;y ;162
		cmp ax, 95 ;height ;1
		jng F3
	
	mov cx, [FB2x] ;x ;124
	mov dx, 125 ;y ;67
	F34:
		mov ah, 0ch
		mov al, 0
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB2x] ;x ;124
		cmp ax, 4 ;width ;4
		jng F34
		
		mov cx, [FB2x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, 125 ;y ;162
		cmp ax, 25 ;height ;1
		jng F34
	
	ret
endp FB2

proc FB2mv
	
	cmp [FBool2], 1
	je skip132453
	mov [FB2color], 0
	call FB2
	sub [FB2x], 2
	mov [FB2color], 255
	call FB2
	cmp [FB2x], 21
	jbe ClearFB2
	jmp skip132453
	
	ClearFB2:
		mov [FB2color], 0
		call FB2
		mov [FB2color], 6
		inc [FBool2]
		
	skip132453:
		ret
		
endp FB2mv

proc FB3
	
	mov cx, [FB3x] ;x ;124
	mov dx, [FB3y] ;y ;67
	F4:
		mov ah, 0ch
		mov al, [FB3color]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB3x] ;x ;124
		cmp ax, 4 ;width ;4
		jng F4
		
		mov cx, [FB3x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [FB3y] ;y ;162
		cmp ax, 95 ;height ;1
		jng F4
		
	mov cx, [FB3x] ;x ;124
	mov dx, 106 ;y ;67
	F45:
		mov ah, 0ch
		mov al, 0
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [FB3x] ;x ;124
		cmp ax, 4 ;width ;4
		jng F45
		
		mov cx, [FB3x] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, 106 ;y ;162
		cmp ax, 25 ;height ;1
		jng F45
	
	ret
endp FB3

proc FB3mv
	
	cmp [FBool3], 1
	je skip1324532
	mov [FB3color], 0
	call FB3
	sub [FB3x], 2
	mov [FB3color], 255
	call FB3
	cmp [FB3x], 21
	jbe ClearFB3
	jmp skip1324532
	
	ClearFB3:
		mov [FB3color], 0
		call FB3
		mov [FB3color], 6
		inc [FBool3]
		
	skip1324532:
		ret
		
endp FB3mv

proc opt1

	call FB3mv
	cmp [FB3x], 80
	jbe opt12
	jmp Move_Soul
	
	opt12:
		cmp [FB2x], 21
		jbe opt13
		call FB2mv
		cmp [FB2x], 80
		jbe opt13
		jmp Move_Soul
		
	opt13:
		cmp [FB1x], 21
		jbe Endopt1
		call FB1mv
		jmp Move_Soul
	
	Endopt1:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
		mov [a1], 0
	
	
	ret
endp opt1

proc opt2

	call FB3mv
	cmp [FB3x], 80
	jbe opt22
	jmp Move_Soul
	
	opt22:
		cmp [FB1x], 21
		jbe opt23
		call FB1mv
		cmp [FB1x], 80
		jbe opt23
		jmp Move_Soul
		
	opt23:
		cmp [FB2x], 21
		jbe Endopt2
		call FB2mv
		jmp Move_Soul
	
	Endopt2:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
		mov [a1], 0
	
	ret
endp opt2

proc opt3

	call FB2mv
	cmp [FB2x], 80
	jbe opt32
	jmp Move_Soul
	
	opt32:
		cmp [FB3x], 21
		jbe opt33
		call FB3mv
		cmp [FB3x], 80
		jbe opt33
		jmp Move_Soul
		
	opt33:
		cmp [FB1x], 21
		jbe Endopt3
		call FB1mv
		jmp Move_Soul
	
	Endopt3:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
		mov [a1], 0
	
	ret
endp opt3

proc opt4

	call FB2mv
	cmp [FB2x], 80
	jbe opt42
	jmp Move_Soul
	
	opt42:
		cmp [FB1x], 21
		jbe opt43
		call FB1mv
		cmp [FB1x], 80
		jbe opt43
		jmp Move_Soul
		
	opt43:
		cmp [FB3x], 21
		jbe Endopt4
		call FB3mv
		jmp Move_Soul
	
	Endopt4:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
		mov [a1], 0
	
	
	ret
endp opt4

proc opt5

	call FB1mv
	cmp [FB1x], 80
	jbe opt52
	jmp Move_Soul
	
	opt52:
		cmp [FB2x], 21
		jbe opt53
		call FB2mv
		cmp [FB2x], 80
		jbe opt53
		jmp Move_Soul
		
	opt53:
		cmp [FB3x], 21
		jbe Endopt5
		call FB3mv
		jmp Move_Soul
	
	Endopt5:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
		mov [a1], 0
	
	
	ret
endp opt5

proc opt6

	call FB1mv
	cmp [FB1x], 80
	jbe opt62
	jmp Move_Soul
	
	opt62:
		cmp [FB3x], 21
		jbe opt63
		call FB3mv
		cmp [FB3x], 80
		jbe opt63
		jmp Move_Soul
		
	opt63:
		cmp [FB2x], 21
		jbe Endopt6
		call FB2mv
		jmp Move_Soul
	
	Endopt6:
		mov [FB3x], 124
		mov [FB3y], 67
		mov [FB2x], 124
		mov [FB2y], 67
		mov [FB1x], 124
		mov [FB1y], 67
		mov [Fbool1], 0
		mov [Fbool2], 0
		mov [Fbool3], 0
		inc [B2s]
		mov [c23], 0
	
	ret
endp opt6

proc FinalA1
	
	mov cx, [Fax+si] ;x ;124
	mov dx, [Fay+si] ;y ;67
	
	Fi1:
		mov ah, 0ch
		mov al, [Facolor+bx]
		mov bh, 00h
		int 10h
		
		inc cx
		mov ax, cx
		sub ax, [Fax+si] ;x ;124
		cmp ax, 53 ;width ;4
		jng Fi1
		
		mov cx, [Fax+si] ;x ;124
		inc dx
		
		mov ax, dx
		sub ax, [Fay+si] ;y ;162
		cmp ax, 4 ;height ;1
		jng Fi1
	
	mov cx, 30 ;x ;124
	mov dx, [Fay+si] ;y ;67
	Fi2:
		mov ah, 0ch
		mov al, 0
		mov bh, 00h
		int 10h
	
		inc cx
		mov ax, cx
		sub ax, 30 ;x ;124
		cmp ax, 20 ;width ;4
		jng Fi2

		mov cx, 30 ;x ;124
		inc dx

		mov ax, dx
		sub ax, [Fay+si] ;y ;162
		cmp ax, 4 ;height ;1
		jng Fi2
	
	ret
endp FinalA1

proc Finalmv1
	
	cmp [Fab], 1
	je skip132456
	mov [Facolor+bx], 0
	call FinalA1
	add [Fay+si], 2
	mov [Facolor+bx], 255
	call FinalA1
	cmp [Fay+si], 158
	jge ClearFinalA
	jmp skip132456
	
	ClearFinalA:
		mov [Facolor+bx], 0
		call FinalA1
		mov [Facolor+bx], 255
		mov [Fab], 1
		
	skip132456:
		ret
		
endp Finalmv1

proc FinalA2

    mov cx, [Fax2+si] ;x ;124
    mov dx, [Fay2+si] ;y ;67

    Fi12:
        mov ah, 0ch
        mov al, [Facolor2+bx]
        mov bh, 00h
        int 10h

        inc cx
        mov ax, cx
        sub ax, [Fax2+si] ;x ;124
        cmp ax, 53 ;width ;4
        jng Fi12

        mov cx, [Fax2+si] ;x ;124
        inc dx

        mov ax, dx
        sub ax, [Fay2+si] ;y ;162
        cmp ax, 4 ;height ;1
        jng Fi12

    mov cx, 45 ;x ;124
    mov dx, [Fay2+si] ;y ;67
    Fi23:
        mov ah, 0ch
        mov al, 0
        mov bh, 00h
        int 10h

        inc cx
        mov ax, cx
        sub ax, 45 ;x ;124
        cmp ax, 20 ;width ;4
        jng Fi23

        mov cx, 45 ;x ;124
        inc dx

        mov ax, dx
        sub ax, [Fay2+si] ;y ;162
        cmp ax, 4 ;height ;1
        jng Fi23

    ret
endp FinalA2

proc Finalmv2

    cmp [Fab2], 1
    je skip1324564
    mov [Facolor2+bx], 0
    call FinalA2
    add [Fay2+si], 2
    mov [Facolor2+bx], 255
    call FinalA2
    cmp [Fay2+si], 158
    jge ClearFinalA2
    jmp skip1324564

    ClearFinalA2:
        mov [Facolor2+bx], 0
        call FinalA2
        mov [Facolor2+bx], 255
        mov [Fab2], 1

    skip1324564:
        ret

endp Finalmv2

proc SwitchToTextMode
    mov ax, 2
    int 10h
    
    ret
endp SwitchToTextMode

proc Soul
	mov cx, [startX] ;x 
    mov dx, [startY] ;y
	mov bx, 0
	S:
        mov ah, 0ch
        mov al, [SoulArr1+bx]
        mov bh, 00h
        int 10h
		
        inc cx
		add bx, 1
        mov ax, cx
        sub ax, [EndX] ;x
        cmp ax, 1 ;width
        jng S

        mov cx, [startX] ;x
        inc dx

        mov ax, dx
        sub ax, [endY] ;y
        cmp ax, 1 ;height
        jng S
	
	ret
endp Soul

proc Soul2
	mov cx, [startX] ;x 
    mov dx, [startY] ;y
	S2:
        mov ah, 0ch
        mov al, 0
        mov bh, 00h
        int 10h
		
        inc cx
		add bx, 1
        mov ax, cx
        sub ax, [EndX] ;x
        cmp ax, 1 ;width
        jng S2

        mov cx, [startX] ;x
        inc dx

        mov ax, dx
        sub ax, [endY] ;y
        cmp ax, 1 ;height
        jng S2
	
	ret
endp Soul2

proc Exit
    mov ax, 4c00h
    int 21h

    ret
endp Exit

proc EndGame
    call SwitchToTextMode
    call Exit

    ret
endp EndGame

proc MoveUp
	cmp [startY], 70
    jbe EndMoveDown

    call Soul2
    
    sub [startY], 5
    sub [endY], 5
	
    call Soul

  EndMoveUp:
		ret
endp MoveUp

proc MoveDown
	cmp [startY], 155
    jge EndMoveUp
	
    call Soul2
    
    add [startY], 5
    add [endY], 5
    
    call Soul

  EndMoveDown:
		ret
endp MoveDown


proc MoveRight
	cmp [startX], 120
    je EndMoveRight

    call Soul2
    
    add [startX], 5
    add [endX], 5
    
    call Soul

  EndMoveRight:
		ret
endp MoveRight


proc MoveLeft
    cmp [startX], 20
    jbe EndMoveLeft

    call Soul2
    
    sub [startX], 5
    sub [endX], 5
    
    call Soul
	
  EndMoveLeft:
		ret
endp MoveLeft

proc Advice1MD ; draws the Advice text
    mov ah,02h
    mov bh,0h ; page number
    mov dl, 4 ; collum number
    mov dh, 5 ; row number

    int 10h

    mov ah,09h
    lea dx,[advice1]
    int 21h
    ret 
endp Advice1MD

proc Advice2MD ; draws the Advice text
    mov ah,02h
    mov bh,0h ; page number
    mov dl, 4  ; collum number
    mov dh, 5 ; row number

    int 10h

    mov ah,09h
    lea dx,[advice2]
    int 21h
    ret 
endp Advice2MD

proc DisplayHP ; draws the "HP:" text
    mov ah,02h
    mov bh,0h ; page number
    mov dl, 14 ; collum number
    mov dh, 253 ; row number

    int 10h

    mov ah,09h
    lea dx,[Display_Hp]
    int 21h
    ret
endp DisplayHP

proc Draw_Hp_Count ;draws the hp number
    ;draws digits
    mov ah,02h
    mov bh,0h ; page number
    mov dl, 19 ; collum number
    mov dh, 253 ; row number
    int 10h

    mov ah,09h
    lea dx,[Display_Hp_Count_Digits]
    int 21h
    ;draws tens
    mov ah,02h
    mov bh,0h ; page number
    mov dl, 18 ; collum number
    mov dh, 253 ; row number
    int 10h

    mov ah,09h
    lea dx,[Display_Hp_Count_Tens]
    int 21h
    ret
endp Draw_Hp_Count

proc Update_Hp
    xor ax,ax
    mov al,[Hp_Count_Dig]
    add al,30h ;converts to ascii
    mov [Display_Hp_Count_Digits],al
    xor ax,ax
    mov al,[Hp_Count_Tens]
    add al,30h
    mov [Display_Hp_Count_Tens],al
    call Draw_Hp_Count
    ret 
endp Update_Hp

proc Hp
    cmp [Hp_Count_Dig],0
    je Hp_Tens
    dec[Hp_Count_Dig]
    jmp End_Death
    Hp_Tens:
    mov [Hp_Count_Dig],9
    dec [Hp_Count_Tens]
    End_Death:
    Call Update_Hp
    ret
endp Hp

proc DeathChecker
	
	White:
		;normal scenario white color
		mov ah,0Dh
		mov bh, 0
		mov cx, [startX]
		mov dx, [startY]
		int 10h ; AL = COLOR
		cmp al, 255
		je Death3
		add cx, 7
		int 10h ; AL = COLOR
		cmp al, 255
		je Death3
		add dx, 7
		int 10h ; AL = COLOR
		cmp al, 255
		je Death3
		sub cx, 7
		int 10h ; AL = COLOR
		cmp al, 255
		je Death3
		
	
	Yellow:
		;normal scenario yellow color
		mov ah,0Dh
		mov bh, 0
		mov cx, [startX]
		mov dx, [startY]
		int 10h ; AL = COLOR
		cmp al, 251
		je Death3
		add cx, 7
		int 10h ; AL = COLOR
		cmp al, 251
		je Death3
		add dx, 7
		int 10h ; AL = COLOR
		cmp al, 251
		je Death3
		sub cx, 7
		int 10h ; AL = COLOR
		cmp al, 251
		je Death3
	
	Blue:
		
		mov ah,0Dh
		mov bh, 0
		mov cx, [endX]
		int 10h ; AL = COLOR
		cmp al, 6
		je DetectMovement
	
	Orange:
		
		mov ah,0Dh
		mov bh, 0
		mov cx, [endX]
		int 10h ; AL = COLOR
		cmp al, 31
		je DetectMovement2
	
	Black:
		;filling the soul with the right color incase of deletion
		mov ah,0Dh
		mov bh, 0
		mov cx, [startX]
		mov dx, [startY]
		int 10h ; AL = COLOR
		cmp al, 0
		je FillSul
	
	jmp skip98689q76
	
	DetectMovement:
		cmp [MovementBool], 1
		je Death3
		jmp skip98689q76
		
	DetectMovement2:
		cmp [MovementBool], 0
		je Death3
		jmp skip98689q76
	
	FillSul:
		call Soul
		jmp skip98689q76
	
	skip98689q76:
		ret
endp DeathChecker

proc Death3
	
	call Soul
	cmp [T3], 0
	jne skipHpLoss
	dec [HpCount]
	call Hp
	cmp [HpCount], 0
	je EndingScreen
	inc [DeathBool]
	cmp [DeathBool],1
	je Death4
	
	skipHpLoss:
		ret
endp Death3

proc Death4
	
	mov ax, [T3num]
	mov [T3], ax
	dec [DeathBool]
	
	ret
endp Death4

proc EndingScreen
	
	mov ax, offset img2
	mov [printAdd], 0
	call PrintBmp
	
	bruh:
		mov ah, 0    ; Set AH to read from the keyboard
		int 16h      ; Call the keyboard interrupt
			
		cmp ah, 1h
		je CallEndGame2
		jmp bruh
	
	CallEndGame2:
		call EndGame
	
endp EndingScreen

proc SixthAttack
	
	B12:
		cmp [C1], 0
		jne TimeCheck12
		mov [a1], 0
		mov [Color2], 4
		call ExplanationMark2
        call MiddleLine
		inc [C1]
		TimeCheck12:
			cmp [a1], 32
			je B1draw2
			cmp [C1], 2
			je TimeCheck32
			jmp Move_Soul
	
	sk32:
		jmp sk3
	
	B1draw2:
		cmp [C1], 1
		jne TimeCheck32
		mov [Color2], 0
		call ExplanationMark2
		call MiddleLine
		mov [ColorB], 255
		call Blocker2
		inc [C1]
		TimeCheck32:
			call Blocker2
			cmp [a1], 240
			je DelB12
			cmp [bool3], 0
			je RealMadrid
			cmp [bool3], 1
			je FcBarcelona
			cmp [bool3], 2
			je PXG
			jmp Move_Soul
			
	RealMadrid:
		mov si, 8
		call BallBoundries1
		jmp Move_Soul
		
	FcBarcelona:
		call FinalAttack
		jmp Move_Soul
	
	PXG:
		mov si, 8
		call BallBoundries1
		call FinalAttack
		jmp Move_Soul
		
	DelB12:
		mov [ColorB], 0
        call Blocker2
		call ClearFinal
		call ClearBall
		mov [C1], 0
		mov [a1], 0
		mov [count], 0
		inc [bool3]
		jmp Move_Soul
	
	sk3:
		ret
endp SixthAttack

proc FourthAttack
	
	call Advice2MD
	call Movementdetectors2Orange
	jmp Move_Soul
	
	sk2:
		ret
endp FourthAttack

proc LCG

	mov ax, 40h
    mov es, ax
    mov cx, 10
    mov bx, 0
    mov ax, [Clock] ; read timer counter
    mov ah, [byte cs:bx] ; read one byte from memory
    xor al, ah ; xor memory and counter
    and al, 100 ; leave result between 0-100
    xor ah, ah
	add[seed],ax
	
	; Generate random number using LCG
    mov ax, [seed] ; Load seed into ax register
    mov bx, [mult]
    mul bx ; Multiply seed by multiplier
    add ax, [incr] ; Add increment to the result
    and ax, 32767 ; Apply modulus by masking the 16th bit (0x7FFF)
    mov [seed], ax ; Store the new seed value

    ; Scale to the desired range (1-3)
    mov cx, 6
    mul cx
    shr ax, 14        ; Divide by 2^13 since the range is 2^16 (0-32767)
    add ax, 1           ; Shift range from 0-6 to 1-7
    mov [Random], al
	
	ret
endp LCG

proc ThirdAttackCP
	
	call Advice1MD
	call Movementdetectors2
	jmp Move_Soul
	
	sk:
		ret
endp ThirdAttackCP

proc RandomCM
	cmp [c23], 1
	je RandCMP2
	
	call LCG
	
	mov [c23], 1
	
	jmp RandCMP2
	
	Skipehts:
		ret
endp RandomCM

proc FifthAttack
	
	cmp [c23], 1
	je RandCMP2
	
    call RandomCM
	
	RandCMP2:
		cmp [Random], 1
		je Fb1call
		cmp [Random], 2
		je Fb2call
		cmp [Random], 3
		je Fb3call
		cmp [Random], 4
		je Fb4call
		cmp [Random], 5
		je Fb5call
		cmp [Random], 6
		je Fb6call
		jmp Move_Soul

    Fb1call:
        call opt1
        jmp Move_Soul

    Fb2call:
        call opt2
        jmp Move_Soul

    Fb3call:
        call opt3
        jmp Move_Soul

    Fb4call:
        call opt4
        jmp Move_Soul

    Fb5call:
        call opt5
        jmp Move_Soul

    Fb6call:
        call opt6
        jmp Move_Soul
	
	skip5th:
		ret
endp FifthAttack

proc FinalAttack
	
	mov si, 0
	cmp [Fay+si], 156
	je j2
	mov si, 0
	mov bx, 0
	call Finalmv1
	cmp [Fay+si], 95
	jge j2
	
	s23:
		jmp skip242534
	
	j2:
		mov si, 0
		cmp [Fay2+si], 156
		jge j3
		mov si, 0
		mov bx, 0
		call Finalmv2
		cmp [Fay2+si], 95
		jge j3
		jmp skip242534
		
	j3:
		mov si, 2
		mov bx, 1
		call Finalmv1
		cmp [Fay+si], 95
		jge j4
		jmp skip242534
	
	j4:
		mov si, 2
		mov bx, 1
		call Finalmv2
		cmp [Fay2+si], 158
		jge j5
		jmp skip242534
	
	j5:
		mov [Fay2+0], 70
		mov [Fay2+2], 70
		mov [Fay+0], 70
		mov [Fay+2], 70
		mov [Facolor+0], 255
		mov [Facolor+2], 255
		mov [Facolor2+0], 255
		mov [Facolor2+2], 255
		
	skip242534:
		ret
endp FinalAttack

proc ClearFinal
	mov [Facolor+0], 0
	mov [Facolor+1], 0
	mov [Facolor2+0], 0
	mov [Facolor2+1], 0
	
	mov si, 0
	mov bx, 0
	call FinalA1
	call FinalA2
	mov si, 2
	mov bx, 1
	call FinalA1
	call FinalA2
	
	mov [Fay2+0], 70
	mov [Fay2+2], 70
	mov [Fay+0], 70
	mov [Fay+2], 70
	mov [Facolor+0], 255
	mov [Facolor+2], 255
	mov [Facolor2+0], 255
	mov [Facolor2+2], 255

endp ClearFinal

proc LCG2
	
	mov ax, 40h
    mov es, ax
    mov cx, 10
    mov bx, 0
    mov ax, [Clock] ; read timer counter
    mov ah, [byte cs:bx] ; read one byte from memory
    xor al, ah ; xor memory and counter
    and al, 100 ; leave result between 0-100
    xor ah, ah
	add[seed2],ax
	
	; Generate random number using LCG
    mov ax, [seed2] ; Load seed into ax register
    mov bx, [mult2]
    mul bx ; Multiply seed by multiplier
    add ax, [incr2] ; Add increment to the result
    and ax, 32767 ; Apply modulus by masking the 16th bit (0x7FFF)
    mov [seed2], ax ; Store the new seed value

    ; Scale to the desired range (1-3)
    mov cx, 2
    mul cx
    shr ax, 15       ; Divide by 2^13 since the range is 2^16 (0-32767)
    mov [Random2], al
		
	endfunc:
		ret
endp LCG2

proc lcgCall
	cmp [a1], 10
	jne skip
	cmp [count], 1
	je RandCMP
	call LCG2
	inc [count]
	
	ret
	
	skip:
		jmp Move_Soul

endp lcgCall

proc SecondAttack
	cmp [count], 1
	je RandCMP
	call lcgCall
	RandCMP:
		cmp [Random2], 1
		je B1l
		cmp [Random2], 0
		je B2l
	
	skip2415:
		jmp skip24253
	
	B1l:
		cmp [C1], 0
		jne TimeCheck1
		mov [Color2], 4
		call ExplanationMark1
        call MiddleLine
		inc [C1]
		TimeCheck1:
			cmp [a1], 32
			je B1draw
			cmp [C1], 2
			je TimeCheck3
			jmp Move_Soul
	
	B1draw:
		cmp [C1], 1
		jne TimeCheck3
		mov [Color2], 0
		call ExplanationMark1
		call MiddleLine
		mov [ColorB], 255
		call Blocker1
		inc [C1]
		TimeCheck3:
			cmp [a1], 38
			je DelB1
			call Blocker1
			jmp Move_Soul
		
	DelB1:
		mov [ColorB], 0
        call Blocker1
		mov [C1], 0
		mov [a1], 0
		mov [count], 0
		inc [SCcount]
		jmp Move_Soul
	
	
	B2l:
		cmp [C2], 0
		jne TimeCheck2
		mov [Color2], 4
		call ExplanationMark2
        call MiddleLine
		inc [C2]
		TimeCheck2:
			cmp [a1], 32
			je B2draw
			cmp [C2], 2
			je TimeCheck4
			jmp Move_Soul
	
	B2draw:
		cmp [C2], 1
		jne TimeCheck4
		mov [Color2], 0
		call ExplanationMark2
		call MiddleLine
		mov [ColorB], 255
		call Blocker2
		inc [C2]
		TimeCheck4:
			cmp [a1], 38
			je DelB2
			call Blocker2
			jmp Move_Soul
	
	DelB2:
		mov [ColorB], 0
        call Blocker2
		mov [C2], 0
		mov [a1], 0
		mov [count], 0
		inc [SCcount]
		jmp Move_Soul
	
	skip24253:
		ret
endp SecondAttack

proc FirstAttack
	
	mov si, 0
	call BallBoundries1
	mov si, 2
	call BallBoundries1
	mov si, 4
	call BallBoundries1
	call HomingBall
	
	jmp Move_Soul
	
	ret
endp FirstAttack

proc CallAttacks
	
	Att1:
		cmp [A1bol], 1
		jge Att2
		cmp [Time], 180
		jge ClearB
		call FirstAttack
		cmp [A1bol], 1
		jnge Move_Soul
	
	ClearB:
		call ClearBall
		inc [A1bol]
	
	Att2:
		cmp [SCcount], 5
		jge Att3
		call SecondAttack
		cmp [SCcount], 5
		jnge Move_Soul
		
	Att3:
		cmp [B23], 1
		jge Att4
		call ThirdAttackCP
		cmp [B23], 1
		jnge Move_Soul
		
	Att4:
		cmp [abc], 1
		jge Att5
		call FourthAttack
		cmp [abc], 1
		jnge Move_Soul
		
	Att5:
		cmp [B2s], 3
		jge Att6
		call FifthAttack
		cmp [B2s], 3
		jnge Move_Soul
		
	Att6:
		cmp [bool3], 1
		jge Att7
		call SixthAttack
		cmp [bool3], 1
		jnge Move_Soul
		mov [count], 0
		
	Att7:
		cmp [SCcount], 8
		jge Att8
		call SecondAttack
		cmp [SCcount], 8
		jnge Move_Soul
		
	Att8:
		cmp [B23], 2
		jge Att9
		call ThirdAttackCP
		cmp [B23], 2
		jnge Move_Soul
	
	Att9:
		cmp [A1bol], 2
		jge Att10
		cmp [Time], 220
		jge ClearB2
		call FirstAttack
		cmp [A1bol], 2
		jnge Move_Soul
		
	ClearB2:
		call ClearBall
		inc [A1bol]
	
	Att10:
		cmp [bool3], 2
		jge Att11
		call SixthAttack
		cmp [bool3], 2
		jnge Move_Soul
		mov [count], 0
	
	Att11:
		cmp [B2s], 7
		jge Att12
		call ClearFinal
		call FifthAttack
		cmp [B2s], 7
		jnge Move_Soul
	
	Att12:
		cmp [SCcount], 12
		jge Att14
		call SecondAttack
		cmp [SCcount], 12
		jnge Move_Soul
	
	Att13:
		cmp [B23], 3
		jge Att14
		call ThirdAttackCP
		cmp [B23], 3
		jnge Move_Soul
	
	Att14: ;1
		cmp [B2s], 8
		jge Att15
		call FifthAttack
		cmp [B2s], 8
		jnge Move_Soul
		
	Att15:
		cmp [A1bol], 3
		jge Att16
		cmp [Time], 220
		jge ClearB3
		call FirstAttack
		cmp [A1bol], 3
		jnge Move_Soul
		
	ClearB3:
		call ClearBall
		inc [A1bol]
	
	Att16:
		cmp [B2s], 10
		jge Att17
		call ClearFinal
		call FifthAttack
		cmp [B2s], 10
		jnge Move_Soul
	
	Att17:
		cmp [SCcount], 15
		jge Att18
		call SecondAttack
		cmp [SCcount], 15
		jnge Move_Soul
	
	Att18:
		cmp [bool3], 3
		jge Att20
		call SixthAttack
		cmp [bool3], 3
		jnge Move_Soul
		
	Att20:
		mov ax, offset img5
		mov [printAdd], 0
		call PrintBmp
		bruh5:
			mov ah, 0    ; Set AH to read from the keyboard
			int 16h      ; Call the keyboard interrupt
		
			cmp ah, 1h
			je CallEndGame4
			
			jmp bruh5
		
		CallEndGame4:
			call endgame
	jmp Move_Soul
endp CallAttacks

proc Move_Soul
	
	cmp [bol], 0
	je callFirst_Tick
	
	call DeathChecker
	mov [MovementBool], 0
	call delay
	
	mov ah, 01h
	int 16h
	jz CallAttacks
	mov ah, 01h
	int 16h
	jnz MovementBoolean
	
	Main2:
	
		mov ah, 0    ; Set AH to read from the keyboard
		int 16h      ; Call the keyboard interrupt
		
		cmp ah, 1h
		je CallEndGame
		; Vertical movement
		cmp ah, 1Fh ;s
		je CallMoveDown
		cmp ah, 11h ;w
		je CallMoveUp
		
		; Horizontal movement
		cmp ah, 20h ;d
		je CallMoveRight
		cmp ah, 1eh ;a
		je CallMoveLeft
		
		; Up-left diagonal movement
		cmp ah, 10h ;q 10h
		je MoveUpLeft
		; Up-right diagonal movement
		cmp ah, 12h ;e 12h
		je MoveUpRight
		; Down-left diagonal movement
		cmp ah, 2ch ;z 2ch
		je MoveDownLeft
		; Down-right diagonal movement
		cmp ah, 2eh ;c 2eh
		je MoveDownRight
		
		; Horizontal movement
		cmp ah, 20h ;d
		je CallMoveRight
		cmp ah, 1eh ;a
		je CallMoveLeft
		jmp CallAttacks
		
	
	callFirst_Tick:
		call First_Tick
		jmp Move_Soul
	
	MovementBoolean:
		inc [MovementBool]
		jmp Main2
		
	MoveUpLeft:
		call MoveUp
		call MoveLeft
		jmp CallAttacks
		
	MoveUpRight:
		call MoveUp
		call MoveRight
		jmp CallAttacks
		
	MoveDownLeft:
		call MoveDown
		call MoveLeft
		jmp CallAttacks
		
	MoveDownRight:
		call MoveDown
		call MoveRight
		jmp CallAttacks
		
	CallMoveUp:
		call MoveUp
		jmp CallAttacks
		
	CallMoveDown:
		call MoveDown
		jmp CallAttacks
		
	CallMoveLeft:
		call MoveLeft
		jmp CallAttacks
		
	CallMoveRight:
		call MoveRight
		jmp CallAttacks
		
	CallEndGame:
		call EndGame
		
	ret
endp Move_Soul

proc First_Tick
	mov ax, offset img3
	mov [printAdd], 0
	call PrintBmp
	
	call DisplayHP
	call Draw_Hp_Count
	call Soul
	inc [bol]
endp First_Tick

proc Main
	
	call LoadingScreen
	
	call Move_Soul
	
endp Main

proc LoadingScreen
	
	cmp [bool2], 1
	jge skipLD
	
	
	mov ax, offset img
	mov [printAdd], 0
	call PrintBmp
	
	bruh2:
		mov ah, 0    ; Set AH to read from the keyboard
		int 16h      ; Call the keyboard interrupt
		
		
		cmp ah, 02h ;1
		je EasyDF
		cmp ah, 03h ;2
		je HardDF
		cmp ah, 05h ;4
		je Hardasf
		cmp ah, 06h ;4
		je Easyasf
		cmp ah, 04h ;info
		je Info
		cmp ah, 1h
		je CallEndGame3
		
		
		jmp bruh2
		
	Hardasf:
		mov [T3num], 0
		inc [bool2]
		jmp Move_Soul
	Easyasf:
		mov [Hp_Count_Dig], 9
		mov [Hp_Count_Tens], 9
		mov [HpCount], 99
		mov [T3num], 20
		inc [bool2]
		jmp Move_Soul
	HardDf:
		mov [T3num], 5
		inc [bool2]
		jmp Move_Soul
	EasyDF:
		mov [T3num], 15
		inc [bool2]
		jmp Move_Soul
		
	Info:
		mov ax, offset img4
		mov [printAdd], 0
		call PrintBmp
		info2:
			mov ah, 0    ; Set AH to read from the keyboard
			int 16h      ; Call the keyboard interrupt
			
			cmp ah, 1h
			je LoadingScreen
		
			jmp info2
		
	CallEndGame3:
		call endgame
		
	skipLD:
		ret
endp LoadingScreen

Start:
    mov ax, @data
    mov ds, ax
    
    call SwitchToGraphicsMode
	
	call Main
	
END Start
maimon.asm
Displaying maimon.asm.