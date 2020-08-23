INCLUDE MACROS.INC
.MODEL LARGE
.386
.STACK 64
.DATA

;-------------------- SERIAL CODES ---------------------
ATTACK_COORD_CODE               EQU 1
ATTACK_RESULT_CODE              EQU 2
MOVE_TO_NEXT_SCENE_CODE         EQU 3
MOVE_TO_GAME_SCENE_CODE         EQU 4
POWER_UP_ACTIVATION_CODE        EQU 5
ATTACK_TWICE_CODE               EQU 6
REVERSE_ATTACK_CODE             EQU 7
DESTROY_RANDOM_SHIP_CODE        EQU 8
DESTROY_RANDOM_SHIP_RESULT_CODE EQU 9
END_CODE                        EQU 33
GAME_INVITATION_CODE            EQU 0FFH
CHAT_INVITATION_CODE            EQU 0FEH
CANCEL_INVITATION_CODE          EQU 0FDH
ACCEPT_INVITATION_CODE          EQU 0FCH
REJECT_INVITATION_CODE          EQU 0FBH
LEVEL1_CODE                     EQU 0F9H
LEVEL2_CODE                     EQU 0FAH    ; LEVEL2 CODE MUST ALWAYS BE HIGHER THAN LEVEL 1 CODE BY 1
START_CHAT_CODE                 EQU 0F8H
USERNAME_CODE                   EQU 0F6H
REQUEST_TO_SEND_CODE            EQU 0F5H
READY_TO_RECEIVE_CODE           EQU 0F4H
ALL_DATA_SENT_CODE              EQU 0F3H
EXIT_GAME_CODE                  EQU 0EEH

;-------------------- MISCELLANEOUS ----------------------

KEY_PRESSED                     DB  ?
WAIT_FOR_THE_OTHER_PLAYER_MSG   DB  45,"- Please wait the other player to press ENTER" 
MY_INDEX                        EQU 1
OTHER_PLAYER_INDEX              EQU 2
WAIT_TO_RECEIEVE_ATTACK_COORD   DB  28,"WAIT TO RECEIEVE ATTACK COORD"
WAIT_TO_RECEIEVE_ATTACK_RESULT   DB  29,"WAIT TO RECEIEVE ATTACK RESULT"
ATTACKX_STRING        DB  2,?,?
ATTACKY_STRING        DB  1,?


;---------------- INVITATIONS ---------------------------
GAME_MODE                       DB  0
PLAY_MODE                       EQU 1
CHAT_MODE                       EQU 2
IS_HOST                         DB  ?
DUMMY_COUNTER                   DB  ?
IS_GAME_STARTED                 DB  0
SEND_GAME_INVITATION_MSG        DB  38,'- To send a game invitation press F2 -' 
SEND_CHAT_INVITATION_MSG        DB  38,'- To send a chat invitation press F3 -'
RECEIVED_GAME_INVITATION_MSG    DB  80,'- You have received a game invitaiton, press ENTER to accept or SPACE to decline'
RECEIVED_CHAT_INVITATION_MSG    DB  80,'- You have received a chat invitaiton, press ENTER to accept or SPACE to decline'
YOU_CANCELLED_MSG               DB  39,'- You cancelled the invitation you sent'
INVITATION_ACCEPTED_MSG         DB  52,'- Your invitation was accepted, press ENTER to start'
INVITATION_REJECTED_MSG         DB  30,'- Your invitation was rejected'
INVITATION_CANCELLED_MSG        DB  43,'- The invitation you received was cancelled'
YOU_ACCEPTED_MSG                DB  51,'- You accepted the invitation, press ENTER to start'
YOU_REJECTED_MSG                DB  29,'- You rejected the invitation'
SENT_GAME_INVITATION_MSG        DB  66,'- You sent a game invitation, press SPACE to cancel the invitation'
SENT_CHAT_INVITATION_MSG        DB  66,'- You sent a chat invitation, press SPACE to cancel the invitation'
HOST_CHOOSING_LEVEL             DB  44,'- Please wait while the host chooses a level'
WAITING_FOR_USERNAME            DB  45,'- Waiting for Player 2 to send their username'

;---------------- BUFFERS -------------------------------
; FIRST BYTE OF ANY BUFFER -> SIZE OF DATA CURRENTLY IN THE BUFFER
; BUFFERS SIZE NEEDS TO BE CHECKED
DATA_BUFFER_INDEX        EQU 1
CHAT_BUFFER_INDEX        EQU 2
BUFFER_SIZE              EQU 100
SEND_DATA_BUFFER_FULL    DB  0
SEND_CHAT_BUFFER_FULL    DB  0
SERIAL_BYTE              DB  ?               
DATA_RECEIVED_FLAG       DB  0
SEND_DATA_BUFFER         DB  BUFFER_SIZE DUP(?) 
SEND_DATA_BUFFER_PTR     DW  ?          ; POINTS TO THE FIRST EMPTY BYTE IN THE SEND_DATA_BUFFER (CONTAINS THE OFFSET)
RECEIVE_DATA_BUFFER      DB  BUFFER_SIZE DUP(?)
SEND_CHAT_BUFFER         DB  BUFFER_SIZE DUP(?)
SEND_CHAT_BUFFER_PTR     DW  ?          ; POINTS TO THE FIRST EMPTY BYTE IN THE SEND_CHAT_BUFFER (CONTAINS THE OFFSET)
RECEIVE_CHAT_BUFFER      DB  BUFFER_SIZE DUP(?)
BUFFER_INDEX             DB  ?
IS_CHAT_KEY              DB  ?   ; 1:TRUE 0:FALSE

;---------------- STARTING PAGE -------------------------
WELCOME_MSG                 DB   24,'Welcome To Battleships !'
CONTROLLERS_MSG             DB   10,'Controls: '
ARROWS_MSG                  DB   60,'ARROWS: For navigation (in the grid and power ups selection)'
TAB_MSG                     DB   46,'TAB: To enter and exit the power ups selection'
SPACE_MSG                   DB   40,'PLUS(+): To send an in-game chat message'
ENTER_MSG                   DB   64,'ENTER: To move throughout game stages and select different items'

;---------------- GENERAL MESSAGES -------------------------
PLAYER_TURN                     DB      34,"'s turn ! Wait for him to attack !"
CHOOSE_LEVEL_MSG                DB      33,"- Press ENTER to choose a level !"
ATTACK_TIME_MSG                 DB      41,"- Attack time ! Press ENTER to continue !"
VIEW_SHIPS_MSG                  DB      97,"- Take a look at your ships to see the effect of your opponent's attack !"
                                DB      " Press ENTER to ATTACK !"
WAIT_FOR_OTHER_ATTACK_MSG       DB      23,"- Wait for the attack !"

;---------------- ATTACK -----------------------------------
SELECT_ATTACK_COLUMN_MSG                DB  84,"- Navigate through columns and press ENTER "
                                        DB  "to select the column of the attacked cell"
FIRE_SLIDER_MSG                         DB  64,"- Press ENTER to stop the slider at the row of the attacked cell"
CELL_ALREADY_ATTACKED_MSG_ATTACKER      DB  81,"- You attacked the cell that you already attacked before! Press ENTER to continue"
GRID_MISSED_MSG_ATTACKER                DB  47,"- You missed the grid ! Press ENTER to continue"
ON_TARGET_MSG_ATTACKER                  DB  61,"- Your attack hit a ship ! Good job ! Press ENTER to continue"
NOT_ON_TARGET_MSG_ATTACKER              DB  69,"- Your attack didn't hit a ship ! Hard Luck ! Press ENTER to continue"

CELL_ALREADY_ATTACKED_MSG_ATTACKED      DB  92,"- The other player attacked a cell that he already attacked before ! Press ENTER to continue"
GRID_MISSED_MSG_ATTACKED                DB  60,"- The other player missed the grid ! Press ENTER to continue"
ON_TARGET_MSG_ATTACKED                  DB  76,"- The other player's attack hit a ship ! Hard Luck ! Press ENTER to continue"
NOT_ON_TARGET_MSG_ATTACKED              DB  83,"- The other player's attack didn't hit a ship ! Good Luck ! Press ENTER to continue"

ATTACKX                                 DW ?        
ATTACKY                                 DW ?               
IS_EVEN                                 DB ?
IS_ONTARGET                             DB 0
IS_ATTACKED_BEFORE                      DB 0
IS_ON_GRID                              DB 1
PLAYER_ATTACKING                        DB 1
PLAYER_ATTACKED                         DB 2
GAME_END                                DB 0
SHIP_INDEX                              DB 0
SHIP_SIZE                               DW ?

;---------------- STATISTICS MENU - ------------------------; 
TO_RESTART_GAME                         DB  33,"- To restart the game press ENTER"
TO_QUIT_GAME                            DB  28,"- To quit the game press ESC"
;---------------- STATUS BAR - ------------------------; 
SCORE_CONSTANT_TEXT                     DB  10,"'s score: "
EMPTY_STRING                            DB  100,100 DUP(' ')
CONCATENATED_STRING                     DB  100,"- ",98 DUP(' ')
CHAT_CONSTANT                           DB  1,":"
CHAT_CONSTANT2                          DB  2,"- "

;---------------- STANDALONE CHAT MODE ------------------------; 
PLACE_TO_PRINT_NEXT_MSG                 DW  ?
TYPE_HERE_MSG                           DB  12,"- Type here:"
MAX_MSG_LENGTH                          DB  ?
MESSAGES_QUEUE1                         DB  0,0,100,100 DUP('1')
MESSAGES_QUEUE2                         DB  0,0,100,100 DUP('2') ;Player Index,Has msg,Size,Message
MESSAGES_QUEUE3                         DB  0,0,100,100 DUP('3')
MESSAGES_QUEUE4                         DB  0,0,100,100 DUP('4')
MESSAGES_QUEUE5                         DB  0,0,100,100 DUP('5')
MESSAGES_QUEUE6                         DB  0,0,100,100 DUP('6')
MESSAGES_QUEUE7                         DB  0,0,100,100 DUP('7')
MESSAGES_QUEUE8                         DB  0,0,100,100 DUP('8')
MESSAGES_QUEUE9                         DB  0,0,100,100 DUP('9')
MESSAGES_QUEUEA                         DB  0,0,100,100 DUP('a')
MESSAGES_QUEUEB                         DB  0,0,100,100 DUP('b')
MESSAGES_QUEUEC                         DB  0,0,100,100 DUP('c')
MESSAGES_QUEUED                         DB  0,0,100,100 DUP('d')
MESSAGES_QUEUEE                         DB  0,0,100,100 DUP('e')
MESSAGES_QUEUEF                         DB  0,0,100,100 DUP('f')    

;----------------------- NADER (EXPERIMENTAL) - ------------------------; 

STATUS_TEST1                            DB  35," is a good person and hates oatmeal"
STATUS_TEST2                            DB  68,"- Please select the orientation of the highlighted ship on the right"
                         
;---------------- CELLS SELECTOR------------------------;
SELECTOR_INITIAL_X1                     EQU 20
SELECTOR_INITIAL_Y1                     EQU 19
SELECTOR_INITIAL_X2                     EQU 20
SELECTOR_INITIAL_Y2                     EQU 19
SELECTOR_X1                             DW  ?
SELECTOR_Y1                             DW  ?
SELECTOR_X2                             DW  ?
SELECTOR_Y2                             DW  ?
SELECTOR_GRID_INITIAL_X1                EQU 0
SELECTOR_GRID_INITIAL_Y1                EQU 0
SELECTOR_GRID_X1                        DW  ?
SELECTOR_GRID_Y1                        DW  ?
SELECTOR_GRID_X2                        DW  ?
SELECTOR_GRID_Y2                        DW  ?
JUMP_COUNTER                            DW  1
UP_ORIENTATION                          DB  ?   ;ORIENTATION = 0 : INVALID
DOWN_ORIENTATION                        DB  ?   ;            = 1 : VALID
LEFT_ORIENTATION                        DB  ?
RIGHT_ORIENTATION                       DB  ?
SELECTED_PLAYER_SHIPS                   DB  ?
SELECTOR_STARTING_MSG                   DB  84,"- Please select the starting cell of the highlighted ship on the right (Press ENTER)"
ORIENTATION_SELECTION_MSG               DB  82,"- Please select the orientation of the highlighted ship on the right (Press ENTER)"
NO_POSSIBLE_ORIENTATION                 DB  96,"- Sorry there is no possible orientation on this cell, press ENTER and choose another valid cell"
START_PLACING_SHIPS_MSG                 DB  88,"- You are going to place your ships (on the right) on the grid now, press ENTER to start"
ALL_SHIPS_PLACED_MSG                    DB  53,"- You placed all your ships ! Press ENTER to continue"
;---------------- COORDINATES TRANSFER PARAMETERS ----------
GRID1_X            DW  ?
GRID2_X            DW  ?
GRID1_Y            DW  ?
GRID2_Y            DW  ?
PIXELS1_X          DW  ?
PIXELS2_X          DW  ?
PIXELS1_Y          DW  ?
PIXELS2_Y          DW  ?
;---------------- GAME SCREEN ------------------------------ DONE
GAME_SCREEN_MAX_X   EQU 799
GAME_SCREEN_MAX_Y   EQU 479
;---------------- GRID  ------------------------------------
GRID_SIZE_MAX                   EQU 400
GRID_SQUARE_SIZE_MAX            EQU 44
GRID_SQUARE_SIZE                DW  ?
GRID_MAX_COORDINATE_MIN         EQU 16
GRID_MAX_COORDINATE             DW  ?
GRID_CORNER1_X                  EQU 20
GRID_CORNER1_Y                  EQU 19
GRID_CORNER2_X                  EQU 460
GRID_CORNER2_Y                  EQU 459
GRID_CELLS_MAX_COORDINATE_MIN   EQU 9 
GRID_CELLS_MAX_COORDINATE       DW  ?

;---------------- COLUMN SELECTOR -------------------------- DONE
COLUMN_SELECTOR_ROW                 EQU GRID_CORNER2_Y+2
COLUMN_SELECTOR_CURRENT_COLUMN      DW  ?
COLUMN_SELECTOR_MIN_COLUMN          DW  ?
COLUMN_SELECTOR_MAX_COLUMN          DW  ?

;---------------- COLORS ----------------------------------------
VARIABLE_COLOR      DB  ?
BLACK               EQU  00H
BLUE                EQU  01H
GREEN               EQU  02H
CYAN                EQU  03H
RED                 EQU  04H
MAGENTA             EQU  05H
BROWN               EQU  06H
LIGHT_GRAY          EQU  07H
DARK_GRAY           EQU  08H
LIGHT_BLUE          EQU  09H
LIGHT_GREEN         EQU  0AH
LIGHT_CYAN          EQU  0BH
LIGHT_RED           EQU  0CH
LIGHT_MAGENTA       EQU  0DH
YELLOW              EQU  0EH
WHITE               EQU  0FH
;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?
;---------------- SLIDER DATA ------------------------------------ DONE
SLIDER_BAR_COLUMN   EQU 470
SLIDER_COLUMN       EQU 480
SLIDER_INITIAL_ROW  EQU 473
SLIDER_CURRENT_ROW  DW  SLIDER_INITIAL_ROW
SLIDER_DIRECTION    DB  0   ; 0 UP, 1 DOWN
SLIDER_MAX_UP       EQU  5
SLIDER_MAX_DOWN     EQU 473

;---------------- KEY SCAN CODES ------------------------------- DONE
SPACE_SCANCODE      EQU 39H
F2_SCANCODE         EQU 3CH
F3_SCANCODE         EQU 3DH
EXIT_SCANCODE       EQU 01H
ENTER_SCANCODE      EQU 1CH
UP_SCANCODE         EQU 48H
DOWN_SCANCODE       EQU 50H
RIGHT_SCANCODE      EQU 4DH
LEFT_SCANCODE       EQU 4BH
BACK_SCANCODE       EQU 0EH
P_SCANCODE          EQU 19H
TAB_SCANCODE        EQU 0FH
PLUS_ASCII_CODE     EQU 2BH

;---------------- POWER UPS --------------------------------
POWER_UPS_CARD_WIDTH             EQU 89     ; WITHOUT BORDERS
POWER_UPS_CARD_HEIGHT            EQU 133    ; WITHOUT BORDERS
POWER_UPS_CARD_MARGIN            EQU 15
POWER_UPS_CARD_X1                DW  ?
POWER_UPS_CARD_Y1                DW  ?
POWER_UPS_CARD_X2                DW  ?
POWER_UPS_CARD_Y2                DW  ?
; CARDS CORNERS (WITHOUT BORDERS)
POWER_UPS_CARD1_X1               EQU  GRID_CORNER2_X +((GAME_SCREEN_MAX_X - GRID_CORNER2_X - POWER_UPS_CARD_WIDTH) / 2)
POWER_UPS_CARD1_X2               EQU  POWER_UPS_CARD1_X1 + POWER_UPS_CARD_WIDTH - 1
POWER_UPS_CARD1_Y1               EQU  GRID_CORNER1_Y + 2
POWER_UPS_CARD1_Y2               EQU  POWER_UPS_CARD1_Y1 + POWER_UPS_CARD_HEIGHT - 1
POWER_UPS_CARD2_Y1               EQU  POWER_UPS_CARD1_Y1 +  POWER_UPS_CARD_HEIGHT + POWER_UPS_CARD_MARGIN + 4  
POWER_UPS_CARD2_Y2               EQU  POWER_UPS_CARD2_Y1 + POWER_UPS_CARD_HEIGHT - 1
POWER_UPS_CARD3_Y1               EQU  POWER_UPS_CARD2_Y1 +  POWER_UPS_CARD_HEIGHT + POWER_UPS_CARD_MARGIN + 4  
POWER_UPS_CARD3_Y2               EQU  POWER_UPS_CARD3_Y1 + POWER_UPS_CARD_HEIGHT - 1
TEMP                             DW   ?
MY_POWER_UPS_IS_USED             DB   0, 0, 1
MY_N_AVAILABLE_POWER_UPS         DB   3
IS_MY_ATTACK_TWICE_ACTIVATED     DB   0
IS_MY_REVERSE_ATTACK_ACTIVATED   DB   0
IS_MY_DESTROY_SHIP_ACTIVATED     DB   0
IS_OTHER_PLAYER_ATTACK_TWICE_ACTIVATED        DB   0
IS_OTHER_PLAYER_REVERSE_ATTACK_ACTIVATED      DB   0
IS_OTHER_PLAYER_DESTROY_SHIP_ACTIVATED        DB   0
RANDOM_SHIP                              DB   ?
RANDOM_PLAYER                            DB   ?
RANDOM_NUMBER                            DB   ?
DESTROY_SHIP_MSG                         DB   67,"- Use this to destroy ANY random ship (it can be a ship of yours !)"
ATTACK_TWICE_MSG                         DB   40,"- Use this to attack twice in one turn !"
REVERSED_ATTACK_MSG                      DB   74,"- Use this to redirect your opponent's next attack towards his own ships !"
IN_SECOND_ATTACK_MSG                     DB   70,"- You are now doing the extra attack, you cannot activate a power up !"
REVERSE_A_REVERSED_ATTACK_MSG            DB   98,"- You and your opponent tried to reverse each other's attacks this turn ! " 
                                         DB   "All reverses cancelled !"
YOUR_ATTACK_WAS_REVERSED_MSG             DB   100,"- Looks like your opponent reversed your attack towards your ships !"
                                         DB   " Press ENTER to see the damage !"
OTHER_PLAYER_ACTIVATE_ATTACK_TWICE_MSG   DB  49,"- The other player activate attack twice power up"                                    
POWER_UP_INDEX                           DB   ?

;---------------- MAIN MENU MESSAGES DATA FOR THE USER ------------  DONE
PLEASE_ENTER_YOUR_NAME_MSG  DB    19H,'- Please enter your name:'
PLAYER1_MSG                 DB    8H ,'Player 1' 
PLAYER2_MSG                 DB    8H ,'Player 2'         
PRESS_ENTER_MSG             DB    1DH,'- Press ENTER key to continue' 
TO_START_GAME_MSG           DB    1CH,'- To start the game press F2'
ENTER_LEVEL_MSG             DB    1EH,'- Choose the game level 1 or 2'
TO_END_PROG_MSG             DB    20H,'- To end the program press ESC -'
END_GAME_MSG                DB     27,"- To end the game press ESC"
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL                   DB     1
MSG_1                   DB     1,'1'
MSG_2                   DB     1,'2'
MSG_Dash                DB     1,'-'

;---- NUMBER OF SHIPS AND CELLS ----------------------------------  DONE
N_SHIPS          EQU 10         ; PLAYER 1 NUMBER OF SHIPS
TOTAL_N_CELLS    EQU 32

;---------------- MY DATA ----------------------------------
My_USERNAME         DB  16, ?, 16 DUP ('?')
MY_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
MY_SCORE_STRING                         DB  2 DUP(?)

;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
MY_ATTACKS_ONTARGET_NUM     DW  0
MY_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
MY_ATTACKS_MISSED_NUM       DW  0
MY_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*') 


;-------- MY SHIPS DATA ------------------------------------------
SHIPS LABEL BYTE
SHIPS_POINTS             DW  N_SHIPS * 4 DUP(-2)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
         ; NUMBER OF REMAINING CELLS FOR EACH SHIP
SHIPS_IS_VERTICAL        DW  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
SHIPS_REMAINING_CELLS    DB  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
       
;---------------- Other PLAYER DATA ----------------------------------
OTHER_PLAYER_USERNAME         DB  16, ?, 16 DUP ('?')
OTHER_PLAYER_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
OTHER_PLAYER_SCORE_STRING                         DB  2 DUP(?)

;-------- OTHER PLAYER ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)

OTHER_PLAYER_ATTACKS_ONTARGET_NUM     DW  0
OTHER_PLAYER_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
OTHER_PLAYER_ATTACKS_MISSED_NUM       DW  0
OTHER_PLAYER_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*')
;-------- OTHER PLAYER DESTROYED SHIPS ---------------------------------------------
IS_DESTROYED                            DB ?
DESTROYED_X1                            DW ?
DESTROYED_X2                            DW ?
DESTROYED_Y1                            DW ?
DESTROYED_Y2                            DW ?  
OTHER_PLAYER_DESTROYED_SHIPS            DW  N_SHIPS * 4 DUP(-2)
OTHER_PLAYER_DESTROYED_SHIPS_NUM        DB 0
DESTROYED_SHIP_REMAINING_CELLS          DB 0
DESTROYED_SHIP_ORIENTATION              DW 0
DESTROYED_SHIP_SIZE                     DW 0


