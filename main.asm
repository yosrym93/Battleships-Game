include Main.inc

.MODEL SMALL
.STACK 64
.DATA
;---------------- Messages Data For The User -------------------
Please_Enter_Your_NAME_MSG  db    16h,'Please Enter Your Name'
Player1_MSG                 db    8h ,'Player1:' 
Player2_MSG                 db    8h ,'Player2:'         
Press_Enter_MSG             db    1Bh,'Press Enter Key To Continue' 
To_Start_Game_MSG           db    1Bh,'-To Start The Game Press F2'
Enter_Level_MSG             db    1Ch,'-Enter The Game Level 1 Or 2'
To_End_Prog_MSG             db    1Eh,'-To End The Programe Press ESC'
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL               DB     1,?,?,?   ; 1 OR 2
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
P1_UserName         db    14h,?,20 DUP('$') 
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
P2_UserName         db    14h,?,20 DUP('$') 
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

.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX


  InitializePrograme
  UserNames
  MainMenu
  GetLevel




HLT
MAIN    ENDP
;-------------------------------------;
;---------- Procedures ---------------;
;-------------------------------------;        
Print_Message    PROC Near

      MOV AX,1301H
      MOV BX,BP
      MOV CL,[BX]
      MOV CH,00H
      ADD BP,1H
      MOV BX,000FH  
      INT 10H
      ret

Print_Message     ENDP
;-------------------------------------;
Clear_Screen    PROC Near

     MOV DX,0  
     Mov AX,0C0FH       
       L1:
          MOV cx,0320H                
       L2:   
          int 10h
          LOOP L2
          INC DX
          CMP DX,0258h
          jnz L1   
            
     ret       

Clear_Screen     ENDP
;-------------------------------------;
Get_User_Name     PROC Near

     PrintMessage Please_Enter_Your_NAME_MSG , 1025h
     PrintMessage Press_Enter_MSG , 1425h
     
     cmp SI,1h
     jnz Player2
     PrintMessage Player1_MSG ,0925h
     jmp Cont
Player2:
     PrintMessage Player2_MSG ,0925h 
     
Cont:        
     mov ah,02h
     mov dx,1225h
     int 10h
        
     mov ah,0AH
     mov dx,DI
     int 21h
     ret 
     
Get_User_Name     ENDP
;-------------------------------------;
User_Names     PROC Near

     GetUserName 1h,P1_UserName
     ClearScreen  
     GetUserName 2h,P2_UserName
     ClearScreen
     
     ret 
User_Names     ENDP
;-------------------------------------;
Main_Menu     PROC Near

        PrintMessage To_Start_Game_MSG , 1025h
        PrintMessage To_End_Prog_MSG , 1425h

  NotValid:          
        mov ah,0
        int 16h
        cmp Ah,3Ch
        jz Cont2
  NotF2:                 
        cmp Ah,01h
        jz EXIT
        jnz NotValid            ;Jz where ???
  Cont2:       
        ClearScreen
     ret 
  EXIT:
        hlt
     
Main_Menu     ENDP
;-------------------------------------;
Initalize_Programe     PROC Near

   
        MOV AX,4f02h           ;Go To VideoMode 800*600
        MOV BX,103h
        int 10h

        ClearScreen
     ret 
Initalize_Programe     ENDP
;-------------------------------------;
Get_Level     PROC Near

 PrintMessage Enter_Level_MSG , 1025h
  
  NotValid2:
        mov ah,02h                 ;Move The Curser
        mov dx,1225h
        int 10h
        
        mov ah,0AH                 ;Get User Input   
        mov dx,offset Level
        int 21h     
        
        Mov Bx,dx                  ;Check That The user input 1 Or 2 
        mov Cl,[bx+2]
        cmp Cl,31h
        jz  Back
        cmp Cl,32h
        jnz NotValid2
  Back:
        ret
Get_Level     ENDP
;-------------------------------------;
END     MAIN
