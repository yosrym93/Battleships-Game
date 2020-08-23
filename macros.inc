;macros are used as wrappers for procedures with the same name
;they have mainly two functionalities 1- Save the registers state before and after invoking a procedure 
;------------------------------------ 2- Routing the parameters to certain registers known by the corresponding procedure  

;-------------------------------------------------------------------; 
EVENORODD	MACRO	NUMBER	
	PUSHA
	MOV BX, NUMBER
	CALL EVENORODD_
	POPA
ENDM EVENORODD
;-------------------------------------------------------------------;

PRINT_MESSAGE MACRO MYMESSAGE , LOCATION,COLOR
	PUSHA   
	MOV DX,LOCATION
	MOV BP, OFFSET MYMESSAGE
	MOV SI, COLOR
	CALL  PRINT_MESSAGE_
	POPA
ENDM PRINTMESSAGE 
;-------------------------------------------------------------------;

CLEAR_SCREEN	MACRO 
	PUSHA 
	CALL  CLEAR_SCREEN_
	POPA
ENDM CLEARSCREEN 
;-------------------------------------------------------------------;

GET_USER_NAME MACRO USER_NAME
	PUSHA
	MOV DI, OFFSET USER_NAME
	CALL GET_USER_NAME_
	POPA
ENDM GETUSERNAME
;-------------------------------------------------------------------;  

USER_NAMES MACRO 
	PUSHA
	CALL USER_NAMES_
	POPA
ENDM GETUSERNAME
;-------------------------------------------------------------------;  

MAIN_MENU MACRO 
	PUSHA
	CALL MAIN_MENU_
	POPA
ENDM MAINMENU
;-------------------------------------------------------------------;  

INITIALIZE_PROGRAM MACRO 
	PUSHA
	CALL INITIALIZE_PROGRAM_
	POPA
ENDM INITALIZEPROGRAM
;-------------------------------------------------------------------; 

GET_LEVEL MACRO 
	PUSHA
	CALL GET_LEVEL_
	POPA
ENDM GETLEVEL
;-------------------------------------------------------------------; 

PIXELS_TO_GRID MACRO  PixelX, PixelY, GridX, GridY 
	PUSHA
	Mov CX, PixelX
	Mov BX, PixelY
	Mov SI, offset GridX
	Mov DI, offset GridY
	CALL PIXELS_TO_GRID_
	POPA
ENDM PIXELS_TO_GRID
;-------------------------------------------------------------------; 
Draw_All_Ships_ON_GRID MACRO 
	PUSHA
	CALL Draw_All_Ships_ON_GRID_
	POPA
ENDM Draw_All_Ships_ON_GRID
;-------------------------------------------------------------------; 

DRAW_ALL_DESTROYED_SHIPS MACRO 
	PUSHA
	CALL DRAW_ALL_DESTROYED_SHIPS_
	POPA
ENDM DRAW_ALL_DESTROYED_SHIPS
;------------------------------------------------------------------;

Draw_X_Sign MACRO GRIDX_ ,GRIDY_ ,Color
	PUSHA
	MOV AX, GRIDX_
	MOV GRID1_X, AX
	MOV AX, GRIDY_
	MOV GRID1_Y, AX
	Mov Al,Color
	Mov Variable_Color, Al
	CALL Draw_X_Sign_
	POPA
ENDM Draw_X_Sign
;-------------------------------------------------------------------; 

Draw_All_X_Signs MACRO PLAYER_NUMBER
	PUSHA
	Mov AL, PLAYER_NUMBER
	CALL  Draw_All_X_Signs_
	POPA
ENDM Draw_All_X_Signs
;-------------------------------------------------------------------; 

CELL_HAS_SHIP MACRO GRIDX_ ,GRIDY_ 
	PUSHA
	MOV AX, GRIDX_
	MOV GRID1_X, AX
	MOV AX, GRIDY_
	MOV GRID1_Y, AX
	CALL  CELL_HAS_SHIP_
	POPA
