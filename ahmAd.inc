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