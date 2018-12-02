StatusBarTemplate       MACRO       PLAYER1, PLAYER2, SCORE_CONSTANT
 ;draws statusbar and default names                      
                        LOCAL LOOP1
                        LOCAL LOOP2
                        LOCAL LOOP3

;.....................STATUS BAR..........................                        
                        MOV AX, 0C00H
                        MOV CX,0
                        MOV DX,545
                        
                        LOOP1:
                        INT 10H
                        INC CX
                        CMP CX,800
                        JNZ LOOP1
;...................................................................

;.....................CHAT BAR..........................   
                        MOV AX, 0C00H                     
                        MOV CX,0    ;STARTING FROM THE LEFT EDGE
                        MOV DX,495  ;HEIGHT VALUE
                        
                        LOOP2:
                        INT 10H
                        INC CX
                        CMP CX,800 ;ENDING AT THE RIGHT EDGE
                        JNZ LOOP2
                        
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,20H ;Y
                        MOV DL,0H ;X
                        MOV BP,OFFSET PLAYER1 + 2
                        MOV BH,0H
                        MOV CL,PLAYER1+1
                        MOV BL,0FH
                        INT 10H
                        
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,21H ;Y
                        MOV DL,0H ;X
                        MOV BP,OFFSET PLAYER2 + 2
                        MOV BH,0H
                        MOV CL,PLAYER1 + 1
                        MOV BL,0FH
                        INT 10H
;...................................................................
;.....................SCORE BAR..........................                        
                        MOV AX, 0C00H
                        MOV CX,0
                        MOV DX,480
                        
                        LOOP3:
                        INT 10H
                        INC CX
                        CMP CX,800
                        JNZ LOOP3
                        ;..........PLAYER 1 SCORE
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,1EH ;Y
                        MOV DL,0H ;X
                        MOV BP,OFFSET PLAYER1 + 2
                        MOV BH,0H
                        MOV CL,PLAYER1+1
                        MOV BL,0FH
                        INT 10H
                        
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,1EH ;Y
                        MOV DL,PLAYER1+1  ;X
                        MOV BP,OFFSET SCORE_CONSTANT
                        MOV BH,0H
                        MOV CL,10
                        MOV BL,0FH
                        INT 10H
                        
                        ;........PLAYER 2 SCORE
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,1EH ;Y
                        MOV DL,40H ;X
                        MOV BP,OFFSET PLAYER2 + 2
                        MOV BH,0H
                        MOV CL,PLAYER1 + 1
                        MOV BL,0FH
                        INT 10H
                        
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,1EH ;Y
                        MOV DL,PLAYER2+1  ;X
                        ADD DL,40H
                        MOV BP,OFFSET SCORE_CONSTANT
                        MOV BH,0H
                        MOV CL,10
                        MOV BL,0FH
                        INT 10H
;...................................................................
ENDM                    StatusBarTemplate

NotificationBarMessage       MACRO       STATUS_TEXT,SIZE,INDEX ;INDEX = 1 -> MESSAGE #1
                                                                ;INDEX = 2 -> MESSAGE #2
;prints notifications
                        MOV CX,0
                        MOV AH,13H
                        MOV AL,01H
                        MOV DH,22H ;Y
                        ADD DH, INDEX
                        MOV DL,0H ;X
                        MOV BP,OFFSET STATUS_TEXT
                        MOV BH,0H
                        MOV CL,SIZE
                        MOV BL,0FH
                        INT 10H
;...................................................................
ENDM                    NotificationBarMessage