.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

        INITIALIZE_PROGRAM
        STARTING_PAGE
        USER_NAMES
STARTING_POINT:
        MAIN_MENU
        GET_LEVEL
        DRAW_STATUS_BAR_TEMPLATE 
        PLAYERS_PLACE_SHIPS
        START_THE_GAME
INITIALIZE_CHAT_MODE:
        STANDALONE_CHAT_MODE
PRE_EXIT_SCREEN:
        DRAW_PRE_EXIT_SCREEN     
THE_END:
        EXIT_GAME

HLT
RET
MAIN    ENDP

;-------------------------------------;
POWER_UP_PICKER_ PROC    NEAR
    ; PARAMETERS
    MOV CL, 1
    MOV DL, 1
    MOV DI, OFFSET MY_N_AVAILABLE_POWER_UPS
    MOV BX, OFFSET MY_POWER_UPS_IS_USED

    CMP BYTE PTR [DI], 0
    JNZ DRAW_THE_CARDS
    JMP END_PICKER
    
    DRAW_THE_CARDS:
    MOV DH, BYTE PTR [DI]
    INC DH
    DRAW_POWER_UP_CARD_BORDER   CL, RED
    ; CL IS THE POSITION INDEX, WE NEED THE POWER UP INDEX
    GET_POWER_UP_INDEX  CL, BX
    PRINT_POWER_UP_MSG  POWER_UP_INDEX
    
    PICKER_WAIT_KEY_PRESS:
    WAIT_FOR_KEY
    MOV AH , KEY_PRESSED
    
    CMP AH, UP_SCANCODE
    JZ MOVE_POWER_UP_UP
    CMP AH, DOWN_SCANCODE
    JZ MOVE_POWER_UP_DOWN
    CMP AH, ENTER_SCANCODE
    JZ ACTIVATE_POWER_UP
    CMP AH, TAB_SCANCODE
    JZ GO_BACK
    CMP AH, BACK_SCANCODE
    JZ GO_BACK
    JMP PICKER_WAIT_KEY_PRESS
    
    CHANGE_HIGHLIGHTED_POWER_UP:
    GET_POWER_UP_INDEX  CL, BX
    PRINT_POWER_UP_MSG  POWER_UP_INDEX
    DRAW_POWER_UP_CARD_BORDER   DL, BLACK
    MOV DL, CL
    DRAW_POWER_UP_CARD_BORDER   CL, RED
    JMP PICKER_WAIT_KEY_PRESS
    
    MOVE_POWER_UP_UP:
    DEC CL
    CMP CL, 0
    JNZ CHANGE_HIGHLIGHTED_POWER_UP
    MOV CL, BYTE PTR [DI]
    JMP CHANGE_HIGHLIGHTED_POWER_UP
    
    MOVE_POWER_UP_DOWN:
    INC CL
    CMP CL, DH 
    JNZ CHANGE_HIGHLIGHTED_POWER_UP
    MOV CL, 1
    JMP CHANGE_HIGHLIGHTED_POWER_UP
    
    ACTIVATE_POWER_UP:
    ; CL IS THE POSITION INDEX, WE NEED THE POWER UP INDEX
    GET_POWER_UP_INDEX   CL, BX
    ; SET AS USED
    MOV AL, POWER_UP_INDEX
    MOV AH, 0
    DEC AX
    ADD BX, AX
    MOV BYTE PTR [BX], 1
    ; DECREMENT N_AVAILABLE_POWER_UPS
    DEC BYTE PTR [DI]
    ; CHECH WHICH POWER UP
    CMP POWER_UP_INDEX, 1
    JZ ACTIVATE_DESTROY_SHIP
    CMP POWER_UP_INDEX, 2
    JZ ACTIVATE_ATTACK_TWICE
    JMP ACTIVATE_REVERSED_ATTACK
    
    
    ACTIVATE_DESTROY_SHIP:
    DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED
    JMP RETURN_TO_GAME
    
    ACTIVATE_ATTACK_TWICE:
    MY_ATTACK_TWICE_POWER_UP_ACTIVATED
    JMP RETURN_TO_GAME
    
    ACTIVATE_REVERSED_ATTACK:
    ;CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    ;JZ  REVERSE_A_REVERSED_ATTACK
    ;MOV IS_REVERSE_ATTACK_ACTIVATED ,1
    JMP RETURN_TO_GAME
    
    ;REVERSE_A_REVERSED_ATTACK:
    ;MOV IS_REVERSE_ATTACK_ACTIVATED , 0
    ; MOV IS_REVERSE_COUNT, 0
    ;PRINT_NOTIFICATION_MESSAGE  REVERSE_A_REVERSED_ATTACK_MSG, 1
    ;PRINT_NOTIFICATION_MESSAGE  PRESS_ENTER_MSG, 2
    ; WAIT_FOR_ENTER_RR:
    ;    MOV AH, 0
    ;   INT 16H
    ;   CMP AH, ENTER_SCANCODE
    ;JNZ WAIT_FOR_ENTER_RR
    ; JMP RETURN_TO_GAME
    
     GO_BACK:
    DRAW_POWER_UP_CARD_BORDER   CL, BLACK
    JMP END_PICKER
    
    RETURN_TO_GAME:
    CLEAR_POWER_UPS
    DRAW_POWER_UPS  

    END_PICKER:
    PRINT_NOTIFICATION_MESSAGE  SELECT_ATTACK_COLUMN_MSG, 1
    RET
POWER_UP_PICKER_    ENDP
;-------------------------------------;
CLEAR_POWER_UPS_    PROC    NEAR
    MOV PIXELS1_X, POWER_UPS_CARD1_X1
    MOV PIXELS1_Y, POWER_UPS_CARD1_Y1
    MOV PIXELS2_X, POWER_UPS_CARD1_X2
    MOV PIXELS2_Y, POWER_UPS_CARD3_Y2
    SUB PIXELS1_X, 2
    SUB PIXELS1_Y, 2
    ADD PIXELS2_X, 2
    ADD PIXELS2_Y, 2
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, WHITE
    RET
CLEAR_POWER_UPS_    ENDP
;-------------------------------------;
GET_POWER_UP_INDEX_      PROC    NEAR
    ; PARAMETERS
    ; AH = POSITION INDEX
    ; BX = IS_USED OFFSET
    ; RETURNS
    ; POWER_UP_INDEX

    MOV CL, AH
    MOV AL, 0   ; COUNTER
    MOV AH, 0   ; POWER UP INDEX
    DEC BX
    GET_POWER_UP_INDEX_LOOP:
        INC BX
        INC AH
        CMP BYTE PTR [BX], 0
        JNZ GET_POWER_UP_INDEX_LOOP
        INC AL
        CMP AL, CL
    JNZ GET_POWER_UP_INDEX_LOOP
    MOV POWER_UP_INDEX, AH
    RET
GET_POWER_UP_INDEX_ ENDP
;-------------------------------------;

PRINT_POWER_UP_MSG_      PROC    NEAR
    ; PARAMETERS
    ; AL = POWER_UP_INDEX
    CMP AL, 1
    JZ PRINT_DESTROY_SHIP_MSG
    
    CMP AL, 2
    JZ PRINT_ATTACK_TWICE_MSG
    
    PRINT_NOTIFICATION_MESSAGE  REVERSED_ATTACK_MSG, 1
    JMP RETURN_TO_PICKER
    
    PRINT_DESTROY_SHIP_MSG:
    PRINT_NOTIFICATION_MESSAGE  DESTROY_SHIP_MSG, 1
    JMP RETURN_TO_PICKER
    
    PRINT_ATTACK_TWICE_MSG:
    PRINT_NOTIFICATION_MESSAGE  ATTACK_TWICE_MSG, 1
    
    RETURN_TO_PICKER:
    RET
PRINT_POWER_UP_MSG_ ENDP
;-------------------------------------;        
MY_ATTACK_TWICE_POWER_UP_ACTIVATED_   PROC    NEAR
   
    MOV IS_MY_ATTACK_TWICE_ACTIVATED  , 1
    SEND_POWER_UP_ACTIVATION ATTACK_TWICE_CODE
    RET
    
MY_ATTACK_TWICE_POWER_UP_ACTIVATED_     ENDP
;-------------------------------------;
OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED_   PROC    NEAR
   
    MOV IS_OTHER_PLAYER_ATTACK_TWICE_ACTIVATED  , 1
    PRINT_NOTIFICATION_MESSAGE OTHER_PLAYER_ACTIVATE_ATTACK_TWICE_MSG , 1
    RET
    
OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED_     ENDP
;-------------------------------------;
DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED_   PROC    NEAR    
     
     MOV IS_MY_DESTROY_SHIP_ACTIVATED  , 1
     MOV AH,2CH               ;GET TIME
     INT 21H 
     
     MOV RANDOM_NUMBER, DH
     MOV CL ,DH
     MOV CH ,00H
     MOV DL ,002
     
     MOV AX , CX               ;DIVIDE THE RANDOM NUMBER BY 2 TO GET RANDOM PLAYER
     DIV DL
     MOV RANDOM_PLAYER , AH
     

     CMP RANDOM_PLAYER , 1
     JZ DESTROY_OTHER_PLAYER_SHIP
     CHOOSE_SHIP_AND_DESTROY_IT
     SEND_POWER_UP_ACTIVATION DESTROY_RANDOM_SHIP_CODE
     DRAW_ALL_DESTROYED_SHIPS
     DRAW_ALL_X_SIGNS MY_INDEX
     RET
    
     DESTROY_OTHER_PLAYER_SHIP:
     SEND_POWER_UP_ACTIVATION DESTROY_RANDOM_SHIP_CODE
     RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT  
     DRAW_ALL_DESTROYED_SHIPS
     DRAW_ALL_X_SIGNS MY_INDEX 
     RET

DESTROY_RANDOM_SHIP_POWER_UP_ACTIVATED_    ENDP
;--------------------------------------;
CHOOSE_SHIP_AND_DESTROY_IT_ PROC NEAR

     MOV AH,2CH               ;GET TIME
     INT 21H 
     
     MOV RANDOM_NUMBER, DH
     MOV CL ,DH
     MOV CH ,00H
     
     MOV DL ,0AH                ;DIVIDE THE RANDOM NUMBER BY 10 TO GET RANDOM SHIP INDEX
     MOV AX , CX
     DIV DL 
     MOV RANDOM_SHIP , AH         
     MOV DL ,RANDOM_SHIP        ;PUT THE RANDOM SHIP INDEX IN DX
     MOV DH ,00
     
     DESTROY_MY_SHIP:
     ;CHECK IF THE SHIP IS ALREADY DESTROYED
     MOV BX, OFFSET SHIPS_REMAINING_CELLS
     ADD BX, DX
     MY_CHECK_ALREADY_DESTROYED:
        CMP BYTE PTR[BX], 0
        JNZ MY_SHIP_NOT_DESTROYED
        INC DX
        INC BX
        CMP DX, 0AH
        JNZ MY_CHECK_ALREADY_DESTROYED
        MOV DX, 0
        MOV BX, OFFSET SHIPS_REMAINING_CELLS
        JMP MY_CHECK_ALREADY_DESTROYED 
       
     MY_SHIP_NOT_DESTROYED:
     MOV BX, OFFSET OTHER_PLAYER_ATTACKS_ONTARGET         ; DESTROY PLAYER MY SHIP --> ADD TO OTHER PLAYER ATTACKS
     MOV AX, OTHER_PLAYER_ATTACKS_ONTARGET_NUM
     MOV CL, 4                                      ; TWO POINTS FOR EACH ATTACK SO FOUR BYTES
     MUL CL                                      
     ADD BX, AX                              ;BX --> THE START POINT WHERE SHOULD I PUT THE DESTROYED SHIP POINTS
     
     MOV DI, OFFSET SHIPS_SIZES
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD DI, AX                       
     MOV AX, [DI]     
     MOV SHIP_SIZE, AX                      ;SHIP_SIZE --> THE SIZE OF THE SHIP
     
     MOV DI, OFFSET SHIPS_REMAINING_CELLS
     MOV AX, DX
     ADD DI, AX                            ; DI --> REMAINING CELLS
     
     MOV SI, OFFSET SHIPS_IS_VERTICAL
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD SI, AX                            ;SI --> IS THE SHIP VERTICAL  
    
     MOV BP, OFFSET SHIPS_POINTS
     MOV AX, DX
     MOV CL, 8
     MUL CL                                      
     ADD BP, AX                           ;BP --> THE START POINT OF THE SHIP
 
     ;INCREASE THE COUNT OF THE ATTACKS
     MOV AX, SHIP_SIZE               ;I EDITED THIS IF THERE WAS AN ERROR
     ADD OTHER_PLAYER_ATTACKS_ONTARGET_NUM, AX
     
     ;DECREASE SCORE
     MOV AL, BYTE PTR [DI]
     MOV DESTROYED_SHIP_REMAINING_CELLS,AL
     SUB MY_SCORE, AL
     PRINT_MY_SCORE

     ;STARTING DESTROY THE SHIP
     MOV AX , [SI]
     MOV DESTROYED_SHIP_ORIENTATION, AX             
     MOV CX , SHIP_SIZE
     MOV DESTROYED_SHIP_SIZE, CX
     MOV BYTE PTR [DI], 0
     CMP AX ,1
     JZ THE_RANDOM_SHIP_IS_VERTICAL
    
 THE_RANDOM_SHIP_IS_HORIZONTAL: 
     MOV DX , DS:[BP]      ;DX ---> X OF THE SHIP
     MOV AX , DS:[BP+2]    ;AX ---> Y OF THE SHIP
     MOV DESTROYED_X1, DX
     MOV DESTROYED_Y1, AX
     LOOP_ON_THE_HSHIP_CELLS:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC DX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_HSHIP_CELLS
     JMP RANDOM_SHIP_DESTROYED

 THE_RANDOM_SHIP_IS_VERTICAL:
     MOV DX , DS:[BP]      ;DX ---> X OF THE SHIP
     MOV AX , DS:[BP+2]    ;AX ---> Y OF THE SHIP
     MOV DESTROYED_X1, DX
     MOV DESTROYED_Y1, AX
     LOOP_ON_THE_VSHIP_CELLS:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC AX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_VSHIP_CELLS
     
     RANDOM_SHIP_DESTROYED:
                     
     RET

CHOOSE_SHIP_AND_DESTROY_IT_ ENDP
;--------------------------------------;
UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP_ PROC NEAR
 

     MOV BX, OFFSET MY_ATTACKS_ONTARGET            ;  DESTROY PLAYER OTHER PLAYER SHIP --> ADD TO MY ATTACKS
     MOV AX, MY_ATTACKS_ONTARGET_NUM
     MOV CL, 4                                      ; TWO POINTS FOR EACH ATTACK SO FOUR BYTES
     MUL CL                                      
     ADD BX, AX                                 ;BX --> THE START POINT WHERE SHOULD I PUT THE DESTROYED SHIP POINTS
     
     ;INCREASE THE COUNT OF THE ATTACKS
     MOV AX, DESTROYED_SHIP_SIZE               
     ADD MY_ATTACKS_ONTARGET_NUM, AX
     
     ;DECREASE SCORE
     MOV AL, DESTROYED_SHIP_REMAINING_CELLS
     SUB OTHER_PLAYER_SCORE, AL
     PRINT_OTHER_PLAYER_SCORE

     ;STARTING DESTROY THE SHIP
     MOV SI, OFFSET OTHER_PLAYER_DESTROYED_SHIPS
     MOV AL, OTHER_PLAYER_DESTROYED_SHIPS_NUM
     MOV CL, 8                                      ; FOUR POINTS FOR EACH SHIP SO EIGHT BYTES
     MUL CL                                      
     ADD SI, AX                                 ;BX --> THE START POINT WHERE SHOULD I PUT THE DESTROYED SHIP POINTS
    
     MOV AL,OTHER_PLAYER_DESTROYED_SHIPS_NUM
     INC AL
     MOV OTHER_PLAYER_DESTROYED_SHIPS_NUM, AL
     
     MOV AX , DESTROYED_SHIP_ORIENTATION            
     MOV CX , DESTROYED_SHIP_SIZE
     CMP AX ,1
     JZ THE_RANDOM_SHIP_IS_VERTICAL1
    
     THE_RANDOM_SHIP_IS_HORIZONTAL1: 
     MOV DX , DESTROYED_X1      ;DX ---> X OF THE SHIP
     MOV AX , DESTROYED_Y1      ;AX ---> Y OF THE SHIP
     MOV [SI], DX
     MOV [SI + 2], AX
     MOV [SI + 6], AX           ;AS IT HORIZONTAL , SO THE SAME Y
     LOOP_ON_THE_HSHIP_CELLS1:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC DX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_HSHIP_CELLS1
     DEC DX
     MOV [SI + 4], DX         ;THE LAST X COORDINATE
     JMP RANDOM_SHIP_DESTROYED1

     THE_RANDOM_SHIP_IS_VERTICAL1:
     MOV DX , DESTROYED_X1     ;DX ---> X OF THE SHIP
     MOV AX , DESTROYED_Y1     ;AX ---> Y OF THE SHIP
     MOV [SI], DX
     MOV [SI + 2], AX
     MOV [SI + 4], DX          ;AS IT VERTICAL , SO THE SAME X
     LOOP_ON_THE_VSHIP_CELLS1:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC AX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_VSHIP_CELLS1
     DEC AX
     MOV [SI + 6], AX          ;THE LAST Y COORDINATE
     
     RANDOM_SHIP_DESTROYED1:
                     
     RET
UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP_ ENDP
;------------------------------------------;
DRAW_POWER_UPS_  PROC    NEAR
    ; PARAMETERS: AL = PLAYER_NUMBER
    ; DRAW THE EMPTY CARDS
    DRAW_POWER_UPS_CARDS    
    
    MOV BX, OFFSET MY_POWER_UPS_IS_USED
    
    START_DRAWING_EMPTY_CARDS:
    MOV CL, 1   ; POWER UP INDEX
    MOV DL, 1   ; POSIION INDEX
    DRAW_ALL_POWER_UPS:
        CMP BYTE PTR [BX], 1
        JZ NEXT_POWER_UP
        DRAW_POWER_UP_GRAPHICS  CL, DL
        INC DL
        NEXT_POWER_UP:
        INC BX
        INC CL
        CMP CL, 4
    JNZ DRAW_ALL_POWER_UPS     
    RET
DRAW_POWER_UPS_ ENDP
;-------------------------------------;

DRAW_POWER_UP_GRAPHICS_     PROC    NEAR
    ; PARAMETERS
    ; AH = POWER UP INDEX, AL = POSITION INDEX
    GET_POWER_UP_GRAPHICS_POSITION  AL
    CMP AH, 1
    JZ DESTROY_SHIP_POWER_UP
    CMP AH, 2
    JZ ATTACK_TWICE_POWER_UP
    DRAW_REVERSED_ATTACK_POWER_UP   
    JMP POWER_UP_DRAWN
    DESTROY_SHIP_POWER_UP:
        DRAW_DESTROY_SHIP_POWER_UP 
        JMP POWER_UP_DRAWN
    ATTACK_TWICE_POWER_UP:
        DRAW_ATTACK_TWICE_POWER_UP 
    POWER_UP_DRAWN:
    RET
DRAW_POWER_UP_GRAPHICS_     ENDP    
;-------------------------------------;

GET_POWER_UP_GRAPHICS_POSITION_  PROC    NEAR
    ; PARAMETERS
    ; AL = POSITION INDEX
    ; RETURNS THE POSITION IN PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y
    MOV PIXELS1_X, POWER_UPS_CARD1_X1
    MOV PIXELS2_X, POWER_UPS_CARD1_X2

    CMP AL, 1
    JZ CARD1
        
    CMP AL, 2
    JZ CARD2

    MOV PIXELS1_Y, POWER_UPS_CARD3_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD3_Y2
    JMP ADD_MARGIN
    
    CARD1:
    MOV PIXELS1_Y, POWER_UPS_CARD1_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD1_Y2
    JMP ADD_MARGIN
    
    CARD2:
    MOV PIXELS1_Y, POWER_UPS_CARD2_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD2_Y2
    
    ADD_MARGIN:
    ; MARGIN
    MOV AX, 28
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    SUB PIXELS2_Y, AX
    RET
GET_POWER_UP_GRAPHICS_POSITION_  ENDP
;-------------------------------------;

DRAW_REVERSED_ATTACK_POWER_UP_    PROC    NEAR
    ; DRAW ARROW 1
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    MOV BX, 0
    MOV AH, 0CH
    MOV AL, BLACK
    ARROW1_TIP1:
        INT 10H
        DEC DX
        INT 10H
        INC CX
        INC BX
        CMP BX, 5
    JNZ ARROW1_TIP1
    MOV BX, 0
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    ARROW1_TIP2:
        INT 10H
        DEC DX
        INT 10H
        ADD DX, 2
        INC CX
        INC BX
        CMP BX, 5
    JNZ ARROW1_TIP2
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    ARROW1_BODY:
        INT 10H
        DEC DX
        INT 10H
        INC DX
        INC CX
        CMP CX, PIXELS2_X
    JNZ ARROW1_BODY

    ; DRAW ARROW 2
    MOV CX, PIXELS2_X
    MOV DX, PIXELS2_Y
    SUB DX, 20
    MOV BX, 0
    ARROW2_TIP1:
        INT 10H
        DEC DX
        INT 10H
        DEC CX
        INC BX
        CMP BX, 5
    JNZ ARROW2_TIP1
    MOV BX, 0
    MOV CX, PIXELS2_X
    MOV DX, PIXELS2_Y
    SUB DX, 20
    ARROW2_TIP2:
        INT 10H
        DEC DX
        INT 10H
        ADD DX, 2
        DEC CX
        INC BX
        CMP BX, 5
    JNZ ARROW2_TIP2
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS2_Y
    SUB DX, 20
    ARROW2_BODY:
        INT 10H
        DEC DX
        INT 10H
        INC DX
        INC CX
        CMP CX, PIXELS2_X
    JNZ ARROW2_BODY

    ; DRAW WALL
    MOV CX, PIXELS1_X
    MOV DX, PIXELS1_Y
    DRAW_WALL:
        INT 10H
        DEC CX
        INT 10H
        INC CX
        INC DX
        CMP DX, PIXELS2_Y
    JNZ DRAW_WALL
    RET
DRAW_REVERSED_ATTACK_POWER_UP_    ENDP
;-------------------------------------;

