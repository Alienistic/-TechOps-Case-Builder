#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\lib\tf.czr
#Include %A_ScriptDir%\_classes.ahk

GuiW := 562
GuiH := 550
 
SettingsINI := "TechOpsCaseBuilder.ini"
IfExist, %SettingsINI%
	{
		IniRead, GuiPosX, %SettingsINI%, TechOpsCaseBuilder, GuiPosX
		IniRead, GuiPosY, %SettingsINI%, TechOpsCaseBuilder, GuiPosY
		
		;MsgBox, The saved ini position is x%GuiPosX% y%GuiPosY%
		
		xchange.checkposition()
	}
	else
	{
		; w562 h550
		GuiPosX := 50
		GuiPosY := 50
		IniWrite, %GuiPosX%, %SettingsINI%, TechOpsCaseBuilder, GuiPosX
		IniWrite, %GuiPosY%, %SettingsINI%, TechOpsCaseBuilder, GuiPosY
		;MsgBox, %SettingsINI% does not exist, setting window position default to 
	}


;VERSION := "2018.01.31.1654"
VERSION := "2018.07.12.0810"



; GUI WINDOW
Gui, 99: Destroy
Gui, 99: -Resize ;No Resize
Gui, 99: Color, FFFFFF

	;Gui, 99: Add, Picture, x-1 y-1, %A_ScriptDir%\everi2.jpg
	;Gui, 99: Add, Picture, x512 y-1 w50 h50 Icon1, %A_ScriptDir%\logo.ico
	;Gui, 99: Add, Text, x12 y12 BackGroundTrans cBLUE, SITE NAME: ;Transparent Background
	
	Gui, 99: Add, Text, x12 y12 cRED  vUNAME_TEXT1 gCP_UNAME, CALLER NAME:
	Gui, 99: Add, Text, x12 y12 cBLUE vUNAME_TEXT2 gCP_UNAME hidden, CALLER NAME:
	Gui, 99: Add, Edit, x12 y28 w150 h20 +HwndUNAMEHwnd gCHECK vUNAME
	
	Gui, 99: Add, Text, x170 y12 cBLUE gCP_UEMAIL, CALLER EMAIL:
	Gui, 99: Add, Edit, x170 y28 w180 h20 gCHECK vUEMAIL
	
	Gui, 99: Add, Text, x358 y12 cRED  vUPHONE_TEXT1 gCP_UPHONE, PHONE:
	Gui, 99: Add, Text, x358 y12 cBLUE vUPHONE_TEXT2 gCP_UPHONE hidden, PHONE:
	Gui, 99: Add, Edit, x358 y28 w110 h20 gCHECK vUPHONE
	
	Gui, 99: Add, Text, x476 y12 cRED  vSFCASE_TEXT1 gCP_SFCASE, CASE:
	Gui, 99: Add, Text, x476 y12 cBLUE vSFCASE_TEXT2 gCP_SFCASE hidden, CASE:
	Gui, 99: Font, bold s11
	Gui, 99: Add, Edit, x476 y28 w75 h20 cRED gCHECK vSFCASE
	Gui, 99: Font, 
	
	Gui, 99: Add, Text, x12 y52 cRED  vSITENAME_TEXT1 gCP_SITENAME, SITE NAME:
	Gui, 99: Add, Text, x12 y52 cBLUE vSITENAME_TEXT2 gCP_SITENAME hidden, SITE NAME:
	Gui, 99: Add, Edit, x12 y68 w240 h20 gCHECK vSITENAME
	
	Gui, 99: Add, Text, x260 y52 cRED  vSITEAVAIL_TEXT1, SITE AVAILABILITY:
	Gui, 99: Add, Text, x260 y52 cBLUE vSITEAVAIL_TEXT2 hidden, SITE AVAILABILITY:
	Gui, 99: Add, DropDownList, x260 y68 w148 gCHECK vAVAILABILITY,No Dispatch Required||24-7 Always Open|8AM-5PM Business Hours|5PM-8AM After Hours|Standard Business Hours|Other
	Gui, 99: Add, Text, x408 y52 cBLUE hidden vAVAIL_TEXT, SPECIFY:
	Gui, 99: Add, Edit, x408 y68 w141 h20 Hidden gCHECK vALT_AVAILABILITY, Standard Business Hours
	
	
	Gui, 99: Add, Tab3, x0 y96 w564 h500, ATM KIOSK GAME|Preview
	
	; ATM KIOSK GAME Tab
	Gui, 99: Tab,  ATM KIOSK GAME
	
		Gui, 99: Add, DropDownList, x12 y138 w50 gCHECK vSVC_TYPE, ATM|EGM|FSK||JXC
		
		Gui, 99: Add, Text, x64 y122 cBLUE gCP_TID vTID_TEXT, TID:
		Gui, 99: Add, Edit, x64 y138 w155 h20 gCHECK vTID, %TID%
		
		Gui, 99: Add, Text, x64 y122 cBLUE Hidden gCP_GAMENAME vGAMENAME_TEXT, GAME NAME:
		Gui, 99: Add, Edit, x64 y138 w120 h20 Hidden gCHECK vGAMENAME, %GAMENAME%
		
		Gui, 99: Add, Text, x185 y122 cBLUE Hidden gCP_SERIALNUM vSERIALNUM_TEXT, SERIAL#:
		Gui, 99: Add, Edit, x185 y138 w60 h20 Hidden gCHECK vSERIALNUM, %SERIALNUM%
		
		Gui, 99: Add, Text, x247 y122 cBLUE Hidden gCP_ASSETNUM vASSETNUM_TEXT, ASSET#:
		Gui, 99: Add, Edit, x247 y138 w60 h20 Hidden gCHECK vASSETNUM, %ASSETNUM%
		
		Gui, 99: Add, Text, x309 y122 cBLUE Hidden gCP_LOCATION vLOCATION_TEXT, LOCATION:
		Gui, 99: Add, Edit, x309 y138 w120 h20 Hidden gCHECK vLOCATION, %LOCATION%
		
		Gui, 99: Add, Text,     x450 y122 Hidden cBLUE vSTAT_TEXT2, DEVICE STATUS:
		
		Gui, 99: Add, Text,     x230 y122 cBLUE vSTAT_TEXT, IS DEVICE STILL PERFORMING ANY FUNCTIONS?
		Gui, 99: Add, Checkbox, x230 y143 gCHECK vSTAT_DOWN Checked, Non-functional
		Gui, 99: Add, Checkbox, x330 y143 gCHECK vSTAT_ATM, ATM
		Gui, 99: Add, Checkbox, x380 y143 gCHECK vSTAT_BREAK, Bill Break
		Gui, 99: Add, Checkbox, x450 y143 gCHECK vSTAT_REDEMPTION, Ticket Redemption
		
		Gui, 99: Add, Text,  x12  y167 cBLUE, IS THIS A HARDWARE, SOFTWARE OR CONNECTIVITY ISSUE?
		Gui, 99: Add, Radio, x12  y183 h20 Checked gCHECK vISSUE_HARDWARE, HARDWARE
		Gui, 99: Add, Radio, x120 y183 h20 gCHECK vISSUE_SOFTWARE, SOFTWARE
		Gui, 99: Add, Radio, x225 y183 h20 gCHECK vISSUE_CONNECTIVITY, CONNECTIVITY
		
		Gui, 99: Add, Text, x365  y167 Hidden cBLUE vIN_ROUTER_TEXT, DOES DEVICE SHOW IN ROUTER?
		Gui, 99: Add, Radio, x365 y183 h20 Hidden gCHECK vIN_ROUTER_YES, YES
		Gui, 99: Add, Radio, x440 y183 h20 Hidden gCHECK vIN_ROUTER_NO, NO
		
		Gui, 99: Add, Button, x12  y208 h25 gISSUE cRED, Issue description
		Gui, 99: Add, Button, x102 y208 h25 gSITE_TS, Troubleshooting by property
		Gui, 99: Add, Button, x244 y208 h25 gPV_ERRORS, Proview Errors
		Gui, 99: Add, Button, x323 y208 h25 gRESOLUTION, Resolution-Notes
		
		Gui, 99: Font, bold
		Gui, 99: Add, Text, x12 y245 w536 cBLACK vDESC_SUB_PREVIEW gCOPY_SUBJECT 0x80, %SUBJECT%
		Gui, 99: Font,
		
		Gui, 99: Add, Text, x12 y268 cRED  vDESC_SUB_TEXT1 gCOPY_SUBJECT, SUBJECT DESCRIPTION:
		Gui, 99: Add, Text, x12 y268 cBLUE vDESC_SUB_TEXT2 gCOPY_SUBJECT hidden, SUBJECT DESCRIPTION:
		Gui, 99: Add, Edit, x140 y265 w408 h20 gCHECK vDESC_SUB
		
		Gui, 99: Add, Text, x12 y287 cRED  vDESC_ISSUE_TEXT1 gCOPY_ISSUE, ISSUE DESCRIPTION:
		Gui, 99: Add, Text, x12 y287 cBLUE vDESC_ISSUE_TEXT2 gCOPY_ISSUE hidden, ISSUE DESCRIPTION:
		Gui, 99: Add, Edit, x12 y303 w536 r14 gCHECK vDESC_ISSUE
		
		Gui, 99: Add, Text, x12 y268 Hidden cBLUE vSITE_TS_TEXT, TROUBLESHOOTING STEPS COMPLETED BY SITE:
		Gui, 99: Add, Edit, x12 y287 w536 r15 Hidden gCHECK vSITE_TS
		
		Gui, 99: Add, Text, x12 y268 Hidden cBLUE vPV_ERRORS_TEXT, PLEASE NOTE WHAT ERRORS (IF ANY) ARE SHOWING IN PROVIEW:
		Gui, 99: Add, Edit, x12 y287 w536 r15 Hidden gCHECK vPV_ERRORS
		
		Gui, 99: Add, Text, x12 y268 Hidden cBLUE vRESOLUTION_TEXT, RESOLUTION NOTES:
		Gui, 99: Add, Edit, x12 y287 w536 r15 Hidden gCHECK vRESOLUTION
		
		Gui, 99: Add, Button, x12 y500 h25 gCLEAR_ALL, RESET
		Gui, 99: Add, Button, x69 y500 h25 gCOPY_SUBJECT, Copy Subject
		Gui, 99: Add, Button, x143 y500 h25 gCOPY_ISSUE, Copy Issue
		Gui, 99: Add, Button, x206 y500 h25 gLOG_CALL, Save Log
		Gui, 99: Add, Button, x273 y500 h25 gOPEN_LOG, Open Log
		
		Gui, 99: Font, bold cRED
		Gui, 99: Add, Checkbox, x340 y511 gCHECK vESCALATE, ESCALATE
		Gui, 99: Font, 
		; Gui, 99: Add, Text, x12 y535 w500 cRED  vCURFIELD, %GuiFieldCur%
		
	; Preview Tab
	Gui, 99: Tab,  Preview
	
		Gui, 99: Font, bold
		Gui, 99: Add, Text, x12 y125 cBLUE, SUBJECT DESCRIPTION:
		Gui, 99: Font,
		Gui, 99: Add, Text, x12 y145 w536 r2 c006600 vDESC_SUB_PREVIEW2 gCOPY_SUBJECT 0x80, %SUBJECT%
		
		Gui, 99: Font, bold
		Gui, 99: Add, Text, x12 y185 cBLUE, ISSUE DESCRIPTION:
		Gui, 99: Font,
		Gui, 99: Add, Text, x12 y205 w536 r25 c006600 vISSUE_PREVIEW gCOPY_ISSUE 0x80, %CASE_DESC%