ENDM  CELL_HAS_SHIP
;-------------------------------------------------------------------; 

Is_Cell_Attacked_Before MACRO 
	PUSHA
	CALL Is_CELL_Attacked_Before_
	POPA
ENDM Is_CELL_Attacked_Before
;-------------------------------------------------------------------; 

Update_ATTACKS_DATA MACRO 
	PUSHA
	CALL Update_ATTACKS_DATA_
	POPA
ENDM Update_ATTACKS_DATA
;-------------------------------------------------------------------; 

ATTACKED_CHECK_CELL_AND_Update_ATTACKS_DATA MACRO 
	PUSHA
	CALL ATTACKED_CHECK_CELL_AND_Update_ATTACKS_DATA_
	POPA
ENDM ATTACKED_CHECK_CELL_AND_Update_ATTACKS_DATA
;-------------------------------------------------------------------; 

ATTACKER_Update_ATTACKS_DATA MACRO 
	PUSHA
	CALL ATTACKER_Update_ATTACKS_DATA_
	POPA
ENDM ATTACKER_Update_ATTACKS_DATA
;-------------------------------------------------------------------; 

Get_CELL_FROM_PLAYER MACRO GRIDX_,GRIDY_
	PUSHA
	MOV SI, offset GRIDX_
	MOV DI,offset GRIDY_
	CALL Get_CELL_FROM_PLAYER_
	POPA
ENDM Get_CELL_FROM_PLAYER
;-------------------------------------------------------------------; 

IS_IT_THE_END MACRO
	PUSHA
	CALL IS_IT_THE_END_
	POPA
ENDM IS_IT_THE_END
;-------------------------------------------------------------------; 

REFRESH_DATA MACRO
	PUSHA
	CALL REFRESH_DATA_
	POPA
ENDM REFRESH_DATA
;-------------------------------------------------------------------; 

START_THE_GAME MACRO
	PUSHA
	CALL START_THE_GAME_
	POPA
ENDM START_THE_GAME
;-------------------------------------------------------------------; 

SCENE1_PLAYER_ATTACKS	MACRO
	PUSHA
	CALL SCENE1_PLAYER_ATTACKS_
	POPA
ENDM SCENE1_PLAYER_ATTACKS 
;-------------------------------------------------------------------; 

SCENE2_PLAYER_WATCHES	MACRO
	PUSHA
	CALL SCENE2_PLAYER_WATCHES_	
	POPA
ENDM SCENE2_PLAYER_WATCHES	
;-------------------------------------------------------------------; 

MY_ATTACK_TWICE_POWER_UP_ACTIVATED MACRO
	PUSHA
	CALL MY_ATTACK_TWICE_POWER_UP_ACTIVATED_
	POPA
ENDM MY_ATTACK_TWICE_POWER_UP_ACTIVATED
;-------------------------------------------------------------------; 

OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED MACRO
	PUSHA
	CALL OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED_
	POPA
ENDM OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED
;-------------------------------------------------------------------; 

DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED MACRO
	PUSHA
	CALL DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED_
	POPA
 ENDM DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED
;-------------------------------------------------------------------; 

CHOOSE_SHIP_AND_DESTROY_IT MACRO
	PUSHA
	CALL CHOOSE_SHIP_AND_DESTROY_IT_
	POPA
ENDM CHOOSE_SHIP_AND_DESTROY_IT
;-------------------------------------------------------------------; 

STARTING_PAGE MACRO
	PUSHA
	CALL STARTING_PAGE_ 
	POPA
 ENDM STARTING_PAGE
;-------------------------------------------------------------------; 

WAIT_FOR_KEY MACRO
	PUSHA
	CALL WAIT_FOR_KEY_
	POPA
ENDM  WAIT_FOR_KEY
;-------------------------------------------------------------------; 

