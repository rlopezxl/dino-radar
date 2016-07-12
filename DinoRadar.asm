
_ButtonCheck:

;DinoRadar.mbas,13 :: 		sub procedure ButtonCheck
;DinoRadar.mbas,14 :: 		if (Button(PINB, 0, 1, 1) <> 0) then
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__ButtonCheck227
	JMP        L__ButtonCheck2
L__ButtonCheck227:
;DinoRadar.mbas,15 :: 		oldstate1 = 1
	LDS        R27, _oldstate1+0
	SBR        R27, BitMask(_oldstate1+0)
	STS        _oldstate1+0, R27
L__ButtonCheck2:
;DinoRadar.mbas,17 :: 		if (oldstate1 and Button(PINB, 0, 1, 0)) then
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	CLR        R4
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate1+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate1+0)
	INC        R17
	AND        R16, R17
	BRNE       L__ButtonCheck228
	JMP        L__ButtonCheck5
L__ButtonCheck228:
;DinoRadar.mbas,18 :: 		inc(selection)
	LDS        R16, _selection+0
	SUBI       R16, 255
	STS        _selection+0, R16
;DinoRadar.mbas,19 :: 		random = 0
	LDS        R27, _random+0
	CBR        R27, BitMask(_random+0)
	STS        _random+0, R27
;DinoRadar.mbas,20 :: 		oldstate1 = 0
	LDS        R27, _oldstate1+0
	CBR        R27, BitMask(_oldstate1+0)
	STS        _oldstate1+0, R27
;DinoRadar.mbas,21 :: 		allon = 0
	LDS        R27, _allon+0
	CBR        R27, BitMask(_allon+0)
	STS        _allon+0, R27
L__ButtonCheck5:
;DinoRadar.mbas,24 :: 		if (Button(PINB, 1, 1, 1) <> 0) then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__ButtonCheck229
	JMP        L__ButtonCheck8
L__ButtonCheck229:
;DinoRadar.mbas,25 :: 		oldstate2 = 1
	LDS        R27, _oldstate2+0
	SBR        R27, BitMask(_oldstate2+0)
	STS        _oldstate2+0, R27
L__ButtonCheck8:
;DinoRadar.mbas,27 :: 		if (oldstate2 and Button(PINB, 1, 1, 0)) then
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate2+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate2+0)
	INC        R17
	AND        R16, R17
	BRNE       L__ButtonCheck230
	JMP        L__ButtonCheck11
L__ButtonCheck230:
;DinoRadar.mbas,28 :: 		allon = not allon
	LDS        R0, _allon+0
	LDI        R27, BitMask(_allon+0)
	EOR        R0, R27
	STS        _allon+0, R0
;DinoRadar.mbas,29 :: 		oldstate2 = 0
	LDS        R27, _oldstate2+0
	CBR        R27, BitMask(_oldstate2+0)
	STS        _oldstate2+0, R27
L__ButtonCheck11:
;DinoRadar.mbas,32 :: 		if (Button(PINB, 2, 1, 1) <> 0) then
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	CPI        R16, 0
	BRNE       L__ButtonCheck233
	JMP        L__ButtonCheck14
L__ButtonCheck233:
;DinoRadar.mbas,33 :: 		oldstate3 = 1
	LDS        R27, _oldstate3+0
	SBR        R27, BitMask(_oldstate3+0)
	STS        _oldstate3+0, R27
L__ButtonCheck14:
;DinoRadar.mbas,35 :: 		if (oldstate3 and Button(PINB, 2, 1, 0)) then
	CLR        R6
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PINB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PINB+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__ButtonCheck234
	JMP        L__ButtonCheck17
L__ButtonCheck234:
;DinoRadar.mbas,36 :: 		random = not random
	LDS        R0, _random+0
	LDI        R27, BitMask(_random+0)
	EOR        R0, R27
	STS        _random+0, R0
;DinoRadar.mbas,37 :: 		inc(selection)
	LDS        R16, _selection+0
	SUBI       R16, 255
	STS        _selection+0, R16