DRAW_ATTACK_TWICE_POWER_UP_   PROC    NEAR
    MOV AX, PIXELS2_Y
    SUB AX, PIXELS1_Y
    MOV BL, 2
    DIV BL
    MOV AH, 0
    ADD AX, PIXELS1_Y
    MOV TEMP, AX       ; NOW TEMP = MIDDLE Y

    ; DRAW A 2
    ; DRAW 3 HORIZONTAL LINES
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK
    ; DRAW 2 VERTICAL LINES
    DRAW_RECTANGLE  PIXELS2_X, PIXELS1_Y, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS1_X, PIXELS2_Y, BLACK

    ; MAKE IT BOLD
    INC PIXELS1_X
    DEC PIXELS2_X
    INC PIXELS1_Y
    DEC PIXELS2_Y
    INC TEMP
    ; DRAW 3 HORIZONTAL LINES
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK
    ; DRAW 2 VERTICAL LINES
    DRAW_RECTANGLE  PIXELS2_X, PIXELS1_Y, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS1_X, PIXELS2_Y, BLACK
    RET
DRAW_ATTACK_TWICE_POWER_UP_   ENDP
;-------------------------------------;

DRAW_DESTROY_SHIP_POWER_UP_    PROC    NEAR
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, LIGHT_GRAY

    ; DRAW_ITS_BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y

    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, BLACK
      
    ; DRAW_ITS_BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y

    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, BLACK 
  
    ; DRAW 2 XS
    ; RESET THE CORNERS COORDINATES AND ADD MARGIN
    ADD PIXELS1_X, 6
    ADD PIXELS1_Y, 6
    SUB PIXELS2_X, 6
    SUB PIXELS2_Y, 6
    DEC TEMP
    
    MOV CX, PIXELS1_X
    MOV DX, PIXELS1_Y
    MOV AL, RED
    MOV AH, 0CH
    DRAW_X_PT1:
        INT 10H
        ADD DX, 45
        INT 10H
        SUB DX, 45
        DEC DX
        INT 10H
        ADD DX, 45
        INT 10H
        SUB DX, 45
        ADD DX, 2
        INC CX
        CMP CX, PIXELS2_X
    JNZ DRAW_X_PT1
    
    MOV CX, PIXELS1_X
    MOV DX, PIXELS2_Y
    DRAW_X_PT2:
        INT 10H
        SUB DX, 45
        INT 10H
        ADD DX, 45
        DEC DX
        INT 10H
        SUB DX, 45
        INT 10H
        ADD DX, 45
        INC CX
        CMP CX, PIXELS2_X
    JNZ DRAW_X_PT2
    
    RET    
DRAW_DESTROY_SHIP_POWER_UP_    ENDP
;-------------------------------------;

DRAW_POWER_UPS_CARDS_    PROC    NEAR
    ; PARAMETERS


    MOV AL, MY_N_AVAILABLE_POWER_UPS
    CMP AL, 0
    JZ DRAW_NO_CARDS
    CMP AL, 1
    JZ DRAW_ONE_CARD
    CMP AL, 2
    JZ DRAW_TWO_CARDS
    CMP AL, 3
    JZ DRAW_THREE_CARDS
    
    DRAW_THREE_CARDS:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD3_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD3_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   3 , BLACK 
    
    DRAW_TWO_CARDS:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD2_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD2_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   2 , BLACK
    
    DRAW_ONE_CARD:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD1_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD1_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   1 , BLACK 
      
    DRAW_NO_CARDS:   
    RET
DRAW_POWER_UPS_CARDS_    ENDP
;-------------------------------------;

DRAW_POWER_UP_CARD_BORDER_   PROC    NEAR
    ; PARAMETERS
    ; AH = POSITION_INDEX
    ; AL = COLOR
    
    ; X IS THE SAME FOR ALL CARDS
    MOV POWER_UPS_CARD_X1, POWER_UPS_CARD1_X1
    MOV POWER_UPS_CARD_X2, POWER_UPS_CARD1_X2
    
    CMP AH, 1
    JZ SET_CARD1_CORNERS
    CMP AH, 2
    JZ SET_CARD2_CORNERS
    ; SET CARD 3 CORNERS
    MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD3_Y1
    MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD3_Y2
    JMP DRAW_CARD_BORDERS
    SET_CARD1_CORNERS:
        MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD1_Y1
        MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD1_Y2
        JMP DRAW_CARD_BORDERS
    SET_CARD2_CORNERS:
        MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD2_Y1
        MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD2_Y2
        
    DRAW_CARD_BORDERS:
        ; DRAW BORDERS
        DEC POWER_UPS_CARD_X1
        DEC POWER_UPS_CARD_Y1
        INC POWER_UPS_CARD_X2
        INC POWER_UPS_CARD_Y2
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        
        DEC POWER_UPS_CARD_X1
        DEC POWER_UPS_CARD_Y1
        INC POWER_UPS_CARD_X2
        INC POWER_UPS_CARD_Y2
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
    RET
DRAW_POWER_UP_CARD_BORDER_   ENDP
;-------------------------------------;

IS_CELL_ON_GRID_   PROC    NEAR

    CMP ATTACKY, 0
    JL NOT_ON_GRID
    MOV AX, GRID_CELLS_MAX_COORDINATE
    CMP ATTACKY, AX 
    JA NOT_ON_GRID

    MOV IS_ON_GRID, 1
    JMP DETERMINED
    
    NOT_ON_GRID:
    MOV IS_ON_GRID, 0
    DETERMINED:    
    RET

IS_CELL_ON_GRID_   ENDP
;-------------------------------------;

PLACE_SHIPS_ON_GRID_     PROC    NEAR
    ; PARAMETERS
    DRAW_SELECTION_SHIPS 
    MOV CX, 0
    MOV BX, OFFSET SHIPS_POINTS
    MOV DI, OFFSET SHIPS_SIZES
    MOV SI, OFFSET SHIPS_IS_VERTICAL 
    
    DISPLAY_STARTING_MSG:
    PUSH AX
    PRINT_NOTIFICATION_MESSAGE  START_PLACING_SHIPS_MSG, 1
    WAIT_FOR_ENTER_TO_START_PLACING_SHIPS:
        WAIT_FOR_KEY
        MOV AH , KEY_PRESSED
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_START_PLACING_SHIPS
    POP AX

    MOV AH, 0
    PUSH AX ; TO STORE THE PLAYER NUMBER
    PLACE_SHIP:   
        ; HIGHLIGHT THE SHIP TO BE PLACED
        DRAW_SELECTION_SHIP CX, [DI], RED
        
        CELLS_SELECTOR [DI]
        MOV AX, SELECTOR_GRID_X1
        CMP AX, SELECTOR_GRID_X2
        JZ SET_VERTICAL_SHIP
        ; IF HORIZONTAL:
        MOV WORD PTR [SI], 0
        ORDER_CELL_SELECTOR_POINTS 0
        JMP STORE_SHIP_POINTS
        
        ;ELSE IF VERTICAL:
        SET_VERTICAL_SHIP:
        MOV WORD PTR [SI], 1
        ORDER_CELL_SELECTOR_POINTS 1    
        
        STORE_SHIP_POINTS:
        MOV AX, SELECTOR_GRID_X1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_X2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        
        ; REMOVE THE HIGHLIGHTING
        DRAW_SELECTION_SHIP CX, [DI] , DARK_GRAY
        
        POP AX
        DRAW_ALL_SHIPS_ON_GRID 
        PUSH AX
        
        ; NEXT SHIP
        ADD DI, 2
        ADD SI,2
        INC CX
        CMP CX, N_SHIPS
    JNZ PLACE_SHIP
    POP AX
    
    PRINT_NOTIFICATION_MESSAGE  ALL_SHIPS_PLACED_MSG, 1
     
    RET
PLACE_SHIPS_ON_GRID_     ENDP 
 
;-------------------------------------;

ORDER_CELL_SELECTOR_POINTS_   PROC    NEAR
    ; PARAMETERS
    ; AL = IS_VERTICAL (1 IF VERTICAL)
    CMP AL, 1
    JNZ ORDER_HORIZONTAL_SHIP_POINTS
    MOV AX, SELECTOR_GRID_Y1
    CMP AX, SELECTOR_GRID_Y2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_Y2
    MOV SELECTOR_GRID_Y1, BX
    MOV SELECTOR_GRID_Y2, AX
    JMP POINTS_ORDERED
    
    ORDER_HORIZONTAL_SHIP_POINTS:
    MOV AX, SELECTOR_GRID_X1
    CMP AX, SELECTOR_GRID_X2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_X2
    MOV SELECTOR_GRID_X1, BX
    MOV SELECTOR_GRID_X2, AX
    
    POINTS_ORDERED:
    RET
ORDER_CELL_SELECTOR_POINTS_ ENDP
;-------------------------------------;

PIXELS_TO_GRID_    PROC    NEAR
    
   ; 4 PARAMETERS CX:PIXELX , DX:PIXELY , SI:OFFSET GRIDX  , DI:OFFSET GRIDY
    
    SUB CX, GRID_CORNER1_X
    MOV DX, 0
    MOV AX, CX
    DIV GRID_SQUARE_SIZE
    MOV [SI], AX
    
    SUB BX, GRID_CORNER1_Y
    MOV DX, 0
    MOV AX, BX
    DIV GRID_SQUARE_SIZE 
    MOV [DI], AX
    RET

 PIXELS_TO_GRID_ ENDP    
;-------------------------------------; 

GET_ATTACK_COLUMN_  PROC    NEAR
    ; DRAW INITIAL COLUMN SELECTOR
    DRAW_COLUMN_SELECTOR    COLUMN_SELECTOR_MIN_COLUMN, LIGHT_BLUE
    MOV AX, COLUMN_SELECTOR_MIN_COLUMN
    MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX

    ; DISPLAY MESSAGE
    PRINT_NOTIFICATION_MESSAGE  SELECT_ATTACK_COLUMN_MSG, 1

    GET_KEY_PRESSED:
        WAIT_FOR_KEY
        MOV AH , KEY_PRESSED
        CMP AH, ENTER_SCANCODE
        JZ ENTER_PRESSED_COLUMN_SELECTOR
        CMP AH, RIGHT_SCANCODE
        JZ RIGHT_PRESSED
        CMP AH, LEFT_SCANCODE
        JZ LEFT_PRESSED
        CMP AH, TAB_SCANCODE
        JZ THE_USER_NEEDS_POWER_UP
        JMP GET_KEY_PRESSED
        
        
        THE_USER_NEEDS_POWER_UP:
        CMP IS_MY_ATTACK_TWICE_ACTIVATED , 1
        JZ  IN_SECOND_ATTACK
        POWER_UP_PICKER PLAYER_ATTACKING
        JMP GET_KEY_PRESSED
        
        IN_SECOND_ATTACK:
        PRINT_NOTIFICATION_MESSAGE  IN_SECOND_ATTACK_MSG, 1
        JMP GET_KEY_PRESSED
        
        RIGHT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MAX_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MAX_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            ADD COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS
            REACHED_MAX_COLUMN:
                MOV AX, COLUMN_SELECTOR_MIN_COLUMN
                MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS:
                DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
                JMP GET_KEY_PRESSED
                
        LEFT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MIN_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MIN_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            SUB COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS_
            REACHED_MIN_COLUMN:
                MOV AX, COLUMN_SELECTOR_MAX_COLUMN
                MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS_:
                DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
                JMP GET_KEY_PRESSED
                
        ENTER_PRESSED_COLUMN_SELECTOR:
        RET
GET_ATTACK_COLUMN_  ENDP        
;-------------------------------------;

SET_LEVEL_SETTINGS_  PROC   NEAR
    ; PARAMETERS AL: 1 OR 2 (LEVEL)
    ; GRID SQUARE SIZE
    MOV LEVEL, AL
    MOV BL, AL
    MOV AX, GRID_SQUARE_SIZE_MAX
    DIV BL
    MOV AH, 0
    MOV GRID_SQUARE_SIZE, AX
    ; GRID MAX COORDINATE
    MOV AX, GRID_MAX_COORDINATE_MIN
    MUL BL
    MOV GRID_MAX_COORDINATE, AX
    ; GRID CELLS MAX COORDINATE
    MOV AX, GRID_CELLS_MAX_COORDINATE_MIN
    MUL BL
    MOV AH, 0
    MOV GRID_CELLS_MAX_COORDINATE, AX
    CMP BL, 2
    JNZ COLUMN_SELECTOR_MIN_AND_MAX
    INC GRID_CELLS_MAX_COORDINATE
    ; COLUMN SELECTOR MIN AND MAX
    COLUMN_SELECTOR_MIN_AND_MAX:
    MOV AX, GRID_SQUARE_SIZE
    MOV BL, 2
    DIV BL
    MOV CL, AL
    MOV CH, 0
    ADD CX, GRID_CORNER1_X
    MOV COLUMN_SELECTOR_MIN_COLUMN, CX
    MOV AH, 0
    MOV CX, GRID_CORNER2_X
    SUB CX, AX
    MOV COLUMN_SELECTOR_MAX_COLUMN, CX
    RET
SET_LEVEL_SETTINGS_ ENDP
;-------------------------------------;
DRAW_SELECTION_SHIPS_   PROC    NEAR
    ; PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX, 0
    MOV DI, OFFSET SHIPS_SIZES
    
    DRAW_ALL_SELECTION_SHIPS:
        DRAW_SELECTION_SHIP CX, [DI], DARK_GRAY
        ADD DI, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ DRAW_ALL_SELECTION_SHIPS
    RET
DRAW_SELECTION_SHIPS_   ENDP
;-------------------------------------;

DRAW_SELECTION_SHIP_     PROC    NEAR
    ; PARAMETERS
    ; AX = INDEX, BX = SIZE, CL = BORDER_COLOR
    MOV DX, GRID_MAX_COORDINATE
    SUB DX, BX
    INC DX
    MOV GRID1_X, DX
    MOV DX, GRID_MAX_COORDINATE
    MOV GRID2_X, DX
    MOV GRID1_Y, AX
    MOV GRID2_Y, AX
    MOV DL, CL
    DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, LIGHT_GRAY, DL
    RET
DRAW_SELECTION_SHIP_ ENDP

;-------------------------------------;

DRAW_SHIP_      PROC    NEAR
    ; PARAMETERS
    ; AX = POINT1_X, BX = POINT1_Y, CX = POINT2_X, SI = POINT2_Y, DL = BORDER_COLOR, DH = SHIP_COLOR
    GRID_TO_PIXELS AX, BX, CX, SI
   
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE LOWER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    MOV AX, PIXELS2_Y
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_Y, AX

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL   
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    SUB PIXELS2_Y, AX
    
    ; DRAW THE SHIP
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DH
    
    ; DRAW SHIP BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL
    
    ; SECOND LAYER 
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL 

    
    
    RET
DRAW_SHIP_  ENDP
;-------------------------------------;

GRID_TO_PIXELS_     PROC    NEAR
    ; PARAMETERS
    ; GRID1_X, GRID1_Y, GRID2_X, GRID2_Y
    ; GRID TO PIXELS (UPPER LEFT CORNER)
    
    ; OUTPUT
    ; PIXEL1_X, PIXEL1_Y, PIXEL2_X, PIXEL2_Y
    
    ; PIXEL X = GRID_CORNER1_X + GRID_SQUARE_SIZE * GRID_X
    ; PIXEL Y = GRID_CORNER1_Y + GRID_SQUARE_SIZE * GRID_Y
    
    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS1_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS1_Y, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS2_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS2_Y, AX
    
    RET
GRID_TO_PIXELS_     ENDP
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
GET_USER_NAME_     PROC NEAR
     
     PRINT_MESSAGE PLEASE_ENTER_YOUR_NAME_MSG , 1025H , 0FF0FH
     PRINT_MESSAGE PRESS_ENTER_MSG , 1425H , 0FF0FH

START_WRITING_HERE:  
     DRAW_RECTANGLE  368,280,450,305,BLACK        
     MOV AH,02H             ;MOVE THE CURSOR
     MOV DX,122FH
     INT 10H

     MOV AH,0AH            ;GET THE USER INPUT AND STORE IT IN USERNAME1 OR USERNAME2(SENT PARAMETER)
     MOV DX,DI
     INT 21H
     MOV BL,[DI+2]
     CMP BL,'A'
     JB START_WRITING_HERE
     CMP BL,'Z'
     JBE GET_USERNAME_SUCCESSFULLY
     CMP BL,'a'
     JB START_WRITING_HERE
     CMP BL,'z'
     JA START_WRITING_HERE
     
 
     GET_USERNAME_SUCCESSFULLY:    
     RET     
 GET_USER_NAME_     ENDP
;-------------------------------------;
USER_NAMES_     PROC NEAR
    
     GET_USER_NAME MY_USERNAME
     CLEAR_GAME_SCREEN  BLACK 
     DRAW_NOTIFICATION_BAR
     PRINT_NOTIFICATION_MESSAGE WAITING_FOR_USERNAME, 1
     
     MOV DUMMY_COUNTER, 0 ; DUMMY COUNTER
     
     MOV BX, OFFSET RECEIVE_DATA_BUFFER
     RECEIVE_DATA
     CMP BYTE PTR [BX], 0
     JE SEND_USERNAME
     
     RECEIVE_USERNAME:
     CMP BYTE PTR [BX], 0
     JE NO_USERNAME_ERROR
     CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
     INC BX
     CMP BYTE PTR [BX], USERNAME_CODE
     JNE NO_USERNAME_ERROR
     INC BX
     MOV CL, BYTE PTR [BX]
     MOV OTHER_PLAYER_USERNAME + 1, CL
     MOV CH, 0
     INC BX
     MOV DI, OFFSET OTHER_PLAYER_USERNAME + 2
     READ_USERNAME:
        MOV AL, BYTE PTR [BX]
        MOV BYTE PTR [DI], AL
        INC BX
        INC DI
     LOOP READ_USERNAME 
     INC DUMMY_COUNTER
     CMP DUMMY_COUNTER, 2
     JNE SEND_USERNAME
     RET
     
     SEND_USERNAME:
     ADD_BYTE_TO_SEND_BUFFER    USERNAME_CODE, DATA_BUFFER_INDEX
     ; SEND MY USERNAME
     MOV BX, OFFSET MY_USERNAME+1
     MOV CL, BYTE PTR [BX] ; CX = USERNAME SIZE
     INC BX                ; BX -> ACTUAL USERNAME
     ADD_BYTE_TO_SEND_BUFFER    CL, DATA_BUFFER_INDEX
     MOV CH, 0
     WRITE_USERNAME:
        MOV DL, BYTE PTR [BX]
        ADD_BYTE_TO_SEND_BUFFER DL, DATA_BUFFER_INDEX
        INC BX
     LOOP WRITE_USERNAME 
     SEND_DATA  DATA_BUFFER_INDEX
     
     INC DUMMY_COUNTER
     CMP DUMMY_COUNTER, 2
     JNE RECEIVE_USERNAME_SECOND
     RET
     
     RECEIVE_USERNAME_SECOND:
     MOV BX, OFFSET RECEIVE_DATA_BUFFER
     WAIT_FOR_USERNAME:
         RECEIVE_DATA
         CMP BYTE PTR [BX], 0
     JE WAIT_FOR_USERNAME
     JMP RECEIVE_USERNAME
     
     NO_USERNAME_ERROR:
     MOV AH, 2
     MOV DL, 'M'
     INT 21H
     RET 