Gui, 99: Show, Center w%GuiW% h%GuiH% x%GuiPosX% y%GuiPosY%, TechOps Case Builder v.%VERSION%

; NOTE:  -E0x200 to remove edit box border
; NOTE:   0x80 to allow ampersand in text box

; Get and save window position when window moved
OnMessage(0x03, "xchange.getposition")



CHECK:
{
	checkfieldtext()
	xchange.guiopt()
	xchange.format_subj()
	xchange.format_issue()
	
	;IfWinActive, TechOps Case Builder
	;{
	;	xchange.getposition()
	;	;WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
	;	;MsgBox, The active window is at %X%`,%Y%
	;}
}
return

checkfieldtext()
{
	global
	GuiControlGet, GuiFieldCur, focusV
	
	if (GuiFieldCur != GuiFieldPrev)
	{
		GuiControl, 99: ,CURFIELD, Changed from %GuiFieldPrev% to %GuiFieldCur%
		
		xchange.cleanfieldtext()
	}
	else
	{
		GuiControl, 99: ,CURFIELD, %GuiFieldCur% (unchanged)
	}
	
	GuiFieldPrev = %GuiFieldCur%
}



LOG_CALL:
{
	Gui, 99: Submit, NoHide ;Minimize
	SetFormat, float, 0.0
	CurTime()
	xchange.format_subj()
	xchange.format_issue()
	
	; GROUP := "ATM Support"
	; %StartTime% (%GROUP%)
	
	CALL_HEAD := 
	CALL_INFO := 
	
	; Call Header
	CALL_HEAD := CurTime "`r`n"
	if (UNAME != "")
	{
		CALL_HEAD := CALL_HEAD "CONTACT NAME: " UNAME "`r`n"
	}
	if (UEMAIL != "")
	{
		CALL_HEAD := CALL_HEAD "CONTACT EMAIL: " UEMAIL "`r`n"
	}
	if (UPHONE != "")
	{
		CALL_HEAD := CALL_HEAD "CONTACT PHONE: " UPHONE "`r`n"
	}
	
	; Call info
	CALL_INFO := "`r`n" SUBJECT "`r`n"
	if (SFCASE != "")
	{
		CALL_INFO := CALL_INFO "CASE: " SFCASE "`r`n`r`n"
	}
	
	; Join Call Log Info
	LOG_CALL := CALL_HEAD . CALL_INFO . CASE_DESC "`r`n____________________________________________________________`r`n"

	LOG_CALL := RegExReplace(LOG_CALL, "`r`n", "`n")
	LOG_CALL := RegExReplace(LOG_CALL, "`n", "`r`n")
	Clipboard := LOG_CALL
	
FileAppend , %LOG_CALL%, %A_ScriptDir%\log.txt
}
return


OPEN_LOG:
{
	Run, %A_ScriptDir%\log.txt
}

SITE_TS:
{
	GuiControl, 99: Show, SITE_TS_TEXT
	GuiControl, 99: Show, SITE_TS
	GuiControl, 99: Hide, PV_ERRORS_TEXT
	GuiControl, 99: Hide, PV_ERRORS
	GuiControl, 99: Hide, DESC_SUB_TEXT1
	GuiControl, 99: Hide, DESC_SUB_TEXT2
	GuiControl, 99: Hide, DESC_SUB
	GuiControl, 99: Hide, DESC_ISSUE_TEXT1
	GuiControl, 99: Hide, DESC_ISSUE_TEXT2
	GuiControl, 99: Hide, DESC_ISSUE
	GuiControl, 99: Hide, RESOLUTION_TEXT
	GuiControl, 99: Hide, RESOLUTION
}
return

PV_ERRORS:
{
	GuiControl, 99: Hide, SITE_TS_TEXT
	GuiControl, 99: Hide, SITE_TS
	GuiControl, 99: Show, PV_ERRORS_TEXT
	GuiControl, 99: Show, PV_ERRORS
	GuiControl, 99: Hide, DESC_SUB_TEXT1
	GuiControl, 99: Hide, DESC_SUB_TEXT2
	GuiControl, 99: Hide, DESC_SUB
	GuiControl, 99: Hide, DESC_ISSUE_TEXT1
	GuiControl, 99: Hide, DESC_ISSUE_TEXT2
	GuiControl, 99: Hide, DESC_ISSUE
	GuiControl, 99: Hide, RESOLUTION_TEXT
	GuiControl, 99: Hide, RESOLUTION
}
return

RESOLUTION:
{
	GuiControl, 99: Hide, SITE_TS_TEXT
	GuiControl, 99: Hide, SITE_TS
	GuiControl, 99: Hide, PV_ERRORS_TEXT
	GuiControl, 99: Hide, PV_ERRORS
	GuiControl, 99: Hide, DESC_SUB_TEXT1
	GuiControl, 99: Hide, DESC_SUB_TEXT2
	GuiControl, 99: Hide, DESC_SUB
	GuiControl, 99: Hide, DESC_ISSUE_TEXT1
	GuiControl, 99: Hide, DESC_ISSUE_TEXT2
	GuiControl, 99: Hide, DESC_ISSUE
	GuiControl, 99: Show, RESOLUTION_TEXT
	GuiControl, 99: Show, RESOLUTION
}
return

ISSUE:
{
	GuiControl, 99: Hide, SITE_TS_TEXT
	GuiControl, 99: Hide, SITE_TS
	GuiControl, 99: Hide, PV_ERRORS_TEXT
	GuiControl, 99: Hide, PV_ERRORS
	GuiControl, 99: Hide, RESOLUTION_TEXT
	GuiControl, 99: Hide, RESOLUTION
	
	GuiControl, 99: Show, DESC_SUB
	GuiControlGet, DESC_SUB
	if (DESC_SUB = "")
	{
		GuiControl, 99: Show, DESC_SUB_TEXT1
		GuiControl, 99: Hide, DESC_SUB_TEXT2
	}
	else
	{
		GuiControl, 99: Hide, DESC_SUB_TEXT1
		GuiControl, 99: Show, DESC_SUB_TEXT2
	}
	
	GuiControl, 99: Show, DESC_ISSUE
	GuiControlGet, DESC_ISSUE
	if (DESC_ISSUE = "")
	{
		GuiControl, 99: Show, DESC_ISSUE_TEXT1
		GuiControl, 99: Hide, DESC_ISSUE_TEXT2
	}
	else
	{
		GuiControl, 99: Hide, DESC_ISSUE_TEXT1
		GuiControl, 99: Show, DESC_ISSUE_TEXT2
	}
	
}
return

COPY_SUBJECT:
{
	SUB_ERR :=
	Gui, 99: Submit, NoHide ;Minimize
	SetFormat, float, 0.0
	xchange.format_subj()
	
	if (SUBJECT="")
	{
		if (SITENAME="")
		{
			SUB_ERR := SUB_ERR . "`n     SITE NAME"
		}
		if (DESC_SUB="")
		{
			SUB_ERR := SUB_ERR . "`n     SUBJECT DESCRIPTION"
		}
		else
		{
			DESC_SUB_FILLED := "YES"
		}
		MsgBox, 48,ERROR, ERROR: Unable to generate subject.`nThe following info is missing:`n%SUB_ERR%
	}
	else
	{	
		Clipboard := SUBJECT
	}
}
return

COPY_ISSUE:
{
	Gui, 99: Submit, NoHide
	SetFormat, float, 0.0
	xchange.format_issue()
	Clipboard := CASE_DESC
}
return

CP_UNAME:
{
	GuiControlGet, UNAME
	Clipboard := UNAME
}
return

CP_UEMAIL:
{
	GuiControlGet, UEMAIL
	Clipboard := UEMAIL
}
return

CP_UPHONE:
{
	GuiControlGet, UPHONE
	Clipboard := UPHONE
}
return

CP_SFCASE:
{
	GuiControlGet, SFCASE
	Clipboard := SFCASE
}
return

CP_SITENAME:
{
	GuiControlGet, SITENAME
	Clipboard := SITENAME
}
return

CP_TID:
{
	GuiControlGet, TID
	Clipboard := TID
}
return

CP_GAMENAME:
{
	GuiControlGet, GAMENAME
	Clipboard := GAMENAME
}
return

CP_SERIALNUM:
{
	GuiControlGet, SERIALNUM
	Clipboard := SERIALNUM
}
return

CP_ASSETNUM:
{
	GuiControlGet, ASSETNUM
	Clipboard := ASSETNUM
}
return

CP_LOCATION:
{
	GuiControlGet, LOCATION
	Clipboard := LOCATION
}
return



CLEAR_ALL:
{
	UNAME := 
	UEMAIL := 
	UPHONE := 
	SFCASE := 
	ALT_AVAILABILITY := 
	AVAIL := 
	AVAILABILITY := 
	CurTime := 
	DESC_SUB := 
	DESC_ISSUE := 
	DLPTOOL_GUIPOS := 
	IN_ROUTER_NO := 
	IN_ROUTER_YES := 
	ISSUE_HARDWARE := 
	ISSUE_SOFTWARE := 
	ISSUE_CONNECTIVITY := 
	SITE_TS := 
	PV_ERRORS := 
	RESOLUTION := 
	SITENAME := 
	STAT_DOWN := 
	STAT_ATM := 
	STAT_BREAK := 
	STAT_REDEMPTION := 
	SUBJECT := 
	TID := 
	GAMENAME :=
	SERIALNUM :=
	ASSETNUM :=
	LOCATION :=
	DISPATCH := 
	CASE_DESC :=
	ISSUE_DESC := 
	
	GuiControl, 99: ,UNAME
	GuiControl, 99: ,UEMAIL
	GuiControl, 99: ,UPHONE
	GuiControl, 99: ,SFCASE
	GuiControl, 99: ,SITENAME
	GuiControl, 99: ,AVAILABILITY, |No Dispatch Required||24-7 Always Open|8AM-5PM Business Hours|5PM-8AM After Hours|Standard Business Hours|Other
	GuiControl, 99: ,ALT_AVAILABILITY
	GuiControl, 99: ,SVC_TYPE,|ATM|EGM|FSK||JXC
	GuiControl, 99: ,TID
	GuiControl, 99: ,SITE_TS
	GuiControl, 99: ,PV_ERRORS
	GuiControl, 99: ,RESOLUTION
	
	GuiControl, 99: ,DESC_SUB_PREVIEW,%SUBJECT%
	GuiControl, 99: ,DESC_SUB_PREVIEW2,%SUBJECT%
	GuiControl, 99: ,ISSUE_PREVIEW,%CASE_DESC%
	GuiControl, 99: ,DESC_SUB
	GuiControl, 99: ,DESC_ISSUE
	GuiControl, 99: ,GAMENAME 
	GuiControl, 99: ,SERIALNUM
	GuiControl, 99: ,ASSETNUM 
	GuiControl, 99: ,LOCATION 
	GuiControl, 99: ,STAT_DOWN,1
	GuiControl, 99: ,STAT_ATM,0
	GuiControl, 99: ,STAT_BREAK,0
	GuiControl, 99: ,STAT_REDEMPTION,0
	GuiControl, 99: ,ISSUE_HARDWARE,1
	GuiControl, 99: ,ISSUE_SOFTWARE,0
	GuiControl, 99: ,ISSUE_CONNECTIVITY,0
	GuiControl, 99: ,IN_ROUTER_YES,0
	GuiControl, 99: ,IN_ROUTER_NO,0
	GuiControl, 99: ,ESCALATE,0
	
	GuiControl, 99: Hide, ALT_AVAILABILITY
	GuiControl, 99: Hide, AVAIL_TEXT
	GuiControl, 99: Show, TID_TEXT
	GuiControl, 99: Show, TID
	GuiControl, 99: Hide, GAMENAME_TEXT
	GuiControl, 99: Hide, GAMENAME
	GuiControl, 99: Hide, SERIALNUM_TEXT
	GuiControl, 99: Hide, SERIALNUM
	GuiControl, 99: Hide, ASSETNUM_TEXT
	GuiControl, 99: Hide, ASSETNUM
	GuiControl, 99: Hide, LOCATION_TEXT
	GuiControl, 99: Hide, LOCATION
	GuiControl, 99: Show, STAT_TEXT
	GuiControl, 99: Hide, STAT_TEXT2
	GuiControl, 99: Show, STAT_DOWN
	GuiControl, 99: Show, STAT_ATM
	GuiControl, 99: Show, STAT_BREAK
	GuiControl, 99: Show, STAT_REDEMPTION
	GuiControl, 99: Hide, IN_ROUTER_TEXT
	GuiControl, 99: Hide, IN_ROUTER_YES
	GuiControl, 99: Hide, IN_ROUTER_NO
	
	GuiControl, 99: Hide, SITE_TS_TEXT
	GuiControl, 99: Hide, SITE_TS
	GuiControl, 99: Hide, PV_ERRORS_TEXT
	GuiControl, 99: Hide, PV_ERRORS
	GuiControl, 99: Hide, RESOLUTION_TEXT
	GuiControl, 99: Hide, RESOLUTION
	GuiControl, 99: Show, DESC_SUB_TEXT1
	GuiControl, 99: Show, DESC_SUB
	GuiControl, 99: Show, DESC_ISSUE_TEXT1
	GuiControl, 99: Show, DESC_ISSUE
	
	GuiControl, 99: Move, STAT_DOWN, x228 y25
	GuiControl, 99: Move, STAT_REDEMPTION, x448 y25
}
return


CurTime()
{
	global
	CurTime := 
	CurTime := A_Now
	FormatTime, CurTime, CurTime, yyyy-MM-dd hh:mm:sstt
	return
}
return

99GuiClose:
{
	ExitApp
}
return



^1:: ; Gather caller info from Interactive Desktop
LOG :=
GROUP :=
PHONE :=
WINTITLE :=
MouseGetPos, mXpos, mYpos
WinActivate, Interaction Desktop
Send, {LCtrl Down}{LShift Down}p{LShift Up}{LCtrl Up}
Sleep, 1000
WinGetTitle, WINTITLE, A

;WINTITLE_FILE := "C:\Users\mcrane\Downloads\Autohotkey scrips\WINTITLE.txt"
;FileAppend, %WINTITLE%`n, %WINTITLE_FILE%

if (WINTITLE != "Interaction desktop")
	{
		;MouseClick, left, 75, 45
		MouseClick, left, 75, 95
		Sleep, 250
		;MouseClick, left, 75, 100, 2
		MouseClick, left, 30, 125, 2
		Sleep, 250
		Send {LCtrl Down}a{LCtrl Up}
		Sleep, 250
		Send, {LCtrl Down}c{LCtrl Up}
		Sleep, 50
		LOG := Clipboard
		
		;WINTITLE_FILE := "C:\Users\mcrane\Downloads\Autohotkey scrips\WINTITLE.txt"
		;FileAppend, %LOG%`n`n, %WINTITLE_FILE%
		
		WINTITLE := RegExReplace(WINTITLE, " - sip:.*", "")
		WINTITLE := RegExReplace(WINTITLE, " -$", "")
		PROPERTY := RegExReplace(WINTITLE, " - .*", "")
		PROPERTY := RegExReplace(PROPERTY, "(^\s)", "")
		PROPERTY := RegExReplace(PROPERTY, "(\s+$)", "")
		GROUP := TF_Find(LOG,"","","Entered Workgroup",0,1)
		GROUP := RegExReplace(GROUP, ".*Entered Workgroup ", "")
		PHONE := TF_Find(LOG,"","","ANI:",1,1)
		PHONE := RegExReplace(PHONE, ".*ANI:", "") ; Get the phone number
  		PHONE := RegExReplace(PHONE, ".*sip:", "") ; Strip sip if exists
  		PHONE := RegExReplace(PHONE, "@.*", "") ; Strip sip if exists
		PHONE := RegExReplace(PHONE, "^\s+", "") ; Strip leading spaces
		PHONE := RegExReplace(PHONE, "(\s+$)", "") ; Strip trailing spaces
		PHONE := RegExReplace(PHONE, "^(\d{3})", "$1-") ; Add first hyphen
		PHONE := RegExReplace(PHONE, "(\d{4})$", "-$1") ; Add second hyphen
		WinClose, %WINTITLE%
	}
MouseMove, mXpos, mYpos
return



^2:: ; Paste caller info from Interactive Desktop
CurTime := A_Now
FormatTime, CurTime, CurTime, yyyy-MM-dd hh:mm:sstt
SetKeyDelay, 15

CallInfo := 
ClipboardBak := Clipboard

Send {Home}

CallInfo =
(
%CurTime% (%GROUP%)
CONTACT NAME:%A_Space%
CONTACT PHONE: %PHONE%
PROPERTY: %PROPERTY%
CASE:%A_Space%
ISSUE:%A_Space%
TROUBLESHOOTING:%A_Space%
RESOLUTION:%A_Space%
____________________________________________________________

)

if WinActive("ahk_class OpusApp")
{
	CallInfo := RegExReplace(CallInfo, "`r`n","`n") ; Carriage Return and Line Feed to Line Feed
	CallInfo := RegExReplace(CallInfo, "`n","`r`n") ; Line Feed to Carriage Return and Line Feed
	CallInfo := RegExReplace(CallInfo, "`r`n","{LShift down}{Enter}{LShift up}") ; Carriage Return and Line 
	Clipboard := CallInfo
	Send %CallInfo%
}
else
{
	CallInfo := RegExReplace(CallInfo, "`r`n","`n") ; Carriage Return and Line Feed to Line Feed
	CallInfo := RegExReplace(CallInfo, "`n","`r`n") ; Line Feed to Carriage Return and Line Feed
	Clipboard := CallInfo
	Send {Ctrl down}v{Ctrl up}
}

