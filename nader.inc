;-------------------------------------------;
;------------ STATUSBAR MACROS -------------;
;-------------------------------------------;

DRAW_STATUS_BAR_TEMPLATE      MACRO     ;DRAWS STATUSBAR WITH DEFAULT PLAYER NAMES                      
         
CALL DRAW_STATUS_BAR_TEMPLATE_              

ENDM    DRAW_STATUS_BAR_TEMPLATE
;------------------------------------------------------------------------;
PRINT_NOTIFICATION_MESSAGE      MACRO       STATUS_TEXT, INDEX
                        
                        PUSHA
                        MOV DX,2200H
                        ADD DH,INDEX
                        MOV BP, OFFSET STATUS_TEXT
                        CALL PRINT_NOTIFICATION_MESSAGE_
                        POPA

ENDM                    PRINT_NOTIFICATION_MESSAGE 
;------------------------------------------------------------------------;
PRINT_PLAYER1_SCORE     MACRO 
                        
CALL PRINT_PLAYER1_SCORE_
                       
ENDM                    PRINT_PLAYER1_SCORE 
;------------------------------------------------------------------------;
PRINT_PLAYER2_SCORE     MACRO 
                        
CALL PRINT_PLAYER2_SCORE_
                       
ENDM                    PRINT_PLAYER2_SCORE 
;------------------------------------------------------------------------;

;-------------------------------------------;
;--------------- GRID MACROS ---------------;
;-------------------------------------------;

CLICK_TO_GRID	MACRO   
;Waits for a click, converts its position to both grid coordinates
; and pixels(obviously)

CALL CLICK_TO_GRID_

ENDM			CLICK_TO_GRID
;------------------------------------------------------------------------;

DRAW_SHIP_ON_CLICK	MACRO   
;waits for two points and draws a ship between them 

CALL DRAW_SHIP_ON_CLICK_

ENDM			DRAW_SHIP_ON_CLICK
;------------------------------------------------------------------------;