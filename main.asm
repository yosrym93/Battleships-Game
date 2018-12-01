.MODEL SMALL

.STACK 64

.DATA
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL               DB     1   ; 1 OR 2
GRID_SIZE           EQU  100   ; 10 X 10

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
P1_USERNAME         DB  20 DUP ('$')
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
P2_USERNAME         DB  20 DUP ('$')
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


MOV AX, 6AH
INT 10H





HLT
MAIN    ENDP

END     MAIN