Sleep 150
Clipboard := ClipboardBak
Sleep, 100
Send, {Up 8}{End}
SetKeyDelay, 0

return



^3::	; Copy info from TechOps Case Builder to Clipify
SetKeyDelay, 0

EleName := "WindowsForms10.EDIT.app.0.12ab327_r14_ad12"
ElePhone := "WindowsForms10.EDIT.app.0.12ab327_r14_ad11"
EleMerchant := "Edit2"
EleService := "WindowsForms10.COMBOBOX.app.0.12ab327_r14_ad13"
EleSummary := "WindowsForms10.EDIT.app.0.12ab327_r14_ad13"
EleNotes := "WindowsForms10.RichEdit20W.app.0.12ab327_r14_ad14"

WinActivate, Clipify
ControlSetText, %EleName%, %UNAME%, Clipify
ControlSetText, %ElePhone%, %UPHONE%, Clipify
ControlSetText, %EleMerchant%, %SITENAME%, Clipify
Control, ChooseString, %SVC_TYPE_SUBJ%, %EleService%, Clipify
;ControlSetText, %EleSummary%, %DESC_SUB%, Clipify
ControlSetText, %EleSummary%, %ClipifySubject%, Clipify
ControlSetText, %EleNotes%, `r`n%CASE_DESC%, Clipify

