;-------------------------------------------;
;------------ STATUSBAR MACROS -------------;
;-------------------------------------------;

DRAW_STATUS_BAR_TEMPLATE      MACRO     ;DRAWS STATUSBAR WITH DEFAULT PLAYERS NAMES                      
PUSHA         
CALL DRAW_STATUS_BAR_TEMPLATE_              
POPA
ENDM    DRAW_STATUS_BAR_TEMPLATE
;------------------------------------------------------------------------;
DRAW_NOTIFICATION_BAR      MACRO       
                        
                        PUSHA
                        CALL DRAW_NOTIFICATION_BAR_
                        POPA

ENDM                    DRAW_NOTIFICATION_BAR 
;------------------------------------------------------------------------;
PRINT_NOTIFICATION_MESSAGE      MACRO       STATUS_TEXT, INDEX
                        
                        PUSHA
                        MOV AX,1301H
                        MOV BX,000FH
                        MOV DX,2200H
                        ADD DH,INDEX
                        MOV BP, OFFSET EMPTY_STRING+1
                        MOV CX,0
                        MOV CL, EMPTY_STRING
                        INT 10H
                        MOV BP, OFFSET STATUS_TEXT
                        CALL PRINT_NOTIFICATION_MESSAGE_
                        POPA

ENDM                    PRINT_NOTIFICATION_MESSAGE 
;------------------------------------------------------------------------;
PRINT_PLAYER1_SCORE     MACRO 
PUSHA                        
CALL PRINT_PLAYER1_SCORE_
POPA                       
ENDM                    PRINT_PLAYER1_SCORE 
;------------------------------------------------------------------------;
PRINT_PLAYER2_SCORE     MACRO 
PUSHA                        
CALL PRINT_PLAYER2_SCORE_
POPA                       
ENDM                    PRINT_PLAYER2_SCORE 
;------------------------------------------------------------------------;

;-------------------------------------------;
;--------------- GRID MACROS ---------------;
;-------------------------------------------;

CELLS_SELECTOR	MACRO 	SHIP_SIZE
PUSHA
MOV CX,SHIP_SIZE
CALL CELLS_SELECTOR_ 
POPA
ENDM			CELLS_SELECTOR
;------------------------------------------------------------------------;
CLEAR_GRID	MACRO   
PUSHA
CALL CLEAR_GRID_
POPA
ENDM			CLEAR_GRID
;------------------------------------------------------------------------;
CALCULATE_SELECTOR_INITIAL_POSITION      MACRO   
PUSHA
CALL CALCULATE_SELECTOR_INITIAL_POSITION_
POPA
ENDM                    CALCULATE_SELECTOR_INITIAL_POSITION
;------------------------------------------------------------------------;
POSSIBLE_ORIENTATIONS_CHECKER      MACRO   
PUSHA
CALL POSSIBLE_ORIENTATIONS_CHECKER_
POPA
ENDM                    POSSIBLE_ORIENTATIONS_CHECKER
;------------------------------------------------------------------------;