;DinoRadar.mbas,38 :: 		oldstate3 = 0
	LDS        R27, _oldstate3+0
	CBR        R27, BitMask(_oldstate3+0)
	STS        _oldstate3+0, R27
;DinoRadar.mbas,39 :: 		allon = 0
	LDS        R27, _allon+0
	CBR        R27, BitMask(_allon+0)
	STS        _allon+0, R27
L__ButtonCheck17:
;DinoRadar.mbas,41 :: 		end sub
L_end_ButtonCheck:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _ButtonCheck

_Button_Interrupt:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;DinoRadar.mbas,43 :: 		sub procedure Button_Interrupt() iv IVT_ADDR_PCINT1
;DinoRadar.mbas,44 :: 		ButtonCheck
	CALL       _ButtonCheck+0
;DinoRadar.mbas,45 :: 		end sub
L_end_Button_Interrupt:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Button_Interrupt

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;DinoRadar.mbas,47 :: 		main:
;DinoRadar.mbas,48 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;DinoRadar.mbas,49 :: 		PCIE1_bit = 1
	IN         R27, PCIE1_bit+0
	SBR        R27, BitMask(PCIE1_bit+0)
	OUT        PCIE1_bit+0, R27
;DinoRadar.mbas,50 :: 		PCINT8_bit = 1
	IN         R27, PCINT8_bit+0
	SBR        R27, BitMask(PCINT8_bit+0)
	OUT        PCINT8_bit+0, R27
;DinoRadar.mbas,51 :: 		PCINT9_bit = 1
	IN         R27, PCINT9_bit+0
	SBR        R27, BitMask(PCINT9_bit+0)
	OUT        PCINT9_bit+0, R27
;DinoRadar.mbas,52 :: 		PCINT10_bit = 1
	IN         R27, PCINT10_bit+0
	SBR        R27, BitMask(PCINT10_bit+0)
	OUT        PCINT10_bit+0, R27
;DinoRadar.mbas,54 :: 		DDB0_bit = 0
	IN         R27, DDB0_bit+0
	CBR        R27, BitMask(DDB0_bit+0)
	OUT        DDB0_bit+0, R27
;DinoRadar.mbas,55 :: 		DDB1_bit = 0
	IN         R27, DDB1_bit+0
	CBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
;DinoRadar.mbas,56 :: 		DDB2_bit = 0
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
;DinoRadar.mbas,57 :: 		DDRA = 0xFF
	LDI        R27, 255
	OUT        DDRA+0, R27
;DinoRadar.mbas,59 :: 		selection = 0
	LDI        R27, 0
	STS        _selection+0, R27
;DinoRadar.mbas,60 :: 		allon = 0
	LDS        R27, _allon+0
	CBR        R27, BitMask(_allon+0)
	STS        _allon+0, R27
;DinoRadar.mbas,61 :: 		maxsel = 9
	LDI        R27, 9
	STS        _maxsel+0, R27
;DinoRadar.mbas,63 :: 		oldstate1 = 0
	LDS        R27, _oldstate1+0
	CBR        R27, BitMask(_oldstate1+0)
	STS        _oldstate1+0, R27
;DinoRadar.mbas,64 :: 		oldstate2 = 0
	LDS        R27, _oldstate2+0
	CBR        R27, BitMask(_oldstate2+0)
	STS        _oldstate2+0, R27
;DinoRadar.mbas,65 :: 		oldstate3 = 0
	LDS        R27, _oldstate3+0
	CBR        R27, BitMask(_oldstate3+0)
	STS        _oldstate3+0, R27
;DinoRadar.mbas,67 :: 		while (true)
L__main22:
;DinoRadar.mbas,68 :: 		ButtonCheck
	CALL       _ButtonCheck+0
;DinoRadar.mbas,70 :: 		if (selection > maxsel) then
	LDS        R17, _selection+0
	LDS        R16, _maxsel+0
	CP         R16, R17
	BRLO       L__main239
	JMP        L__main27
L__main239:
;DinoRadar.mbas,71 :: 		selection = 0
	LDI        R27, 0
	STS        _selection+0, R27
L__main27:
;DinoRadar.mbas,74 :: 		if (allon = 1) then
	LDS        R27, _allon+0
	SBRS       R27, BitPos(_allon+0)
	JMP        L__main30
