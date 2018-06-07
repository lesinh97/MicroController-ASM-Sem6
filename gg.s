GPIOA          				EQU   0x40020000				; Dia chi co so cua General-purpose input/output pin(GPIO) cua cong A
GPIOB          				EQU   0x40020400 				; Dia chi co so cua General-purpose input/output pin(GPIO) cua cong B
RCC            				EQU   0x40023800				; Dia chi co so cua Reset and Clock Control
CAPXUNGNHIP      			EQU   0x1C						; Dia chi offset cua thanh ghi cap xung nhiet (AHB peripheral clock enable register)
DC_CHEDO					EQU   0x00						; Dia chi offset cua thanh ghi Mode (Mode register) - dung de dieu chinh che do
LOAI_OUTPUT					EQU   0x04						; Dia chi offset cua thanh ghi Output type (Output type register) - dung de dieu dinh kieu cua output(push-pull, open-drain)
TOCDO_OUTPUT				EQU   0x08						; Dia chi offset cua thanh ghi Output speed (Output speed register) - dung de dieu chinh toc do dien ap dau ra tren moi don vi thoi gian
PULLUP_PULLDOWN				EQU   0x0C						; Dia chi offset cua thanh ghi Pull-up, pull-down (Pull-up, pull-down register) - dung de dieu chinh push-pull hay pull-down cua pin dau vao
DULIEUDAUVAO				EQU   0x10						; Dia chi offset cua thanh ghi du lieu dau vao (Input data register) 
DULIEUDAURA					EQU   0x14						; Dia chi offset cua thanh ghi du lieu dau ra (Output data register) 
	
	;AREA    __DEFINES_LUONGLEDAT_DUMMY, CODE, READONLY
	END