return



^4::	; Copy case info from Clipify to Salesforce
SetKeyDelay, 0

FoundX :=
FoundY :=
ClipifyName := 
ClipifyPhone := 
ClipifyMerchant := 
ClipifyService := 
ClipifySummary := 
ClipifySubject := 
ClipifyPreNotes := 
ClipifyOngoingNotes := 
ClipifyNotes := 

Resources := "Resources" ; Location of resource files

EleName := "WindowsForms10.EDIT.app.0.12ab327_r14_ad12"
ElePhone := "WindowsForms10.EDIT.app.0.12ab327_r14_ad11"
EleMerchant := "Edit2"
EleService := "WindowsForms10.COMBOBOX.app.0.12ab327_r14_ad13"
EleSummary := "WindowsForms10.EDIT.app.0.12ab327_r14_ad13"
EleSubject := "WindowsForms10.EDIT.app.0.12ab327_r14_ad14"
ElePreNotes := "WindowsForms10.RichEdit20W.app.0.12ab327_r14_ad13"
EleOngoingNotes := "WindowsForms10.RichEdit20W.app.0.12ab327_r14_ad14"

141b42a_r14_ad14

ControlGetText, ClipifyName, %EleName%, Clipify
ControlGetText, ClipifyPhone, %ElePhone%, Clipify
ControlGetText, ClipifyMerchant, %EleMerchant%, Clipify
ControlGet, ClipifyService, Choice, , %EleService%, Clipify
ControlGetText, ClipifySummary, %EleSummary%, Clipify
ControlGetText, ClipifySubject, %EleSubject%, Clipify
ControlGetText, ClipifyPreNotes, %ElePreNotes%, Clipify
ControlGetText, ClipifyOngoingNotes, %EleOngoingNotes%, Clipify