;DinoRadar.mbas,75 :: 		for led = 0 to 7
	LDI        R27, 0
	STS        _led+0, R27
L__main33:
;DinoRadar.mbas,76 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main241
L__main240:
	LSL        R17
	DEC        R27
	BRNE       L__main240
L__main241:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,77 :: 		delay_ms(2)
	LDI        R17, 3
	LDI        R16, 152
L__main39:
	DEC        R16
	BRNE       L__main39
	DEC        R17
	BRNE       L__main39
	NOP
;DinoRadar.mbas,78 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main243
L__main242:
	LSL        R16
	DEC        R27
	BRNE       L__main242
L__main243:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,79 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main244
	JMP        L__main36
L__main244:
	LDS        R16, _led+0
	SUBI       R16, 255
	STS        _led+0, R16
	JMP        L__main33
L__main36:
;DinoRadar.mbas,80 :: 		continue
	JMP        L__main22
L__main30:
;DinoRadar.mbas,83 :: 		inc(counter)
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 255
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,85 :: 		case 0
	LDS        R16, _selection+0
	CPI        R16, 0
	BREQ       L__main245
	JMP        L__main46
L__main245:
;DinoRadar.mbas,86 :: 		for led = 0 to 7
	LDI        R27, 0
	STS        _led+0, R27
L__main48:
;DinoRadar.mbas,87 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main247
L__main246:
	LSL        R17
	DEC        R27
	BRNE       L__main246
L__main247:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,88 :: 		delay_ms(75)
	LDI        R17, 98
	LDI        R16, 102
L__main54:
	DEC        R16
	BRNE       L__main54
	DEC        R17
	BRNE       L__main54
	NOP
;DinoRadar.mbas,89 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main249
L__main248:
	LSL        R16
	DEC        R27
	BRNE       L__main248
L__main249:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,90 :: 		counter = counter + 3
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 253
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,91 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main250
	JMP        L__main51
L__main250:
	LDS        R16, _led+0
	SUBI       R16, 255
	STS        _led+0, R16
	JMP        L__main48
L__main51:
	JMP        L__main43
L__main46:
;DinoRadar.mbas,92 :: 		case 1
	LDS        R16, _selection+0
	CPI        R16, 1
	BREQ       L__main251
	JMP        L__main60
L__main251:
;DinoRadar.mbas,93 :: 		for led = 7 to 0 step -1
	LDI        R27, 7
	STS        _led+0, R27
L__main62:
;DinoRadar.mbas,94 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main253
L__main252:
	LSL        R17
	DEC        R27
	BRNE       L__main252
L__main253:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,95 :: 		delay_ms(75)
	LDI        R17, 98
	LDI        R16, 102
L__main68:
	DEC        R16
	BRNE       L__main68
	DEC        R17
	BRNE       L__main68
	NOP
;DinoRadar.mbas,96 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main255
L__main254:
	LSL        R16
	DEC        R27
	BRNE       L__main254
L__main255:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,97 :: 		counter = counter + 3
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 253
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,98 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 0
	BRNE       L__main256
	JMP        L__main65
L__main256:
	LDS        R16, _led+0
	SUBI       R16, 1
	STS        _led+0, R16
	JMP        L__main62
L__main65:
	JMP        L__main43
L__main60:
;DinoRadar.mbas,99 :: 		case 2
	LDS        R16, _selection+0
	CPI        R16, 2
	BREQ       L__main257
	JMP        L__main74
L__main257:
;DinoRadar.mbas,100 :: 		for led = 0 to 7 step 2
	LDI        R27, 0
	STS        _led+0, R27
L__main75:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main258
	JMP        L__main79
L__main258:
;DinoRadar.mbas,101 :: 		PORTA.(led) = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main260
L__main259:
	LSL        R17
	DEC        R27
	BRNE       L__main259
L__main260:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,102 :: 		delay_ms(100)
	LDI        R17, 130
	LDI        R16, 222
L__main82:
	DEC        R16
	BRNE       L__main82
	DEC        R17
	BRNE       L__main82
	NOP