SEND_ATTACK_COORD MACRO
	PUSHA
	CALL SEND_ATTACK_COORD_
	POPA
ENDM  SEND_ATTACK_COORD
;-------------------------------------------------------------------; 

RECEIEVE_ATTACK_COORD MACRO
	PUSHA
	CALL RECEIEVE_ATTACK_COORD_
	POPA
ENDM  RECEIEVE_ATTACK_COORD
;------------------------------------------------------------------; 

SEND_ATTACK_RESULT MACRO
	PUSHA
	CALL SEND_ATTACK_RESULT_
	POPA
ENDM  SEND_ATTACK_RESULT
;-------------------------------------------------------------------; 

RECEIEVE_ATTACK_RESULT MACRO
	PUSHA
	CALL RECEIEVE_ATTACK_RESULT_
	POPA
ENDM  RECEIEVE_ATTACK_RESULT
;-------------------------------------------------------------------; 

MOVE_TO_NEXT_SCENE MACRO
	PUSHA
	CALL MOVE_TO_NEXT_SCENE_
	POPA
ENDM  MOVE_TO_NEXT_SCENE
;------------------------------------------------------------------; 

SEND_POWER_UP_ACTIVATION MACRO POWER_UP_CODE_
	PUSHA
	MOV AL, POWER_UP_CODE_
	CALL SEND_POWER_UP_ACTIVATION_
	POPA
ENDM SEND_POWER_UP_ACTIVATION
;-------------------------------------------------------------------; 

ACTIVATE_OTHER_PLAYER_POWER_UP MACRO 
	PUSHA
	CALL ACTIVATE_OTHER_PLAYER_POWER_UP_
	POPA
ENDM ACTIVATE_OTHER_PLAYER_POWER_UP
;-------------------------------------------------------------------; 

UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP MACRO
	PUSHA
	CALL UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP_
	POPA
ENDM UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP
;-------------------------------------------------------------------; 

RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT MACRO 
	PUSHA
	CALL RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT_
	POPA
ENDM RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT 
;-------------------------------------------------------------------; 

SEND_DESTROYED_SHIP_POWER_UP_RESULT MACRO 
	PUSHA
	CALL SEND_DESTROYED_SHIP_POWER_UP_RESULT_
	POPA
ENDM SEND_DESTROYED_SHIP_POWER_UP_RESULT
;-------------------------------------------------------------------; 

MY_REVERSE_ATTACK_POWER_UP_ACTIVATED	MACRO
	PUSHA
	CALL MY_REVERSE_ATTACK_POWER_UP_ACTIVATED_
	POPA
ENDM MY_REVERSE_ATTACK_POWER_UP_ACTIVATED
;-------------------------------------------------------------------; 

PRINT_ATTACK_MSG	MACRO ATTACKED_OR_ATTACKER
	PUSHA
	MOV AL, ATTACKED_OR_ATTACKER
	CALL PRINT_ATTACK_MSG_
	POPA
ENDM PRINT_ATTACK_MSG
;-----------------------------;
IS_CELL_ON_GRID	 MACRO
	PUSHA
	CALL IS_CELL_ON_GRID_
	POPA
ENDM IS_CELL_ON_GRID

;-----------------------------;
PLACE_SHIPS_ON_GRID	MACRO	
	PUSHA
	CALL PLACE_SHIPS_ON_GRID_
	POPA
ENDM PLACE_SHIPS_ON_GRID

;-----------------------------;
ORDER_CELL_SELECTOR_POINTS	MACRO	IS_VERTICAL
	PUSHA
	MOV AL, IS_VERTICAL
	CALL ORDER_CELL_SELECTOR_POINTS_
	POPA
ENDM ORDER_CELL_SELECTOR_POINTS

;-----------------------------;
DRAW_SELECTION_SHIPS MACRO 
	PUSHA
	CALL DRAW_SELECTION_SHIPS_
	POPA
