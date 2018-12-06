include yosry.inc
include ahmad.inc
include nader.inc
.model large
.386
.STACK 64
.DATA

;---------------- ATTACK -----------------------------------
SELECT_ATTACK_COLUMN_MSG                DB  84,"- Navigate through columns and press space "
                                        DB  "to select the column of the attacked cell"
FIRE_SLIDER_MSG                         DB  62,"Press SPACE to stop the slider at the row of the attacked cell"


;---------------- STATUS BAR - ------------------------; 
SCORE_CONSTANT_TEXT                     DB  10,"'s Score: "
EMPTY_STRING                            DB  100,100 DUP(' ')
;----------------------- Nader (EXPERIMENTAL) - ------------------------; 
STATUS_TEST1                            DB  46,"- Please select the starting cell of your ship"
STATUS_TEST2                            DB  44,"- Please select the orientation of your ship"
Is_OnTarget                             DB    ?
;---------------- CELLS SELECTOR------------------------; 
SELECTOR_X1                             DW  20
SELECTOR_Y1                             DW  19
SELECTOR_X2                             DW  20
SELECTOR_Y2                             DW  19
SELECTOR_GRID_X1                        DW  0
SELECTOR_GRID_Y1                        DW  0
SELECTOR_GRID_X2                        DW  ?
SELECTOR_GRID_Y2                        DW  ?
UP_ORIENTATION                          DB  ?   ;ORIENTATION = 0 : INVALID
DOWN_ORIENTATION                        DB  ?   ;            = 1 : VALID
LEFT_ORIENTATION                        DB  ?
RIGHT_ORIENTATION                       DB  ?
;---------------- COORDINATES TRANSFER PARAMETERS ----------
GRID1_X            DW  ?
GRID2_X            DW  ?
GRID1_Y            DW  ?
GRID2_Y            DW  ?
PIXELS1_X          DW  ?
PIXELS2_X          DW  ?
PIXELS1_Y          DW  ?
PIXELS2_Y          DW  ?
;---------------- attack -----------------------------------  Done
select_attack_column_msg                db  84,"- Navigate through columns and press space "
                                        db  "to select the column of the attacked cell"
fire_slider_msg                         db  62,"Press space to stop the slider at the row of the attacked cell"

attackx                                 dw ?        
attacky                                 dw ?               
Is_Even                                 db ?
Is_OnTarget                             db ?
Is_Attacked_before                      db ?
Player_Attacking                        db 1
Player_Attacked                         db 2
Game_END                                db 0
;---------------- status bar - nader------------------------; most of those variables are experimental
score_constant_text                     db  10,"'s Score: "
status_test                             db  37,"- This is a test notification message"
p1_score_string                         db  2 dup(?)
p2_score_string                         db  2 dup(?)

;---------------- coordinates transfer parameters ---------- Done
grid1_x            dw  ?
grid2_x            dw  ?
grid1_y            dw  ?
grid2_y            dw  ?
pixels1_x          dw  ?
pixels2_x          dw  ?
pixels1_y          dw  ?
pixels2_y          dw  ?

;---------------- game screen ------------------------------ Done
game_screen_max_x   equ 799
game_screen_max_y   equ 479
 
;---------------- GRID  ------------------------------------
GRID_SIZE_MAX               EQU 400
GRID_SQUARE_SIZE_MAX        EQU 44
GRID_SQUARE_SIZE            DW  ?
GRID_MAX_COORDINATE_MIN     EQU 16
GRID_MAX_COORDINATE         DW  ?
GRID_CORNER1_X              EQU 20
GRID_CORNER1_Y              EQU 19
GRID_CORNER2_X              EQU 460
GRID_CORNER2_Y              EQU 459
GRID_CELLS_MAX_COORDINATE   EQU 9 ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SHOULD BE IMPLEMENTED AS A WORD NOT A BYTE (YOSRY)!!!!!!!!!!!!!!!!!!!!!!!!!!!!

;---------------- column selector -------------------------- Done
column_selector_row                 equ grid_corner2_y+2
column_selector_current_column      dw  ?
column_selector_min_column          dw  ?
column_selector_max_column          dw  ?

;---------------- COLORS ----------------------------------------
BLACK               DB  00H
BLUE                DB  01H
GREEN               DB  02H
CYAN                DB  03H
RED                 DB  04H
MAGENTA             DB  05H
BROWN               DB  06H
LIGHT_GRAY          DB  07H
DARK_GRAY           DB  08H
LIGHT_BLUE          DB  09H
LIGHT_GREEN         DB  0AH
LIGHT_CYAN          DB  0BH
LIGHT_RED           DB  0CH
LIGHT_MAGENTA       DB  0DH
YELLOW              DB  0EH
WHITE               DB  0FH
;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?
;---------------- colors ---------------------------------------- Done
Variable_Color      db  ?
black               db  00h
white               db  0fh
blue                db  01h
light_blue          db  09h
light_gray          db  07h
dark_gray           db  08h

;---------------- draw rectangle parameters ---------------------- Done
x1                  dw  ?
x2                  dw  ?
y1                  dw  ?
y2                  dw  ?

;---------------- slider data ------------------------------------ Done
slider_bar_column   equ 470
slider_column       equ 480
slider_initial_row  equ 473
slider_current_row  dw  slider_initial_row
slider_direction    db  0   ; 0 up, 1 down
slider_max_up       equ  5
slider_max_down     equ 473

;---------------- key scan codes ------------------------------- Done
space_scancode      equ 39h
F2_scancode         equ 3ch
EXIT_scancode       equ 01h
Enter_scancode       equ 1ch
up_scancode         equ 48h
down_scancode       equ 50h
right_scancode      equ 4dh
left_scancode       equ 4bh

;---------------- Main Menu messages data for the user ------------  DOne
please_enter_your_name_msg  db    19h,'- Please Enter Your Name:'
player1_msg                 db    7h ,'Player1' 
player2_msg                 db    7h ,'Player2'         
press_enter_msg             db    1bh,'Press Enter Key To Continue' 
to_start_game_msg           db    1ch,'- To Start the Game Press F2'
enter_level_msg             db    1eh,'- Choose The Game Level 1 or 2'
to_end_prog_msg             db    1Fh,'- To End the Programe Press Esc'
;---------------- common data for both players -------------------
level               db     2,?,?,?   ; 1 or 2

;---------------- common ships data ------------------------------
all_ships           dw     2    ; contains the offsets of p1_ships and p2_ships   ???

;---- number of ships and cells ----------------------------------  Done
n_ships          equ 10         ; player 1 number of ships
total_n_cells    equ 32