;DinoRadar.mbas,103 :: 		PORTA.(led) = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main262
L__main261:
	LSL        R16
	DEC        R27
	BRNE       L__main261
L__main262:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,104 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main263
	JMP        L__main79
L__main263:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main75
L__main79:
;DinoRadar.mbas,105 :: 		counter = counter + 20
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 236
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,106 :: 		for led = 1 to 7 step 2
	LDI        R27, 1
	STS        _led+0, R27
L__main86:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main264
	JMP        L__main90
L__main264:
;DinoRadar.mbas,107 :: 		PORTA.(led) = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main266
L__main265:
	LSL        R17
	DEC        R27
	BRNE       L__main265
L__main266:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,108 :: 		delay_ms(100)
	LDI        R17, 130
	LDI        R16, 222
L__main93:
	DEC        R16
	BRNE       L__main93
	DEC        R17
	BRNE       L__main93
	NOP
;DinoRadar.mbas,109 :: 		PORTA.(led) = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main268
L__main267:
	LSL        R16
	DEC        R27
	BRNE       L__main267
L__main268:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,110 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main269
	JMP        L__main90
L__main269:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main86
L__main90:
	JMP        L__main43
L__main74:
;DinoRadar.mbas,111 :: 		case 3
	LDS        R16, _selection+0
	CPI        R16, 3
	BREQ       L__main270
	JMP        L__main99
L__main270:
;DinoRadar.mbas,112 :: 		for led = 0 to 7 step 2
	LDI        R27, 0
	STS        _led+0, R27
L__main100:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main271
	JMP        L__main104
L__main271:
;DinoRadar.mbas,113 :: 		PORTA.(7-led) = 1
	LDS        R0, _led+0
	LDI        R16, 7
	SUB        R16, R0
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__main273
L__main272:
	LSL        R17
	DEC        R27
	BRNE       L__main272
L__main273:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,114 :: 		delay_ms(100)
	LDI        R17, 130
	LDI        R16, 222
L__main107:
	DEC        R16
	BRNE       L__main107
	DEC        R17
	BRNE       L__main107
	NOP
;DinoRadar.mbas,115 :: 		PORTA.(7-led) = 0
	LDS        R0, _led+0
	LDI        R16, 7
	SUB        R16, R0
	MOV        R27, R16
	LDI        R16, 1
	TST        R27
	BREQ       L__main275
L__main274:
	LSL        R16
	DEC        R27
	BRNE       L__main274
L__main275:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,116 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main276
	JMP        L__main104
L__main276:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main100
L__main104:
;DinoRadar.mbas,117 :: 		counter = counter + 20
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 236
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,118 :: 		for led = 1 to 7 step 2
	LDI        R27, 1
	STS        _led+0, R27
L__main111:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main277
	JMP        L__main115
L__main277:
;DinoRadar.mbas,119 :: 		PORTA.(7-led) = 1
	LDS        R0, _led+0
	LDI        R16, 7
	SUB        R16, R0
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__main279
L__main278:
	LSL        R17
	DEC        R27
	BRNE       L__main278
L__main279:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,120 :: 		delay_ms(100)
	LDI        R17, 130
	LDI        R16, 222
L__main118:
	DEC        R16
	BRNE       L__main118
	DEC        R17
	BRNE       L__main118
	NOP
;DinoRadar.mbas,121 :: 		PORTA.(7-led) = 0
	LDS        R0, _led+0
	LDI        R16, 7
	SUB        R16, R0
	MOV        R27, R16
	LDI        R16, 1
	TST        R27
	BREQ       L__main281
L__main280:
	LSL        R16
	DEC        R27
	BRNE       L__main280
L__main281:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,122 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main282
	JMP        L__main115
L__main282:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main111
L__main115:
	JMP        L__main43
L__main99:
;DinoRadar.mbas,123 :: 		case 4, 6
	LDS        R16, _selection+0
	CPI        R16, 4
	BREQ       L__main283
	JMP        L__main124
L__main283:
	JMP        L__main122
L__main124:
	LDS        R16, _selection+0
	CPI        R16, 6
	BREQ       L__main284
	JMP        L__main125
