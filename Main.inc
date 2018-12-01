PrintMessage MACRO MyMessage , Location
      PushA   
      MOV DX,Location
      MOV BP, offset MyMessage
      Call  Print_Message
      POPA
ENDM PrintMessage 
;-------------------------------------------------------------------;
ClearScreen MACRO 
      PushA  
      Call  Clear_Screen
      POPA
ENDM ClearScreen 
;-------------------------------------------------------------------;
GetUserName MACRO Player_Index ,User_Name
      PushA
      Mov SI, Player_Index
      Mov DI, offset User_Name
      Call Get_User_Name
      POPA
ENDM GetUserName
;-------------------------------------------------------------------;  
UserNames MACRO 
      PushA
      Call User_Names
      POPA
ENDM GetUserName
;-------------------------------------------------------------------;  
MainMenu MACRO 
      PushA
      Call Main_Menu
      POPA
ENDM MainMenu
;-------------------------------------------------------------------;  
InitializePrograme MACRO 
      PushA
      Call Initalize_Programe
      POPA
ENDM InitalizePrograme
;-------------------------------------------------------------------; 
GetLevel MACRO 
      PushA
      Call Get_Level
      POPA
ENDM GetLevel
;-------------------------------------------------------------------; 

