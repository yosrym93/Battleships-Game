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
GET_USER_NAME MACRO PLAYER_INDEX ,USER_NAME
      PUSHA
      MOV SI, PLAYER_INDEX
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
Draw_All_Ships_ON_GRID MACRO PLAYER_NUMBER
PUSHA
MOV AL, PLAYER_NUMBER
CALL Draw_All_Ships_ON_GRID_
POPA
ENDM Draw_All_Ships_ON_GRID
;-------------------------------------------------------------------; 
DRAW_ALL_DESTROYED_SHIPS MACRO PLAYER_NUMBER
PUSHA
MOV AL, PLAYER_NUMBER
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
 CELL_HAS_SHIP MACRO GRIDX_ ,GRIDY_ ,ATTACKED_PLAYER
PUSHA
MOV AX, GRIDX_
MOV GRID1_X, AX
MOV AX, GRIDY_
MOV GRID1_Y, AX
Mov Al,ATTACKED_PLAYER
CALL  CELL_HAS_SHIP_
POPA
ENDM  CELL_HAS_SHIP
;-------------------------------------------------------------------; 
Is_Cell_Attacked_Before MACRO PLAYER_WHO_ATTACKS
PUSHA
Mov Al,PLAYER_WHO_ATTACKS
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
CHECK_CELL_AND_Update_ATTACKS_DATA MACRO 
PUSHA
CALL CHECK_CELL_AND_Update_ATTACKS_DATA_
POPA
ENDM CHECK_CELL_AND_Update_ATTACKS_DATA
;-------------------------------------------------------------------; 
Get_CELL_FROM_PLAYER MACRO GRIDX_,GRIDY_
PUSHA
Mov SI, offset GRIDX_
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
ACTIVATE_ATTACK_TWICE_POWER_UP MACRO
PUSHA
CALL ACTIVATE_ATTACK_TWICE_POWER_UP_
POPA
ENDM ACTIVATE_ATTACK_TWICE_POWER_UP
;-------------------------------------------------------------------; 
 ACTIVATE_DESTROY_RANDOM_POWER_UP MACRO
PUSHA
CALL ACTIVATE_DESTROY_RANDOM_POWER_UP_ 
POPA
 ENDM ACTIVATE_DESTROY_RANDOM_POWER_UP
;-------------------------------------------------------------------; 