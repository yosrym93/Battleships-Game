INCLUDE YOSRY.INC
INCLUDE AHMAD.INC
.MODEL LARGE
.386

.STACK 64
.DATA

;---------------- COLORS ----------------------------------------
BLACK               DB  00H
WHITE               DB  0FH
BLUE                DB  01H
LIGHT_BLUE          DB  09H

;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?

;---------------- SLIDER DATA ------------------------------------
SLIDER_COLUMN       EQU 480
SLIDER_INITIAL_ROW  EQU 473
SLIDER_CURRENT_ROW  DW  SLIDER_INITIAL_ROW
SPACE_SCANCODE      EQU 39H
SLIDER_DIRECTION    DB  0   ; 0 UP, 1 DOWN
SLIDER_MAX_UP       EQU  5
SLIDER_MAX_DOWN     EQU 473

;---------------- MESSAGES DATA FOR THE USER -------------------
PLEASE_ENTER_YOUR_NAME_MSG  DB    19H,'- PLEASE ENTER YOUR NAME:'
PLAYER1_MSG                 DB    7H ,'PLAYER1' 
PLAYER2_MSG                 DB    7H ,'PLAYER2'         
PRESS_ENTER_MSG             DB    1BH,'PRESS ENTER KEY TO CONTINUE' 
TO_START_GAME_MSG           DB    1CH,'- TO START THE GAME PRESS F2'
ENTER_LEVEL_MSG             DB    1EH,'- CHOOSE THE GAME LEVEL 1 OR 2'
TO_END_PROG_MSG             DB    1DH,'TO END THE PROGRAME PRESS ESC'
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL               DB     2,?,?,?   ; 1 OR 2
GRID_SIZE           EQU  100         ; 10 X 10

;---- NUMBER OF SHIPS --------------------------------------------
N_SHIPS          EQU 10   ; PLAYER 1 NUMBER OF SHIPS

;---- SHIPS SIZES (NUMBER OF CELLS) ------------------------------
SHIP1_N_CELLS    EQU 5
SHIP2_N_CELLS    EQU 4
SHIP3_N_CELLS    EQU 4
SHIP4_N_CELLS    EQU 4
SHIP5_N_CELLS    EQU 3
SHIP6_N_CELLS    EQU 3
SHIP7_N_CELLS    EQU 3
SHIP8_N_CELLS    EQU 2
SHIP9_N_CELLS    EQU 2
SHIP10_N_CELLS   EQU 2

;---- SHIPS SELECTION CELLS --------------------------------------
SHIPS_SEL_CELLS     DB  1, 1, 1, 1, 1, 1, 1, 1, 1, 1              ;TO BE REPLACES WITH ACTUAL CELLS COORDINATES
                    DB  1, 1, 1, 1, 1, 1, 1, 1, 1, 1 

;---------------- PLAYER 1 DATA ----------------------------------
P1_USERNAME         DB  20, ?, 20 DUP ('?')
P1_SCORE            DB  37 ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS

;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P1_ATTACKS_ONTARGET DB  (GRID_SIZE * 2) DUP(?)
P1_ATTACH_MISSED    DB  (GRID_SIZE * 2) DUP(?)            

;-------- P1 SHIPS -----------------------------------------------

;---- SHIPS DATA ARRAY -------------------------------------------
P1_SHIPS            DB  N_SHIPS DUP(?)                            ; SHOULD BE INITIALIZED WITH SHIPS OFFSETS

;---- SHIPS DATA -------------------------------------------------

