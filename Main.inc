;-------------------------------------------------------------------;
Print_Message MACRO MyMessage , Location,Color
      PushA   
      MOV DX,Location
      MOV BP, offset MyMessage
      MOV SI, Color
      Call  Print_Message_
      POPA
ENDM PrintMessage 
;-------------------------------------------------------------------;
Clear_Screen MACRO SmallX, LargeX,  SmallY, LargeY,Color
      PushA 
      Mov AL,Color 
      Mov Dx,SmallY
      Mov SI,LargeY
      Mov Cx,SmallX
      Mov Bp,Cx
      Mov DI,LargeX
      Call  Clear_Screen_
      POPA
ENDM ClearScreen 
;-------------------------------------------------------------------;
Get_User_Name MACRO Player_Index ,User_Name
      PushA
      Mov SI, Player_Index
      Mov DI, offset User_Name
      Call Get_User_Name_
      POPA
ENDM GetUserName
;-------------------------------------------------------------------;  
User_Names MACRO 
      PushA
      Call User_Names_
      POPA
ENDM GetUserName
;-------------------------------------------------------------------;  
Main_Menu MACRO 
      PushA
      Call Main_Menu_
      POPA
ENDM MainMenu
;-------------------------------------------------------------------;  
Initialize_Programe MACRO 
      PushA
      Call Initialize_Programe_
      POPA
ENDM InitalizePrograme
;-------------------------------------------------------------------; 
Get_Level MACRO 
      PushA
      Call Get_Level_
      POPA
ENDM GetLevel
;-------------------------------------------------------------------; 