;---- ships selection cells --------------------------------------
ships_sel_cells     db  1, 1, 1, 1, 1, 1, 1, 1, 1, 1              ;to be replaces with actual cells coordinates
                    db  1, 1, 1, 1, 1, 1, 1, 1, 1, 1              ;?????

;---------------- player 1 data ---------------------------------- Done
p1_username         db  20, ?, 20 dup ('?')
p1_score            db  total_n_cells               ; number of remaining cells, initially total cells of all ships

;-------- p1 attacks ---------------------------------------------
;grid cells that p1 attacked (cell1x, cell1y, cell2x, cell2y, ..)
P1_Attacks_OnTarget_Num     dw  0
P1_Attacks_OnTarget         dw  (grid_size_max * 2) dup('*')
P1_Attacks_Missed_Num       dw  0
p1_Attacks_missed           dw  (grid_size_max * 2) dup('*') 
;---------------- PLAYER 1 DATA ----------------------------------
P1_USERNAME         DB  20, ?, 20 DUP ('?')
P1_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P1_SCORE_STRING                         DB  2 DUP(?)
;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P1_ATTACKS_ONTARGET DB  (GRID_SIZE_MAX * 2) DUP(?)
P1_ATTACH_MISSED    DB  (GRID_SIZE_MAX * 2) DUP(?)            

;-------- P1 SHIPS DATA ------------------------------------------
P1_SHIPS LABEL BYTE
P1_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(?)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
P1_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
P1_SHIPS_REMAINING_CELLS    DB  N_SHIPS DUP(?)            ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P1_SHIPS_IS_VERTICAL        DB  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
P1_SHIPS_IS_DRAWN           DW  N_SHIPS DUP(0)            ; IS THE SHIP DRAWN ON THE GRID YET? (0: NO, 1: YES)   

;-------- p1 ships data ------------------------------------------ Done
p1_ships label byte
p1_ships_points             dw  n_ships * 4 dup(?)       ; for each ship store point1_x, point1_y ,point2_x, point2_y
                                                         ; we don't need point 2 as we have size & vertical or horizontal
                                                         ; but keep them not to calcualte them each time                      
p1_ships_sizes              dw  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
p1_ships_remaining_cells    db  n_ships dup(?)            ; number of remaining cells for each ship
p1_ships_is_vertical        db  n_ships dup(1)            ; is the ship vertical? (0: horizontal, 1:vertical)

;---------------- PLAYER 2 DATA ----------------------------------
P2_USERNAME         DB  20, ?, 20 DUP ('?')
P2_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P2_SCORE_STRING                         DB  2 DUP(?)
;-------- P2 ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P2_ATTACKS_ONTARGET DB  (GRID_SIZE_MAX * 2) DUP(?)
P2_ATTACH_MISSED    DB  (GRID_SIZE_MAX * 2) DUP(?)  

;---------------- player 2 data ---------------------------------- 
p2_username         db  20, ?, 20 dup ('?')
p2_score            db  total_n_cells          ; number of remaining cells, initially total cells of all ships

;-------- p2 attacks ---------------------------------------------
;grid cells that p2 attacked (cell1x, cell1y, cell2x, cell2y, ..)

P2_Attacks_OnTarget_Num     dw  0
P2_Attacks_OnTarget         dw  (grid_size_max * 2) dup('*')
P2_Attacks_Missed_Num       dw  0
P2_Attacks_missed           dw  (grid_size_max * 2) dup('*')  

;-------- p2 ships data ------------------------------------------
p2_ships label byte
p2_ships_points             dw  n_ships * 4 dup(?)       ; for each ship store point1_x, point1_y
                                                         ; we don't need point 2 as we have size & vertical or horizontal
                                                         ; but keep them not to calcualte them each time
p2_ships_sizes              dw  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
p2_ships_remaining_cells    db  n_ships dup(?)            ; number of remaining cells for each ship
p2_ships_is_vertical        db  n_ships dup(1)            ; is the ship vertical? (0: horizontal, 1:vertical)
p2_ships_is_drawn           dw  n_ships dup(0)            ; is the ship drawn on the grid yet in the selection part? 
                                                          ; (0: no, 1: yes)                    


.code
main proc far
mov ax, @data
mov ds, ax
mov es, ax

        initialize_program
        user_names
        
STARTING_POINT:

        main_menu
        get_level
        draw_status_bar_template 
        print_player1_score
        print_player2_score
        START_THE_GAME


   The_END: 
hlt
ret
main    endp

;-------------------------------------;
;--------- Yousry procedures ---------;
;-------------------------------------;
Pixels_To_Grid_    Proc    near
    
   ; 4 Parameters Cx:PixelX , Dx:PixelY , SI:offset GridX  , DI:offset GridY
    
    sub cx, grid_corner1_x
    mov dx, 0
    mov ax, cx
    div grid_square_size
    mov [SI], ax
    
    sub bx, grid_corner1_y
    mov dx, 0
    mov ax, bx
    div grid_square_size 
    mov [DI], ax
    ret

 Pixels_To_Grid_ endp    
;-------------------------------------; 

get_attack_column_  proc    near
    ; draw initial column selector
    draw_column_selector    column_selector_min_column, light_blue
    mov ax, column_selector_min_column
    mov column_selector_current_column, ax

    ; display message
    print_notification_message  select_attack_column_msg, 1

    get_key_pressed:
        mov ah, 0
        int 16h
        cmp ah, space_scancode
        jz space_pressed
        cmp ah, right_scancode
        jz right_pressed
        cmp ah, left_scancode
        jz left_pressed
        jmp get_key_pressed

        right_pressed:
            draw_column_selector column_selector_current_column, white
            mov ax, column_selector_max_column
            cmp column_selector_current_column, ax
            jz reached_max_column
            mov ax, grid_square_size
            add column_selector_current_column, ax
            jmp draw_cs
            reached_max_column:
                mov ax, column_selector_min_column
                mov column_selector_current_column, ax
            draw_cs:
                draw_column_selector column_selector_current_column, light_blue
                jmp get_key_pressed
                
        left_pressed:
            draw_column_selector column_selector_current_column, white
            mov ax, column_selector_min_column
            cmp column_selector_current_column, ax
            jz reached_min_column
            mov ax, grid_square_size
            sub column_selector_current_column, ax
            jmp draw_cs_
            reached_min_column:
                mov ax, column_selector_max_column
                mov column_selector_current_column, ax
            draw_cs_:
                draw_column_selector column_selector_current_column, light_blue
                jmp get_key_pressed
                
        space_pressed:
        ret
get_attack_column_  endp        
;-------------------------------------;