ClipifyPreNotes := RegExReplace(ClipifyPreNotes, "`r`n","`n") ;Convert CRLF to LF
ClipifyPreNotes := ClipifyPreNotes "`n" ; Correct missing end line break
ClipifyPreNotes := RegExReplace(ClipifyPreNotes, "`n`n","`n") ;Remove double line breaks
;Clipboard := ClipifyPreNotes

ClipifyNotes = 
(
%ClipifyPreNotes%
Additional Notes:

%ClipifyOngoingNotes%
)
ClipifyNotes := RegExReplace(ClipifyNotes, "`r`n","`n")
;Clipboard := ClipifySubject . "`r`n`r`n" . ClipifyNotes

WinMove, ahk_class Chrome_WidgetWin_1,, 2000, 10, 1600, 1000
Send {LCtrl down}{Home}{LCtrl up}
Sleep 150

Salesforce.CaseDetails()

; FILL IN: Status, Severity Level
Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 222, 354, 544, 582, *150 %Resources%\Status.jpg ; (x440 y450)
}
If ErrorLevel = 0
{
	; Status
	FoundX := FoundX+75
	FoundY := FoundY+10
	Click, %FoundX%, %FoundY% Left, 1
	Send %CaseStatus%{Enter}
	Sleep 150

	; Severity Level
	FoundY := FoundY+28
	Click, %FoundX%, %FoundY% Left, 1
	Send 4{Enter}
	Sleep 150
}