L__main284:
L__main122:
;DinoRadar.mbas,124 :: 		for led = 0 to 7
	LDI        R27, 0
	STS        _led+0, R27
L__main127:
;DinoRadar.mbas,125 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main286
L__main285:
	LSL        R17
	DEC        R27
	BRNE       L__main285
L__main286:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,127 :: 		case 6
	LDS        R16, _led+0
	CPI        R16, 6
	BREQ       L__main287
	JMP        L__main136
L__main287:
;DinoRadar.mbas,128 :: 		PORTA.0 = 1
	IN         R27, PORTA+0
	SBR        R27, 1
	OUT        PORTA+0, R27
	JMP        L__main133
L__main136:
;DinoRadar.mbas,129 :: 		case 7
	LDS        R16, _led+0
	CPI        R16, 7
	BREQ       L__main288
	JMP        L__main139
L__main288:
;DinoRadar.mbas,130 :: 		PORTA.1 =1
	IN         R27, PORTA+0
	SBR        R27, 2
	OUT        PORTA+0, R27
	JMP        L__main133
L__main139:
;DinoRadar.mbas,132 :: 		PORTA.(led+2) = 1
	LDS        R16, _led+0
	SUBI       R16, 254
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__main290
L__main289:
	LSL        R17
	DEC        R27
	BRNE       L__main289
L__main290:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
L__main133:
;DinoRadar.mbas,134 :: 		delay_ms(150)
	LDI        R17, 195
	LDI        R16, 205
L__main142:
	DEC        R16
	BRNE       L__main142
	DEC        R17
	BRNE       L__main142
	NOP
	NOP
;DinoRadar.mbas,135 :: 		PORTA = 0
	LDI        R27, 0
	OUT        PORTA+0, R27
;DinoRadar.mbas,136 :: 		counter = counter + 3
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 253
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,137 :: 		if (selection > 5) then
	LDS        R17, _selection+0
	LDI        R16, 5
	CP         R16, R17
	BRLO       L__main291
	JMP        L__main145
L__main291:
;DinoRadar.mbas,138 :: 		delay_ms(150)
	LDI        R17, 195
	LDI        R16, 205
L__main147:
	DEC        R16
	BRNE       L__main147
	DEC        R17
	BRNE       L__main147
	NOP
	NOP
;DinoRadar.mbas,139 :: 		counter = counter + 2
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 254
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
L__main145:
;DinoRadar.mbas,141 :: 		if (selection <> 4) and (selection <> 6) then
	LDS        R16, _selection+0
	CPI        R16, 4
	LDI        R17, 0
	BREQ       L__main292
	LDI        R17, 255
L__main292:
	CPI        R16, 6
	LDI        R27, 0
	BREQ       L__main293
	LDI        R27, 255
L__main293:
	MOV        R16, R27
	AND        R16, R17
	BRNE       L__main294
	JMP        L__main150
L__main294:
;DinoRadar.mbas,142 :: 		break
	JMP        L__main130
L__main150:
;DinoRadar.mbas,144 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main295
	JMP        L__main130
L__main295:
	LDS        R16, _led+0
	SUBI       R16, 255
	STS        _led+0, R16
	JMP        L__main127
L__main130:
	JMP        L__main43
L__main125:
;DinoRadar.mbas,145 :: 		case 5, 7
	LDS        R16, _selection+0
	CPI        R16, 5
	BREQ       L__main296
	JMP        L__main154
L__main296:
	JMP        L__main152
L__main154:
	LDS        R16, _selection+0
	CPI        R16, 7
	BREQ       L__main297
	JMP        L__main155
L__main297:
L__main152:
;DinoRadar.mbas,146 :: 		for led = 7 to 0 step -1
	LDI        R27, 7
	STS        _led+0, R27
L__main157:
;DinoRadar.mbas,147 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main299
L__main298:
	LSL        R17
	DEC        R27
	BRNE       L__main298
L__main299:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,149 :: 		case 1
	LDS        R16, _led+0
	CPI        R16, 1
	BREQ       L__main300
	JMP        L__main166