SET_LEVEL_SETTINGS_  PROC   NEAR
    ; PARAMETERS AL: 1 OR 2 (LEVEL)
    ; GRID SQUARE SIZE
    MOV BL, AL
    MOV AX, GRID_SQUARE_SIZE_MAX
    DIV BL
    MOV AH, 0
    MOV GRID_SQUARE_SIZE, AX
    ; GRID MAX COORDINATE
    MOV AX, GRID_MAX_COORDINATE_MIN
    MUL BL
    MOV GRID_MAX_COORDINATE, AX
    ; COLUMN SELECTOR MIN AND MAX
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
    CMP AL, 1
    JNZ PLAYER2_SELECTION_SHIPS
    MOV DI, OFFSET P1_SHIPS_SIZES
    MOV SI, OFFSET P1_SHIPS_IS_DRAWN
    JMP DRAW_ALL_SELECTION_SHIPS
    PLAYER2_SELECTION_SHIPS:
    MOV DI, OFFSET P2_SHIPS_SIZES
    MOV SI, OFFSET P2_SHIPS_IS_DRAWN
    DRAW_ALL_SELECTION_SHIPS:
        CMP WORD PTR [SI], 1
        JZ DRAW_NEXT_SELECTION_SHIP
        MOV AX, GRID_MAX_COORDINATE
        SUB AX, [DI]
        MOV GRID1_X, AX
        MOV BX, GRID_MAX_COORDINATE
        MOV GRID2_X, BX
        MOV GRID1_Y, CX
        MOV GRID2_Y, CX
        DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y
        DRAW_NEXT_SELECTION_SHIP:
        ADD DI, 2
        ADD SI, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ DRAW_ALL_SELECTION_SHIPS
    RET
DRAW_SELECTION_SHIPS_   ENDP
;-------------------------------------;

draw_selection_ships_   proc    near
    
    ; parameters al: 1 or 2 (player)
    mov cx, 0
    cmp al, 1
    jnz player2_selection_ships
    mov di, offset p1_ships_sizes
    mov si, offset p1_ships_is_drawn
    jmp draw_all_selection_ships
    
    player2_selection_ships:
        mov di, offset p2_ships_sizes
        mov si, offset p2_ships_is_drawn
        
    draw_all_selection_ships:
        cmp word ptr [si], 1
        jz draw_next_selection_ship
        mov ax, grid_max_coordinate         ;Here i will draw the Ship
        sub ax, [di]
        mov grid1_x, ax
        mov bx, grid_max_coordinate
        mov grid2_x, bx
        mov grid1_y, cx
        mov grid2_y, cx
        draw_ship grid1_x, grid1_y, grid2_x, grid2_y
        
        draw_next_selection_ship:
            add di, 2
            add si, 2
            inc cx
            cmp cx, n_ships
            jnz draw_all_selection_ships
    ret
draw_selection_ships_   endp
;-------------------------------------;

initialize_ships_array_     proc    near
    mov bx, offset all_ships
    mov word ptr [bx], offset p1_ships
    add bx, 2
    mov word ptr [bx], offset p2_ships
    ret
initialize_ships_array_    endp
;-------------------------------------;

draw_ship_      proc    near
    ; parameters
    ; ax = point1_x, bx = point1_y, cx = point2_x, dx = point2_y
    grid_to_pixels ax, bx, cx, dx
   
    ; move the second point from the upper left corner to the lower right corner
    mov ax, pixels2_x
    add ax, grid_square_size
    mov pixels2_x, ax
    mov ax, pixels2_y
    add ax, grid_square_size
    mov pixels2_y, ax

    ; adjust ship size (smaller than grid)   ; set margin
    mov ax, 10
    div level   ; margin = 10 / level   ;I Edit 6 to 10 in the Comment ;Check Yousry 
    add pixels1_x, ax
    add pixels1_y, ax
    sub pixels2_x, ax
    sub pixels2_y, ax
    
    ; draw the ship
    draw_rectangle pixels1_x, pixels1_y, pixels2_x, pixels2_y, light_gray
    
    ; draw ship borders
    dec pixels1_x
    dec pixels1_y
    inc pixels2_x
    inc pixels2_y
    
    draw_rectangle pixels1_x, pixels1_y, pixels2_x, pixels1_y, dark_gray        ;Now the function draw lines not rectangles
    draw_rectangle pixels1_x, pixels2_y, pixels2_x, pixels2_y, dark_gray 
    draw_rectangle pixels1_x, pixels1_y, pixels1_x, pixels2_y, dark_gray 
    draw_rectangle pixels2_x, pixels1_y, pixels2_x, pixels2_y, dark_gray     
    
    ret
draw_ship_  endp
;-------------------------------------;
grid_to_pixels_     proc    near
    ; parameters
    ; grid1_x, grid1_y, grid2_x, grid2_y
    ; grid to pixels (upper left corner)
    
    ; output
    ; pixel1_x, pixel1_y, pixel2_x, pixel2_y
    
    ; pixel x = grid_corner1_x + grid_square_size * grid_x
    ; pixel y = grid_corner1_y + grid_square_size * grid_y
    
    mov ax, grid_square_size
    mul grid1_x
    add ax, grid_corner1_x
    mov pixels1_x, ax 

    mov ax, grid_square_size
    mul grid1_y
    add ax, grid_corner1_y
    mov pixels1_y, ax 

    mov ax, grid_square_size
    mul grid2_x
    add ax, grid_corner1_x
    mov pixels2_x, ax 

    mov ax, grid_square_size
    mul grid2_y
    add ax, grid_corner1_y
    mov pixels2_y, ax
    
    ret
grid_to_pixels_     endp
;-------------------------------------;   
;--------- Ahmed Procedures ----------;
;-------------------------------------;
draw_rectangle_   proc  near    
    ;parameters
    ; x1, y1, x2, y2, al = color
    inc x2
    inc y2  ;to stop at x2 + 1, y2 + 1
    mov dx, y1
    mov ah, 0ch   ;ah = 0c for int, al = color
    draw_all_rectangle_rows:
    mov cx, x1
        draw_rectange_row:
            int 10h
            inc cx
            cmp cx, x2
        jnz draw_rectange_row
    inc dx
    cmp dx, y2
    jnz draw_all_rectangle_rows
    ret
draw_rectangle_ endp   
;-------------------------------------;    
print_message_    proc near

      mov ax,1301h
      mov bx,bp
      mov cl,[bx]
      mov ch,00h
      add bp,1h
      mov bx,si
      int 10h
      ret

print_message_    endp
;-------------------------------------;
get_user_name_     proc near
     print_message please_enter_your_name_msg , 1025h , 0ff0fh
     print_message press_enter_msg , 1425h , 0ff0fh
     
     cmp si,1h
     jnz player2
     print_message player1_msg ,0c2Eh , 0ff28h
     jmp cont
player2:
     print_message player2_msg ,0c2Eh , 0ff28h
     