; FILL IN: Case Origin
Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 936, 475, 1204, 703, *150 %Resources%\CaseOrigin.jpg ; (x440 y450)
}
If ErrorLevel = 0
{
	; Case Origin
	FoundX := FoundX+100
	FoundY := FoundY+10
	Click, %FoundX%, %FoundY% Left, 1
	Send Phone{Enter}
	Sleep 150
}

; FILL IN: Caller Name, Caller Phone
Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 936, 475, 1204, 703, *150 %Resources%\CallerName.jpg ; (x1050 y571)
}
If ErrorLevel = 0
{
	; Caller Name
	FoundX := FoundX+130
	FoundY := FoundY+10
	Click, %FoundX%, %FoundY% Left, 1
	Send {LCtrl down}a{LCtrl up}{Del}
	Sleep 50
	Send %ClipifyName%
	Sleep 150
	Send {Esc}
	Sleep 150
	
	; Caller Phone
	FoundY := FoundY+28
	Click, %FoundX%, %FoundY% Left, 1
	Send {LCtrl down}a{LCtrl up}{Del}
	Sleep 50
	Send %ClipifyPhone%
	Sleep 150
	Send {Esc}
	Sleep 150
}

; FILL IN: Subject
Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 216, 758, 588, 1000, *150 %Resources%\Subject.jpg ; (x434 y854)
}
If ErrorLevel = 0
{
	; Subject
	FoundX := FoundX+100
	FoundY := FoundY+10
	Click, %FoundX%, %FoundY% Left, 1
	Send {LCtrl down}a{LCtrl up}{Del}
	Sleep 150
	SendRaw %ClipifySubject%
	Sleep 300
	Send {Esc}
	Sleep 150
	
	; Description
	FoundY := FoundY+28
	Click, %FoundX%, %FoundY% Left, 1
	Send {LCtrl down}a{LCtrl up}{Del}
	Sleep 150
	SendRaw %ClipifyNotes%
	Sleep 300
	Send {Esc}
	Sleep 150
}

	FoundX := FoundX-150
	Click, %FoundX%, %FoundY% Left, 1
	Sleep 50
	Send {PgDn}
	Sleep 150
	
