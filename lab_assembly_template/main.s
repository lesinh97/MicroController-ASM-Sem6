;********************************************************************************************************
; file:     main.c
; author:   xxxx, your-email@maine.edu
; date:     mmm-dd-2015
; version:  1.0
; compiler: MDK 5.12
; note:     Warning: L6314W: No section matches pattern *(InRoot$$Sections).
;           It is because this program does not execute the compiler's basic run-time support library. 
; hardware: Discovery kit with STM32L152RCT6 MCU
; description: xxxx
;********************************************************************************************************

;********************************************************************************************************
; STM32L1 Discovery Kit Pin Connections (STM32L152RBT6 or STM32L152RCT6)
;  USER Pushbutton  <------>  PA.0 (clock: RCC_AHBENR_GPIOAEN)
;  RESET Pushbutton <------>  RESET
;  Green LED (LD3)  <------>  PB.7 (clock: RCC_AHBENR_GPIOBEN)
;  Blue LED (LD4)   <------>  PB.6 (clock: RCC_AHBENR_GPIOBEN)
;  Touch Sensors    <------>  6 pins, PA.6,7 (group 2), PB.0,1 (group 3), PC.4,5 (group 9)
;  LCD (24 segments)<------>  28 pins, PA.1,2,3,8,9,10,15, 
;                                      PB.3,4,5,8,9,10,11,12,13,14,15
;                                      PC.0,1,2,3,6,7,8,9,10,11 
;  ST Link          <------>  PA.13,14
;  Boot 1           <------>  PB.2
;  Freely available pins: PA.5, PA.11, PA.12, PC.12, PD.2 
;  A GPIO pin is 5V tolerant and can sink or source up to 8 mA
;********************************************************************************************************


		INCLUDE stm32l1xx_constants.s       ; Load Constant Definitions
		INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

;********************************************************************************************************
;                                      CODE AREA
;********************************************************************************************************
		AREA main, CODE, READONLY
		EXPORT __main                       ; make __main visible to linker
		ENTRY


;********************************************************************************************************
;                                      MAIN FUNCTION
; Description  : xxxxxx
; C prototype  : void main (void)
; Note         : Has a dead loop and never exit
; Argument(s)  : none
; Return value : none
;********************************************************************************************************
__main	PROC
		LDR r0,=chuoi		;r0=&x[0]
		MOV r3,#0
		MOV r4,#0
loop0	LDRB r2,[r0]		;r2=ki tu tro boi r0
		CBNZ r2, notZero0	;neu ki tu r2<>null thi re nhanh den notZero 
		B xoa				;nguoc lai thi ket thuc lap
notZero0 ADD r3,r3,#1
		ADD r0,r0,#1
		B loop0
		
		BL xoa
		
stop	B    stop       ;loop forever

		ENDP
			
xoa		PROC
		
		sub r0,r0,r3
loop	LDRB r2,[r0]		;r2=ki tu tro boi r0
		CBNZ r2, notZero	;neu ki tu r2<>null thi re nhanh den notZero 
		B stop				;nguoc lai thi ket thuc lap
notZero	CMP r2,#97	;so sanh r2 voi ki tu a
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		CMP r2,#65			;so sanh r2 voi ki tu A
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu A
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#101			;so sanh r2 voi ki tu e
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu e
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#69			;so sanh r2 voi ki tu E
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu E
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#105			;so sanh r2 voi ki tu i
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu i
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#73			;so sanh r2 voi ki tu I
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu I
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#111			;so sanh r2 voi ki tu o
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu o
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#79			;so sanh r2 voi ki tu O
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu O
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#117			;so sanh r2 voi ki tu u
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu u
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		CMP r2,#85			;so sanh r2 voi ki tu U
		LDREQ r1,[r0,#1];xoa ki tu do neu r2 la ki tu a
		STREQ r1,[r0]		;luu ki tu mem tro boi r0
		BEQ loop
		;MOVEQ r2,#0			;xoa ki tu do neu r2 la ki tu U
		;STRB r2,[r0]		;luu ki tu mem tro boi r0
		ADD r0,r0,#1		;r0 tro den ki tu tiep theo
			
		
		B loop				;tiep tuc lap
		
		BX lr
		
		ENDP
		ALIGN

;********************************************************************************************************
;                                      DATA AREA
;********************************************************************************************************
		AREA myData, DATA, READWRITE
		ALIGN
chuoi 	DCB " Aa2I3oEe"
output  DCB 0

;********************************************************************************************************
;                                      ASSEMBLY FILE END
;********************************************************************************************************
		END
abcdefghiklmnou