L__main300:
;DinoRadar.mbas,150 :: 		PORTA.7 = 1
	IN         R27, PORTA+0
	SBR        R27, 128
	OUT        PORTA+0, R27
	JMP        L__main163
L__main166:
;DinoRadar.mbas,151 :: 		case 0
	LDS        R16, _led+0
	CPI        R16, 0
	BREQ       L__main301
	JMP        L__main169
L__main301:
;DinoRadar.mbas,152 :: 		PORTA.6 = 1
	IN         R27, PORTA+0
	SBR        R27, 64
	OUT        PORTA+0, R27
	JMP        L__main163
L__main169:
;DinoRadar.mbas,154 :: 		PORTA.(led-2) = 1
	LDS        R16, _led+0
	SUBI       R16, 2
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__main303
L__main302:
	LSL        R17
	DEC        R27
	BRNE       L__main302
L__main303:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
L__main163:
;DinoRadar.mbas,156 :: 		delay_ms(150)
	LDI        R17, 195
	LDI        R16, 205
L__main172:
	DEC        R16
	BRNE       L__main172
	DEC        R17
	BRNE       L__main172
	NOP
	NOP
;DinoRadar.mbas,157 :: 		PORTA = 0
	LDI        R27, 0
	OUT        PORTA+0, R27
;DinoRadar.mbas,158 :: 		counter = counter + 3
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 253
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,159 :: 		if (selection > 6) then
	LDS        R17, _selection+0
	LDI        R16, 6
	CP         R16, R17
	BRLO       L__main304
	JMP        L__main175
L__main304:
;DinoRadar.mbas,160 :: 		delay_ms(150)
	LDI        R17, 195
	LDI        R16, 205
L__main177:
	DEC        R16
	BRNE       L__main177
	DEC        R17
	BRNE       L__main177
	NOP
	NOP
;DinoRadar.mbas,161 :: 		counter = counter + 2
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 254
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
L__main175:
;DinoRadar.mbas,163 :: 		if (selection <> 5) and (selection <> 7) then
	LDS        R16, _selection+0
	CPI        R16, 5
	LDI        R17, 0
	BREQ       L__main305
	LDI        R17, 255
L__main305:
	CPI        R16, 7
	LDI        R27, 0
	BREQ       L__main306
	LDI        R27, 255
L__main306:
	MOV        R16, R27
	AND        R16, R17
	BRNE       L__main307
	JMP        L__main180
L__main307:
;DinoRadar.mbas,164 :: 		break
	JMP        L__main160
L__main180:
;DinoRadar.mbas,166 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 0
	BRNE       L__main308
	JMP        L__main160
L__main308:
	LDS        R16, _led+0
	SUBI       R16, 1
	STS        _led+0, R16
	JMP        L__main157
L__main160:
	JMP        L__main43
L__main155:
;DinoRadar.mbas,167 :: 		case 8
	LDS        R16, _selection+0
	CPI        R16, 8
	BREQ       L__main309
	JMP        L__main184
L__main309:
;DinoRadar.mbas,168 :: 		for led = 0 to 7 step 2
	LDI        R27, 0
	STS        _led+0, R27
L__main185:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main310
	JMP        L__main189
L__main310:
;DinoRadar.mbas,169 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main312
L__main311:
	LSL        R17
	DEC        R27
	BRNE       L__main311
L__main312:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,170 :: 		delay_ms(2)
	LDI        R17, 3
	LDI        R16, 152
L__main192:
	DEC        R16
	BRNE       L__main192
	DEC        R17
	BRNE       L__main192
	NOP
;DinoRadar.mbas,171 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main314
L__main313:
	LSL        R16
	DEC        R27
	BRNE       L__main313
L__main314:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,172 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main315
	JMP        L__main189
L__main315:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main185
L__main189:
;DinoRadar.mbas,173 :: 		counter = counter + 5
	LDS        R16, _counter+0
	LDS        R17, _counter+1
	LDS        R18, _counter+2
	LDS        R19, _counter+3
	SUBI       R16, 251
	SBCI       R17, 255
	SBCI       R18, 255
	SBCI       R19, 255
	STS        _counter+0, R16
	STS        _counter+1, R17
	STS        _counter+2, R18
	STS        _counter+3, R19