; FILL IN: Case Details
Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 229, 139, 601, 381, *150 %Resources%\Type.jpg ; (x434 y854)
}
If ErrorLevel = 0
{
	; Type
	FoundX := FoundX+100
	FoundY := FoundY+10
	Click, %FoundX%, %FoundY% Left, 1
	Send Problem{Enter}
	Sleep 150
	
	; Vendor
	FoundY := FoundY+25
	Click, %FoundX%, %FoundY% Left, 1
	Send Everi{Enter}
	Sleep 150
	
	; Product Family
	FoundY := FoundY+25
	if (ProductFamily != "")
	{
		Click, %FoundX%, %FoundY% Left, 1
		Send %ProductFamily%{Enter}
		Sleep 150
	}
	
	; Case Reason
	FoundY := FoundY+25
	if (CaseReason != "")
	{
		Click, %FoundX%, %FoundY% Left, 1
		Send %CaseReason%{Enter}
		Sleep 150
	}
	
	; Root Cause 1
	FoundY := FoundY+25
	if (RootCause1 != "")
	{
		Click, %FoundX%, %FoundY% Left, 1
		Send %RootCause1%{Enter}
		Sleep 150
	}
	
	; Root Cause 2
	FoundY := FoundY+25
	if (RootCause2 != "")
	{
		Click, %FoundX%, %FoundY% Left, 1
		Send %RootCause2%{Enter}
		Sleep 150
	}
}

;Send {LCtrl down}{Home}{LCtrl up}

Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 229, 139, 601, 381, *150 %Resources%\Type.jpg ; (x434 y854)
}
If ErrorLevel = 0
{
	; Type
	FoundX := FoundX-25
	FoundY := FoundY+5
	Click, %FoundX%, %FoundY% Left, 1
	Send {Up 5}
	Sleep 150
}


Loop, 5
{
    CoordMode, Pixel, Client
    ImageSearch, FoundX, FoundY, 450, 110, 800, 280, *150 %Resources%\SrchIcon.jpg ; (x434 y854)
}
If ErrorLevel = 0
{
	; Type
	FoundX := FoundX+10
	FoundY := FoundY+5
	Click, %FoundX%, %FoundY% Left, 0
	Sleep 150
}

return