cont:        
     mov ah,02h             ;move the cursor
     mov dx,122Fh
     int 10h
        
     mov ah,0ah            ;get the user input and store it in username1 or username2(sent parameter)
     mov dx,di
     int 21h
     ret 
     
 get_user_name_     endp
;-------------------------------------;
user_names_     proc near

     get_user_name 1h,p1_username
     clear_game_screen  black 
     get_user_name 2h,p2_username
     clear_game_screen  black
     
     ret 
user_names_     endp
;-------------------------------------;
main_menu_     proc near

        print_message to_start_game_msg , 1025h , 0ff0fh
        print_message to_end_prog_msg , 1425h , 0ff0fh

  notvalid:          
        mov ah,0
        int 16h
        cmp ah,F2_scancode
        jz cont2
  notf2:                 
        cmp ah,EXIT_scancode
        jz THE_END
        jnz notvalid            
  cont2:       
  clear_game_screen black 
     ret 

        hlt
     
main_menu_     endp
;-------------------------------------;
initialize_program_     proc near

        mov ax,4f02h           ;go to videomode 800*600
        mov bx,103h
        int 10h

     ret 
initialize_program_     endp
;-------------------------------------;
get_level_     proc near

 print_message enter_level_msg , 1025h , 0ff0fh
  
  notvalid2:

        mov ah,02h                 ;move the curser
        mov dx,1232h
        int 10h
        
        mov ah,0ah                 ;get user input and store it in level  
        mov dx,offset level
        int 21h     
        
        mov bx,dx                  ;check that the user input 1 or 2 
        mov cl,[bx+2]
        cmp cl,31h
        jz  set_level1
        cmp cl,32h
        jnz notvalid2
        jmp set_level2
  set_level1:
        set_level_settings 1
        jmp back
  set_level2:
        set_level_settings 2
  back:

        ret
get_level_     endp
;-------------------------------------;

Draw_All_Ships_ON_GRID_   proc    near
    
    ;parameters al: 1 or 2 (player)
    mov Cx,0
    cmp al, 1
    jnz player2_All_ships
    mov si, offset p1_ships_points
    jmp draw_all_ships
    
    player2_ALL_ships:  
        mov si, offset p2_ships_points
            
        draw_all_ships:
            mov Dx, word Ptr [SI]
            mov grid1_x, Dx
            mov Dx, word Ptr [SI + 2]
            mov grid1_Y, Dx
            mov Dx, word Ptr [SI + 4]
            mov grid2_X, Dx
            mov Dx, word Ptr [SI + 6]
            mov grid2_y, Dx
            draw_ship grid1_x, grid1_y, grid2_x, grid2_y
            add si, 8
            inc cx
            cmp cx, n_ships
            jnz draw_all_ships
    ret
    
    Draw_All_Ships_ON_GRID_   ENDP
;-------------------------------------;
Draw_X_Sign_   proc    near

     grid_to_pixels grid1_x, grid1_y, grid1_x, grid1_y 
      
    ; move the second point from the upper left corner to the upper right corner
    mov ax, pixels2_x
    add ax, grid_square_size
    mov pixels2_x, ax
    
    ; Get lower Y to check the end of X-sign
    mov BP, pixels2_y
    add BP, grid_square_size

    ; adjust ship size (smaller than grid)   ; set margin
    mov ax, 10
    div level   ; margin = 10 / level   ;I Edit 6 to 10 in the Comment ;Check Yousry 
    add pixels1_x, ax
    add pixels1_y, ax
    sub pixels2_x, ax
    add pixels2_y, ax                ;Point 2 is the upper right corner
    sub BP,ax                        ;BP has the Lower Y
    
 
    mov SI,pixels2_x        ;The Upper right Corner coordinates
    mov DI,pixels2_y  
    
    mov ah,0ch 
    mov cx,pixels1_x        ;The Upper left Corner coordinates
    mov dx,pixels1_y  
    
    mov al,Variable_color
    mov BX,00               ;I will need it to check the next iteration is odd or even 
    Next_Two_Pixels: 
         
         int 10h           ;Draw Each Pixel 3 Times To Make the It Bold ( more obvious )
         INC cx
         int 10h
         Sub Cx,2
         int 10h
         Inc Cx
         
         Call EvenOrOdd                   ;at even iterations I draw \ so inc cx
         CMP Is_Even,0                    ;at odd iterations I draw / so dec cx
         JNE IF_ODD
         IF_EVEN: 
             INC cx
             JMP DONE
             IF_ODD:  
                 Dec cx 
         DONE:
         INC Dx
         XCHG cx , Si
         XCHG dx , DI
         INC BX
         cmp Dx, BP
         jnz Next_Two_Pixels
         
         ret

 Draw_X_Sign_   ENDP
;-----------------------------------------; 
Draw_All_X_Signs_   proc    near
    
    ;parameters al: 1 or 2 (player)
    cmp al, 1
    jnz player2_All_Attacks
    mov SI, offset P1_Attacks_OnTarget 
    mov DI, offset P1_Attacks_Missed 
    Mov Cx, P1_Attacks_OnTarget_Num 
    Mov Dx, P1_Attacks_Missed_Num    
    jmp draw_all_Attacks
    
    player2_ALL_Attacks:  
         mov SI, offset P2_Attacks_OnTarget 
         mov DI, offset P2_Attacks_Missed
         Mov Cx, P2_Attacks_OnTarget_Num 
         Mov Dx, P2_Attacks_Missed_Num  
         
        draw_all_Attacks:
            OnTarget_Attacks:
               cmp cx,0
               jz Missed_Attacks
               mov Ax,[SI]
               mov grid1_x,Ax
               mov Ax,[SI + 2]
               mov grid1_y,Ax
               Draw_X_Sign grid1_x, grid1_y, 0Ch
               Add SI,4
               DEC CX
               jmp OnTarget_Attacks
               
               
            Missed_Attacks: 
               cmp dx,0
               jz ALL_DRAWN
               mov Ax,[DI]
               mov grid1_x,Ax
               mov Ax,[DI + 2]
               mov grid1_y,Ax
               Draw_X_Sign grid1_x, grid1_y, 00h
               Add DI,4
               DEc DX
               jmp Missed_Attacks
      ALL_DRAWN:         
        
     ret
           