;DinoRadar.mbas,174 :: 		delay_ms(50)
	LDI        R17, 65
	LDI        R16, 239
L__main196:
	DEC        R16
	BRNE       L__main196
	DEC        R17
	BRNE       L__main196
;DinoRadar.mbas,175 :: 		for led = 1 to 7 step 2
	LDI        R27, 1
	STS        _led+0, R27
L__main198:
	LDS        R17, _led+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__main316
	JMP        L__main202
L__main316:
;DinoRadar.mbas,176 :: 		PORTA.led = 1
	LDS        R27, _led+0
	LDI        R17, 1
	TST        R27
	BREQ       L__main318
L__main317:
	LSL        R17
	DEC        R27
	BRNE       L__main317
L__main318:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,177 :: 		delay_ms(2)
	LDI        R17, 3
	LDI        R16, 152
L__main205:
	DEC        R16
	BRNE       L__main205
	DEC        R17
	BRNE       L__main205
	NOP
;DinoRadar.mbas,178 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main320
L__main319:
	LSL        R16
	DEC        R27
	BRNE       L__main319
L__main320:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,179 :: 		next led
	LDS        R16, _led+0
	CPI        R16, 7
	BRNE       L__main321
	JMP        L__main202
L__main321:
	LDS        R16, _led+0
	SUBI       R16, 254
	STS        _led+0, R16
	JMP        L__main198
L__main202:
;DinoRadar.mbas,180 :: 		delay_ms(50)
	LDI        R17, 65
	LDI        R16, 239
L__main209:
	DEC        R16
	BRNE       L__main209
	DEC        R17
	BRNE       L__main209
	JMP        L__main43
L__main184:
;DinoRadar.mbas,181 :: 		case 9
	LDS        R16, _selection+0
	CPI        R16, 9
	BREQ       L__main322
	JMP        L__main213
L__main322:
;DinoRadar.mbas,182 :: 		led = rand() mod 8
	CALL       _rand+0
	LDI        R20, 8
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _led+0, R16
;DinoRadar.mbas,183 :: 		PORTA.led = 1
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__main324
L__main323:
	LSL        R17
	DEC        R27
	BRNE       L__main323
L__main324:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;DinoRadar.mbas,184 :: 		delay_ms(50)
	LDI        R17, 65
	LDI        R16, 239
L__main216:
	DEC        R16
	BRNE       L__main216
	DEC        R17
	BRNE       L__main216
;DinoRadar.mbas,185 :: 		PORTA.led = 0
	LDS        R27, _led+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main326
L__main325:
	LSL        R16
	DEC        R27
	BRNE       L__main325
L__main326:
	MOV        R17, R16
	COM        R17
	IN         R16, PORTA+0
	AND        R16, R17
	OUT        PORTA+0, R16
	JMP        L__main43
L__main213:
L__main43:
;DinoRadar.mbas,188 :: 		if (counter > 250) then
	LDS        R20, _counter+0
	LDS        R21, _counter+1
	LDS        R22, _counter+2
	LDS        R23, _counter+3
	LDI        R16, 250
	LDI        R17, 0
	LDI        R18, 0
	LDI        R19, 0
	CP         R16, R20
	CPC        R17, R21
	CPC        R18, R22
	CPC        R19, R23
	BRLO       L__main327
	JMP        L__main221
L__main327:
;DinoRadar.mbas,189 :: 		counter = 0
	LDI        R27, 0
	STS        _counter+0, R27
	STS        _counter+1, R27
	STS        _counter+2, R27
	STS        _counter+3, R27
;DinoRadar.mbas,190 :: 		if (random = 1) then
	LDS        R27, _random+0
	SBRS       R27, BitPos(_random+0)
	JMP        L__main224
;DinoRadar.mbas,191 :: 		inc(selection)
	LDS        R16, _selection+0
	SUBI       R16, 255
	STS        _selection+0, R16
L__main224:
;DinoRadar.mbas,192 :: 		end if
L__main221:
;DinoRadar.mbas,194 :: 		wend
	JMP        L__main22
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
