;-----------------------------;
DRAW_GRID   MACRO
PUSHA
CALL DRAW_GRID_   
POPA
ENDM    DRAW_GRID   
;-----------------------------;
DRAW_SLIDER MACRO   SLIDER_ROW, COLOR
PUSHA
MOV AX, SLIDER_ROW
MOV Bl, COLOR
CALL DRAW_SLIDER_
POPA
ENDM    DRAW_SLIDER
;-----------------------------;
DRAW_SLIDER_BAR MACRO
PUSHA
CALL DRAW_SLIDER_BAR_   
POPA
ENDM DRAW_SLIDER_BAR_MACRO
;-----------------------------;
FIRE_SLIDER MACRO
PUSHA
CALL FIRE_SLIDER_
POPA
ENDM FIRE_SLIDER
;-----------------------------;