Draw_All_X_Signs_   ENDP
;-------------------------------------; 
 CELL_HAS_SHIP_   proc    near
   
    mov cx,0
    cmp al, 1
    jnz Check_player2_Ships
    mov SI, offset P1_Ships_Points
    Mov DI, offset P1_Ships_Is_Vertical    
    jmp Check_ALL_SHIPS
    
    Check_player2_Ships:
           mov SI, offset P2_Ships_Points
           Mov DI, offset P2_Ships_Is_Vertical 
         
           Check_ALL_SHIPS:
                
                Check_SHIP:
                mov Bx, [DI]              
                cmp Bx ,1                 
                jnz Horizontal_Ship        
                
                mov  Ax, GRID1_X
                cmp  Ax ,  word ptr[SI]
                Jnz  EdIT_AND_CHECK_AGAIN  
                mov  Ax, GRID1_Y
                cmp  Ax , word ptr[SI + 2]                       
                Jb EdIT_AND_CHECK_AGAIN
                cmp  Ax , word ptr[SI + 6] 
                JA  EdIT_AND_CHECK_AGAIN
                Mov Is_OnTarget,1
                ret
                
                
                Horizontal_Ship:  
                mov  Ax, GRID1_Y
                cmp  Ax ,  word ptr[SI + 2]
                Jnz  EdIT_AND_CHECK_AGAIN  
                mov  Ax, GRID1_X      
                cmp Ax , word ptr[SI]                      
                Jb EdIT_AND_CHECK_AGAIN
                cmp Ax , word ptr[SI + 4]
                JA  EdIT_AND_CHECK_AGAIN
                Mov Is_OnTarget,1
                ret
                
                EdIT_AND_CHECK_AGAIN:
                Add SI ,8
                INC Cx
                CMP CX ,N_SHIPS
                jnz Check_SHIP
                Mov Is_OnTarget,0
                ret

                    
  CELL_HAS_SHIP_   ENDP
;-------------------------------------; 
Is_CELL_Attacked_Before_  PROC NEAR
    
   ;parameters al: 1 or 2 (player)
    mov BX,0
    cmp al, 1
    jnz ChECK_player2_All_Attacks
    mov SI, offset P1_Attacks_OnTarget 
    mov DI, offset P1_Attacks_Missed 
    Mov Cx, P1_Attacks_OnTarget_Num 
    Mov Dx, P1_Attacks_Missed_Num    
    jmp CHECK_all_Attacks
    
    CHECK_player2_ALL_Attacks:  
         mov SI, offset P2_Attacks_OnTarget 
         mov DI, offset P2_Attacks_Missed
         Mov Cx, P2_Attacks_OnTarget_Num 
         Mov Dx, P2_Attacks_Missed_Num 
         
         CHECK_all_Attacks:
               cmp Cx ,0
               jz CHECK_MISSED_ATTACKS
               Mov Ax, [SI]
               cmp Ax,Attackx                       
               Jnz CHECK_NEXT_ATTACK1
               Mov Ax, [SI + 2]
               cmp AX,Attacky
               Jnz CHECK_NEXT_ATTACK1
               Mov Is_Attacked_before,1
               ret      
               CHECK_NEXT_ATTACK1:  
                   Add SI,4
                   Dec Cx 
                   jmp CHECK_all_Attacks
        
          CHECK_MISSED_ATTACKS:     
               mov SI,DI
               mov Cx,Dx
               Inc Bx
               cmp Bx,2                   ;Ax is used to repeat the operation twice (one for missed and one for onYarget)
               jnz CHECK_all_Attacks
              
          
                
               Mov Is_Attacked_before,0
               ret      
           

Is_CELL_Attacked_Before_   ENDP
;-------------------------------------; 
Get_CELL_FROM_PLAYER_  PROC NEAR
         
         Get_attack_column                ;It Modify column_selector_current_column
         print_notification_message  fire_slider_msg, 1
         Fire_slider                      ;It Modify  slider_current_row
         Pixels_To_Grid column_selector_current_column , slider_current_row , attackx , attacky
         Mov Ax , attackx
         Mov [SI] , Ax
         Mov Bx , attacky
         Mov [DI] , BX

Get_CELL_FROM_PLAYER_   ENDP
;-------------------------------------; 
EvenOrOdd  PROC NEAR

    PUSHA
    Mov AX,Bx
    MOV DL,2
    DIV DL
    Mov IS_EVEN,Ah
    POPA
    ret
                  
EvenOrOdd   ENDP
;-----------------------------------------;
CHECK_CELL_AND_Update_ATTACKS_DATA_  PROC NEAR
   
    Is_CELL_Attacked_Before Player_Attacking
     CELL_HAS_SHIP attackx , attacky ,Player_Attacked
    
    cmp IS_Attacked_before , 1
    jz DATA_UPDATED                    ;No Data Needs To be Updated if Player choose a cell twice
    
    cmp Player_Attacked , 2
    jnz Player1_IS_ATTACKED
    
    Player2_Is_Attacked:   
        cmp IS_OnTarget , 1
        jnz Player1_Attack_MISSED
    
    Player1_Attack_OnTarget:
        mov SI , offset P2_score
        Mov Cx ,[SI]         ;Decrement The Score
        Dec CX 
        Mov [SI] , CX 
        print_player2_score

        
        Mov Bx, offset P1_Attacks_OnTarget
        Mov SI, offset P1_Attacks_OnTarget_Num
        Draw_X_SIGN Attackx, AttackY,0Ch

       jmp EDIT_DATA 
  
    Player1_Attack_MISSED:
        Mov Bx, offset P1_Attacks_Missed
        Mov SI, offset P1_Attacks_Missed_Num
        Draw_X_SIGN Attackx,AttackY,00h 
        jmp EDIT_DATA 
    
    Player1_IS_ATTACKED:
        cmp IS_OnTarget , 1
        jnz Player2_Attack_MISSED
    
    Player2_Attack_OnTarget:
        mov SI , offset P1_score
        Mov Cx ,[SI]         ;Decrement The Score
        Dec CX 
        Mov [SI] , CX 
        print_player1_score
        
        Mov Bx, offset P2_Attacks_OnTarget
        Mov SI, offset P2_Attacks_OnTarget_Num
        Draw_X_SIGN Attackx, AttackY,0Ch
        jmp EDIT_DATA  
  
    Player2_Attack_MISSED:
        Mov Bx, offset P2_Attacks_Missed
        Mov SI, offset P2_Attacks_Missed_Num
        Draw_X_SIGN Attackx,AttackY,00h
        
        EDIT_DATA:  
            Mov Ax, [SI]         ;Increment Number of Missed Or OnTarget Attacks
            INC AX 
            Mov [SI] , Ax
            DEC AX
            
            Mov Cl , 04h         ;Put The Cell in OnTarget Or Missed ( Player 1 or 2) Array of Attacks 
            Mul Cl
            ADD Bx,AX 
            Mov Cx ,Attackx 
            Mov [Bx] , Cx
            Mov Cx ,Attacky 
            Mov [Bx + 2] ,Cx  
            
            DATA_UPDATED:
                ret
                  