ENDM DRAW_SELECTION_SHIPS

;-----------------------------;
INITIALIZE_SHIPS_ARRAY	MACRO
	PUSHA
	CALL INITIALIZE_SHIPS_ARRAY_
	POPA
ENDM INITIALIZE_SHIPS_ARRAY

;-----------------------------;
DRAW_SELECTION_SHIP	MACRO	INDEX, SIZE, BORDER_COLOR
	PUSHA
	MOV AX, INDEX
	MOV BX, SIZE
	MOV CL, BORDER_COLOR
	CALL DRAW_SELECTION_SHIP_
	POPA
ENDM	DRAW_SELECTION_SHIP

;-----------------------------;
DRAW_SHIP	MACRO	POINT1_X, POINT1_Y, POINT2_X, POINT2_Y, SHIP_COLOR, BORDER_COLOR
	PUSHA
	MOV AX, POINT1_X
	MOV BX, POINT1_Y
	MOV CX, POINT2_X
	MOV SI, POINT2_Y
	MOV DL, BORDER_COLOR
	MOV DH, SHIP_COLOR
	CALL DRAW_SHIP_
	POPA
ENDM	DRAW_SHIP

;-----------------------------;
GRID_TO_PIXELS	MACRO	GRID1_X_, GRID1_Y_, GRID2_X_, GRID2_Y_
	PUSHA
	MOV AX, GRID1_X_
	MOV GRID1_X, AX
	MOV AX, GRID1_Y_
	MOV GRID1_Y, AX
	MOV AX, GRID2_X_
	MOV GRID2_X, AX 
	MOV AX, GRID2_Y_
	MOV GRID2_Y, AX 
	CALL GRID_TO_PIXELS_	
	POPA
ENDM	GRID_TO_PIXELS	
;-----------------------------;
DRAW_RECTANGLE	MACRO	CORNER1X, CORNER1Y, CORNER2X, CORNER2Y, COLOR
	PUSHA
	PUSH AX
	MOV AX, CORNER1X
	MOV X1, AX
	MOV AX, CORNER1Y
	MOV Y1, AX
	MOV AX, CORNER2X
	MOV X2, AX
	MOV AX, CORNER2Y
	MOV Y2, AX
	POP AX
	MOV AL, COLOR
	CALL DRAW_RECTANGLE_
	POPA
ENDM	DRAW_RECTANGLE
;-----------------------------;

CLEAR_GAME_SCREEN    MACRO	COLOR
	PUSHA
	MOV AL, COLOR
	CALL CLEAR_GAME_SCREEN_
	POPA
ENDM	CLEAR_GAME_SCREEN	
;-----------------------------;

DRAW_GRID   MACRO
	PUSHA
	CALL DRAW_GRID_   
	POPA
ENDM	DRAW_GRID   
;-----------------------------;

DRAW_SLIDER MACRO   SLIDER_ROW, COLOR
	PUSHA
	MOV DI, SLIDER_ROW
	MOV AL, COLOR
	CALL DRAW_SLIDER_
	POPA
ENDM    DRAW_SLIDER

;-----------------------------;

DRAW_COLUMN_SELECTOR MACRO   COLUMN_SELECTOR_COLUMN, COLOR
	PUSHA
	MOV DI, COLUMN_SELECTOR_COLUMN
	MOV AL, COLOR
	CALL DRAW_COLUMN_SELECTOR_
	POPA
ENDM    DRAW_COLUMN_SELECTOR 

;-----------------------------;

DRAW_SLIDER_BAR	MACRO
	PUSHA
	CALL DRAW_SLIDER_BAR_	
	POPA
ENDM DRAW_SLIDER_BAR_MACRO
;-----------------------------;

FIRE_SLIDER	MACRO
	PUSHA
	CALL FIRE_SLIDER_
	POPA
ENDM FIRE_SLIDER
;-----------------------------;