;-- SHIP 1 -------------------------------------------------------
P1_SHIP1 LABEL BYTE
P1_SHIP1_N_CELLS                   DB  SHIP1_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP1_GRID_CELLS                DB  (SHIP1_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 2 -------------------------------------------------------
P1_SHIP2 LABEL BYTE
P1_SHIP2_N_CELLS                   DB  SHIP2_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP2_GRID_CELLS                DB  (SHIP2_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 3 -------------------------------------------------------
P1_SHIP3 LABEL BYTE
P1_SHIP3_N_CELLS                   DB  SHIP3_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP3_N_UNDESTROYED_CELLS       DB  SHIP3_N_CELLS              ; NUMBER OF UNDESTROYED CELLS
P1_SHIP3_GRID_CELLS                DB  (SHIP3_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 4 -------------------------------------------------------
P1_SHIP4 LABEL BYTE
P1_SHIP4_N_CELLS                   DB  SHIP4_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP4_GRID_CELLS                DB  (SHIP4_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 5 -------------------------------------------------------
P1_SHIP5 LABEL BYTE
P1_SHIP5_N_CELLS                   DB  SHIP5_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP5_GRID_CELLS                DB  (SHIP5_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 6 -------------------------------------------------------
P1_SHIP6 LABEL BYTE
P1_SHIP6_N_CELLS                   DB  SHIP6_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP6_GRID_CELLS                DB  (SHIP6_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 7 -------------------------------------------------------
P1_SHIP7 LABEL BYTE
P1_SHIP7_N_CELLS                   DB  SHIP7_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP7_GRID_CELLS                DB  (SHIP7_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 8 -------------------------------------------------------
P1_SHIP8 LABEL BYTE
P1_SHIP8_N_CELLS                   DB  SHIP8_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP8_GRID_CELLS                DB  (SHIP8_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 9 -------------------------------------------------------
P1_SHIP9 LABEL BYTE
P1_SHIP9_N_CELLS                   DB  SHIP9_N_CELLS              ; TOTAL NUMBER OF CELLS
P1_SHIP9_GRID_CELLS                DB  (SHIP9_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 10 -------------------------------------------------------
P1_SHIP10 LABEL BYTE
P1_SHIP10_N_CELLS                  DB  SHIP10_N_CELLS             ; TOTAL NUMBER OF CELLS
P1_SHIP10_GRID_CELLS               DB  (SHIP10_N_CELLS * 2) DUP(?); (X1 , Y1, X2, Y2, X3, Y3, ...)


;---------------- PLAYER 2 DATA ----------------------------------
P2_USERNAME         DB  20, ?, 20 DUP ('?')
P2_SCORE            DB  37 ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS

;-------- P2 ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P2_ATTACKS_ONTARGET DB  (GRID_SIZE * 2) DUP(?)
P2_ATTACH_MISSED    DB  (GRID_SIZE * 2) DUP(?)  

;-------- P2 SHIPS -----------------------------------------------

;---- SHIPS DATA ARRAY -------------------------------------------
P2_SHIPS            DB  N_SHIPS DUP(?)                            ; SHOULD BE INITIALIZED WITH SHIPS OFFSETS

;---- SHIPS DATA -------------------------------------------------

;-- SHIP 1 -------------------------------------------------------
P2_SHIP1 LABEL BYTE
P2_SHIP1_N_CELLS                   DB  SHIP1_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP1_GRID_CELLS                DB  (SHIP1_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 2 -------------------------------------------------------
P2_SHIP2 LABEL BYTE
P2_SHIP2_N_CELLS                   DB  SHIP2_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP2_GRID_CELLS                DB  (SHIP2_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 3 -------------------------------------------------------
P2_SHIP3 LABEL BYTE
P2_SHIP3_N_CELLS                   DB  SHIP3_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP3_GRID_CELLS                DB  (SHIP3_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 4 -------------------------------------------------------
P2_SHIP4 LABEL BYTE
P2_SHIP4_N_CELLS                   DB  SHIP4_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP4_GRID_CELLS                DB  (SHIP4_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 5 -------------------------------------------------------
P2_SHIP5 LABEL BYTE
P2_SHIP5_N_CELLS                   DB  SHIP5_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP5_GRID_CELLS                DB  (SHIP5_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 6 -------------------------------------------------------
P2_SHIP6 LABEL BYTE
P2_SHIP6_N_CELLS                   DB  SHIP6_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP6_GRID_CELLS                DB  (SHIP6_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 7 -------------------------------------------------------
P2_SHIP7 LABEL BYTE
P2_SHIP7_N_CELLS                   DB  SHIP7_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP7_GRID_CELLS                DB  (SHIP7_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 8 -------------------------------------------------------
P2_SHIP8 LABEL BYTE
P2_SHIP8_N_CELLS                   DB  SHIP8_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP8_GRID_CELLS                DB  (SHIP8_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 9 -------------------------------------------------------
P2_SHIP9 LABEL BYTE
P2_SHIP9_N_CELLS                   DB  SHIP9_N_CELLS              ; TOTAL NUMBER OF CELLS
P2_SHIP9_GRID_CELLS                DB  (SHIP9_N_CELLS * 2) DUP(?) ; (X1 , Y1, X2, Y2, X3, Y3, ...)

;-- SHIP 10 -------------------------------------------------------
P2_SHIP10 LABEL BYTE
P2_SHIP10_N_CELLS                  DB  SHIP10_N_CELLS             ; TOTAL NUMBER OF CELLS
P2_SHIP10_GRID_CELLS               DB  (SHIP10_N_CELLS * 2) DUP(?); (X1 , Y1, X2, Y2, X3, Y3, ...)

;--NADER-----------------------------------------------------------; Most of those variables are experimental
SCORE_CONSTANT_TEXT                     DB  "'s Score: "
PLAYER1                                 DB  20,7,"PLAYER1"
PLAYER2                                 DB  20,7,"PLAYER2"
STATUS_TEST                             DB  37,2, "- This is a test notification message"
SCORE1                                  DB  28
SCORE1_STRING                           DB  2 DUP(?)
SCORE2                                  DB  7
SCORE2_STRING                           DB  2 DUP(?)

.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

INITIALIZE_PROGRAM
USER_NAMES
MAIN_MENU
GET_LEVEL
CLEAR_GAME_SCREEN   WHITE
DRAW_GRID
DRAW_STATUS_BAR_TEMPLATE PLAYER1, PLAYER2, SCORE_CONSTANT_TEXT
PRINT_NOTIFICATION_MESSAGE STATUS_TEST
PRINT_PLAYER1_SCORE PLAYER1,SCORE1,SCORE1_STRING
PRINT_PLAYER2_SCORE PLAYER2,SCORE2,SCORE2_STRING
DRAW_SLIDER_BAR
FIRE_SLIDER


HLT
RET
MAIN    ENDP
;-------------------------------------;
;---------- PROCEDURES ---------------;
;-------------------------------------;
DRAW_RECTANGLE_   PROC  NEAR    
    ;PARAMETERS
    ; X1, Y1, X2, Y2, AL = COLOR
    INC X2
    INC Y2  ;TO STOP AT X2 + 1, Y2 + 1
    MOV DX, Y1
    MOV AH, 0CH   ;AH = 0C FOR INT, AL = COLOR
    DRAW_ALL_RECTANGLE_ROWS:
    MOV CX, X1
        DRAW_RECTANGE_ROW:
            INT 10H
            INC CX
            CMP CX, X2
        JNZ DRAW_RECTANGE_ROW
    INC DX
    CMP DX, Y2
    JNZ DRAW_ALL_RECTANGLE_ROWS
    RET
DRAW_RECTANGLE_ ENDP   
;-------------------------------------;    
PRINT_MESSAGE_    PROC NEAR

      MOV AX,1301H
      MOV BX,BP
      MOV CL,[BX]
      MOV CH,00H
      ADD BP,1H
      MOV BX,SI
      INT 10H
      RET

PRINT_MESSAGE_    ENDP
;-------------------------------------;
CLEAR_SCREEN_    PROC NEAR        ;CLEAR AN SPECIFIC PART IN THE GAME
     DRAW_RECTANGLE 0H,800,0H,480,BLACK     
     RET       
CLEAR_SCREEN_     ENDP
;-------------------------------------;
GET_USER_NAME_     PROC NEAR
     PRINT_MESSAGE PLEASE_ENTER_YOUR_NAME_MSG , 1025H , 0FF0FH
     PRINT_MESSAGE PRESS_ENTER_MSG , 1423H , 0FF0FH
     
     CMP SI,1H
     JNZ PLAYER2
     PRINT_MESSAGE PLAYER1_MSG ,0C2CH , 0FF28H
     JMP CONT
PLAYER2:
     PRINT_MESSAGE PLAYER2_MSG ,0C2CH , 0FF28H
     
CONT:        
     MOV AH,02H             ;MOVE THE CURSOR
     MOV DX,122AH
     INT 10H
        
     MOV AH,0AH            ;GET THE USER INPUT AND STORE IT IN USERNAME1 OR USERNAME2(SENT PARAMETER)
     MOV DX,DI
     INT 21H
     RET 
     
 GET_USER_NAME_     ENDP
;-------------------------------------;
USER_NAMES_     PROC NEAR

     GET_USER_NAME 1H,P1_USERNAME
     CLEAR_GAME_SCREEN  BLACK 
     GET_USER_NAME 2H,P2_USERNAME
     CLEAR_GAME_SCREEN  BLACK
     
     RET 
USER_NAMES_     ENDP
;-------------------------------------;
MAIN_MENU_     PROC NEAR

        PRINT_MESSAGE TO_START_GAME_MSG , 1025H , 0FF0FH
        PRINT_MESSAGE TO_END_PROG_MSG , 1425H , 0FF0FH

  NOTVALID:          
        MOV AH,0
        INT 16H
        CMP AH,3CH
        JZ CONT2
  NOTF2:                 
        CMP AH,01H
        JZ EXIT
        JNZ NOTVALID            ;JZ WHERE ???
  CONT2:       
  CLEAR_GAME_SCREEN BLACK 
     RET 
  EXIT:
        HLT
     
MAIN_MENU_     ENDP
;-------------------------------------;
INITIALIZE_PROGRAM_     PROC NEAR

        MOV AX,4F02H           ;GO TO VIDEOMODE 800*600
        MOV BX,103H
        INT 10H

     RET 
INITIALIZE_PROGRAM_     ENDP
;-------------------------------------;
GET_LEVEL_     PROC NEAR

 PRINT_MESSAGE ENTER_LEVEL_MSG , 1025H , 0FF0FH
  
  NOTVALID2:

        MOV AH,02H                 ;MOVE THE CURSER
        MOV DX,1232H
        INT 10H
        
        MOV AH,0AH                 ;GET USER INPUT AND STORE IT IN LEVEL  
        MOV DX,OFFSET LEVEL
        INT 21H     
        
        MOV BX,DX                  ;CHECK THAT THE USER INPUT 1 OR 2 
        MOV CL,[BX+2]
        CMP CL,31H
        JZ  BACK
        CMP CL,32H
        JNZ NOTVALID2
  BACK:
        CLEAR_GAME_SCREEN WHITE
        RET
GET_LEVEL_     ENDP
;-------------------------------------;
DRAW_GRID_  PROC    NEAR    
    ; DRAW GRID COLUMNS
    MOV CX, 20
    MOV DX, 19      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_COLUMNS:
        MOV DX, 19  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_COLUMN:
            INT 10H
            INC DX
            CMP DX, 460
        JNZ DRAW_COLUMN
        ADD CX, 44  ;DISTANCE BETWEEN COLUMNS
        CMP CX, 504 ;LAST LINE AT CX = 460 SO STOP WHEN CX + 44 = 504
    JNZ DRAW_ALL_COLUMNS
    ; DRAW GRID ROWS
    MOV CX, 20
    MOV DX, 19      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_ROWS:
        MOV CX, 20  ;START DRAWING EVERY ROW FROM THE INITIAL COLUMN
        DRAW_ROW:
            INT 10H
            INC CX
            CMP CX, 461
        JNZ DRAW_ROW
        ADD DX, 44  ;DISTANCE BETWEEN ROWS
        CMP DX, 503 ;LAST LINE AT DX = 459 SO STOP WHEN DX + 44 = 503
    JNZ DRAW_ALL_ROWS
    RET
DRAW_GRID_  ENDP
;-----------------------------------------;

DRAW_SLIDER_     PROC   NEAR   
    ; PARAMETERS
    ; DI = SLIDER_ROW
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, SLIDER_COLUMN
    MOV DX, DI
    DEC DX
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_SLIDER_COLUMNS:
        MOV DI, BX
        DRAW_SLIDER_COLUMN:
            INT 10H
            INC DX
            DEC DI
        JNZ DRAW_SLIDER_COLUMN
        MOV DI, BX
        INC DI
        SUB DX, DI
        INC CX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE SLIDER SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_SLIDER_COLUMNS
    RET
DRAW_SLIDER_    ENDP 
;-----------------------------------------;

DRAW_SLIDER_BAR_    PROC    NEAR   
    MOV CX, 470
    MOV DX, SLIDER_MAX_UP      ;INITIAL POINT
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_BARS:
        MOV DX, SLIDER_MAX_UP  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_BAR:
            INT 10H
            INC DX
            CMP DX, SLIDER_MAX_DOWN
        JNZ DRAW_BAR
        ADD CX, 1  ;DISTANCE BETWEEN COLUMNS
        CMP CX, 476 ;LAST LINE AT CX = 460 SO STOP WHEN CX + 44 = 504
    JNZ DRAW_ALL_BARS
    DRAW_SLIDER SLIDER_INITIAL_ROW, LIGHT_BLUE
    RET
DRAW_SLIDER_BAR_    ENDP
;-----------------------------------------;

FIRE_SLIDER_    PROC    NEAR   
    CHECK_USER_CLICK:
    ; CHECK IF USER PRESSED A KEY
    MOV AH, 1
    INT 16H
    JZ MOVE_SLIDER
    ; GET KEY PRESSED
    MOV AH, 0
    INT 16H
    CMP AH, SPACE_SCANCODE
    JZ STOP_SLIDER
    ; MOVE THE SLIDER
    MOVE_SLIDER:
    ; CLEAR THE SLIDER CURRENT POSITION
    DRAW_SLIDER SLIDER_CURRENT_ROW, WHITE
    ; CHECK WHETHER TO MOVE IT UP OR DOWN
    CMP SLIDER_DIRECTION, 0
    JZ  DECREMENT_ROW
    ; MOVE SLIDER DOWN
    INC SLIDER_CURRENT_ROW
    ; CHECK IF ROW IS AT ITS LOWEST, CHANGE THE DIRECTION TO UP (0)
    CMP SLIDER_CURRENT_ROW, SLIDER_MAX_DOWN
    JNZ DRAW_NEW_SLIDER
    MOV SLIDER_DIRECTION, 0
    JMP DRAW_NEW_SLIDER
    ; MOVE SLIDER UP
    DECREMENT_ROW:
    DEC SLIDER_CURRENT_ROW
    ; CHECK IF ROW IS AT ITS HIGHEST, CHANGE THE DIRECTION TO DOWN (1)
    CMP SLIDER_CURRENT_ROW, SLIDER_MAX_UP
    JNZ DRAW_NEW_SLIDER
    MOV SLIDER_DIRECTION, 1
    ; DRAW THE SLIDER NEW POSITION
    DRAW_NEW_SLIDER:
    DRAW_SLIDER SLIDER_CURRENT_ROW, LIGHT_BLUE
    ; DELAY 
    MOV AH,86H
    MOV CX,0 ;CX:DX = INTERVAL IN MICROSECONDS
    MOV DX,03E8H
    INT 15H
    JMP CHECK_USER_CLICK
    STOP_SLIDER:
    RET
FIRE_SLIDER_    ENDP
;-----------------------------------------;
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, 799, 479, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP

END     MAIN