CHECK_CELL_AND_Update_ATTACKS_DATA_   ENDP
;-------------------------------------; 
Scene1_PLAYER_ATTACKS  PROC NEAR
    
    clear_game_screen   white
    draw_grid   
    draw_slider_bar 
    Draw_All_X_Signs Player_Attacking
    ret
                
Scene1_PLAYER_ATTACKS   ENDP
;-----------------------------------------;
Scene2_PLAYER_Watches  PROC NEAR
    
    clear_game_screen   white
    draw_grid
    draw_slider_bar
    Draw_All_Ships_ON_GRID Player_Attacked
    Draw_ALL_X_SIGNs Player_Attacking
    ret
    
Scene2_PLAYER_Watches   ENDP
;-----------------------------------------;
IS_IT_THE_END_  PROC NEAR
    
    cmp P1_score , 0
    jnz CHECK_PLAYER_2_SCORE 
    Mov GAME_END , 1
    jmp THE_END_IS_NEAR
    
    CHECK_PLAYER_2_SCORE:
    cmp P2_score , 0
    jnz THE_END_IS_NEAR
    Mov GAME_END , 1   
    
  THE_END_IS_NEAR:
    ret 
    
IS_IT_THE_END_   ENDP
;-----------------------------------------;
REFRESH_DATA_  PROC NEAR
    MOV P1_score , total_n_cells 
    MOV P2_score , total_n_cells 
    MOV P1_Attacks_OnTarget_Num ,0
    MOV P1_Attacks_MISSED_Num ,0 
    MOV P2_Attacks_OnTarget_Num ,0 
    MOV P2_Attacks_MISSED_Num ,0
    MOV Player_Attacking ,1
    MOV Player_Attacking ,2
    Mov Game_END,0
    ret 
    
REFRESH_DATA_   ENDP
START_THE_GAME_  PROC NEAR
MAIN_LOOP:   
    
    Call SCENE1_PLAYER_ATTACKS
    Get_CELL_FROM_PLAYER Attackx,Attacky
    Check_CELL_AND_Update_ATTACKS_DATA
    
    print_notification_message  press_enter_msg, 1
    NOT_ENTER:
    mov ah,0                      ;Wait for The User To click Enter
    int 16h
    cmp ah,Enter_scancode
    jnz NOT_ENTER

    CAll Scene2_PLAYER_Watches
    
    print_notification_message  press_enter_msg, 1
    NOT_ENTER2:
    mov ah,0                        ;Wait for The User To click Enter
    int 16h
    cmp ah,Enter_scancode
    jnz NOT_ENTER2
    
    Mov Al ,Player_Attacking        ;Exchange The Two players role
    Mov ah ,Player_Attacked
    Mov Player_Attacking , ah
    Mov Player_attacked , al
    
    Is_IT_THE_END 
    
    CMP GAME_END , 1
    jnz MAIN_LOOP
    
    Refresh_DATA
    jmp STARTING_POINT      ;return to the main menu if the game has been ended
    
START_THE_GAME_   ENDP
;-------------------------------------;   
;--------- Nader Procedures ----------;
;-------------------------------------;

draw_grid_  proc    near
    ; di and si are values to stop looping at  
    mov di, grid_corner2_x
    add di, grid_square_size
    mov si, grid_corner2_y
    add si, grid_square_size
    
    ; draw grid columns
    mov cx, grid_corner1_x
    mov dx, grid_corner1_y      ;initial point: (20,19)
    mov ax, 0c00h   ;ah = 0c for int, al = o0 (black)
    draw_all_columns:
        mov dx, grid_corner1_y  ;start drawing every column from the initial row
        draw_column:
            int 10h
            inc dx
            cmp dx, grid_corner2_y + 1
        jnz draw_column
        add cx, grid_square_size  ;distance between columns
        cmp cx, di ;last line at cx = grid_corner2_x so stop at cx = grid_corner2_x + grid_square_size = di
    jnz draw_all_columns
    
    ; draw grid rows
    mov cx, grid_corner1_x
    mov dx, grid_corner1_y      ;initial point: (20,19)
    mov ax, 0c00h   ;ah = 0c for int, al = o0 (black)
    draw_all_rows:
        mov cx, grid_corner1_x  ;start drawing every row from the initial column
        draw_row:
            int 10h
            inc cx
            cmp cx, grid_corner2_x + 1
        jnz draw_row
        add dx, grid_square_size  ;distance between rows
        cmp dx, si ;last line at dx = grid_corner2_y so stop at dx = grid_corner2_y + grid_square_size = si
    jnz draw_all_rows
    ret
draw_grid_  endp
;-----------------------------------------;

draw_slider_     proc   near   
    ; parameters
    ; di = slider_row
    ; al = color
    ;draw slider
    mov cx, slider_column
    mov dx, di
    dec dx
    mov ah, 0ch ; al = color
    mov bx, 1
    draw_all_slider_columns:
        mov di, bx
        draw_slider_column:
            int 10h
            inc dx
            dec di
        jnz draw_slider_column
        mov di, bx
        inc di
        sub dx, di
        inc cx
        add bx, 2
        cmp bx, 15  ; to increase slider size add 2 (must be always odd)
    jnz draw_all_slider_columns
    ret
draw_slider_    endp 
;-----------------------------------------;

draw_column_selector_     proc   near   
    ; parameters
    ; di = column_selector_column, 
    ; al = color
    ;draw slider
    mov cx, di
    mov dx, column_selector_row 
    dec dx
    mov ah, 0ch ; al = color
    mov bx, 1
    draw_all_column_selector_rows:
        mov di, bx
        draw_column_selector_row:
            int 10h
            inc cx
            dec di
        jnz draw_column_selector_row
        mov di, bx
        inc di
        sub cx, di
        inc dx
        add bx, 2
        cmp bx, 15  ; to increase the size add 2 (must be always odd)
    jnz draw_all_column_selector_rows
    ret
draw_column_selector_    endp 
;-----------------------------------------;

draw_slider_bar_    proc    near   
    mov cx, slider_bar_column
    mov dx, slider_max_up      ;initial point
    mov ax, 0c00h   ;ah = 0c for int, al = o0 (black)
    draw_all_bars:
        mov dx, slider_max_up  ;start drawing every column from the initial row
        draw_bar:
            int 10h
            inc dx
            cmp dx, slider_max_down
        jnz draw_bar
        add cx, 1  ;distance between columns
        cmp cx, slider_bar_column + 6 ; so that slider bar width = 5
    jnz draw_all_bars
    draw_slider slider_initial_row, light_blue
    ret
draw_slider_bar_    endp
;-----------------------------------------;