SET_LEVEL_SETTINGS	MACRO	LEVEL
	PUSHA
	MOV AL, LEVEL
	CALL SET_LEVEL_SETTINGS_
	POPA
ENDM	SET_LEVEL_SETTINGS	
;-----------------------------;

GET_ATTACK_COLUMN	MACRO
	PUSHA
	CALL GET_ATTACK_COLUMN_
	POPA
ENDM	GET_ATTACK_COLUMN
;------------------------------;

GET_ATTACK_COORDINATES	MACRO
	PUSHA
	CALL GET_ATTACK_COORDINATES_
	POPA
ENDM	GET_ATTACK_COORDINATES
;-----------------------------;

DRAW_DESTROY_SHIP_POWER_UP	MACRO	
	PUSHA
	CALL DRAW_DESTROY_SHIP_POWER_UP_
	POPA
ENDM DRAW_DESTROY_SHIP_POWER_UP
;-----------------------------;

DRAW_ATTACK_TWICE_POWER_UP 	MACRO	
	PUSHA
	CALL DRAW_ATTACK_TWICE_POWER_UP_
	POPA
ENDM DRAW_ATTACK_TWICE_POWER_UP
;-----------------------------;

DRAW_REVERSED_ATTACK_POWER_UP	MACRO
	PUSHA
	CALL DRAW_REVERSED_ATTACK_POWER_UP_
	POPA
ENDM DRAW_REVERSED_ATTACK_POWER_UP
;-----------------------------;

GET_POWER_UP_GRAPHICS_POSITION	MACRO	 POSITION_INDEX
	PUSHA
	MOV AL, POSITION_INDEX
	CALL GET_POWER_UP_GRAPHICS_POSITION_
	POPA
ENDM GET_POWER_UP_GRAPHICS_POSITION
;-----------------------------;

DRAW_POWER_UPS_CARDS	MACRO	
	PUSHA
	CALL DRAW_POWER_UPS_CARDS_
	POPA
ENDM DRAW_POWER_UPS_CARDS
;-----------------------------;

DRAW_POWER_UP_GRAPHICS	MACRO	POWER_UP_INDEX, POSITION_INDEX
	PUSHA
	MOV AH, POWER_UP_INDEX
	MOV AL, POSITION_INDEX
	CALL DRAW_POWER_UP_GRAPHICS_	
	POPA
ENDM DRAW_POWER_UP_GRAPHICS
;-----------------------------;

DRAW_POWER_UPS	 MACRO	
	PUSHA
	CALL DRAW_POWER_UPS_
	POPA
ENDM DRAW_POWER_UPS
;-----------------------------;

DRAW_POWER_UP_CARD_BORDER	MACRO	POSITION_INDEX, COLOR
	PUSHA
	MOV AH, POSITION_INDEX
	MOV AL, COLOR
	CALL DRAW_POWER_UP_CARD_BORDER_	
	POPA
ENDM	DRAW_POWER_UP_CARD_BORDER
;-----------------------------;

POWER_UP_PICKER		MACRO	
	PUSHA
	CALL POWER_UP_PICKER_
	POPA
ENDM POWER_UP_PICKER
;-----------------------------;

PRINT_POWER_UP_MSG	MACRO	POWER_UP_INDEX
	PUSHA
	MOV AL, POWER_UP_INDEX
	CALL PRINT_POWER_UP_MSG_
	POPA
ENDM PRINT_POWER_UP_MSG
;-----------------------------;

GET_POWER_UP_INDEX	 MACRO	POSITION_INDEX, IS_USED_OFFSET
	PUSHA
	MOV BX, IS_USED_OFFSET
	MOV AH, POSITION_INDEX 
	CALL GET_POWER_UP_INDEX_
	POPA
ENDM GET_POWER_UP_INDEX	 
;-----------------------------;