^5::
EMAIL_TEMPLATE_IN := A_ScriptDir "\Resources\email\EmailTemplateIN.htm"
EMAIL_TEMPLATE_OUT := A_ScriptDir "\Resources\email\EmailTemplateOUT.htm"
send_from := "supportoperations@everi.com"
send_to_cc := "Everi Support Operations <supportoperations@everi.com>; "

EleSubject := "WindowsForms10.EDIT.app.0.12ab327_r14_ad14"
ControlGetText, ClipifySubject, %EleSubject%, Clipify

FileCopy, %EMAIL_TEMPLATE_IN%, %EMAIL_TEMPLATE_OUT%,1

EmailText := Clipboard
FName := TF_Find(EmailText, "1", "0", "CONTACT NAME:", 1, 1)
FName := RegExReplace(FName, "^(CONTACT NAME: {1})(.*$)", "$2") ;Working!
FName := RegExReplace(FName, "`r`n.*", "") ;Working!
FName := RegExReplace(FName, "\s.*", "") ;Working!
StringUpper FName, FName, T  ; (Title case)

EmailText := RegExReplace(EmailText, "im)^([a-zA-Z].*?:{1})(.*$)", "<b style='mso-bidi-font-weight:normal'><span style='color:#1F497D'>$1</span></b><span style='color:red'>$2</span>")

EmailText := RegExReplace(EmailText, "im)^(\*\*\*.*$)", "<b style='mso-bidi-font-weight:normal'><span style='color:#1F497D'>$1</span></b>")

EmailText := RegExReplace(EmailText, "im)^(.*)$", "<p class=MsoNormal><o:p>$1</o:p></p>")

TF_Replace("!"EMAIL_TEMPLATE_OUT,"EmailText",EmailText)
TF_Replace("!"EMAIL_TEMPLATE_OUT,"FName",FName)

;############### HTML Message Body ##############
FileRead, template_master, %EMAIL_TEMPLATE_OUT%

html=
(
%template_master%
)

;############### COM ##############
m := ComObjActive("Outlook.Application").CreateItem(0)
m.Subject := ClipifySubject			    ; <---- Subject -----
m.SentOnBehalfOfName := send_from       ; <---- Sender -----
m.To := send_to                         ; <---- Recipient -----
m.CC := send_to_cc                      ; <---- Recipient CC -----
m.Display
m.HTMLBody := html                      ; <---- Email message body -----

WinActivate, ahk_class rctrl_renwnd32

Sleep 300
Click, x20, y345 Left, 1

Sleep 300
Send, {Control down}{end}{Control up}

Sleep 300
SetControlDelay -1
ControlClick, x650 y96, ahk_class rctrl_renwnd32,,,, NA

Sleep 300
Send, {down}{enter}

Sleep 300
Send, {Control down}{home}{Control up}{end}

Return



^!P:: ; Generate a random 20 character password
ID_CODE()
{
	global
	; Generate Random Alphanumeric String
	Chars1 = 234567892345678923456789
	Chars2 = ABCDEFGHJKLMNPQRSTUVWXYZ
	Chars3 = abcdefghjklmnpqrstuvwxyz
	str =
	clipboard =
	UpperRange = 3 ;<-- use all 3 character strings
	len1 = 2 ;<-- number of characters first set
	len2 = 15 ;<-- number of characters second set
	len3 = 3 ;<-- number of characters third set
	
	; generate string
	loop, %len1%
	{ 
		random,x,1,%Chars2% ;<-- selects the Character string
		random,y,1,24 ;<-- selects the character in the string
		StringMid,z,Chars2,%y%,1 ;<-- grab the selected letter
		str = %str%%z% ;<-- and add it to the password string
	}
	loop, %len2%
	{ 
		random,x,1,%UpperRange% ;<-- selects the Character string
		random,y,1,24 ;<-- selects the character in the string
		StringMid,z,Chars%x%,%y%,1 ;<-- grab the selected letter
		str = %str%%z% ;<-- and add it to the password string
	}
	loop, %len3%
	{ 
		random,x,1,%Chars2% ;<-- selects the Character string
		random,y,1,24 ;<-- selects the character in the string
		StringMid,z,Chars2,%y%,1 ;<-- grab the selected letter
		str = %str%%z% ;<-- and add it to the password string
	}
	
	;IDCODE := "A" str ;<-- put the completed string on a variable
	;clipboard := "ID#" str ;<-- put the completed string on the clipboard
	clipboard := "" str ;<-- put the completed string on the clipboard
	Clipwait ;<-- wait for the clipboard to accept the string
}

ID_CODE()
return



^!R::reload
MsgBox reloaded
return



;	version number MAJOR.MINOR.PATCH, increment the:
;	
;	MAJOR version when you make incompatible API changes,
;	MINOR version when you add functionality in a backwards-compatible manner, and
;	PATCH version when you make backwards-compatible bug fixes.
;	Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.



;MsgBox, 0, , 
;(LTrim
;ISSUE_HARDWARE = %ISSUE_HARDWARE%
;ISSUE_SOFTWARE = %ISSUE_SOFTWARE%
;ISSUE_CONNECTIVITY = %ISSUE_CONNECTIVITY%
;IN_ROUTER_YES = %IN_ROUTER_YES%
;IN_ROUTER_NO = %IN_ROUTER_NO%
;AVAILABILITY = %AVAIL%
;SVC_TYPE = %SVC_TYPE%
;STAT_DOWN = %STAT_DOWN%
;STAT_ATM = %STAT_ATM%
;STAT_BREAK = %STAT_BREAK%
;STAT_REDEMPTION = %STAT_REDEMPTION%
;)