USER_NAMES_     ENDP
;-------------------------------------;
MAIN_MENU_     PROC NEAR
  ;CLEARS THE WHOLE SCREEN
  DRAW_RECTANGLE  0, 0, 800, 600, BLACK 
  ; PRINT MESSAGES
  PRINT_MESSAGE SEND_GAME_INVITATION_MSG , 1022H , 0FF28H
  PRINT_MESSAGE SEND_CHAT_INVITATION_MSG, 1222H, 0FF02H
  PRINT_MESSAGE TO_END_PROG_MSG , 1425H , 0FF03H
  PRINT_NOTIFICATION_MESSAGE    EMPTY_STRING, 1
  ; CHECK FOR INVITATIONS
  MOV BX, OFFSET RECEIVE_DATA_BUFFER

  CHECK_FOR_INVITATIONS:
      ; CHECK IF AN INVITATION IS RECEIVED
      RECEIVE_DATA
      MOV BX, OFFSET RECEIVE_DATA_BUFFER
      CMP BYTE PTR [BX], 0
      JNE INVITATION_RECEIVED
      ; CHECK IF THE PLAYER WANTS TO SEND AN INVITATION (OR EXIT)
      MOV AH, 1
      INT 16H
      JZ CHECK_FOR_INVITATIONS
      MOV AH, 0
      INT 16H
      CMP AH, F2_SCANCODE
      JE SEND_GAME_INVITATION
      CMP AH, F3_SCANCODE
      JE SEND_CHAT_INVITATION
      CMP AH,EXIT_SCANCODE
      JE THE_END
  JMP CHECK_FOR_INVITATIONS
  
  SEND_GAME_INVITATION:
  ADD_BYTE_TO_SEND_BUFFER GAME_INVITATION_CODE, DATA_BUFFER_INDEX
  SEND_DATA     DATA_BUFFER_INDEX
  MOV IS_HOST, 1
  MOV GAME_MODE, PLAY_MODE
  PRINT_NOTIFICATION_MESSAGE    SENT_GAME_INVITATION_MSG, 1
  JMP WAIT_FOR_INVITATION_RESPONSE
  
  SEND_CHAT_INVITATION:
  ADD_BYTE_TO_SEND_BUFFER CHAT_INVITATION_CODE, DATA_BUFFER_INDEX
  SEND_DATA     DATA_BUFFER_INDEX
  MOV IS_HOST, 1
  MOV GAME_MODE, CHAT_MODE
  PRINT_NOTIFICATION_MESSAGE    SENT_CHAT_INVITATION_MSG, 1
  
  WAIT_FOR_INVITATION_RESPONSE:
  MOV BX, OFFSET RECEIVE_DATA_BUFFER
  CHECK_FOR_RESPONSE:
    RECEIVE_DATA
    CMP BYTE PTR [BX], 0
    JNE CHECK_RESPONSE
    ; CHECK IF THE INVITATION IS CANCELLED
    MOV AH, 1
    INT 16H
    JZ CHECK_FOR_RESPONSE
    MOV AH, 0
    INT 16H
    CMP AH, SPACE_SCANCODE
    JE CANCEL_INVITATION
    CMP AH, EXIT_SCANCODE
    JE THE_END
   JMP CHECK_FOR_RESPONSE
   
   CANCEL_INVITATION:
   ADD_BYTE_TO_SEND_BUFFER CANCEL_INVITATION_CODE, DATA_BUFFER_INDEX
   SEND_DATA    DATA_BUFFER_INDEX
   PRINT_NOTIFICATION_MESSAGE    YOU_CANCELLED_MSG, 1
   JMP CHECK_FOR_INVITATIONS 
   
   CHECK_RESPONSE:
   CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
   MOV BX, OFFSET RECEIVE_DATA_BUFFER+1
   CMP BYTE PTR [BX], ACCEPT_INVITATION_CODE
   JE INVITATION_ACCEPTED
   CMP BYTE PTR [BX], REJECT_INVITATION_CODE
   JE INVITATION_REJECTED
   JMP CHECK_FOR_RESPONSE
   
   INVITATION_REJECTED:
   PRINT_NOTIFICATION_MESSAGE    INVITATION_REJECTED_MSG, 1
   JMP CHECK_FOR_INVITATIONS
   
   INVITATION_ACCEPTED:
   PRINT_NOTIFICATION_MESSAGE    INVITATION_ACCEPTED_MSG, 1
   JMP START_GAME_MODE
    
   INVITATION_RECEIVED:
   MOV IS_HOST, 0
   CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
   MOV BX, OFFSET RECEIVE_DATA_BUFFER+1
   MOV AL, BYTE PTR [BX]
   CMP AL, GAME_INVITATION_CODE
   JE GAME_INVITATION_RECEIVED
   CMP AL, CHAT_INVITATION_CODE
   JNE CHECK_FOR_INVITATIONS
   CHAT_INVITATION_RECEIVED:
   PRINT_NOTIFICATION_MESSAGE    RECEIVED_CHAT_INVITATION_MSG, 1
   MOV GAME_MODE, CHAT_MODE
   JMP CHECK_FOR_USER_RESPONSE
   
   GAME_INVITATION_RECEIVED:
   MOV GAME_MODE, PLAY_MODE
   PRINT_NOTIFICATION_MESSAGE    RECEIVED_GAME_INVITATION_MSG, 1
   
   CHECK_FOR_USER_RESPONSE:
     ; CHECK IF THE INVITATION IS CANCELLED
     MOV BX, OFFSET RECEIVE_DATA_BUFFER
     RECEIVE_DATA
     CMP BYTE PTR [BX], 0
     JNE IS_INVITATION_CANCELLED
     MOV AH, 1
     INT 16H
     JZ CHECK_FOR_USER_RESPONSE
     MOV AH, 0
     INT 16H
     CMP AH, ENTER_SCANCODE
     JE ACCEPT_INVITATION
     CMP AH, SPACE_SCANCODE
     JE REJECT_INVITATION
     CMP AH, EXIT_SCANCODE
     JE THE_END
   JMP CHECK_FOR_USER_RESPONSE
     
   IS_INVITATION_CANCELLED:
   CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
   MOV BX, OFFSET RECEIVE_DATA_BUFFER+1
   CMP BYTE PTR[BX], CANCEL_INVITATION_CODE
   JE INVITATION_WAS_CANCELLED
   JMP CHECK_FOR_USER_RESPONSE
   
   INVITATION_WAS_CANCELLED:
   PRINT_NOTIFICATION_MESSAGE    INVITATION_CANCELLED_MSG, 1; 
   JMP CHECK_FOR_INVITATIONS
 
   ACCEPT_INVITATION:
   ADD_BYTE_TO_SEND_BUFFER      ACCEPT_INVITATION_CODE, DATA_BUFFER_INDEX
   SEND_DATA    DATA_BUFFER_INDEX
   PRINT_NOTIFICATION_MESSAGE    YOU_ACCEPTED_MSG, 1
   JMP START_GAME_MODE  
    
   REJECT_INVITATION:
   ADD_BYTE_TO_SEND_BUFFER   REJECT_INVITATION_CODE, DATA_BUFFER_INDEX
   SEND_DATA    DATA_BUFFER_INDEX
   PRINT_NOTIFICATION_MESSAGE    YOU_REJECTED_MSG, 1
   JMP CHECK_FOR_INVITATIONS  
  
     
   START_GAME_MODE:
   CMP GAME_MODE,CHAT_MODE
   JE INITIALIZE_CHAT_MODE
   CLEAR_GAME_SCREEN BLACK 
   RET 
MAIN_MENU_     ENDP
;-------------------------------------;
INITIALIZE_PROGRAM_     PROC NEAR
        
      
        MOV AX,4F02H           ;GO TO VIDEOMODE 800*600
        MOV BX,103H
        INT 10H
        INITIALIZE_SERIAL_PORT

     RET 
INITIALIZE_PROGRAM_     ENDP
;-------------------------------------;
GET_LEVEL_     PROC NEAR
 CMP IS_HOST, 1
 JNE WAIT_FOR_LEVEL
 
 PRINT_MESSAGE ENTER_LEVEL_MSG , 1025H , 0FF0FH
 PRINT_MESSAGE MSG_DASH , 122EH , 0FF0FH
 PRINT_MESSAGE MSG_1 , 122FH , 0FF0FH
 PRINT_MESSAGE MSG_2 , 123AH , 0FF0FH
 PRINT_NOTIFICATION_MESSAGE CHOOSE_LEVEL_MSG, 1
  NOTVALID2:
        
        MOV AH,0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JNE NO_EXIT
        SEND_EXIT_GAME
        NO_EXIT:
        CMP AH , RIGHT_SCANCODE
        JZ MOVE_THE_DASH_TO_RIGHT
        CMP AH , LEFT_SCANCODE
        JZ MOVE_THE_DASH_TO_LEFT
        CMP AH , ENTER_SCANCODE
        JZ THE_LEVEL_IS_KNOWN_NOW
        JNZ NOTVALID2
       
    MOVE_THE_DASH_TO_RIGHT:
    DRAW_RECTANGLE  368,292,375,297,BLACK
    PRINT_MESSAGE MSG_DASH , 1239H , 0FF0FH
    MOV DL ,2
    MOV LEVEL , DL
    JMP NOTVALID2
    
    MOVE_THE_DASH_TO_LEFT:
     DRAW_RECTANGLE  455,292,464,297,BLACK
    PRINT_MESSAGE MSG_DASH , 122EH , 0FF0FH
    MOV DL ,1
    MOV LEVEL , DL
    JMP NOTVALID2
    
   
    
    THE_LEVEL_IS_KNOWN_NOW:
    
    ; SEND THE LEVEL TO PLAYER 2
    CMP LEVEL, 1
    JNE SEND_LEVEL2
    ADD_BYTE_TO_SEND_BUFFER    LEVEL1_CODE, DATA_BUFFER_INDEX
    SEND_DATA   DATA_BUFFER_INDEX
    JMP SET_LEVEL
    
    SEND_LEVEL2:
    ADD_BYTE_TO_SEND_BUFFER    LEVEL2_CODE, DATA_BUFFER_INDEX
    SEND_DATA   DATA_BUFFER_INDEX
    JMP SET_LEVEL
    
    WAIT_FOR_LEVEL:
    MOV BX, OFFSET RECEIVE_DATA_BUFFER
    PRINT_NOTIFICATION_MESSAGE  HOST_CHOOSING_LEVEL, 1
    KEEP_WAITING_FOR_LEVEL:
        RECEIVE_DATA
        CMP BYTE PTR [BX], 0
    JE KEEP_WAITING_FOR_LEVEL
    CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
    MOV AL, BYTE PTR [BX+1]
    SUB AL, LEVEL1_CODE-1
    MOV LEVEL, AL
        
    SET_LEVEL:
    CMP LEVEL , 1
    JNZ SET_LEVEL2
        
    SET_LEVEL1:
        SET_LEVEL_SETTINGS 1
        JMP BACK
    SET_LEVEL2:
        SET_LEVEL_SETTINGS 2
        JMP BACK
 
   BACK:
   RET
GET_LEVEL_     ENDP
;-------------------------------------;

DRAW_ALL_SHIPS_ON_GRID_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX,0  
    MOV SI, OFFSET SHIPS_POINTS
    MOV DI, OFFSET SHIPS_REMAINING_CELLS    
   
 DRAW_ALL_SHIPS:
    MOV AL,BYTE PTR[DI]
    AND AL, AL
    JNZ NOT_DESTROYED_SHIP
            
    MOV AL , BLACK
    MOV VARIABLE_COLOR , AL
    JMP COMPLETE_DRAWING_SHIPS
            
    NOT_DESTROYED_SHIP:
    MOV AL , LIGHT_GRAY
    MOV VARIABLE_COLOR , AL
            
    COMPLETE_DRAWING_SHIPS:
    MOV DX, WORD PTR [SI]
    MOV GRID1_X, DX
    MOV DX, WORD PTR [SI + 2]
    MOV GRID1_Y, DX
    MOV DX, WORD PTR [SI + 4]
    MOV GRID2_X, DX
    MOV DX, WORD PTR [SI + 6]
    MOV GRID2_Y, DX
    DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, VARIABLE_COLOR , DARK_GRAY
    ADD SI, 8
    INC DI
    INC CX
    CMP CX, N_SHIPS
    JNZ DRAW_ALL_SHIPS
    RET
    
    DRAW_ALL_SHIPS_ON_GRID_   ENDP
;-------------------------------------;
DRAW_X_SIGN_   PROC    NEAR

     GRID_TO_PIXELS GRID1_X, GRID1_Y, GRID1_X, GRID1_Y 
      
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE UPPER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    
    ; GET LOWER Y TO CHECK THE END OF X-SIGN
    MOV BP, PIXELS2_Y
    ADD BP, GRID_SQUARE_SIZE

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 5
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    ADD PIXELS2_Y, AX                ;POINT 2 IS THE UPPER RIGHT CORNER
    SUB BP,AX                        ;BP HAS THE LOWER Y
    
 
    MOV SI,PIXELS2_X        ;THE UPPER RIGHT CORNER COORDINATES
    MOV DI,PIXELS2_Y  
    
    MOV AH,0CH 
    MOV CX,PIXELS1_X        ;THE UPPER LEFT CORNER COORDINATES
    MOV DX,PIXELS1_Y  
    
    MOV AL,VARIABLE_COLOR
    MOV BX,00               ;I WILL NEED IT TO CHECK THE NEXT ITERATION IS ODD OR EVEN 
    NEXT_TWO_PIXELS: 
         
         INT 10H           ;DRAW EACH PIXEL 3 TIMES TO MAKE THE IT BOLD ( MORE OBVIOUS )
         INC CX
         INT 10H
         SUB CX,2
         INT 10H
         INC CX
         
         EVENORODD  BX                   ;AT EVEN ITERATIONS I DRAW \ SO INC CX
         CMP IS_EVEN,0                    ;AT ODD ITERATIONS I DRAW / SO DEC CX
         JNE IF_ODD
         IF_EVEN: 
             INC CX
             JMP DONE
             IF_ODD:  
                 DEC CX 
         DONE:
         INC DX
         XCHG CX , SI
         XCHG DX , DI
         INC BX
         CMP DX, BP
         JNZ NEXT_TWO_PIXELS
         
         RET

 DRAW_X_SIGN_   ENDP
