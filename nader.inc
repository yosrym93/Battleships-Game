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
PRINT_MY_SCORE     MACRO  
PUSHA                        
CALL PRINT_MY_SCORE_
POPA                       
ENDM                    PRINT_PLAYER1_SCORE 
;------------------------------------------------------------------------;
PRINT_OTHER_PLAYER_SCORE     MACRO  
PUSHA                        
CALL PRINT_OTHER_PLAYER_SCORE_
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
STAT_SCREEN      MACRO   
PUSHA
CALL STAT_SCREEN_
POPA
ENDM                    STAT_SCREEN
;------------------------------------------------------------------------;
CONCATENATE      MACRO   STRING,PLAYER_NUMBER
PUSHA
MOV BX, OFFSET STRING
MOV AL, PLAYER_NUMBER
CALL CONCATENATE_
POPA
ENDM                    CONCATENATE
;------------------------------------------------------------------------;
DRAW_PRE_EXIT_SCREEN	MACRO   
PUSHA
CALL DRAW_PRE_EXIT_SCREEN_
POPA
ENDM                    DRAW_PRE_EXIT_SCREEN
;------------------------------------------------------------------------;
EXIT_GAME		MACRO   
PUSHA
CALL EXIT_GAME_
POPA
ENDM                    EXIT_GAME
;------------------------------------------------------------------------;
PRINT_INLINE_CHAT_MESSAGE	MACRO       STATUS_TEXT, INDEX
                        PUSHA
                        MOV BX, OFFSET STATUS_TEXT
                        MOV AL, INDEX
                        CALL PRINT_INLINE_CHAT_MESSAGE_
                        POPA

ENDM                    PRINT_INLINE_CHAT_MESSAGE
;------------------------------------------------------------------------; 
;-------------------------------------------;
;--------------- CHAT MACROS ---------------;
;-------------------------------------------;

STANDALONE_CHAT_MODE  MACRO   
PUSHA
CALL STANDALONE_CHAT_MODE_
POPA
ENDM                    STANDALONE_CHAT_MODE
;------------------------------------------------------------------------;
CHECK_IF_CHAT_KEY  MACRO   ASCII_KEY

PUSHA

MOV BL,ASCII_KEY

CALL CHECK_IF_CHAT_KEY_

POPA

ENDM                    CHECK_IF_CHAT_KEY
;------------------------------------------------------------------------;
ADD_TO_MSGS_QUEUE  MACRO   PLAYER_INDEX,MESSAGE
PUSHA
MOV AH,PLAYER_INDEX
MOV BP, OFFSET MESSAGE
CALL ADD_TO_MSGS_QUEUE_
POPA
ENDM                    ADD_TO_MSGS_QUEUE
;------------------------------------------------------------------------;
PRINT_MSGS_QUEUE  MACRO
PUSHA
CALL PRINT_MSGS_QUEUE_
POPA
ENDM                    PRINT_MSGS_QUEUE
;------------------------------------------------------------------------;