fire_slider_    proc    near   
    
    check_user_click:
        ; check if user pressed a key
        mov ah, 1
        int 16h
        jz move_slider
        ; get key pressed
        mov ah, 0
        int 16h
        cmp ah, space_scancode
        jz stop_slider
        ; move the slider
   
     move_slider:
        ; clear the slider current position
        draw_slider slider_current_row, white
        ; check whether to move it up or down
        cmp slider_direction, 0
        jz  decrement_row
        ; move slider down
        inc slider_current_row
        ; check if row is at its lowest, change the direction to up (0)
        cmp slider_current_row, slider_max_down
        jnz draw_new_slider
        mov slider_direction, 0
        jmp draw_new_slider
        ; move slider up
  
    decrement_row:
        dec slider_current_row
        ; check if row is at its highest, change the direction to down (1)
        cmp slider_current_row, slider_max_up
        jnz draw_new_slider
        mov slider_direction, 1
        ; draw the slider new position
        
    draw_new_slider:
        draw_slider slider_current_row, light_blue
        ; delay 
        mov ah,86h
        mov cx,0 ;cx:dx = interval in microseconds
        mov dx,03e8h
        int 15h
        jmp check_user_click
        
    stop_slider:
    ret
fire_slider_    endp
;-----------------------------------------;

draw_status_bar_template_   proc    near
;notification bar                        
    mov ax, 0c0fh
    mov cx,0
    mov dx,545  
    loop1:
    int 10h
    inc cx
    cmp cx,800
    jnz loop1
;chat bar                   
    mov cx,0    ;starting from the left edge
    mov dx,496  ;height value
    loop2:
    int 10h
    inc cx
    cmp cx,800  ;ending at the right edge
    jnz loop2

    print_message p1_username+1,2000h,0fh
    print_message p2_username+1,2100h,0fh
;score bar                       
    ;player 1 score
    print_message p1_username+1,1e00h,0fh
    
    mov dh,1eh ;y
    mov dl,p1_username+1  ;x
    print_message score_constant_text,dx,0fh    

    ;player 2 score
    print_message p2_username+1,1e40h,0fh
    
    mov dh,1eh ;y
    mov dl,p2_username+1  ;x
    add dl,40h
    print_message score_constant_text,dx,0fh    
 
    ret
draw_status_bar_template_   endp
;-----------------------------------------;

print_notification_message_   proc    near
;index = 1 -> message #1
;index = 2 -> message #2
;prints notification messages
    
    mov cx,0
    mov ax,1301h
    mov bx,bp
    mov cl,[bx]
    add bp,1
    mov bx,000fh
    int 10h  
 
    ret
print_notification_message_   endp
;-----------------------------------------;

print_player1_score_   proc    near
    
    ;decimal_to_string:
    mov ax,0
    mov al,p1_score
    mov bl,10
    div bl
    mov p1_score_string, al
    mov p1_score_string+1, ah
    add p1_score_string,48
    add p1_score_string+1,48

    mov ax,1301h
    mov dh,1eh ;y
    mov dl,p1_username+1 ;x
    add dl,10
    mov bp,offset p1_score_string
    mov cx,2         ;size
    mov bx,000fh
    int 10h
 
    ret
print_player1_score_   endp
;-----------------------------------------;

print_player2_score_   proc    near
    
    ;decimal_to_string:
    mov ax,0
    mov al,p2_score
    mov bl,10
    div bl
    mov p2_score_string, al
    mov p2_score_string+1, ah
    add p2_score_string,48
    add p2_score_string+1,48

    mov ax,1301h
    mov dh,1eh ;y
    mov dl,p2_username+1 ;x
    add dl,4ah
    mov bp,offset p2_score_string
    mov cx,2         ;size
    mov bx,000fh
    int 10h
 
    RET
PRINT_PLAYER2_SCORE_   ENDP
;-------------------------------------;
CELLS_SELECTOR_   PROC    NEAR 
    ;PARAMETERS:
   ;CX: SHIP SIZE 
   ;RETURNS: 2 points in grid coordinates that the player chose (SELECTOR_GRID 1 and 2) , they are NOT necessarily in the right format
    DEC CX
    MOV DX,GRID_SQUARE_SIZE
    ADD SELECTOR_X2,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 10
    DIV LEVEL   ; MARGIN = 10 / LEVEL 
    ADD SELECTOR_X1, AX
    ADD SELECTOR_Y1, AX
    SUB SELECTOR_X2, AX
    SUB SELECTOR_Y2, AX
    
    PRINT_NOTIFICATION_MESSAGE STATUS_TEST1,1
WAIT_FOR_DIRECTION_KEY:
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,RED
    MOV AH,0
    INT 16H
    CMP AH,ENTER_SCANCODE ;Checks if the user has already chosen the first cell of the selected ship
    JE SELECTOR_SECOND_POINT
    ;After getting DIRECTION key, remove the old selector icon, to draw the new one
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,WHITE
    CMP AH,UP_SCANCODE 
    JE SELECTOR_UP
    CMP AH,DOWN_SCANCODE
    JE SELECTOR_DOWN
    CMP AH,LEFT_SCANCODE 
    JE SELECTOR_LEFT
    CMP AH,RIGHT_SCANCODE 
    JE SELECTOR_RIGHT
    
SELECTOR_UP:
    CMP SELECTOR_GRID_Y1,0    ;Boundaries check
    JE WAIT_FOR_DIRECTION_KEY
    DEC SELECTOR_GRID_Y1
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,1  ;checks whether the cell has a ship placed on it or not
    CMP Is_OnTarget,0
    JE  SELECTOR_UP_CONTINUE
    INC SELECTOR_GRID_Y1            ;if there is a ship, reset selector grid coordinates to thier previous values
    JMP WAIT_FOR_DIRECTION_KEY
    SELECTOR_UP_CONTINUE:
    SUB SELECTOR_Y1,DX
    SUB SELECTOR_Y2,DX
    JMP WAIT_FOR_DIRECTION_KEY 
SELECTOR_DOWN:
    CMP SELECTOR_GRID_Y1,GRID_CELLS_MAX_COORDINATE    ;Boundaries check
    JE  WAIT_FOR_DIRECTION_KEY
    INC SELECTOR_GRID_Y1
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,1  ;checks whether the cell has a ship placed on it or not
    CMP Is_OnTarget,0
    JE  SELECTOR_DOWN_CONTINUE
    DEC SELECTOR_GRID_Y1            ;if there is a ship, reset selector grid coordinates to thier previous values
    JMP WAIT_FOR_DIRECTION_KEY
    SELECTOR_DOWN_CONTINUE:
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    JMP WAIT_FOR_DIRECTION_KEY   
SELECTOR_LEFT:
    CMP SELECTOR_GRID_X1,0    ;Boundaries check
    JE  WAIT_FOR_DIRECTION_KEY
    DEC SELECTOR_GRID_X1
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,1  ;checks whether the cell has a ship placed on it or not(FOR PLAYER 1!!!!!)
    CMP Is_OnTarget,0
    JE  SELECTOR_LEFT_CONTINUE
    INC SELECTOR_GRID_X1            ;if there is a ship, reset selector grid coordinates to thier previous values
    JMP WAIT_FOR_DIRECTION_KEY
    SELECTOR_LEFT_CONTINUE:
    SUB SELECTOR_X1,DX
    SUB SELECTOR_X2,DX
    JMP WAIT_FOR_DIRECTION_KEY 
