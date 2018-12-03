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

