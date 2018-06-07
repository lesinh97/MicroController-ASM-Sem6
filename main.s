;******************** (C) Yifeng ZHU ********************
; @file    main.s
; @author  Yifeng Zhu
; @version V1.0.0
; @date    May-5-2012
; @note    
; @brief   Assembly code for STM32L1xx Discovery Kit
; @note
;          This code is for the book "Embedded Systems with ARM Cortex-M3 
;          Microcontrollers in Assembly Language and C, Yifeng Zhu, 
;          ISBN-10: 0982692625.
; @attension
;          This code is provided for education purpose. The author shall not be 
;          held liable for any direct, indirect or consequential damages, for any 
;          reason whatever. More information can be found from book website: 
;          http://www.eece.maine.edu/~zhu/book
;********************************************************

				
; STM32L1xx Discovery Kit:
;    - USER Pushbutton: connected to PA0 (GPIO Port A, PIN 0), CLK RCC_AHBENR_GPIOAEN
;    - RESET Pushbutton: connected RESET
;    - GREEN LED: connected to PB7 (GPIO Port B, PIN 7), CLK RCC_AHBENR_GPIOBEN 
;    - BLUE LED: connected to PB6 (GPIO Port B, PIN 6), CLK RCC_AHBENR_GPIOBEN
;    - Linear touch sensor/touchkeys: PA6, PA7 (group 2),  PC4, PC5 (group 9),  PB0, PB1 (group 3)

				INCLUDE gg.s		; Load Constant Definitions
				

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
	
				;Cap xung nhiet co pin GPIO cua cong A
				LDR r7, =RCC; Nap vao thanh ghi r7 dia chi co so cua Reset and Clock Control
				LDR	r1,[r7,#CAPXUNGNHIP]; Nap 4 bytes du lieu cua thanh ghi cap xung nhiet chua trong thanh ghi r7 vao thanh ghi r1
				ORR r1,r1,#0x00000001; Set bit thu 0 bang 1
				STR r1,[r7,#CAPXUNGNHIP]; Luu gia tri moi cua thanh ghi cap xung nhiet vao bo nho tai dia chi chua trong thanh ghi r7
				
				;Cap xung nhiet co pin GPIO cua cong B
				LDR r7, =RCC; Nap vao thanh ghi r7 dia chi co so cua Reset and Clock Control
				LDR	r1,[r7,#CAPXUNGNHIP]; Nap 4 bytes du lieu cua thanh ghi cap xung nhip chua trong thanh ghi r7 vao thanh ghi r1
				ORR r1,r1,#0x00000002; Set bit thu 1 bang 1
				STR r1,[r7,#CAPXUNGNHIP]; Luu gia tri moi vao thanh ghi cap xung nhip vao bo nho tai dia chi chua trong thanh ghi r7
				
;------------------------------------------------------------------------------

				;Cau hinh chan 6 cua cong B hoat dong o che do digital output
				LDR r7,=GPIOB; Nap dia chi co so cua cong B vao thanh ghi r7
				LDR r1,[r7,#DC_CHEDO]; Nap 4 bytes cua thanh ghi Mode cua cong B vao r1
				BIC r1,r1,#(0x03<<12); Xoa bit thu 12 13
				ORR r1,r1,#(0x1<<12); Set bit thu 12 va 13 bang 0, 1
				STR r1,[r7,#DC_CHEDO]; Luu gia tri moi vao thanh ghi Mode cua cong B
				
				;Cau hinh chan 7 cua cong B hoat dong o che do digital output
				LDR r1,[r7,#DC_CHEDO]; Nap 4 bytes cua thanh ghi Mode cua cong B vao r1
				BIC r1,r1,#(0x03<<14); Xoa bit thu 14 15
				ORR r1,r1,#(0x1<<14); Set bit thu 14 va 15 bang 0, 1
				STR r1,[r7,#DC_CHEDO]; Luu gia tri moi vao thanh ghi Mode cua cong B
				
				;Thiet lap che do push-pull mode cho chan 6 cua cong B
				LDR r1,[r7,#LOAI_OUTPUT]; Nap 4 bytes cua thanh ghi Output type cua cong B vao r1
				BIC r1,r1,#(1<<6); Xoa bit thu 6
				STR r1,[r7,#LOAI_OUTPUT]; Luu gia tri moi vao thanh ghi Output type cua cong B
				
				;Thiet lap che do push-pull mode cho chan 7 cua cong B
				LDR r1,[r7,#LOAI_OUTPUT]; Nap 4 bytes cua thanh ghi Output type cua cong B vao r1
				BIC r1,r1,#(1<<7); Xoa bit thu 7
				STR r1,[r7,#LOAI_OUTPUT]; Luu gia tri moi vao thanh ghi Output type cua cong B
				
				;Thiet lap gia tri output speed cho chan 6 cua cong B la 2MHz
				;00 = 400KHZ, 01 = 2MHz, 10 = 10MHz, 11 = 40MHz
				LDR r1,[r7,#TOCDO_OUTPUT]; Nap 4 bytes cua thanh ghi Ouput speed cua cong B vao r1
				BIC r1,r1,#(0x03<<12); Xoa bit thu 12 13
				ORR r1,r1,#(0x01<<12); Set bit thu 12 va 13 bang 0, 1 
				STR r1,[r7,#TOCDO_OUTPUT]; Luu gia tri moi vao thanh ghi Output speed cua cong B
				
				;Thiet lap gia tri output speed cho chan 7 cua cong B la 2MHz
				;00 = 400KHZ, 01 = 2MHz, 10 = 10MHz, 11 = 40MHz
				LDR r1,[r7,#TOCDO_OUTPUT]; Nap 4 bytes cua thanh ghi Ouput speed cua cong B vao r1
				BIC r1,r1,#(0x03<<14); Xoa bit thu 14 15
				ORR r1,r1,#(0x01<<14); Set bit thu 14 va 15 bang 0, 1 
				STR r1,[r7,#TOCDO_OUTPUT]; Luu gia tri moi vao thanh ghi Output speed cua cong B
				
				;Thiet lap che do no pull-up pull-down cho chan 6 cua cong B
				;00 = no pull-up, no pull-down, 01 = pull-up, 10 = pull-down, 11 = reserved
				LDR r1,[r7,#PULLUP_PULLDOWN]; Nap 4 bytes cua thanh ghi Pull-up/Pull-down cua cong B vao r1
				BIC r1,r1,#(0x03<<12); Xoa bit thu 12 13
				ORR r1,r1,#(0x00<<12); Set bit thu 12 va 13 bang 0, 0
				STR r1,[r7,#PULLUP_PULLDOWN]; Luu gia tri moi vao thanh ghi Pull-up/Pull-down cua cong B
				
				;Thiet lap che do no pull-up pull-down cho chan 7 cua cong B
				;00 = no pull-up, no pull-down, 01 = pull-up, 10 = pull-down, 11 = reserved
				LDR r1,[r7,#PULLUP_PULLDOWN]; Nap 4 bytes cua thanh ghi Pull-up/Pull-down cua cong B vao r1
				BIC r1,r1,#(0x03<<14); Xoa bit thu 14 15
				ORR r1,r1,#(0x00<<14); Set bit thu 14 va 15 bang 0, 0
				STR r1,[r7,#PULLUP_PULLDOWN]; Luu gia tri moi vao thanh ghi Pull-up/Pull-down cua cong B
				
;------------------------------------------------------------------------------

				;Cau hinh chan 0 cua cong A hoat dong o che do digital input
				LDR r7,=GPIOA; Nap dia chi co so cua cong A vao thanh ghi r7
				LDR r1,[r7,#DC_CHEDO]; Nap 4 bytes cua thanh ghi Mode cua cong A vao r1
				BIC r1,r1,#(0x03); Xoa 2 bit dau tien
				STR r1,[r7,#DC_CHEDO]; Luu gia tri moi vao thanh ghi Mode cua cong A
				
				;Thiet lap che do push-pull mode cho chan 0 cua cong A
				LDR r1,[r7,#LOAI_OUTPUT]; Nap 4 bytes cua thanh ghi Output type cua cong A vao r1
				BIC r1,r1,#(0x1); Xoa bit dau tien
				STR r1,[r7,#LOAI_OUTPUT]; Luu gia tri moi vao thanh ghi Output type cua cong A
				
				;Thiet lap gia tri output speed cho chan 0 cua cong A la 2MHz
				;00 = 400KHZ, 01 = 2MHz, 10 = 10MHz, 11 = 40MHz
				LDR r1,[r7,#TOCDO_OUTPUT]; Nap 4 bytes cua thanh ghi Ouput speed cua cong A vao r1
				BIC r1,r1,#(0x03); Xoa 2 bit dau tien
				ORR r1,r1,#(0x01); Xet 2 bit dau tien bang 0, 1
				STR r1,[r7,#TOCDO_OUTPUT]; Luu gia tri moi vao thanh ghi Output speed cua cong A
				
				;Thiet lap che do no pull-up pull-down cho chan 0 cua cong A
				;00 = no pull-up, no pull-down, 01 = pull-up, 10 = pull-down, 11 = reserved
				LDR r1,[r7,#PULLUP_PULLDOWN]; Nap 4 bytes cua thanh ghi Pull-up/Pull-down cua cong A vao r1
				BIC r1,r1,#(0x03); Xoa 2 bit dau tien
				STR r1,[r7,#PULLUP_PULLDOWN]; Luu gia tri moi vao thanh ghi Pull-up/Pull-down cua cong A

;------------------------------------------------------------------------------

				;Tat den blue
				LDR r7,=GPIOB; Nap dia chi co so cua cong B vao thanh ghi r7
				LDR r1,[r7,#DULIEUDAURA]; Nap 4 bytes cua thanh ghi Output data cua cong B
				BIC r1,r1,#(1<<6);Xoa bit thu 6
				STR r1,[r7,#DULIEUDAURA]; Luu gia tri moi vao thanh ghi Output data cua cong B
				;Bat den green
				LDR r1,[r7,#DULIEUDAURA]; Nap 4 bytes cua thanh ghi Output data cua cong B
				ORR r1,r1,#(1<<7);Set bit thu 7 bang 1
				STR r1,[r7,#DULIEUDAURA]; Luu gia tri moi vao thanh ghi Output data cua cong B
				
;------------------------------------------------------------------------------		
				;Vong lap xac dinh bam nut hay chua
bamgiu			LDR r7,=GPIOA; Nap dia chi co so cua cong A vao thanh ghi r7
				LDR r1,[r7,#DULIEUDAUVAO]; Nap 4 bytes cua thanh ghi Input data cua cong B
				ANDS r2,r1,#1; Kiem tra bit dau tien cua IDR vao luu gia tri vao thanh ghi r2
				CMP r2,0; So sanh r2 voi 0
				BEQ bamgiu; Neu r2 = 0 thi thuc hien lai vong lap (bamgiu)
				
				;Vong lap xac dinh da tha tay ra hay chua
thatay			LDR r1,[r7,#DULIEUDAUVAO]; Nap 4 bytes cua thanh ghi Input data cua cong B
				ANDS r2,r1,#1; Kiem tra bit dau tien cua IDR vao luu gia tri vao thanh ghi r2
				CMP r2,1; So sanh r2 voi 1
				BEQ thatay; Neu r2 = 1 co nghia la van chua tha tay ra thi luc nay cho thuc hien lai vong lap (thatay)
				;Neu da tha tay ra roi thi thuc hien dao den
				;Dao den blue
				LDR r7,=GPIOB; Nap dia chi co so cua cong B vao thanh ghi r7
				LDR r2,[r7,#DULIEUDAURA]; Nap 4 bytes cua thanh ghi Output data cua cong B
				EOR r2,r2,#(1<<6); Dao bit thu 6
				STR r2,[r7,#DULIEUDAURA]; Luu gia tri moi vao thanh ghi Output data cua cong B
				;Dao den green
				LDR r7,=GPIOB; Nap dia chi co so cua cong B vao thanh ghi r7
				LDR r2,[r7,#DULIEUDAURA]; Nap 4 bytes cua thanh ghi Output data cua cong B
				EOR r2,r2,#(1<<7); Dao bit thu 7
				STR r2,[r7,#DULIEUDAURA]; Luu gia tri moi vao thanh ghi Output data cua cong B
				B bamgiu; thuc hien lai vong lap (bamgiu)





stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
gg				DCD 1000
array			DCD   1, 2, 3, 4
				END