CLEAR_POWER_UPS		MACRO
	PUSHA
	CALL CLEAR_POWER_UPS_
	POPA
ENDM CLEAR_POWER_UPS
;-----------------------------;

PRESS_ENTER_TO_CONTINUE		MACRO
	PUSHA
	CALL PRESS_ENTER_TO_CONTINUE_
	POPA
ENDM PRESS_ENTER_TO_CONTINUE
;-----------------------------;

PLAYERS_PLACE_SHIPS	MACRO
	PUSHA
	CALL PLAYERS_PLACE_SHIPS_
	POPA
ENDM PLAYERS_PLACE_SHIPS
;-----------------------------;

SEND_BYTE   MACRO
	PUSHA
	CALL SEND_BYTE_
	POPA
ENDM SEND_BYTE  
;-----------------------------;

RECEIVE_BYTE    MACRO
	PUSHA
	CALL RECEIVE_BYTE_
	POPA
ENDM RECEIVE_BYTE
;-----------------------------;

INITIALIZE_SERIAL_PORT  MACRO
	PUSHA
	CALL INITIALIZE_SERIAL_PORT_
	POPA
ENDM INITIALIZE_SERIAL_PORT
;-----------------------------;

SEND_DATA   MACRO   BUFFER_INDEX
	PUSHA
	MOV AL, BUFFER_INDEX
	CALL SEND_DATA_
	POPA
ENDM SEND_DATA
;-----------------------------;

RECEIVE_DATA    MACRO
	PUSHA
	CALL RECEIVE_DATA_
	POPA
ENDM RECEIVE_DATA
;-----------------------------;

ADD_BYTE_TO_SEND_BUFFER  MACRO  BYTE_, BUFFER_INDEX
	PUSHA
	MOV BH, BYTE_
	MOV SERIAL_BYTE, BH
	MOV BL, BUFFER_INDEX
	CALL ADD_BYTE_TO_SEND_BUFFER_
	POPA
ENDM ADD_BYTE_TO_SEND_BUFFER
;-----------------------------;

ADD_WORD_TO_SEND_BUFFER MACRO   WORD_, BUFFER_INDEX
	PUSHA
	MOV AX, WORD_
	MOV SERIAL_BYTE, AL
	MOV BL, BUFFER_INDEX
	CALL ADD_BYTE_TO_SEND_BUFFER_
	MOV AX, WORD_
	MOV SERIAL_BYTE, AH
	MOV BL, BUFFER_INDEX
	CALL ADD_BYTE_TO_SEND_BUFFER_
	POPA
ENDM ADD_WORD_TO_SEND_BUFFER     
;-----------------------------;

REMOVE_BYTE_FROM_SEND_BUFFER    MACRO   BUFFER_INDEX
	PUSHA
	MOV BL, BUFFER_INDEX
	CALL REMOVE_BYTE_FROM_SEND_BUFFER_ 
	POPA
ENDM  REMOVE_BYTE_FROM_SEND_BUFFER   
;-----------------------------;

CHECK_FOR_INLINE_CHAT_KEY	MACRO	SCANCODE, ASCII_CODE
	PUSHA
	MOV AH, SCANCODE
	MOV AL, ASCII_CODE
	CALL CHECK_FOR_INLINE_CHAT_KEY_
	POPA
ENDM	CHECK_FOR_INLINE_CHAT_KEY
;-----------------------------;

CLEAR_RECEIVE_BUFFER	MACRO   BUFFER_INDEX
	PUSHA
	MOV AL, BUFFER_INDEX
	CALL CLEAR_RECEIVE_BUFFER_
	POPA
ENDM  CLEAR_RECEIVE_BUFFER
;-----------------------------;

SEND_EXIT_GAME   	 MACRO   
	PUSHA
	CALL SEND_EXIT_GAME_
	JMP PRE_EXIT_SCREEN
	POPA
ENDM  SEND_EXIT_GAME   
;-----------------------------;

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