;-----------------------------------------; 
DRAW_ALL_X_SIGNS_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    CMP AL, 1
    JNZ OTHER_PLAYER_ALL_ATTACKS
    MOV SI, OFFSET MY_ATTACKS_ONTARGET 
    MOV DI, OFFSET MY_ATTACKS_MISSED 
    MOV CX, MY_ATTACKS_ONTARGET_NUM 
    MOV DX, MY_ATTACKS_MISSED_NUM    
    JMP DRAW_ALL_ATTACKS
    
    OTHER_PLAYER_ALL_ATTACKS:  
    MOV SI, OFFSET OTHER_PLAYER_ATTACKS_ONTARGET 
    MOV DI, OFFSET OTHER_PLAYER_ATTACKS_MISSED
    MOV CX, OTHER_PLAYER_ATTACKS_ONTARGET_NUM 
    MOV DX, OTHER_PLAYER_ATTACKS_MISSED_NUM  
         
        DRAW_ALL_ATTACKS:
            ONTARGET_ATTACKS:
               CMP CX,0
               JZ MISSED_ATTACKS
               MOV AX,[SI]
               MOV GRID1_X,AX
               MOV AX,[SI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 0CH
               ADD SI,4
               DEC CX
               JMP ONTARGET_ATTACKS
               
               
            MISSED_ATTACKS: 
               CMP DX,0
               JZ ALL_DRAWN
               MOV AX,[DI]
               MOV GRID1_X,AX
               MOV AX,[DI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 00H
               ADD DI,4
               DEC DX
               JMP MISSED_ATTACKS
      ALL_DRAWN:         
        
     RET
           
DRAW_ALL_X_SIGNS_   ENDP
;-------------------------------------; 
DRAW_ALL_DESTROYED_SHIPS_  PROC NEAR
   
    MOV CL, OTHER_PLAYER_DESTROYED_SHIPS_NUM
    MOV CH, 0
    MOV SI, OFFSET OTHER_PLAYER_DESTROYED_SHIPS
    
    CMP CX, 0
    JE FINISH_DESTROYED_SHIPS
    
    DRAW_DESTROYED_SHIPS:
    MOV DX, WORD PTR [SI]
    MOV GRID1_X, DX
    MOV DX, WORD PTR [SI + 2]
    MOV GRID1_Y, DX
    MOV DX, WORD PTR [SI + 4]
    MOV GRID2_X, DX
    MOV DX, WORD PTR [SI + 6]
    MOV GRID2_Y, DX
    DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, BLACK ,BLACK

    ADD SI, 8
    LOOP DRAW_DESTROYED_SHIPS
    
    FINISH_DESTROYED_SHIPS:
    RET

DRAW_ALL_DESTROYED_SHIPS_  ENDP
;-------------------------------------; 
;SCORES_SCENE_ PROC NEAR
    
   ; CLEAR_GAME_SCREEN BLACK                        
    ;PLAYER 1 SCORE
    ; PRINT_MESSAGE P1_USERNAME+1,1218H,0FH  
    
    ; MOV DL,18H
    ; MOV DH,12H ;Y
    ; ADD DL,P1_USERNAME+1  ;X
    ; PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH   

    ;PLAYER 2 SCORE
    ;PRINT_MESSAGE P2_USERNAME+1,1233H,0FH
    
    ;MOV DH,12H ;Y
    ;MOV DL,33H
    ;ADD DL,P2_USERNAME+1  ;X
    ;PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH  
    
    ;PRINT_PLAYER1_SCORE 18H, 12H
    ;PRINT_PLAYER2_SCORE 33H, 12H
    
    
    ;PRINT_MESSAGE PRESS_ENTER_MAIN_MENU_MSG ,141AH ,0FH  
    ;ENTER_AT_SCORE_SCENE:
    ; MOV AH,0
       ; INT 16H
       ; CMP AH,ENTER_SCANCODE
       ; JNZ ENTER_AT_SCORE_SCENE
       
       ;RET
    
       ;SCORES_SCENE_ ENDP
;-----------------------------------------;

 CELL_HAS_SHIP_   PROC    NEAR
  
     MOV CX,0
     MOV SI, OFFSET SHIPS_POINTS
     MOV DI, OFFSET SHIPS_IS_VERTICAL       
          
          CHECK_SHIP:
          MOV BX, [DI]              
          CMP BX ,1                 
          JNZ HORIZONTAL_SHIP
          
          MOV  AX, GRID1_X
          CMP  AX ,  WORD PTR[SI]
          JNE  EDIT_AND_CHECK_AGAIN  
          MOV  AX, GRID1_Y
          CMP  AX , WORD PTR[SI + 2]                       
          JB EDIT_AND_CHECK_AGAIN
          CMP  AX , WORD PTR[SI + 6] 
          JA  EDIT_AND_CHECK_AGAIN
          JBE THE_ATTACK_WAS_ON_TARGET
             
          HORIZONTAL_SHIP:  
          MOV  AX, GRID1_Y
          CMP  AX ,  WORD PTR[SI + 2]
          JNE  EDIT_AND_CHECK_AGAIN 
          MOV  AX, GRID1_X      
          CMP AX , WORD PTR[SI]                      
          JB EDIT_AND_CHECK_AGAIN
          CMP AX , WORD PTR[SI + 4]
          JA  EDIT_AND_CHECK_AGAIN
          JBE THE_ATTACK_WAS_ON_TARGET
              
                
          THE_ATTACK_WAS_ON_TARGET:
          MOV IS_ONTARGET,1
          MOV SHIP_INDEX , CL
          RET
               
          EDIT_AND_CHECK_AGAIN:
          ADD SI, 8
          ADD DI, 2
          INC CX
          CMP CX ,N_SHIPS
          JNZ CHECK_SHIP
          MOV IS_ONTARGET,0
          RET  
          
  CELL_HAS_SHIP_   ENDP
;-------------------------------------; 
IS_CELL_ATTACKED_BEFORE_  PROC NEAR
    
    MOV BX,0
    MOV SI, OFFSET OTHER_PLAYER_ATTACKS_ONTARGET 
    MOV DI, OFFSET OTHER_PLAYER_ATTACKS_MISSED
    MOV CX, OTHER_PLAYER_ATTACKS_ONTARGET_NUM 
    MOV DX, OTHER_PLAYER_ATTACKS_MISSED_NUM 
         
    CHECK_ALL_ATTACKS:
    CMP CX ,0
    JZ CHECK_MISSED_ATTACKS
    MOV AX, [SI]
    CMP AX,ATTACKX                       
    JNZ CHECK_NEXT_ATTACK1
    MOV AX, [SI + 2]
    CMP AX,ATTACKY
    JNZ CHECK_NEXT_ATTACK1
    MOV IS_ATTACKED_BEFORE,1
    RET      
    CHECK_NEXT_ATTACK1:  
    ADD SI,4
    DEC CX 
    JMP CHECK_ALL_ATTACKS
                                                
    CHECK_MISSED_ATTACKS:     
    MOV SI,DI
    MOV CX,DX
    INC BX
    CMP BX,2                   ;AX IS USED TO REPEAT THE OPERATION TWICE (ONE FOR MISSED AND ONE FOR ONYARGET)
    JNZ CHECK_ALL_ATTACKS
                                                                                        
    MOV IS_ATTACKED_BEFORE,0
    RET      
                                               

IS_CELL_ATTACKED_BEFORE_   ENDP
;-------------------------------------; 
GET_CELL_FROM_PLAYER_  PROC NEAR
         
         GET_ATTACK_COLUMN                ;IT MODIFY COLUMN_SELECTOR_CURRENT_COLUMN
         PRINT_NOTIFICATION_MESSAGE  FIRE_SLIDER_MSG, 1
         DRAW_SLIDER_BAR
         FIRE_SLIDER                      ;IT MODIFY  SLIDER_CURRENT_ROW
         PIXELS_TO_GRID COLUMN_SELECTOR_CURRENT_COLUMN , SLIDER_CURRENT_ROW , ATTACKX , ATTACKY
         

         MOV AX , ATTACKX   
         MOV AH , 0   
         MOV WORD PTR[SI], AX        ;PUT IT IN THE FUNCTION PARAMETER TO BE USED LATER
         MOV ATTACKX,AX

         MOV AX , ATTACKY
         MOV AH , 0
         MOV WORD PTR[DI], AX        ;PUT IT IN THE FUNCTION PARAMETER TO BE USED LATER
         MOV ATTACKY,AX
         
         RET
         
GET_CELL_FROM_PLAYER_   ENDP
;-------------------------------------;
 
EVENORODD_  PROC NEAR
    ; PARAMETERS
    ; BX = NUMBER
    MOV AX,BX
    MOV DL,2
    DIV DL
    MOV IS_EVEN,AH
    RET                  
EVENORODD_   ENDP
;-----------------------------------------;
ATTACKED_CHECK_CELL_AND_UPDATE_ATTACKS_DATA_  PROC NEAR
    IS_CELL_ON_GRID      ;-----> FIRST CHECK

    CMP IS_ON_GRID, 0
    JZ ATTACKED_DATA_UPDATED
   
    IS_CELL_ATTACKED_BEFORE PLAYER_ATTACKING        ;-----> SECOND CHECK
    CELL_HAS_SHIP ATTACKX , ATTACKY     ;-----> THIRD CHECK
    
    CMP IS_ATTACKED_BEFORE , 1
    JZ ATTACKED_DATA_UPDATED                    ;NO DATA NEEDS TO BE UPDATED IF PLAYER CHOOSE A CELL TWICE

    CMP IS_ONTARGET , 1
    JNZ ATTACKER_ATTACK_IS_MISSED
      
    MOV SI , OFFSET MY_SCORE
    DEC BYTE PTR [SI]                ;DECREMENT MY SCORE
    PRINT_MY_SCORE

    MOV BP , OFFSET SHIPS_REMAINING_CELLS  ;DECREMENT THE REMAINING CELL
    MOV DL , SHIP_INDEX  
    MOV DH , 0
    ADD BP , DX
    DEC BYTE PTR DS:[BP]
    MOV CL ,0
    CMP DS:[BP], CL                        ;IF THE SHIP IS DESTROYED SEND ITS DATA TO THE OTHER PLAYER
    JNZ THE_SHIP_ISNOT_DESTROYED
    
    MOV BX, OFFSET IS_DESTROYED
    MOV CX, 1
    MOV [BX], CX
    
    MOV SI ,OFFSET SHIPS_POINTS
    MOV AL , SHIP_INDEX
    MOV BL , 8
    MUL BL
    ADD SI , AX 
    MOV DX, WORD PTR [SI]
    MOV DESTROYED_X1, DX
    MOV DX, WORD PTR [SI + 2]
    MOV DESTROYED_Y1, DX
    MOV DX, WORD PTR [SI + 4]
    MOV DESTROYED_X2, DX
    MOV DX, WORD PTR [SI + 6]
    MOV DESTROYED_Y2, DX
    
    DRAW_ALL_SHIPS_ON_GRID 
    DRAW_ALL_X_SIGNS OTHER_PLAYER_INDEX
    
    THE_SHIP_ISNOT_DESTROYED:    
    MOV BX, OFFSET OTHER_PLAYER_ATTACKS_ONTARGET
    MOV SI, OFFSET OTHER_PLAYER_ATTACKS_ONTARGET_NUM
    DRAW_X_SIGN ATTACKX, ATTACKY,0CH
    JMP EDIT_ATTACKED_PLAYER_DATA 
  
    ATTACKER_ATTACK_IS_MISSED:
    MOV BX, OFFSET OTHER_PLAYER_ATTACKS_MISSED
    MOV SI, OFFSET OTHER_PLAYER_ATTACKS_MISSED_NUM
    DRAW_X_SIGN ATTACKX,ATTACKY,00H 
    

    EDIT_ATTACKED_PLAYER_DATA: 
    MOV AX, [SI]         ;INCREMENT NUMBER OF MISSED OR ONTARGET ATTACKS
    INC AX 
    MOV [SI] , AX
    DEC AX
    
    MOV CL , 04H         ;PUT THE CELL IN ONTARGET OR MISSED OTHER PLAYER ARRAY OF ATTACKS 
    MUL CL
    ADD BX,AX 
    MOV CX ,ATTACKX 
    MOV [BX] , CX
    MOV CX ,ATTACKY 
    MOV [BX + 2] ,CX  
          
    ATTACKED_DATA_UPDATED:
    RET
                  
ATTACKED_CHECK_CELL_AND_UPDATE_ATTACKS_DATA_   ENDP
;-----------------------------------------;
ATTACKER_UPDATE_ATTACKS_DATA_  PROC NEAR
    CMP IS_ON_GRID, 0
    JZ ATTACKER_DATA_UPDATED

    CMP IS_ATTACKED_BEFORE , 1
    JZ ATTACKER_DATA_UPDATED                    ;NO DATA NEEDS TO BE UPDATED IF PLAYER CHOOSE A CELL TWICE

    CMP IS_ONTARGET , 1
    JNZ MY_ATTACK_IS_MISSED
      
    MOV SI , OFFSET OTHER_PLAYER_SCORE
    DEC BYTE PTR [SI]                    ;DECREMENT THE OTHER PLAYER SCORE
    PRINT_OTHER_PLAYER_SCORE

    MOV BX, OFFSET MY_ATTACKS_ONTARGET
    MOV SI, OFFSET MY_ATTACKS_ONTARGET_NUM
    DRAW_X_SIGN ATTACKX, ATTACKY,0CH
    
    CMP IS_DESTROYED, 1            ;IF THE SHIP IS DESTROYED PUT ITS DATA INTO DESTROYD ARRAY
    JNE EDIT_ATTACKER_DATA
    MOV DI, OFFSET OTHER_PLAYER_DESTROYED_SHIPS
    MOV Cl, OTHER_PLAYER_DESTROYED_SHIPS_NUM
    MOV AL, 8
    MUL CL
    ADD DI, AX
    
    MOV DX, DESTROYED_X1
    MOV [DI] , DX
    MOV DX, DESTROYED_Y1
    MOV [DI + 2], DX
    MOV DX, DESTROYED_X2
    MOV [DI + 4] , DX
    MOV DX, DESTROYED_Y2
    MOV [DI + 6], DX
    
    MOV CH,0
    INC CX                    ;UPDATE THE PTR AND RETURN IS_DESTROYED TO BE ZERO AGAIN
    MOV OTHER_PLAYER_DESTROYED_SHIPS_NUM, CL
    MOV IS_DESTROYED, 0
    DRAW_ALL_DESTROYED_SHIPS 
    
    
    JMP EDIT_ATTACKER_DATA 
  
    MY_ATTACK_IS_MISSED:
    MOV BX, OFFSET MY_ATTACKS_MISSED
    MOV SI, OFFSET MY_ATTACKS_MISSED_NUM
    DRAW_X_SIGN ATTACKX,ATTACKY,00H 

    EDIT_ATTACKER_DATA: 
    MOV AX, [SI]         ;INCREMENT NUMBER OF MISSED OR ONTARGET ATTACKS
    INC AX 
    MOV [SI] , AX
    DEC AX
    
    MOV CL , 04H         ;PUT THE CELL IN ONTARGET OR MISSED MY ARRAY OF ATTACKS 
    MUL CL
    ADD BX,AX 
    MOV CX ,ATTACKX 
    MOV [BX] , CX
    MOV CX ,ATTACKY 
    MOV [BX + 2] ,CX  
   
    DRAW_ALL_X_SIGNS MY_INDEX
    ATTACKER_DATA_UPDATED:
    RET
                  
ATTACKER_UPDATE_ATTACKS_DATA_   ENDP
;-------------------------------------; 
SCENE1_PLAYER_ATTACKS_  PROC NEAR
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    DRAW_ALL_DESTROYED_SHIPS  
    DRAW_ALL_X_SIGNS MY_INDEX
    DRAW_POWER_UPS 
    RET
                
SCENE1_PLAYER_ATTACKS_   ENDP
;-----------------------------------------;
SCENE2_PLAYER_WATCHES_  PROC NEAR
    ;---------------POWER UPS ----------------
    MOV AL, 0
    ;CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    ;JNZ VIEW_PLAYER_SHIPS
    ;CMP IS_REVERSE_COUNT, 2
    ;JNZ VIEW_PLAYER_SHIPS
    ;JMP VIEW_OWN_DAMAGE
    ;--------------------------------------
    
    ;ANNOUNCE_OTHER_PLAYER_TURN:
    ;CONCATENATE PLAYER_TURN, OTHER_PLAYER_INDEX
    ;PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    ;PRESS_ENTER_TO_CONTINUE  
    ;JMP VIEW_PLAYER_SHIPS
    
   ;---------------POWER UPS ----------------
   ; VIEW_OWN_DAMAGE:
   ; MOV AL, 1
   ;PRINT_NOTIFICATION_MESSAGE  PRESS_ENTER_MSG, 1
    ;--------------------------------------
    
    VIEW_PLAYER_SHIPS:
    PRINT_NOTIFICATION_MESSAGE  WAIT_FOR_OTHER_ATTACK_MSG, 1
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    DRAW_ALL_SHIPS_ON_GRID 
    DRAW_ALL_X_SIGNS OTHER_PLAYER_INDEX
 ;---------------POWER UPS ----------------    
    ; ANNOUNCE OTHER PLAYER'S TURN IN CASE THIS TURN WAS REVERSED
    ; CMP AL, 1
    ;JNZ GO_TO_ATTACK_SCENE
    ; PRESS_ENTER_TO_CONTINUE
    ;CONCATENATE PLAYER_TURN, PLAYER_ATTACKING
    ;PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    ;PRESS_ENTER_TO_CONTINUE
    ;--------------------------------------
    
    GO_TO_ATTACK_SCENE:
    RET
    
SCENE2_PLAYER_WATCHES_   ENDP
;-----------------------------------------;
IS_IT_THE_END_  PROC NEAR
    
    CMP MY_SCORE , 0
    JNZ CHECK_OTHER_PLAYER_SCORE 
    MOV GAME_END , 1
    JMP THE_END_IS_NEAR
    
    CHECK_OTHER_PLAYER_SCORE:
    CMP OTHER_PLAYER_SCORE , 0
    JNZ THE_END_IS_NEAR
    MOV GAME_END , 1   
    
  THE_END_IS_NEAR:
    RET 
    
IS_IT_THE_END_   ENDP
;-----------------------------------------;
REFRESH_DATA_  PROC NEAR
    MOV MY_SCORE , TOTAL_N_CELLS 
    MOV OTHER_PLAYER_SCORE , TOTAL_N_CELLS 
    MOV MY_ATTACKS_ONTARGET_NUM ,0
    MOV MY_ATTACKS_MISSED_NUM ,0 
    MOV OTHER_PLAYER_ATTACKS_ONTARGET_NUM ,0 
    MOV OTHER_PLAYER_ATTACKS_MISSED_NUM ,0
    MOV GAME_END,0
    MOV JUMP_COUNTER, 1
    MOV LEVEL, 1
    
    ; RESET DESTROYED SHIPS
    MOV OTHER_PLAYER_DESTROYED_SHIPS_NUM, 0
    MOV DESTROYED_SHIP_REMAINING_CELLS, 0
    MOV DESTROYED_SHIP_ORIENTATION, 0
    MOV DESTROYED_SHIP_SIZE, 0
    ; RESET SLIDER
    MOV SLIDER_CURRENT_ROW, SLIDER_INITIAL_ROW
    MOV SLIDER_DIRECTION, 0
    ; RESET SHIPS POSITIONS
    MOV CX, 0
    MOV SI, OFFSET SHIPS_POINTS
    MOV DI, OFFSET SHIPS_POINTS
    RESET_SHIPS_POSITIONS:
        MOV WORD PTR [SI], -2
        MOV WORD PTR [DI], -2
        ADD SI, 2
        ADD DI, 2
        INC CX
        CMP CX, N_SHIPS * 4
    JNZ RESET_SHIPS_POSITIONS
    ; RESET REMAINING CELLS
    MOV CX, 0
    MOV SI, OFFSET SHIPS_REMAINING_CELLS
    MOV DI, OFFSET SHIPS_SIZES
    MOV BX, OFFSET SHIPS_REMAINING_CELLS
    MOV BP, OFFSET SHIPS_SIZES
    RESET_REMAINING_CELLS:
        MOV AX, WORD PTR [DI]
        MOV BYTE PTR [SI], AL
        MOV AX, WORD PTR DS:[BP]
        MOV BYTE PTR [BX], AL
        INC SI
        INC BX
        ADD DI, 2
        ADD BP, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ RESET_REMAINING_CELLS
    ; RESET POWER UPS
    MOV SI, OFFSET MY_POWER_UPS_IS_USED
    ;MOV DI, OFFSET P2_IS_USED
    MOV CX, 0
    RESET_IS_USED:
        MOV BYTE PTR [SI], 0
        MOV BYTE PTR [DI], 0
        INC SI
        INC DI
        INC CX
        CMP CX, 3
    JNZ RESET_IS_USED
    MOV MY_POWER_UPS_IS_USED+2, 1
    MOV MY_N_AVAILABLE_POWER_UPS, 3

    MOV IS_MY_ATTACK_TWICE_ACTIVATED, 0
    MOV IS_MY_REVERSE_ATTACK_ACTIVATED, 0
    MOV IS_MY_DESTROY_SHIP_ACTIVATED, 0
    MOV IS_OTHER_PLAYER_ATTACK_TWICE_ACTIVATED, 0
    MOV IS_OTHER_PLAYER_REVERSE_ATTACK_ACTIVATED, 0
    MOV IS_OTHER_PLAYER_DESTROY_SHIP_ACTIVATED, 0
    ; RESET INVITATIONS AND CHAT
    MOV GAME_MODE, 0
    MOV IS_GAME_STARTED, 0
    ; RESET SERIAL COMMUNICATION
    MOV SEND_DATA_BUFFER_FULL, 0
    MOV SEND_CHAT_BUFFER_FULL, 0              
    MOV DATA_RECEIVED_FLAG, 0
    ; RESET ATTACK
    MOV IS_ONTARGET, 0
    MOV IS_ATTACKED_BEFORE, 0
    MOV IS_ON_GRID, 1
    MOV PLAYER_ATTACKING, 1
    MOV PLAYER_ATTACKED, 2
    MOV SHIP_INDEX, 0
    
    ; RESET SERIAL PORT
    INITIALIZE_SERIAL_PORT
    
    ;-----------STANDALONE CHAT MODE VARIABLES RESETING-------
    MOV BX,OFFSET MESSAGES_QUEUE1
    MOV CX,15
    
    RESET_STANDALONE_CHAT_MODE:    
        MOV BYTE PTR[BX],0
        INC BX
        MOV BYTE PTR[BX],0
        INC BX
        MOV BYTE PTR[BX],100
        INC BX
        SUB BX,3
        ADD BX,103
    LOOP RESET_STANDALONE_CHAT_MODE
    ;---------------------------------------------------------
    RET 
    
REFRESH_DATA_   ENDP
;-----------------------------------------;
PRINT_ATTACK_MSG_    PROC    NEAR
    
    CMP IS_ON_GRID, 0
    JZ ATTACK_OUTSIDE_GRID
    
    ;CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    ;JNZ CONTINUE_CHECKING
    ; CMP IS_REVERSE_COUNT, 2
    ;JZ ATTACK_IS_REVERSED
    
    CONTINUE_CHECKING:
    CMP IS_ATTACKED_BEFORE, 1
    JZ ATTACK_NO_EFFECT
      
    CMP IS_ONTARGET, 1
    JZ ATTACK_ON_TARGET
    
    CMP Al, 1
    JNE NOT_ON_TARGET_FOR_ATTACKED
    PRINT_NOTIFICATION_MESSAGE  NOT_ON_TARGET_MSG_ATTACKER, 1
    JMP END_PRINT_ATTACK_MSG
    NOT_ON_TARGET_FOR_ATTACKED:
    PRINT_NOTIFICATION_MESSAGE  NOT_ON_TARGET_MSG_ATTACKED, 1
    JMP END_PRINT_ATTACK_MSG
    
    
    ATTACK_OUTSIDE_GRID:
    CMP Al, 1
    JNE GRID_MISSED_FOR_ATTACKED
    PRINT_NOTIFICATION_MESSAGE  GRID_MISSED_MSG_ATTACKER, 1
    JMP END_PRINT_ATTACK_MSG
    GRID_MISSED_FOR_ATTACKED:
    PRINT_NOTIFICATION_MESSAGE  GRID_MISSED_MSG_ATTACKED, 1
    JMP END_PRINT_ATTACK_MSG
    
    ATTACK_NO_EFFECT:
    CMP Al, 1
    JNE ALREADY_ATTACKED_FOR_ATTACKED
    PRINT_NOTIFICATION_MESSAGE  CELL_ALREADY_ATTACKED_MSG_ATTACKER, 1
    JMP END_PRINT_ATTACK_MSG
    ALREADY_ATTACKED_FOR_ATTACKED:
    PRINT_NOTIFICATION_MESSAGE  CELL_ALREADY_ATTACKED_MSG_ATTACKED, 1
    JMP END_PRINT_ATTACK_MSG
    
    ATTACK_IS_REVERSED:
    PRINT_NOTIFICATION_MESSAGE  YOUR_ATTACK_WAS_REVERSED_MSG, 1
    JMP END_PRINT_ATTACK_MSG
    
    ATTACK_ON_TARGET:
    CMP Al, 1
    JNE ON_TARGET_FOR_ATTACKED
    PRINT_NOTIFICATION_MESSAGE  ON_TARGET_MSG_ATTACKER, 1
    JMP END_PRINT_ATTACK_MSG
    ON_TARGET_FOR_ATTACKED:
    PRINT_NOTIFICATION_MESSAGE  ON_TARGET_MSG_ATTACKED, 1
    
    END_PRINT_ATTACK_MSG:
    
    RET

PRINT_ATTACK_MSG_    ENDP
;-----------------------------------------;

START_THE_GAME_  PROC NEAR
   
    CMP IS_HOST, 1
    JNE ATTACKED_STARTING
    
MAIN_LOOP:
    
    ATTACKER_STARTING:

    SCENE1_PLAYER_ATTACKS
    GET_CELL_FROM_PLAYER ATTACKX,ATTACKY
    SEND_ATTACK_COORD
    RECEIEVE_ATTACK_RESULT
    ATTACKER_UPDATE_ATTACKS_DATA
    PRINT_ATTACK_MSG 1 ;--> 1 Print Attack Msg For ATTACKER
    
    CMP IS_MY_ATTACK_TWICE_ACTIVATED, 1
    JNE NO_ATTACK_TWICE
    MOV IS_MY_ATTACK_TWICE_ACTIVATED, 0
    JMP ATTACKER_STARTING
    
    NO_ATTACK_TWICE:
    MOVE_TO_NEXT_SCENE
    
   
    ATTACKED_STARTING:
    SCENE2_PLAYER_WATCHES
    RECEIEVE_ATTACK_COORD
    PRINT_NOTIFICATION_MESSAGE  VIEW_SHIPS_MSG, 1    
    ATTACKED_CHECK_CELL_AND_UPDATE_ATTACKS_DATA
    SEND_ATTACK_RESULT
    PRINT_ATTACK_MSG 2     ;--> 2 Print Attack Msg For ATTACKED
    
    CMP IS_OTHER_PLAYER_ATTACK_TWICE_ACTIVATED , 1
    JNE NO_ATTACK_TWICE2
    MOV IS_OTHER_PLAYER_ATTACK_TWICE_ACTIVATED, 0
    JMP ATTACKED_STARTING
    
    NO_ATTACK_TWICE2:
    MOVE_TO_NEXT_SCENE
    
    
;;;;;;;;;;;; Power UPS ;;;;;;;;;;;;;;;;;    
    ;CMP IS_REVERSE_ATTACK_ACTIVATED , 1
    ;JNZ NO_REVERSE_ATTACK_OR_REVERSE_IT2
    ;CMP IS_REVERSE_COUNT , 0
    ;JZ THE_REVERSE_WILL_BE_IN_THE_NEXT_TURN
     
    ;MOV AL , PLAYER_ATTACKED              ;RETURN EVERYTHING
    ;MOV BL , PLAYER_ATTACKING
    ;MOV PLAYER_ATTACKED  , BL
    ;MOV PLAYER_ATTACKING , AL  
    ;MOV IS_REVERSE_ATTACK_ACTIVATED, 0
    ;MOV IS_REVERSE_COUNT , 0
    ;JMP NO_REVERSE_ATTACK_OR_REVERSE_IT2
    
    ;THE_REVERSE_WILL_BE_IN_THE_NEXT_TURN:
    ;INC IS_REVERSE_COUNT 
    
    ; NO_REVERSE_ATTACK_OR_REVERSE_IT2:
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
    IS_IT_THE_END 
    
    CMP GAME_END , 1
    JNZ MAIN_LOOP
    JMP PRE_EXIT_SCREEN      ;RETURN TO THE STATISTICS MENU IF THE GAME HAS BEEN ENDED
    
START_THE_GAME_   ENDP
;-------------------------------------;

DRAW_GRID_  PROC    NEAR
    ; DI AND SI ARE VALUES TO STOP LOOPING AT  
    MOV DI, GRID_CORNER2_X
    ADD DI, GRID_SQUARE_SIZE
    MOV SI, GRID_CORNER2_Y
    ADD SI, GRID_SQUARE_SIZE
    
    ; DRAW GRID COLUMNS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_COLUMNS:
        MOV DX, GRID_CORNER1_Y  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_COLUMN:
            INT 10H
            INC DX
            CMP DX, GRID_CORNER2_Y + 1
        JNZ DRAW_COLUMN
        ADD CX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN COLUMNS
        CMP CX, DI ;LAST LINE AT CX = GRID_CORNER2_X SO STOP AT CX = GRID_CORNER2_X + GRID_SQUARE_SIZE = DI
    JNZ DRAW_ALL_COLUMNS
    
    ; DRAW GRID ROWS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_ROWS:
        MOV CX, GRID_CORNER1_X  ;START DRAWING EVERY ROW FROM THE INITIAL COLUMN
        DRAW_ROW:
            INT 10H
            INC CX
            CMP CX, GRID_CORNER2_X + 1
        JNZ DRAW_ROW
        ADD DX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN ROWS
        CMP DX, SI ;LAST LINE AT DX = GRID_CORNER2_Y SO STOP AT DX = GRID_CORNER2_Y + GRID_SQUARE_SIZE = SI
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

DRAW_COLUMN_SELECTOR_     PROC   NEAR   
    ; PARAMETERS
    ; DI = COLUMN_SELECTOR_COLUMN, 
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, DI
    MOV DX, COLUMN_SELECTOR_ROW 
    DEC DX
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_COLUMN_SELECTOR_ROWS:
        MOV DI, BX
        DRAW_COLUMN_SELECTOR_ROW:
            INT 10H
            INC CX
            DEC DI
        JNZ DRAW_COLUMN_SELECTOR_ROW
        MOV DI, BX
        INC DI
        SUB CX, DI
        INC DX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE THE SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_COLUMN_SELECTOR_ROWS
    RET
DRAW_COLUMN_SELECTOR_    ENDP 
;-----------------------------------------;

DRAW_SLIDER_BAR_    PROC    NEAR   
    MOV CX, SLIDER_BAR_COLUMN
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
        CMP CX, SLIDER_BAR_COLUMN + 6 ; SO THAT SLIDER BAR WIDTH = 5
    JNZ DRAW_ALL_BARS
    DRAW_SLIDER SLIDER_INITIAL_ROW, LIGHT_BLUE
    RET
DRAW_SLIDER_BAR_    ENDP
;-----------------------------------------;

FIRE_SLIDER_    PROC    NEAR   
    MOV SLIDER_CURRENT_ROW, SLIDER_INITIAL_ROW
    MOV SLIDER_DIRECTION, 0
    CHECK_USER_CLICK:
        RECEIVE_DATA
        MOV DI, OFFSET RECEIVE_CHAT_BUFFER
        CMP BYTE PTR [DI], 0
        JNE PRINT_INCOMING_CHAT_MESSAGE6
        ; CHECK IF USER PRESSED A KEY
        MOV AH, 1
        INT 16H
        JZ MOVE_SLIDER
        ; GET KEY PRESSED
        MOV AH, 0
        INT 16H   
        CMP AH,EXIT_SCANCODE
        JNE NO_EXIT2
        SEND_EXIT_GAME
        NO_EXIT2:
        CMP AH, ENTER_SCANCODE
        JZ STOP_SLIDER
        ; CHECK FOR CHAT KEYS
        CHECK_FOR_INLINE_CHAT_KEY  AH, AL
        ; CHECK IF ANY CHAT IS RECEIVED
        JMP CHECK_USER_CLICK
  
        
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
    
    PRINT_INCOMING_CHAT_MESSAGE6:
    PRINT_NOTIFICATION_MESSAGE  STATUS_TEST1, 1
    PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
    CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
    JMP CHECK_USER_CLICK
    
    STOP_SLIDER:
    RET
FIRE_SLIDER_    ENDP
;-----------------------------------------;

DRAW_STATUS_BAR_TEMPLATE_   PROC    NEAR
;CHAT BAR  
    MOV AX, 0C0FH                 
    MOV CX,0    ;STARTING FROM THE LEFT EDGE
    MOV DX,496  ;HEIGHT VALUE
    LOOP2:
    INT 10H
    INC CX
    CMP CX,800  ;ENDING AT THE RIGHT EDGE
    JNZ LOOP2

    PRINT_MESSAGE MY_USERNAME+1,2000H,0FH
    MOV DH,20H
    MOV DL,MY_USERNAME+1
    PRINT_MESSAGE CHAT_CONSTANT,DX,0FH
    PRINT_MESSAGE OTHER_PLAYER_USERNAME+1,2100H,0FH
    MOV DH,21H
    MOV DL,OTHER_PLAYER_USERNAME+1
    PRINT_MESSAGE CHAT_CONSTANT,DX,0FH
;SCORE BAR                       
    ;PLAYER 1 SCORE
    PRINT_MESSAGE MY_USERNAME+1,1E00H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,MY_USERNAME+1  ;X
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    

    ;PLAYER 2 SCORE
    PRINT_MESSAGE OTHER_PLAYER_USERNAME+1,1E40H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,OTHER_PLAYER_USERNAME+1  ;X
    ADD DL,40H
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    
    PRINT_MY_SCORE
    PRINT_OTHER_PLAYER_SCORE
    RET
DRAW_STATUS_BAR_TEMPLATE_   ENDP
;-----------------------------------------;
DRAW_NOTIFICATION_BAR_   PROC    NEAR
;NOTIFICATION BAR                        
    MOV AX, 0C0FH
    MOV CX,0
    MOV DX,555  
    LOOP1:
    INT 10H
    INC CX
    CMP CX,800
    JNZ LOOP1   
    RET
DRAW_NOTIFICATION_BAR_   ENDP
;-----------------------------------------;
PRINT_NOTIFICATION_MESSAGE_   PROC    NEAR
;INDEX = 1 -> MESSAGE #1
;INDEX = 2 -> MESSAGE #2
;PRINTS NOTIFICATION MESSAGES
    
    MOV CX,0
    MOV AX,1301H
    MOV BX,BP
    MOV CL,[BX]
    ADD BP,1
    MOV BX,000FH
    INT 10H  
 
    RET
PRINT_NOTIFICATION_MESSAGE_   ENDP
;-----------------------------------------;

PRINT_MY_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,MY_SCORE
    MOV BL,10
    DIV BL
    MOV MY_SCORE_STRING, AL
    MOV MY_SCORE_STRING+1, AH
    ADD MY_SCORE_STRING,48
    ADD MY_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,MY_USERNAME+1 ;X
    ADD DL,10
    MOV BP,OFFSET MY_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
PRINT_MY_SCORE_   ENDP
;-----------------------------------------;

PRINT_INLINE_CHAT_MESSAGE_   PROC    NEAR
;INDEX = 1 -> PLAYER1 CHAT AREA
;INDEX = 2 -> PLAYER2 CHAT AREA
;PRINTS CHAT MESSAGES
    MOV DUMMY_COUNTER, 0
    CMP AL,2
    JE PLAYER2_CHAT_AREA
    INC DUMMY_COUNTER
    MOV DH,20H
    MOV DL,MY_USERNAME+1
    INC DL ;CONSIDERING EACH NAME HAS ":' AFTER IT
    JMP PRINT_CHAT_MSG
PLAYER2_CHAT_AREA:
    MOV DH,21H
    MOV DL,OTHER_PLAYER_USERNAME+1
    INC DL ;CONSIDERING EACH NAME HAS ":' AFTER IT
    
PRINT_CHAT_MSG:
    ; STORE MESSAGE OFFSET IN DI
    MOV DI, BX
    ; PRINT EMPTY STRING
    MOV AX,1301H
    MOV BX,000FH
    MOV BP, OFFSET EMPTY_STRING+1
    MOV CX,0
    MOV CL, EMPTY_STRING
    SUB CL, DL
    INT 10H
    ; PRINT CHAT MESSAGE
    MOV AX,1301H
    MOV BP,DI
    INC BP
    MOV BL, DUMMY_COUNTER   
    MOV BH, 0
    ADD BP, BX              ; BYPASS THE SEND CHAT CODE IF WE ARE PRINTING THE SEND BUFFER
    MOV CL,[DI]
    MOV CH,00H
    SUB CL, DUMMY_COUNTER   ; SUBTRACT ONE IF WE ARE PRINTING THE SEND BUFFER TO ACCOUNT FOR THE SEND CHAT CODE
    MOV BX,000FH
    INT 10H 
 
    RET
PRINT_INLINE_CHAT_MESSAGE_   ENDP
;-----------------------------------------;

PRINT_OTHER_PLAYER_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,OTHER_PLAYER_SCORE
    MOV BL,10
    DIV BL
    MOV OTHER_PLAYER_SCORE_STRING, AL
    MOV OTHER_PLAYER_SCORE_STRING+1, AH
    ADD OTHER_PLAYER_SCORE_STRING,48
    ADD OTHER_PLAYER_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,OTHER_PLAYER_USERNAME+1 ;X
    ADD DL,4AH
    MOV BP,OFFSET OTHER_PLAYER_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
 PRINT_OTHER_PLAYER_SCORE_   ENDP
;-------------------------------------;
CALCULATE_SELECTOR_INITIAL_POSITION_   PROC    NEAR
    
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_Y1, SELECTOR_INITIAL_Y1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    MOV SELECTOR_Y2, SELECTOR_INITIAL_Y2
    MOV SELECTOR_GRID_X1, SELECTOR_GRID_INITIAL_X1
    MOV SELECTOR_GRID_Y1, SELECTOR_GRID_INITIAL_Y1   
    MOV DX,GRID_SQUARE_SIZE
    ADD SELECTOR_X2,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL 
    ADD SELECTOR_X1, AX
    ADD SELECTOR_Y1, AX
    SUB SELECTOR_X2, AX
    SUB SELECTOR_Y2, AX
    MOV UP_ORIENTATION,0
    MOV DOWN_ORIENTATION,0
    MOV LEFT_ORIENTATION,0
    MOV RIGHT_ORIENTATION,0    

CHECK_FOR_SELECTOR_INITIAL_POSITION:
    MOV AX,0
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1
    NOT IS_ONTARGET ;NOW IS_ONTARGET = 1 MEANS AN EMPTY CELL
    MOV AL,IS_ONTARGET
    POSSIBLE_ORIENTATIONS_CHECKER ;CHECKS WHETHER THE SELECTOR WILL BE STUCK OR NOT (LITERALLY CORNER CASE)
    MOV AH,UP_ORIENTATION
    OR AH,DOWN_ORIENTATION
    OR AH,LEFT_ORIENTATION
    OR AH,RIGHT_ORIENTATION 
    AND AL,AH
    CMP AL,1
    JE  VALID_INITIAL_POSITION
    ;IF THERE IS A SHIP, SELECTOR IS MOVED TO THE RIGHT, BUT IT CHECKS WHETHER THERE IS A SHIP ON ITS RIGHT
    ;IF ALL THE RIGHT CELLS ARE FULL, MOVE TO THE NEXT ROW, AND SO ON...
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX
    JE MOVE_TO_NEXT_ROW
    INC SELECTOR_GRID_X1
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
MOVE_TO_NEXT_ROW:
    MOV SELECTOR_GRID_X1,0
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    ADD SELECTOR_X2,DX
   
    INC SELECTOR_GRID_Y1
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL 
    ADD SELECTOR_X1, AX
    SUB SELECTOR_X2, AX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
VALID_INITIAL_POSITION:    
    RET
CALCULATE_SELECTOR_INITIAL_POSITION_   ENDP
;-----------------------------------------;
CELLS_SELECTOR_   PROC    NEAR 
    ;PARAMETERS:
    ;CX: SHIP SIZE 
    ;RETURNS: 2 POINTS IN GRID COORDINATES THAT THE PLAYER CHOSE (SELECTOR_GRID 1 AND 2) , THEY ARE NOT NECESSARILY IN THE RIGHT FORMAT
    
    ; INITIALIZATION
    DEC CX
    MOV DX,GRID_SQUARE_SIZE
    CALCULATE_SELECTOR_INITIAL_POSITION
    
    PRINT_NOTIFICATION_MESSAGE SELECTOR_STARTING_MSG,1
WAIT_FOR_DIRECTION_KEY:
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,RED
    WAIT_FOR_KEY
    MOV AH , KEY_PRESSED
    CMP AH,ENTER_SCANCODE ;CHECKS IF THE USER HAS ALREADY CHOSEN THE FIRST CELL OF THE SELECTED SHIP
    JE SELECTOR_SECOND_POINT
    ;AFTER GETTING DIRECTION KEY, REMOVE THE OLD SELECTOR ICON, TO DRAW THE NEW ONE
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,WHITE
    CMP AH,UP_SCANCODE 
    JE SELECTOR_UP
    CMP AH,DOWN_SCANCODE
    JE SELECTOR_DOWN
    CMP AH,LEFT_SCANCODE 
    JE SELECTOR_LEFT
    CMP AH,RIGHT_SCANCODE 
    JE SELECTOR_RIGHT
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_UP:
    CMP SELECTOR_GRID_Y1,0    ;BOUNDARIES CHECK
    JE WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_UP:
    DEC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1 ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_UP_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_Y1,0 
    JE RESET_UP_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_UP  
    
    RESET_UP_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_UP_COORDINATES:    
    INC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_UP_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_UP_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_UP_PIXEL_COORDINATES:    
    SUB SELECTOR_Y1,DX
    SUB SELECTOR_Y2,DX
    LOOP DECREMENT_SELECTOR_UP_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY 
SELECTOR_DOWN:
    MOV AX, SELECTOR_GRID_Y1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_DOWN:
    INC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_DOWN_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_Y1,AX 
    JE RESET_DOWN_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_DOWN  
    
    RESET_DOWN_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_DOWN_COORDINATES:    
    DEC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_DOWN_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_DOWN_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES:    
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    LOOP INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY   
SELECTOR_LEFT:
    CMP SELECTOR_GRID_X1,0    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_LEFT:
    DEC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_LEFT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_X1,0 
    JE RESET_LEFT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_LEFT  
    
    RESET_LEFT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_LEFT_COORDINATES:    
    INC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_LEFT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_LEFT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES:    
    SUB SELECTOR_X1,DX
    SUB SELECTOR_X2,DX
    LOOP DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_RIGHT:
    MOV AX, SELECTOR_GRID_X1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_RIGHT:
    INC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_RIGHT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX 
    JE RESET_RIGHT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_RIGHT  
    
    RESET_RIGHT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_RIGHT_COORDINATES:    
    DEC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_RIGHT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_RIGHT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES:    
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    LOOP INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
    
SELECTOR_SECOND_POINT:
    PRINT_NOTIFICATION_MESSAGE ORIENTATION_SELECTION_MSG,1
    ;ORIENTATIONS CHECK
    POSSIBLE_ORIENTATIONS_CHECKER
    MOV DX,CX
HIGHLIGHT_UP_ORIENTATION:
    CMP UP_ORIENTATION,0
    JE  HIGHLIGHT_DOWN_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    UP_HIGHLIGHT:
    SUB PIXELS1_Y,AX
    SUB PIXELS2_Y,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP UP_HIGHLIGHT
HIGHLIGHT_DOWN_ORIENTATION:
    CMP DOWN_ORIENTATION,0
    JE  HIGHLIGHT_LEFT_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    DOWN_HIGHLIGHT:
    ADD PIXELS1_Y,AX
    ADD PIXELS2_Y,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP DOWN_HIGHLIGHT
HIGHLIGHT_LEFT_ORIENTATION:
    CMP LEFT_ORIENTATION,0
    JE  HIGHLIGHT_RIGHT_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    LEFT_HIGHLIGHT:
    SUB PIXELS1_X,AX
    SUB PIXELS2_X,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP LEFT_HIGHLIGHT
HIGHLIGHT_RIGHT_ORIENTATION:
    CMP RIGHT_ORIENTATION,0
    JE  CHECK_POSSIBLE_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    RIGHT_HIGHLIGHT:
    ADD PIXELS1_X,AX
    ADD PIXELS2_X,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP RIGHT_HIGHLIGHT
        ;CHECK IF THERE IS AT LEAST ONE POSSIBLE ORIENTATION
CHECK_POSSIBLE_ORIENTATION:
        MOV AL,0
        OR AL,UP_ORIENTATION
        OR AL,DOWN_ORIENTATION        
        OR AL,LEFT_ORIENTATION
        OR AL,RIGHT_ORIENTATION 
        CMP AL,0
        JNE GET_SECOND_POINT
        PRINT_NOTIFICATION_MESSAGE NO_POSSIBLE_ORIENTATION,1
        WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY:
        WAIT_FOR_KEY
        MOV AH , KEY_PRESSED
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY
        PRINT_NOTIFICATION_MESSAGE SELECTOR_STARTING_MSG,1
        ;RESET DATA
        MOV DX,GRID_SQUARE_SIZE
        JMP WAIT_FOR_DIRECTION_KEY
        
GET_SECOND_POINT:
    MOV CX,DX
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX
    WAIT_ORIENTATION_SELECTION:
        WAIT_FOR_KEY
        MOV AH , KEY_PRESSED
        CMP AH,UP_SCANCODE 
        JE UP_ORIENTATION_SELECTED
        CMP AH,DOWN_SCANCODE
        JE DOWN_ORIENTATION_SELECTED
        CMP AH,LEFT_SCANCODE 
        JE LEFT_ORIENTATION_SELECTED
        CMP AH,RIGHT_SCANCODE 
        JE RIGHT_ORIENTATION_SELECTED
        JMP WAIT_ORIENTATION_SELECTION
UP_ORIENTATION_SELECTED:   
        CMP UP_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_Y2,CX
        CLEAR_GRID 
        RET   
DOWN_ORIENTATION_SELECTED:
        CMP DOWN_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION 
        ADD SELECTOR_GRID_Y2,CX
        CLEAR_GRID
        RET       
LEFT_ORIENTATION_SELECTED: 
        CMP LEFT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_X2,CX
        CLEAR_GRID
        RET        
RIGHT_ORIENTATION_SELECTED:
        CMP RIGHT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION          
        ADD SELECTOR_GRID_X2,CX
        CLEAR_GRID
    RET
CELLS_SELECTOR_   ENDP
;-----------------------------------------;  
POSSIBLE_ORIENTATIONS_CHECKER_   PROC    NEAR 

UP_ORIENTATION_CHECK:
MOV AX,SELECTOR_GRID_X1
MOV SELECTOR_GRID_X2,AX
MOV AX,SELECTOR_GRID_Y1
MOV SELECTOR_GRID_Y2,AX    ;COPY POINT 1 TO POINT 2
MOV DX,CX                  ;COPY SIZE TO DX
CMP SELECTOR_GRID_Y1,CX
JAE UP_ORIENTATION_SHIP_CHECK   
MOV UP_ORIENTATION,0
JMP DOWN_ORIENTATION_CHECK 
UP_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE UP-REGION HAS SHIPS PLACED IN ITS DIRECTION 
    DEC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS UPWARDS
    CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2
    CMP IS_ONTARGET,0
    JNE UP_ORIENTATION_INVALID
    LOOP UP_ORIENTATION_SHIP_CHECK
    MOV UP_ORIENTATION,1            ;ORIENTATION IS VALID
    JMP DOWN_ORIENTATION_CHECK
    UP_ORIENTATION_INVALID:
       MOV UP_ORIENTATION,0 
           
DOWN_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_Y1
    CMP SI,CX
    JAE DOWN_ORIENTATION_SHIP_CHECK   
    MOV DOWN_ORIENTATION,0
    JMP LEFT_ORIENTATION_CHECK 
    DOWN_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE DOWN-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS DOWNWARDS
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2
        CMP IS_ONTARGET,0
        JNE DOWN_ORIENTATION_INVALID
        LOOP DOWN_ORIENTATION_SHIP_CHECK
        MOV DOWN_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP LEFT_ORIENTATION_CHECK
        DOWN_ORIENTATION_INVALID:
        MOV DOWN_ORIENTATION,0 
                          
LEFT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    CMP SELECTOR_GRID_X1,CX
    JAE LEFT_ORIENTATION_SHIP_CHECK   
    MOV LEFT_ORIENTATION,0
    JMP RIGHT_ORIENTATION_CHECK 
    LEFT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE LEFT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        DEC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE LEFT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2
        CMP IS_ONTARGET,0
        JNE LEFT_ORIENTATION_INVALID
        LOOP LEFT_ORIENTATION_SHIP_CHECK
        MOV LEFT_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP RIGHT_ORIENTATION_CHECK
        LEFT_ORIENTATION_INVALID:
        MOV LEFT_ORIENTATION,0
RIGHT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_X1
    CMP SI,CX
    JAE RIGHT_ORIENTATION_SHIP_CHECK   
    MOV RIGHT_ORIENTATION,0
    JMP POSSIBLE_ORIENTATIONS_CHECKER_FINISH 
    RIGHT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE RIGHT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE RIGHT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2
        CMP IS_ONTARGET,0
        JNE RIGHT_ORIENTATION_INVALID
        LOOP RIGHT_ORIENTATION_SHIP_CHECK
        MOV RIGHT_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP POSSIBLE_ORIENTATIONS_CHECKER_FINISH
        RIGHT_ORIENTATION_INVALID:
        MOV RIGHT_ORIENTATION,0
        POSSIBLE_ORIENTATIONS_CHECKER_FINISH:     
    RET
POSSIBLE_ORIENTATIONS_CHECKER_   ENDP
;-----------------------------------------;  
CLEAR_GRID_   PROC    NEAR 
    DRAW_RECTANGLE  GRID_CORNER1_X,GRID_CORNER1_Y,GRID_CORNER2_X,GRID_CORNER2_Y,WHITE
    DRAW_GRID 
    RET
CLEAR_GRID_   ENDP
;-----------------------------------------;    
STAT_SCREEN_   PROC    NEAR 
    DRAW_RECTANGLE 400,70,400,470,WHITE
    ;PLAYER 1 SCORE
    MOV DL,0FH
    PRINT_MESSAGE MY_USERNAME+1,0F0FH,0FH
    
    MOV DH,0FH ;Y
    ADD DL,MY_USERNAME+1  ;X
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    
    ;PLAYER 2 SCORE
    MOV DL,10H    
    PRINT_MESSAGE OTHER_PLAYER_USERNAME+1,0F40H,0FH
    
    MOV DH,0FH ;Y
    ADD DL,OTHER_PLAYER_USERNAME+1  ;X
    ADD DL,30H
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH 
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,MY_SCORE
    MOV BL,10
    DIV BL
    MOV MY_SCORE_STRING, AL
    MOV MY_SCORE_STRING+1, AH
    ADD MY_SCORE_STRING,48
    ADD MY_SCORE_STRING+1,48
    MOV AX,1301H 
    MOV DH,0FH ;Y
    MOV DL,MY_USERNAME+1 ;X
    ADD DL,19H
    MOV BP,OFFSET MY_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,OTHER_PLAYER_SCORE
    MOV BL,10
    DIV BL
    MOV OTHER_PLAYER_SCORE_STRING, AL
    MOV OTHER_PLAYER_SCORE_STRING+1, AH
    ADD OTHER_PLAYER_SCORE_STRING,48
    ADD OTHER_PLAYER_SCORE_STRING+1,48
    MOV AX,1301H
    MOV DH,0FH ;Y
    MOV DL,OTHER_PLAYER_USERNAME+1 ;X
    ADD DL,4AH
    MOV BP,OFFSET OTHER_PLAYER_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
    
    PRINT_NOTIFICATION_MESSAGE TO_RESTART_GAME,1
    PRINT_NOTIFICATION_MESSAGE TO_QUIT_GAME,2
CHECK_STAT_MENU_PRESS:
    MOV AH,0
    INT 16H
    CMP AH,ENTER_SCANCODE
    JNE MAY_QUIT
    REFRESH_DATA
    RET
    MAY_QUIT:
    CMP AH,EXIT_SCANCODE
    JNE CHECK_STAT_MENU_PRESS
    JMP THE_END
STAT_SCREEN_   ENDP
;-----------------------------------------; 
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, GAME_SCREEN_MAX_X, GAME_SCREEN_MAX_Y, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP
;-----------------------------------------; 
CONCATENATE_  PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER NUMBER
    ; BX = OFFSET STRING   
    CMP AL,1
    JNE PLAYER_2_CONCATENATION
    MOV SI,0
    MOV SI,OFFSET MY_USERNAME
    INC SI
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    MOV CONCATENATED_STRING,AL
    MOV CX,0
    MOV CL,BYTE PTR[SI]
    INC SI
    MOV DI,0
    MOV DI,OFFSET CONCATENATED_STRING
    INC DI
    ADD DI, 2 ; TO ACCOUNT FOR THE DASH AND SPACE
    REP MOVSB
    JMP STRING_CONCATENATION
    PLAYER_2_CONCATENATION: 
    MOV SI,0
    MOV SI,OFFSET OTHER_PLAYER_USERNAME
    INC SI
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    MOV CONCATENATED_STRING,AL
    MOV CX,0
    MOV CL,BYTE PTR[SI]
    INC SI
    MOV DI,0
    MOV DI,OFFSET CONCATENATED_STRING
    INC DI
    ADD DI, 2 ; TO ACCOUNT FOR THE DASH AND SPACE
    REP MOVSB
    STRING_CONCATENATION:
    MOV SI,OFFSET BX
    MOV CL,BYTE PTR[SI]
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    ADD CONCATENATED_STRING, AL
    INC SI 
    REP MOVSB   
    RET
CONCATENATE_  ENDP
;-----------------------------------------; 
DRAW_PRE_EXIT_SCREEN_    PROC    NEAR
    DRAW_RECTANGLE  0, 0, 800, 554, BLACK ;CLEARS THE WHOLE SCREEN EXCEPT THE NOTIFICATION BAR
    CMP GAME_MODE, CHAT_MODE
    JE NO_STAT_SCREEN
    STAT_SCREEN
    NO_STAT_SCREEN:
    REFRESH_DATA
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    DRAW_NOTIFICATION_BAR
    JMP STARTING_POINT
    RET
DRAW_PRE_EXIT_SCREEN_    ENDP
;-----------------------------------------;
EXIT_GAME_    PROC    NEAR
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    MOV AH,4CH  
    INT 21H 
    RET
EXIT_GAME_    ENDP
;-----------------------------------------;
PRESS_ENTER_TO_CONTINUE_    PROC    NEAR
    KEEP_WAITING:
        WAIT_FOR_KEY
        MOV AH , KEY_PRESSED
        CMP AH, ENTER_SCANCODE
    JNE KEEP_WAITING
    RET
PRESS_ENTER_TO_CONTINUE_    ENDP
;-----------------------------------------;
PLAYERS_PLACE_SHIPS_    PROC    NEAR
    MOV IS_GAME_STARTED, 1
    CLEAR_GAME_SCREEN WHITE
    DRAW_GRID
    PLACE_SHIPS_ON_GRID  
    MOVE_TO_NEXT_SCENE
    PRINT_NOTIFICATION_MESSAGE SELECT_ATTACK_COLUMN_MSG, 1

    RET
PLAYERS_PLACE_SHIPS_    ENDP
;-----------------------------------------; 

STARTING_PAGE_     PROC NEAR
    PRINT_MESSAGE WELCOME_MSG , 0825H , 0FF28H
    PRINT_MESSAGE CONTROLLERS_MSG , 0F10h , 0FF0FH
    
    PRINT_MESSAGE ARROWS_MSG , 1210H , 0FF0FH
    PRINT_MESSAGE ENTER_MSG , 1410H , 0FF0FH        
    PRINT_MESSAGE SPACE_MSG , 1610H , 0FF0FH
    PRINT_MESSAGE TAB_MSG , 1810H , 0FF0FH
    
    PRINT_MESSAGE PRESS_ENTER_MSG , 2125H , 0FF0FH
    

    PRESS_ENTER_TO_CONTINUE
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    RET
STARTING_PAGE_     ENDP
;-----------------------------------------;  
SEND_BYTE_   PROC    NEAR
    ; PARAMETERS
    ; SERIAL_BYTE -> BYTE TO BE SENT
    
    ; CHECK THAT THE TRANSMITTER HOLDING REGISTER IS EMPTY
    MOV DX, 3FDH
    CHECK_THR:
    IN AL, DX
    AND AL, 00100000B
    JZ CHECK_THR
    ; IF EMPTY PUT THE VALUE IN THE TRANSMIT DATA REGISTER
    MOV DX, 3F8H
    MOV AL, SERIAL_BYTE
    OUT DX, AL 
    RET
SEND_BYTE_  ENDP
;-----------------------------------------;  

RECEIVE_BYTE_   PROC    NEAR
    ; PARAMETERS
    ; SERIAL_BYTE -> BYTE TO BE SENT
    
    MOV DX,3FDH
    ; CHECK IF DATA IS AVAILABLE TO READ
    IN AL, DX
    AND AL, 1
    JZ NO_DATA_TO_RECEIVE
    ; IF READY READ THE VALUE IN RECEIVED DATA REGISTER
    MOV DX, 03F8H
    IN AL, DX
    MOV SERIAL_BYTE, AL
    MOV DATA_RECEIVED_FLAG, 1
    ; CHECK FOR OVERRUN
    MOV DX, 3FDH
    IN AL, DX
    AND AL, 00000010B
    JNZ OVERRUN_DETECTED
    RET
    NO_DATA_TO_RECEIVE:
    MOV DATA_RECEIVED_FLAG, 0
    RET
    OVERRUN_DETECTED:
    MOV AH, 2
    MOV DL, 'E'
    INT 21H
    RET
RECEIVE_BYTE_    ENDP 
;-----------------------------------------;  

INITIALIZE_SERIAL_PORT_ PROC    NEAR
    ; SET DIVISOR LATCH ACCESS
    MOV DX, 3FBH
    MOV AL, 10000000B
    OUT DX, AL
    ; SET LSB OF THE DIVISOR
    MOV DX, 3F8H
    MOV AL, 0CH
    OUT DX, AL
    ; SET MSB OF THE DIVISOR
    MOV DX, 3F9H
    MOV AL, 00H
    OUT DX, AL
    ; SET PORT CONFIGURATION
    MOV DX, 3FBH
    MOV AL, 00011011B
    OUT DX, AL
    ; INITIALIZE BUFFER POINTERS
    MOV BX, OFFSET SEND_DATA_BUFFER + 1
    MOV SEND_DATA_BUFFER_PTR, BX
    MOV BX, OFFSET SEND_CHAT_BUFFER + 2
    MOV SEND_CHAT_BUFFER_PTR, BX
    ; ADD START CHAT CODE TO THE SEND BUFFER
    MOV BX, OFFSET SEND_CHAT_BUFFER + 1
    MOV BYTE PTR [BX], START_CHAT_CODE
    ; INITIALIZE BUFFER SIZES
    MOV SI, OFFSET SEND_DATA_BUFFER
    MOV DI, OFFSET RECEIVE_DATA_BUFFER
    MOV BYTE PTR [SI], 0
    MOV BYTE PTR [DI], 0
    MOV SI, OFFSET SEND_CHAT_BUFFER
    MOV DI, OFFSET RECEIVE_CHAT_BUFFER
    MOV BYTE PTR [SI], 1  ; CHAT BUFFER SIZE SHOULD BE 1 WHEN IT IS EMPTY AS IT ALWAYS CONTAINS THE START CHAT CODE
    MOV BYTE PTR [DI], 0
    RET
INITIALIZE_SERIAL_PORT_ ENDP 
;-----------------------------------------; 

SEND_DATA_  PROC    NEAR
    ; PARAMETERS
    ; AL : BUFFER INDEX
    MOV BUFFER_INDEX, AL
    ; SEND A REQUEST TO SEND
    MOV SERIAL_BYTE, REQUEST_TO_SEND_CODE
    SEND_BYTE
    ; WAIT FOR THE RECEIVER TO BE READ
    WAIT_FOR_READY_TO_RECEIVE:
        RECEIVE_BYTE
        CMP DATA_RECEIVED_FLAG, 1
        JNE WAIT_FOR_READY_TO_RECEIVE
        CMP SERIAL_BYTE, READY_TO_RECEIVE_CODE
        JNE WAIT_FOR_READY_TO_RECEIVE
        
    ; READY TO SEND
  
    ; GET THE SIZE OF THE DATA IN THE BUFFER
    CMP BUFFER_INDEX, DATA_BUFFER_INDEX
    JNE GET_CHAT_BUFFER_OFFSET
    MOV BP, OFFSET SEND_DATA_BUFFER     ; BP -> BUFFER SIZE
    MOV SI, OFFSET SEND_DATA_BUFFER_PTR ; SI -> BUFFER POINTER
    MOV BX, OFFSET SEND_DATA_BUFFER+1
    MOV DI, BX          ; BX & DI -> THE FIRST BYTE OF DATA (AFTER THE SIZE)
    JMP START_SENDING
    
    GET_CHAT_BUFFER_OFFSET:
    MOV BP, OFFSET SEND_CHAT_BUFFER     ; BP -> BUFFER SIZE
    MOV SI, OFFSET SEND_CHAT_BUFFER_PTR ; SI -> BUFFER POINTER
    MOV BX, OFFSET SEND_CHAT_BUFFER+1
    MOV DI, BX          ; BX & DI -> THE FIRST BYTE OF DATA (AFTER THE SIZE, INCLUDING THE START CHAT CODE)
    
    START_SENDING:
    MOV CL, BYTE PTR DS:[BP]
    MOV CH, 0               ; CX = DATA SIZE
    CMP BYTE PTR DS:[BP], 0
    JE EMPTY_SEND_BUFFER
    ; SEND ALL THE DATA IN THE BUFFER
    SEND_ALL_BYTES:
        MOV DL, [BX]
        MOV SERIAL_BYTE, DL
        SEND_BYTE
        INC BX
    LOOP SEND_ALL_BYTES
    
    ; RESET THE SIZE TO 0
    MOV BYTE PTR DS:[BP], 0
    CMP BUFFER_INDEX, DATA_BUFFER_INDEX
    JNE RESET_CHAT_BUFFER_SIZE
    MOV SEND_DATA_BUFFER_FULL, 0
    ; RESET THE POINTER TO THE FIRST DATA BYTE
    MOV WORD PTR [SI], DI
    JMP DONE_SENDING_BUFFER
    
    RESET_CHAT_BUFFER_SIZE:
    MOV SEND_CHAT_BUFFER_FULL, 0
    INC BYTE PTR DS:[BP]    ; CHAT BUFFER SIZE SHOULD BE 1 WHEN IT IS EMPTY AS IT ALWAYS CONTAINS THE START CHAT CODE
    ; RESET THE POINTER TO THE FIRST DATA BYTE AFTER THE START CHAT CODE
    MOV WORD PTR [SI], DI
    INC WORD PTR [SI]
    
    EMPTY_SEND_BUFFER:

    DONE_SENDING_BUFFER:
    ; SEND THE END OF SESSION CODE
    MOV SERIAL_BYTE, ALL_DATA_SENT_CODE
    SEND_BYTE
    
    RET
SEND_DATA_  ENDP
;-----------------------------------------;  

RECEIVE_DATA_   PROC    NEAR
    ; RESETTING BUFFERS NOW HAPPEN MANUALLY , TAKE CARE
    RECEIVE_BYTE
    CMP DATA_RECEIVED_FLAG, 1
    JNE NO_DATA_TO_PUT_IN_THE_BUFFER
    ; CHECK FOR THE REQUEST TO SEND
    CMP SERIAL_BYTE, REQUEST_TO_SEND_CODE
    JNE NO_DATA_TO_PUT_IN_THE_BUFFER
    ; SEND READY TO RECEIVE STATUS
    MOV SERIAL_BYTE, READY_TO_RECEIVE_CODE
    SEND_BYTE
    ; START RECEIVING DATA
    WAIT_FOR_FIRST_BYTE:
        RECEIVE_BYTE
        CMP DATA_RECEIVED_FLAG, 1
        JNE WAIT_FOR_FIRST_BYTE
        CMP SERIAL_BYTE, ALL_DATA_SENT_CODE
        JE NO_DATA_WAS_RECEIVED
        CMP SERIAL_BYTE, EXIT_GAME_CODE
        JE PRE_EXIT_SCREEN
    ; FIRST BYTE RECEIVED, CHECK IF IT IS DATA OR CHAT
    MOV CL, 0
    CMP SERIAL_BYTE, START_CHAT_CODE
    JE RECEIVE_CHAT
    ; RECEIVE DATA
    MOV BX, OFFSET RECEIVE_DATA_BUFFER+1    ; BX -> DATA
    MOV SI, OFFSET RECEIVE_DATA_BUFFER      ; SI -> SIZE

    ; ADD THE RECEIVED BYTE TO THE BUFFER 
    MOV DL, SERIAL_BYTE
    MOV BYTE PTR [BX], DL
    INC BX 
    INC CL
    JMP START_RECEIVING
    
    RECEIVE_CHAT:
    MOV BX, OFFSET RECEIVE_CHAT_BUFFER+1    ; BX -> CHAT DATA
    MOV SI, OFFSET RECEIVE_CHAT_BUFFER      ; SI -> SIZE
    
    START_RECEIVING:
    MOV AX, BX
    DEC AX ; NOW AX = BUFFER OFFSET
    ADD AX, BUFFER_SIZE ; NOW AX = OFFSET JUST BEYOND THE BUFFER
    SUB AL, OTHER_PLAYER_USERNAME+1
    RECEIVE_ALL:
        RECEIVE_BYTE
        CMP DATA_RECEIVED_FLAG, 1
        JNE RECEIVE_ALL
        ; CHECK IF THATS THE END OF THE SESSION
        CMP SERIAL_BYTE, ALL_DATA_SENT_CODE
        JE ALL_DATA_RECEIVED
        MOV DL, SERIAL_BYTE
        MOV BYTE PTR [BX], DL
        INC BX
        INC CL
        CMP BX, AX
        JE ALL_DATA_RECEIVED
    JMP RECEIVE_ALL
    ALL_DATA_RECEIVED:
    ; SET THE SIZE OF THE BUFFER
    MOV BYTE PTR[SI], CL
    RET
    
    NO_DATA_WAS_RECEIVED:
    
    NO_DATA_TO_PUT_IN_THE_BUFFER:
    RET
RECEIVE_DATA_   ENDP
;-----------------------------------------; 
ADD_BYTE_TO_SEND_BUFFER_ PROC    NEAR
    ; PARAMETERS
    ; SERIAL_BYTE -> BYTE TO BE ADDED TO THE BUFFER
    ; BL -> BUFFER INDEX
    MOV BUFFER_INDEX, BL
    ; CHECK WHICH BUFFER TO ADD TO
    CMP BUFFER_INDEX, DATA_BUFFER_INDEX
    JNE ADD_TO_CHAT_BUFFER
    ; ADD TO DATA BUFFER
    CMP SEND_DATA_BUFFER_FULL, 1
    JE DONE_ADDING_TO_SEND_BUFFER
    MOV SI, OFFSET SEND_DATA_BUFFER     ; SI -> SIZE OF THE BUFFER
    MOV BX, SEND_DATA_BUFFER_PTR        ; BX -> DATA IN THE BUFFER
    MOV DI, OFFSET SEND_DATA_BUFFER_PTR
    MOV BP, OFFSET SEND_DATA_BUFFER_FULL
    JMP ADD_TO_BUFFER
    
    ADD_TO_CHAT_BUFFER:
    CMP SEND_CHAT_BUFFER_FULL, 1
    JE DONE_ADDING_TO_SEND_BUFFER
    MOV SI, OFFSET SEND_CHAT_BUFFER     ; SI -> SIZE OF THE BUFFER
    MOV BX, SEND_CHAT_BUFFER_PTR        ; BX -> DATA IN THE BUFFER
    MOV DI, OFFSET SEND_CHAT_BUFFER_PTR
    MOV BP, OFFSET SEND_CHAT_BUFFER_FULL
    
    ADD_TO_BUFFER:
    MOV AL, SERIAL_BYTE
    MOV BYTE PTR [BX], AL
    INC WORD PTR [DI]   ; INCREMENT BUFFER POINTER
    INC BYTE PTR [SI]   ; INCREMENT SIZE
    ; CHECK IF THE MAXIMUM CAPACITY IS REACHED
    MOV AX, SI
    ADD AX, BUFFER_SIZE     ; NOW AX = OFFSET JUST BEYOND THE BUFFER
    SUB AL, MY_USERNAME+1   
    CMP WORD PTR [DI], AX
    JNE DONE_ADDING_TO_SEND_BUFFER
    
    ; MAXIMUM CAPACITY REACHED
    MOV BYTE PTR DS:[BP], 1
    
    DONE_ADDING_TO_SEND_BUFFER:
    RET
ADD_BYTE_TO_SEND_BUFFER_ ENDP
;-----------------------------------------; 
REMOVE_BYTE_FROM_SEND_BUFFER_   PROC    NEAR
    ; PARAMETERS
    ; BL -> BUFFER INDEX
    MOV BUFFER_INDEX, BL
    CMP BUFFER_INDEX, DATA_BUFFER_INDEX
    JNE REMOVE_BYTE_FROM_CHAT_BUFFER
    
    REMOVE_BYTE_FROM_DATA_BUFFER:
    MOV BX, OFFSET SEND_DATA_BUFFER
    CMP BYTE PTR [BX], 0
    JE NO_BYTE_TO_REMOVE
    DEC BYTE PTR [BX]
    DEC SEND_DATA_BUFFER_PTR
    RET
    
    REMOVE_BYTE_FROM_CHAT_BUFFER:
    MOV BX, OFFSET SEND_CHAT_BUFFER
    CMP BYTE PTR [BX], 1
    JE NO_BYTE_TO_REMOVE
    DEC BYTE PTR [BX]
    DEC SEND_CHAT_BUFFER_PTR
    RET
    
    NO_BYTE_TO_REMOVE:
    RET
REMOVE_BYTE_FROM_SEND_BUFFER_   ENDP 
;-----------------------------------------;  
WAIT_FOR_KEY_  PROC   NEAR
    
     WAIT_FOR_KEY_OR_DATA:
     CMP IS_GAME_STARTED, 1
     JNE DONT_CHECK_FOR_RECEIVED_CHAT
     ; CHECK IF A CHAT MESSAGE IS RECEIVED
     RECEIVE_DATA
     MOV BX, OFFSET RECEIVE_CHAT_BUFFER
     CMP BYTE PTR [BX], 0
     JNE PRINT_INCOMING_CHAT_MESSAGE 
     DONT_CHECK_FOR_RECEIVED_CHAT:
     ; IF NOT CHECK FOR KEY PRESSES
     MOV AH,1
     INT 16H
     JZ WAIT_FOR_KEY_OR_DATA
     MOV AH,0
     INT 16H
     
     CMP AH,EXIT_SCANCODE
     JNE NO_EXIT3
        SEND_EXIT_GAME
     NO_EXIT3:
     
     ; CHECK FOR CHAT KEYS
     CMP IS_GAME_STARTED, 1
     JNE DONT_CHECK_FOR_SENT_CHAT
     CHECK_FOR_INLINE_CHAT_KEY  AH, AL
     CMP IS_CHAT_KEY, 1
     JE WAIT_FOR_KEY_OR_DATA
     
     DONT_CHECK_FOR_SENT_CHAT:
     DIFFERENT_KEY_IS_PRESSED:
     MOV KEY_PRESSED, AH
     RET
     
     PRINT_INCOMING_CHAT_MESSAGE:
     PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
     CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
     JMP WAIT_FOR_KEY_OR_DATA
     
WAIT_FOR_KEY_ ENDP
;-----------------------------------------; 
SEND_ATTACK_COORD_  PROC   NEAR

                     
      ADD_BYTE_TO_SEND_BUFFER ATTACK_COORD_CODE, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER ATTACKX, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER ATTACKY, DATA_BUFFER_INDEX    
      SEND_DATA DATA_BUFFER_INDEX
        
      RET
 
SEND_ATTACK_COORD_ ENDP
;-----------------------------------------; 
RECEIEVE_ATTACK_COORD_  PROC   NEAR
   
  IS_IT_ATTACK_COORD:   
     RECEIVE_DATA 
     MOV BX, OFFSET RECEIVE_DATA_BUFFER 
     MOV AL,[Bx]
     CMP AL,0
     JNE ATTACK_COORD_RECEIVED
     MOV DI, OFFSET RECEIVE_CHAT_BUFFER
     CMP BYTE PTR [DI], 0
     JNE PRINT_INCOMING_CHAT_MESSAGE3
     ; IF NOT CHECK FOR KEY PRESSES
     MOV AH,1
     INT 16H
     JZ IS_IT_ATTACK_COORD
     MOV AH,0
     INT 16H
     CMP AH,EXIT_SCANCODE
     JNE NO_EXIT4
        SEND_EXIT_GAME
     NO_EXIT4:
     ; CHECK FOR CHAT KEYS
     CHECK_FOR_INLINE_CHAT_KEY  AH, AL
     JMP IS_IT_ATTACK_COORD
     
     PRINT_INCOMING_CHAT_MESSAGE3:
     PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
     CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
     JMP IS_IT_ATTACK_COORD
     
     
     ATTACK_COORD_RECEIVED:
     CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
     INC BX
     MOV AL,[Bx]
     CMP AL, POWER_UP_ACTIVATION_CODE
     JE THE_OTHER_PLAYER_ACTIVATE_POWER_UP
     CMP AL, ATTACK_COORD_CODE
     JNE IS_IT_ATTACK_COORD
     JE ATTACK_COORD_RECEIEVED_SUCCESSFULLY
     
     THE_OTHER_PLAYER_ACTIVATE_POWER_UP:
     ACTIVATE_OTHER_PLAYER_POWER_UP
     JMP IS_IT_ATTACK_COORD    
     
     ATTACK_COORD_RECEIEVED_SUCCESSFULLY:
     INC BX
     MOV AX,[BX]
     MOV ATTACKX,AX
    
     ADD BX, 2
     MOV AX,[BX]
     MOV ATTACKY,AX

     RET
    
 RECEIEVE_ATTACK_COORD_ ENDP
;-----------------------------------------; 
RECEIEVE_ATTACK_RESULT_  PROC   NEAR
 
   IS_IT_ATTACK_RESULTS:   
     RECEIVE_DATA 
     MOV BX, OFFSET RECEIVE_DATA_BUFFER
     MOV AL,[Bx]
     CMP AL, 0
     JNE RECEIVED_ATTACK_RESULTS
     MOV DI, OFFSET RECEIVE_CHAT_BUFFER
     CMP BYTE PTR [DI], 0
     JNE PRINT_INCOMING_CHAT_MESSAGE4
     ; IF NOT CHECK FOR KEY PRESSES
     MOV AH,1
     INT 16H
     JZ IS_IT_ATTACK_RESULTS
     MOV AH,0
     INT 16H
     CMP AH,EXIT_SCANCODE
     JNE NO_EXIT5
        SEND_EXIT_GAME
     NO_EXIT5:
     ; CHECK FOR CHAT KEYS
     CHECK_FOR_INLINE_CHAT_KEY  AH, AL
     JMP IS_IT_ATTACK_RESULTS
     
     PRINT_INCOMING_CHAT_MESSAGE4:
     PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
     CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
     JMP IS_IT_ATTACK_RESULTS
     
     
     RECEIVED_ATTACK_RESULTS:
     CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
     INC BX
     MOV AL,[Bx]
     CMP AL, ATTACK_RESULT_CODE
     JNE IS_IT_ATTACK_RESULTS
     ;JNE HERE WE HAVE TO CHECK IF IT WAS A MSG OR NOT TO CHECK , LET'S TRY IT AT FIRST
     
     ;RECEIEVE THE DATA By THE SAME ORDER I SENT IT
     INC BX                
     MOV AL,[BX]
     MOV IS_ON_GRID,AL
    
     INC BX
     MOV AL,[BX]
     MOV IS_ATTACKED_BEFORE,AL
     
     INC BX
     MOV AL,[BX]
     MOV IS_ONTARGET,AL
     
     INC BX
     MOV AL,[BX]
     MOV IS_DESTROYED, AL
     
     CMP AL, 0
     JE THIS_DATA_IS_ENOUGH
     
     INC BX
     MOV AX,[BX]
     MOV DESTROYED_X1, AX
     
     ADD BX, 2
     MOV AX,[BX]
     MOV DESTROYED_Y1, AX
     
     ADD BX, 2
     MOV AX,[BX]
     MOV DESTROYED_X2, AX
     
     ADD BX, 2
     MOV AX,[BX]
     MOV DESTROYED_Y2, AX
     
     THIS_DATA_IS_ENOUGH:   
     RET   
     
RECEIEVE_ATTACK_RESULT_ ENDP
;-----------------------------------------; 
RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT_  PROC   NEAR
 
   IS_IT_RANDOM_SHIP_RESULTS:   
     RECEIVE_DATA 
     MOV BX, OFFSET RECEIVE_DATA_BUFFER
     MOV AL,[Bx]
     CMP AL, 0
     JNE RECEIVED_DESTROYED_SHIP_POWER_UP_RESULT
     MOV DI, OFFSET RECEIVE_CHAT_BUFFER
     CMP BYTE PTR [DI], 0
     JNE PRINT_INCOMING_CHAT_MESSAGE5
     ; IF NOT CHECK FOR KEY PRESSES
     MOV AH,1
     INT 16H
     JZ IS_IT_RANDOM_SHIP_RESULTS
     MOV AH,0
     INT 16H
     CMP AH,EXIT_SCANCODE
     JNE NO_EXIT6
        SEND_EXIT_GAME
     NO_EXIT6:
     ; CHECK FOR CHAT KEYS
     CHECK_FOR_INLINE_CHAT_KEY  AH, AL
     JMP IS_IT_RANDOM_SHIP_RESULTS
     
     PRINT_INCOMING_CHAT_MESSAGE5:
     PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
     CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
     JMP IS_IT_RANDOM_SHIP_RESULTS
     
     
     RECEIVED_DESTROYED_SHIP_POWER_UP_RESULT:
     CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
     INC BX
     MOV AL,[Bx]
     CMP AL, DESTROY_RANDOM_SHIP_RESULT_CODE
     JNE IS_IT_RANDOM_SHIP_RESULTS
     ;JNE HERE WE HAVE TO CHECK IF IT WAS A MSG OR NOT TO CHECK , LET'S TRY IT AT FIRST
     
     INC BX
     MOV DX, [BX]
     MOV DESTROYED_X1, DX
     
     ADD BX, 2
     MOV DX, [BX]
     MOV DESTROYED_Y1, DX
     
     ADD BX, 2
     MOV DL, [BX]
     MOV DESTROYED_SHIP_REMAINING_CELLS, DL
     
     INC BX
     MOV DX, [BX]
     MOV DESTROYED_SHIP_ORIENTATION, DX
     
     ADD BX, 2
     MOV DX, [BX]
     MOV DESTROYED_SHIP_SIZE, DX
     UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP   
     RET   
     
RECEIEVE_DESTROYED_SHIP_POWER_UP_RESULT_ ENDP
;-----------------------------------------;  
SEND_DESTROYED_SHIP_POWER_UP_RESULT_  PROC   NEAR
      
      ADD_BYTE_TO_SEND_BUFFER DESTROY_RANDOM_SHIP_RESULT_CODE, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER DESTROYED_X1, DATA_BUFFER_INDEX        ;THOSE PARAMETERS WILL ONLY BE USED IF THE RANDOM_PLAYER WAS THE SENDER 
      ADD_WORD_TO_SEND_BUFFER DESTROYED_Y1, DATA_BUFFER_INDEX        ;SO THE RECEIEVER WANT TO KNOW THEIR POINTS 
      ADD_BYTE_TO_SEND_BUFFER DESTROYED_SHIP_REMAINING_CELLS, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER DESTROYED_SHIP_ORIENTATION, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER DESTROYED_SHIP_SIZE, DATA_BUFFER_INDEX
      SEND_DATA DATA_BUFFER_INDEX
      RET
 
SEND_DESTROYED_SHIP_POWER_UP_RESULT_ ENDP
;-----------------------------------------; 
SEND_ATTACK_RESULT_  PROC   NEAR
     
     ADD_BYTE_TO_SEND_BUFFER ATTACK_RESULT_CODE, DATA_BUFFER_INDEX
     ADD_BYTE_TO_SEND_BUFFER IS_ON_GRID, DATA_BUFFER_INDEX
     ADD_BYTE_TO_SEND_BUFFER IS_ATTACKED_BEFORE, DATA_BUFFER_INDEX
     ADD_BYTE_TO_SEND_BUFFER IS_ONTARGET, DATA_BUFFER_INDEX
     ADD_BYTE_TO_SEND_BUFFER IS_DESTROYED, DATA_BUFFER_INDEX
     ADD_WORD_TO_SEND_BUFFER DESTROYED_X1, DATA_BUFFER_INDEX
     ADD_WORD_TO_SEND_BUFFER DESTROYED_Y1, DATA_BUFFER_INDEX
     ADD_WORD_TO_SEND_BUFFER DESTROYED_X2, DATA_BUFFER_INDEX
     ADD_WORD_TO_SEND_BUFFER DESTROYED_Y2, DATA_BUFFER_INDEX
     SEND_DATA DATA_BUFFER_INDEX
     
     MOV IS_DESTROYED, 0
     RET
 
SEND_ATTACK_RESULT_ ENDP
;-----------------------------------------; 
MOVE_TO_NEXT_SCENE_  PROC   NEAR
    CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
    MOV DUMMY_COUNTER, 0
    WAIT_FOR_ME_TO_MOVE_TO_NEXT_SCENE:
    WAIT_FOR_KEY
    MOV AH, KEY_PRESSED
    CMP AH, ENTER_SCANCODE
    JNZ WAIT_FOR_ME_TO_MOVE_TO_NEXT_SCENE

    MOV BX, OFFSET RECEIVE_DATA_BUFFER
    RECEIVE_DATA
    CMP BYTE PTR [BX], 0
    JNE RECEIVE_MOVE_TO_NEXT_SCENE

    SEND_MOVE_TO_NEXT_SCENE:
    PRINT_NOTIFICATION_MESSAGE  WAIT_FOR_THE_OTHER_PLAYER_MSG, 1
    ADD_BYTE_TO_SEND_BUFFER MOVE_TO_NEXT_SCENE_CODE, DATA_BUFFER_INDEX
    SEND_DATA   DATA_BUFFER_INDEX
    INC DUMMY_COUNTER
    CMP DUMMY_COUNTER, 2
    JNE RECEIVE_MOVE_TO_NEXT_SCENE_AFTER_SENDING
    RET

    RECEIVE_MOVE_TO_NEXT_SCENE:
    CLEAR_RECEIVE_BUFFER   DATA_BUFFER_INDEX
    MOV BX, OFFSET RECEIVE_DATA_BUFFER+1
    CMP BYTE PTR [BX], MOVE_TO_NEXT_SCENE_CODE
    JNE MOVE_TO_NEXT_SCENE_ERROR
    INC DUMMY_COUNTER
    CMP DUMMY_COUNTER, 2
    JNE SEND_MOVE_TO_NEXT_SCENE
    RET

    RECEIVE_MOVE_TO_NEXT_SCENE_AFTER_SENDING:
    MOV BX, OFFSET RECEIVE_DATA_BUFFER
    MOV DI, OFFSET RECEIVE_CHAT_BUFFER
    WAIT_FOR_THE_OTHER_PLAYER_TO_MOVE_TO_THE_NEXT_SCENE:
         RECEIVE_DATA
         CMP BYTE PTR [BX], 0
         JNE RECEIVE_MOVE_TO_NEXT_SCENE
         CMP BYTE PTR [DI], 0
         JNE PRINT_INCOMING_CHAT_MESSAGE2
         ; IF NOT CHECK FOR KEY PRESSES
         MOV AH,1
         INT 16H
         JZ WAIT_FOR_THE_OTHER_PLAYER_TO_MOVE_TO_THE_NEXT_SCENE
         MOV AH,0
         INT 16H
         CMP AH,EXIT_SCANCODE
         JNE NO_EXIT7
         SEND_EXIT_GAME
         NO_EXIT7:
         ; CHECK FOR CHAT KEYS
         CHECK_FOR_INLINE_CHAT_KEY  AH, AL
    JMP WAIT_FOR_THE_OTHER_PLAYER_TO_MOVE_TO_THE_NEXT_SCENE 
    
    MOVE_TO_NEXT_SCENE_ERROR:
    ; IF WE REACHED THIS POINT THEN ONE PLAYER HAS SENT MOVE_TO_NEXT_SCENE_CODE AND THE OTHER PLAYER SEND SOMETHING ELSE
    PRINT_NOTIFICATION_MESSAGE  FIRE_SLIDER_MSG, 1
    MOV AH, 0
    INT 16H
    RET
    
    PRINT_INCOMING_CHAT_MESSAGE2:
    PRINT_INLINE_CHAT_MESSAGE RECEIVE_CHAT_BUFFER, 2
    CLEAR_RECEIVE_BUFFER   CHAT_BUFFER_INDEX
    JMP WAIT_FOR_THE_OTHER_PLAYER_TO_MOVE_TO_THE_NEXT_SCENE
    RET
MOVE_TO_NEXT_SCENE_ ENDP
;-----------------------------------------; 
SEND_POWER_UP_ACTIVATION_  PROC   NEAR
      
      ;PARAMETERS, AL --> CERTAIN POWER UP CODE 
      ADD_BYTE_TO_SEND_BUFFER POWER_UP_ACTIVATION_CODE, DATA_BUFFER_INDEX
      ADD_BYTE_TO_SEND_BUFFER AL, DATA_BUFFER_INDEX
      ADD_BYTE_TO_SEND_BUFFER RANDOM_PLAYER, DATA_BUFFER_INDEX       ;IT WILL BE USED ONLY IF AL HAS THE RANDOM SHIP CODE
      ADD_WORD_TO_SEND_BUFFER DESTROYED_X1, DATA_BUFFER_INDEX        ;THOSE PARAMETERS WILL ONLY BE USED IF THE RANDOM_PLAYER WAS THE SENDER 
      ADD_WORD_TO_SEND_BUFFER DESTROYED_Y1, DATA_BUFFER_INDEX        ;SO THE RECEIEVER WANT TO KNOW THEIR POINTS 
      ADD_BYTE_TO_SEND_BUFFER DESTROYED_SHIP_REMAINING_CELLS, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER DESTROYED_SHIP_ORIENTATION, DATA_BUFFER_INDEX
      ADD_WORD_TO_SEND_BUFFER DESTROYED_SHIP_SIZE, DATA_BUFFER_INDEX
      SEND_DATA DATA_BUFFER_INDEX
      RET
 
SEND_POWER_UP_ACTIVATION_ ENDP
;-----------------------------------------; 
ACTIVATE_OTHER_PLAYER_POWER_UP_  PROC   NEAR

     MOV BX, OFFSET RECEIVE_DATA_BUFFER + 2
     MOV AL,[Bx]
     CMP AL, ATTACK_TWICE_CODE
     JNE NOT_ATTACK_TWICE
     OTHER_PLAYER_ATTACK_TWICE_POWER_UP_ACTIVATED
     RET
    
     NOT_ATTACK_TWICE:
     CMP AL, DESTROY_RANDOM_SHIP_CODE
     JNE NOT_DESTROY_RANDOM_SHIP
     INC BX
     MOV DL, [BX]
     CMP DL, 1
     JNE THE_RANDOM_SHIP_ISNOT_MINE
     CHOOSE_SHIP_AND_DESTROY_IT
     SEND_DESTROYED_SHIP_POWER_UP_RESULT
     DRAW_ALL_SHIPS_ON_GRID
     DRAW_ALL_X_SIGNS OTHER_PLAYER_INDEX
     RET
     
     THE_RANDOM_SHIP_ISNOT_MINE:
     INC BX
     MOV DX, [BX]
     MOV DESTROYED_X1, DX
     
     ADD BX, 2
     MOV DX, [BX]
     MOV DESTROYED_Y1, DX
     
     ADD BX, 2
     MOV DL, [BX]
     MOV DESTROYED_SHIP_REMAINING_CELLS, DL
     
     INC BX
     MOV DX, [BX]
     MOV DESTROYED_SHIP_ORIENTATION, DX
     
     ADD BX, 2
     MOV DX, [BX]
     MOV DESTROYED_SHIP_SIZE, DX
     UPDATE_OTHER_PLAYER_RANDOM_DESTROYED_SHIP
     RET
     
     NOT_DESTROY_RANDOM_SHIP:
     MOV AL,1
     MOV IS_OTHER_PLAYER_REVERSE_ATTACK_ACTIVATED , Al
     RET
     

ACTIVATE_OTHER_PLAYER_POWER_UP_ ENDP
;-----------------------------------------; 
;-----------------------------------------; 

CHECK_FOR_INLINE_CHAT_KEY_  PROC    NEAR
    ; PARAMETERS
    ; AL : ASCII CODE
    ; AH : SCAN CODE
    CMP AH, TAB_SCANCODE
    JE IS_NOT_A_CHAT_KEY
    
    CMP AH, ENTER_SCANCODE
    JE IS_NOT_A_CHAT_KEY
    
    CMP AL,PLUS_ASCII_CODE
    JE SEND_CHAT_MSG
    
    CHECK_IF_CHAT_KEY AL
    CMP IS_CHAT_KEY,1
    JE ADD_BYTE_TO_BUFFER
    CMP AL,8        ;CHECKS IF THE NOT-A-CHAT KEY IS BACKSPACE
    JE BACK_SPACE_PRESSED
    RET
    
    SEND_CHAT_MSG:
    SEND_DATA CHAT_BUFFER_INDEX
    MOV IS_CHAT_KEY, 1
    JMP PRINT_MY_CHAT_MESSAGE
    
    ADD_BYTE_TO_BUFFER:    
    ADD_BYTE_TO_SEND_BUFFER AL, CHAT_BUFFER_INDEX
    JMP PRINT_MY_CHAT_MESSAGE
    
    BACK_SPACE_PRESSED:
    REMOVE_BYTE_FROM_SEND_BUFFER CHAT_BUFFER_INDEX
    MOV IS_CHAT_KEY, 1
    JMP PRINT_MY_CHAT_MESSAGE
    
    PRINT_MY_CHAT_MESSAGE:
    PRINT_INLINE_CHAT_MESSAGE SEND_CHAT_BUFFER, 1
    RET
    
    IS_NOT_A_CHAT_KEY:
    MOV IS_CHAT_KEY, 0
    RET
CHECK_FOR_INLINE_CHAT_KEY_  ENDP
;-----------------------------------------; 

CHECK_IF_CHAT_KEY_   PROC    NEAR
    ;PARAMETERS:
    ;BL: KEY ASCII CODE
    
    CMP BL,32
    JNAE NOT_A_CHAT_KEY
    CMP BL,126
    JNBE NOT_A_CHAT_KEY
    MOV IS_CHAT_KEY,1
    JMP FINISHED_CHECK_IF_CHAT_KEY
    
NOT_A_CHAT_KEY:
    MOV IS_CHAT_KEY,0
FINISHED_CHECK_IF_CHAT_KEY:    
    RET
CHECK_IF_CHAT_KEY_    ENDP
;-----------------------------------------; 
CLEAR_RECEIVE_BUFFER_   PROC    NEAR
    ; PARAMETERS
    ; AL: BUFFER INDEX
    MOV BUFFER_INDEX, AL
    CMP BUFFER_INDEX, DATA_BUFFER_INDEX
    JE CLEAR_RECEIVE_DATA_BUFFER
    
    CLEAR_RECEIVE_CHAT_BUFFER:
    MOV RECEIVE_CHAT_BUFFER, 0
    RET
    
    CLEAR_RECEIVE_DATA_BUFFER:
    MOV RECEIVE_DATA_BUFFER, 0
    RET
    
CLEAR_RECEIVE_BUFFER_   ENDP
;-----------------------------------------; 
SEND_EXIT_GAME_  PROC    NEAR
    ADD_BYTE_TO_SEND_BUFFER     EXIT_GAME_CODE, DATA_BUFFER_INDEX
    SEND_DATA   DATA_BUFFER_INDEX
    RET
SEND_EXIT_GAME_ ENDP

;-----------------------------------------;
ADD_TO_MSGS_QUEUE_   PROC    NEAR
    ; PARAMETERS
    ; AH -> PLAYRE INDEX
    ; BP -> OFFSET MESSAGE
    MOV CX,15
    MOV BX,OFFSET MESSAGES_QUEUE1
SEARCH_FOR_EMPTY_PLACE: 
    INC BX   
    CMP BYTE PTR[BX],0
    JE FOUND_EMPTY_PLACE
    DEC BX
    ADD BX,103
    DEC CX
    CMP CX,0
    JNE SEARCH_FOR_EMPTY_PLACE
    JMP NO_EMPTY_PLACE
    
FOUND_EMPTY_PLACE:
    DEC BX
    MOV SI,BP
    MOV BYTE PTR[BX],AH
    INC BX
    MOV BYTE PTR[BX],1
    INC BX
    MOV DI,BX
    MOV CX,101
    REP MOVSB
    RET
    
NO_EMPTY_PLACE:
    MOV BX,OFFSET MESSAGES_QUEUE1
    MOV DX,14
EMPTYING_A_PLACE:    
    MOV DI,BX
    MOV SI,BX
    ADD SI,103
    MOV CX,103
    REP MOVSB
    ADD BX,103
    DEC DX
    CMP DX,0
    JE ENQUEUE_NEW_MSG
    JMP EMPTYING_A_PLACE
    
ENQUEUE_NEW_MSG:
    MOV SI,BP
    MOV BYTE PTR[BX],AH
    ADD BX,2
    MOV DI,BX
    MOV CX,101
    REP MOVSB
      
    RET
ADD_TO_MSGS_QUEUE_   ENDP
;-----------------------------------------;
PRINT_MSGS_QUEUE_   PROC    NEAR
    MOV CX,15
    MOV BX,OFFSET MESSAGES_QUEUE1
    MOV PLACE_TO_PRINT_NEXT_MSG,0100H
    
PRINT_NEXT_MSG:
    INC BX
    CMP BYTE PTR[BX],0
    JE CLOSE_PRINT_MSGS_QUEUE
    DEC BX    
    CMP BYTE PTR[BX],2
    JE PLAYER2_PRINT_MSG
    
    MOV DX,PLACE_TO_PRINT_NEXT_MSG
    PRINT_MESSAGE EMPTY_STRING,PLACE_TO_PRINT_NEXT_MSG,000FH
    PRINT_MESSAGE CHAT_CONSTANT2,DX,0FF02H
    ADD DL,2
    PRINT_MESSAGE MY_USERNAME+1,DX,0FF02H
    ADD DL,MY_USERNAME+1
    PRINT_MESSAGE CHAT_CONSTANT,DX,0FF02H
    ADD DL,2
    ADD BX,2
    ;PRINTING MESSAGE
    PUSHA
    MOV CX,0
    MOV AX,1301H
    MOV CL,[BX]
    INC BX
    MOV BP,BX
    MOV BX,000FH
    INT 10H
    POPA
    SUB BX,2
    ADD PLACE_TO_PRINT_NEXT_MSG,0200H 
    
    ADD BX,103
    DEC CX
    CMP CX,0
    JNE PRINT_NEXT_MSG
    RET
    
PLAYER2_PRINT_MSG:
    MOV DX,PLACE_TO_PRINT_NEXT_MSG
    PRINT_MESSAGE EMPTY_STRING,PLACE_TO_PRINT_NEXT_MSG,000FH
    PRINT_MESSAGE CHAT_CONSTANT2,DX,0FF03H
    ADD DL,2
    PRINT_MESSAGE OTHER_PLAYER_USERNAME+1,DX,0FF03H
    ADD DL,OTHER_PLAYER_USERNAME+1
    PRINT_MESSAGE CHAT_CONSTANT,DX,0FF03H
    ADD DL,2
    ADD BX,2
    ;PRINTING MESSAGE
    PUSHA
    MOV CX,0
    MOV AX,1301H
    MOV CL,[BX]
    INC BX
    MOV BP,BX
    MOV BX,000FH
    INT 10H
    POPA
    SUB BX,2
    ADD PLACE_TO_PRINT_NEXT_MSG,0200H 
    
    ADD BX,103
    DEC CX
    CMP CX,0
    JNE PRINT_NEXT_MSG
CLOSE_PRINT_MSGS_QUEUE:    
    RET
PRINT_MSGS_QUEUE_   ENDP
;-----------------------------------------;
STANDALONE_CHAT_MODE_   PROC    NEAR
    
    CLEAR_GAME_SCREEN BLACK
    PRINT_MESSAGE TYPE_HERE_MSG,1F00H,000FH 
    MOV AX, 0C0FH
    MOV CX,0
    MOV DX,517  
    DRAW_TYPING_BOX:
    INT 10H
    INC CX
    CMP CX,800
    JNZ DRAW_TYPING_BOX
    MOV PLACE_TO_PRINT_NEXT_MSG,0100H ; INITIAL POSITION
    
    ;EMPTY NOTIFICATION BAR
    MOV AX,1301H
    MOV BX,000FH
    MOV DX,2300H
    MOV BP, OFFSET EMPTY_STRING+1
    MOV CX,0
    MOV CL, EMPTY_STRING
    INT 10H
    MOV DX,2400H
    INT 10H
    
    MOV MAX_MSG_LENGTH,96
    MOV CL,MY_USERNAME+1
    SUB MAX_MSG_LENGTH,CL
    
STANDALONE_CHAT_MODE_START:     
    MOV AH,1
    INT 16H
    
    JZ CHECK_IF_MSG_RECEIVED
    PRINT_MSGS_QUEUE
    MOV AH,0
    INT 16H
    
    CMP AH,EXIT_SCANCODE
    JNE CONTINUE_STANDALONE_CHAT_MODE
    RET
    
CONTINUE_STANDALONE_CHAT_MODE:   
    CMP AH,ENTER_SCANCODE
    JE SEND_CHAT_MESSAGE
    
    CHECK_IF_CHAT_KEY AL
    CMP IS_CHAT_KEY,1
    JE ADD_A_BYTE_TO_BUFFER
    CMP AL,8        ;CHECKS IF THE NOT-A-CHAT KEY IS BACKSPACE
    JNE CHECK_IF_MSG_RECEIVED
    REMOVE_BYTE_FROM_SEND_BUFFER DATA_BUFFER_INDEX
    PRINT_MESSAGE EMPTY_STRING,2100H,000FH
    PRINT_MESSAGE SEND_DATA_BUFFER,2100H,000FH 
    JMP CHECK_IF_MSG_RECEIVED
    
SEND_CHAT_MESSAGE:
    CMP SEND_DATA_BUFFER,0
    JE CHECK_IF_MSG_RECEIVED
    PRINT_MESSAGE EMPTY_STRING,2100H,000FH
    ADD_TO_MSGS_QUEUE 1,SEND_DATA_BUFFER
    SEND_DATA DATA_BUFFER_INDEX
    PRINT_MSGS_QUEUE
    JMP CHECK_IF_MSG_RECEIVED 
    
ADD_A_BYTE_TO_BUFFER:
    MOV CL,MAX_MSG_LENGTH
    CMP SEND_DATA_BUFFER,CL
    JAE CHECK_IF_MSG_RECEIVED   
    ADD_BYTE_TO_SEND_BUFFER AL,DATA_BUFFER_INDEX
    PRINT_MESSAGE EMPTY_STRING,2100H,000FH
    PRINT_MESSAGE SEND_DATA_BUFFER,2100H,000FH 
    
    
CHECK_IF_MSG_RECEIVED:
    RECEIVE_DATA
    CMP RECEIVE_DATA_BUFFER,0
    JE STANDALONE_CHAT_MODE_START
    ADD_TO_MSGS_QUEUE 2,RECEIVE_DATA_BUFFER
    CLEAR_RECEIVE_BUFFER    DATA_BUFFER_INDEX
    PRINT_MSGS_QUEUE
    JMP STANDALONE_CHAT_MODE_START

    RET
STANDALONE_CHAT_MODE_    ENDP

END     MAIN