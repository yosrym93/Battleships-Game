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