SELECTOR_RIGHT:
    CMP SELECTOR_GRID_X1,GRID_CELLS_MAX_COORDINATE    ;Boundaries check
    JE  WAIT_FOR_DIRECTION_KEY
    INC SELECTOR_GRID_X1 
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,1  ;checks whether the cell has a ship placed on it or not
    CMP Is_OnTarget,0
    JE  SELECTOR_RIGHT_CONTINUE
    DEC SELECTOR_GRID_X1            ;if there is a ship, reset selector grid coordinates to thier previous values
    JMP WAIT_FOR_DIRECTION_KEY
    SELECTOR_RIGHT_CONTINUE:   
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    JMP WAIT_FOR_DIRECTION_KEY
    
SELECTOR_SECOND_POINT:
    PRINT_NOTIFICATION_MESSAGE STATUS_TEST2,1
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
    UP_ORIENTATION_SHIP_CHECK:     ;checks whether the up-region has ships placed in its direction 
        DEC SELECTOR_GRID_Y2       ;Traverse on the y-axis upwards
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,1
        CMP Is_OnTarget,0
        JNE UP_ORIENTATION_INVALID
        LOOP UP_ORIENTATION_SHIP_CHECK
        MOV UP_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
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
    DOWN_ORIENTATION_SHIP_CHECK:     ;checks whether the DOWN-region has ships placed in its direction 
        INC SELECTOR_GRID_Y2       ;Traverse on the y-axis DOWNWARDS
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,1
        CMP Is_OnTarget,0
        JNE DOWN_ORIENTATION_INVALID
        LOOP DOWN_ORIENTATION_SHIP_CHECK
        MOV DOWN_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
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
    LEFT_ORIENTATION_SHIP_CHECK:     ;checks whether the LEFT-region has ships placed in its direction 
        DEC SELECTOR_GRID_X2       ;Traverse on the X-axis in the left direction
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,1
        CMP Is_OnTarget,0
        JNE LEFT_ORIENTATION_INVALID
        LOOP LEFT_ORIENTATION_SHIP_CHECK
        MOV LEFT_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
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
    JMP GET_SECOND_POINT 
    RIGHT_ORIENTATION_SHIP_CHECK:     ;checks whether the RIGHT-region has ships placed in its direction 
        INC SELECTOR_GRID_X2       ;Traverse on the X-axis in the RIGHT direction
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,1
        CMP Is_OnTarget,0
        JNE RIGHT_ORIENTATION_INVALID
        LOOP RIGHT_ORIENTATION_SHIP_CHECK
        MOV RIGHT_ORIENTATION,1            ;ORIENTATION IS VALID
        ;HIGHLIGHT ORIENTATION REGION
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
        
        JMP GET_SECOND_POINT
        RIGHT_ORIENTATION_INVALID:
        MOV RIGHT_ORIENTATION,0
        
GET_SECOND_POINT:
    MOV CX,DX
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX
    WAIT_ORIENTATION_SELECTION:
        MOV AH,0
        INT 16H
        CMP AH,UP_SCANCODE 
        JE UP_ORIENTATION_SELECTED
        CMP AH,DOWN_SCANCODE
        JE DOWN_ORIENTATION_SELECTED
        CMP AH,LEFT_SCANCODE 
        JE LEFT_ORIENTATION_SELECTED
        CMP AH,RIGHT_SCANCODE 
        JE RIGHT_ORIENTATION_SELECTED
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
;-------------------------------------;
CELL_HAS_SHIP_   PROC    NEAR

CMP AL, 1
JNZ CHECK_PLAYER2_SHIPS
MOV SI, OFFSET P1_SHIPS_POINTS
MOV DI, OFFSET P1_SHIPS_SIZES
MOV BX, OFFSET P1_SHIPS_IS_VERTICAL    
JMP CHECK_ALL_SHIPS

CHECK_PLAYER2_SHIPS:
MOV SI, OFFSET P2_SHIPS_POINTS
MOV DI, OFFSET P2_SHIPS_SIZES
MOV BX, OFFSET P2_SHIPS_IS_VERTICAL 

CHECK_ALL_SHIPS:

CHECK_SHIP:              
CMP [BX] ,1                 
JNZ HORIZONTAL_SHIP        

MOV AX,GRID1_Y
CMP WORD PTR[SI + 2],AX                       
JB EDIT_AND_CHECK_AGAIN
MOV AX,GRID1_Y
CMP WORD PTR[SI + 6],AX
JA  EDIT_AND_CHECK_AGAIN
MOV IS_ONTARGET,0;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SHOULD MOVE 1 INSTEAD OF 0, BUT WAITING FOR AHMAD TO FIX THIS FUNCTION!!!!!!!!!!!!!!!!!!!!!!!!
RET


HORIZONTAL_SHIP:  
MOV AX,GRID1_X          
CMP WORD PTR[SI],AX                      
JB EDIT_AND_CHECK_AGAIN
MOV AX,GRID1_X          
CMP WORD PTR[SI + 4],AX
JA  EDIT_AND_CHECK_AGAIN
MOV IS_ONTARGET,0;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SHOULD MOVE 1 INSTEAD OF 0, BUT WAITING FOR AHMAD TO FIX THIS FUNCTION!!!!!!!!!!!!!!!!!!!!!!!!
RET

EDIT_AND_CHECK_AGAIN:
ADD SI ,8
INC DI
INC BX
CMP BX , N_SHIPS
JNZ CHECK_SHIP
MOV IS_ONTARGET,0
RET

CELL_HAS_SHIP_   ENDP
;-----------------------------------------;  
CLEAR_GRID_   PROC    NEAR 
    DRAW_RECTANGLE  GRID_CORNER1_X,GRID_CORNER1_Y,GRID_CORNER2_X,GRID_CORNER2_Y,WHITE
    DRAW_GRID 
    RET
CLEAR_GRID_   ENDP
;-----------------------------------------;    
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, GAME_SCREEN_MAX_X, GAME_SCREEN_MAX_Y, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP

end     main