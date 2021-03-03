#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include %A_ScriptDir%\modules\tf.czr
#Include %A_ScriptDir%\modules\GenHeaderVars.czr
#Include %A_ScriptDir%\_classes.ahk


^Esc:: ;Press CTRL every X minutes

  StopLoop := "False"
  
  TrayTip,, On

  Loop, 
    { 
       if (StopLoop = "True")
		{
		   sleep 2000
		   break
		}
		else
		{
		;send, test {space}
		send {Ctrl down}
		sleep 50
		send {Ctrl up}
		sleep 590000
	   }
     } 

return 

^!Esc:: 

  StopLoop := "True"
  TrayTip,, Off

return




^6::	; Copy case info from Excel
SetKeyDelay, 0
SetFormat, float, 0.0

DateTime := A_Now
FormatTime, DateTime, DateTime, yyyyMMddPTHHmm
SetKeyDelay, 15

TRACKING_FILE := "C:\Users\mcrane\Pictures\_TEMP\VSS Instant Priv Tracking - mcrane.xlsx"
TS_TRACKING_TAB := "Sheet1"

TS_USER_TID :=
TS_USER_TECH_NAME :=
TS_USER_SOS_NAME :=
TS_USER_MINUTES :=
TS_USER_REBOOTS :=
TS_USER_SF_CASE :=
TS_USER_REASON :=
TS_USER_CONTACT_METHOD :=
TS_USER_SITE :=
TS_USER_SITE_CAPS :=
TS_USER_ACCESS_TYPE :=
TS_USER_ACCESS_TYPE2 :=
TS_USER_ACCESS_TYPE2A :=
TS_USER_ALGORITHM :=
VSS_FILENAME :=
SF_SUBJ :=
SF_DESC :=

;START_WORKBOOK_PATH Workbook folder path
;START_WORKBOOK_FILE Workbook filename
;START_WORKBOOK Workbook full path
;START_SHEET Workbook current sheet


		get_current_book_sheet()
		
		; Generate Header Column Variables
		;SHEET_COL_PREFIX := "TS_COL_"
		SHEET_COL_PREFIX := "TS_COL_"
		SHEET_FILE := TRACKING_FILE
		SHEET_TAB := TS_TRACKING_TAB
		GenHeaderVars.GenHeader()
		
		; XL Activate the Worksheet
		XL := ComObjGet(TRACKING_FILE) 			; Load the Worksheet
		XL.Worksheets(TS_TRACKING_TAB).Activate	; Activate the Worksheet Tab
		XL := ComObjActive("Excel.Application")	; Set the Worksheet Active
		
		; Get Tracking Sheet Worksheets
		;Progress, zh0 fs16 B cwFF0000 ctFFFFFF, Gathering list of worksheet names...
		TS_SHEETS := 
		Clipboard :=
		For Sheet in XL.ActiveWorkbook.Worksheets
		{
			if (Clipboard = "")
			{
				Clipboard := Sheet.Name
			}
			else
			{
				Clipboard := Clipboard "`n" Sheet.Name
			}
		}
		TS_SHEETS := Clipboard
		Progress, Off
		
		; Get current active row
		XL := ComObjActive("Excel.Application")
		Cell := XL.ActiveCell
		ADDR := XL.Cells(Cell.Row,Cell.Column).Address
		TS_TRACKING_TAB_ROW := RegExReplace(ADDR, "[^\$\d.*]", "")  ; (Cell Address Row)
		TS_TRACKING_TAB_ROW := RegExReplace(TS_TRACKING_TAB_ROW, "\$", "")  ; (Cell Address Row remove extra $$)
		
		; Get TID
		TS_USER_TID_ADDR := TS_COL_TID . TS_TRACKING_TAB_ROW
		TS_USER_TID := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_TID_ADDR).Value
		TS_USER_TID := RegExReplace(TS_USER_TID, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_TID := RegExReplace(TS_USER_TID, "\r\n.*$", "")  ; (Strip linebreaks)
		TS_USER_TID_SSC := RegExReplace(TS_USER_TID, "([a-zA-Z0-9]+).*", "$1")
		
		; Get Tech Name
		TS_USER_TECH_NAME_ADDR := TS_COL_TECH_NAME . TS_TRACKING_TAB_ROW
		TS_USER_TECH_NAME := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_TECH_NAME_ADDR).Value
		TS_USER_TECH_NAME := RegExReplace(TS_USER_TECH_NAME, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_TECH_NAME := RegExReplace(TS_USER_TECH_NAME, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get SOS Name
		TS_USER_SOS_NAME_ADDR := TS_COL_SOS_NAME . TS_TRACKING_TAB_ROW
		TS_USER_SOS_NAME := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_SOS_NAME_ADDR).Value
		TS_USER_SOS_NAME := RegExReplace(TS_USER_SOS_NAME, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_SOS_NAME := RegExReplace(TS_USER_SOS_NAME, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get Minutes
		TS_USER_MINUTES_ADDR := TS_COL_MINUTES . TS_TRACKING_TAB_ROW
		TS_USER_MINUTES := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_MINUTES_ADDR).Value
		TS_USER_MINUTES := RegExReplace(TS_USER_MINUTES, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_MINUTES := RegExReplace(TS_USER_MINUTES, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get Reboots
		TS_USER_REBOOTS_ADDR := TS_COL_REBOOTS . TS_TRACKING_TAB_ROW
		TS_USER_REBOOTS := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_REBOOTS_ADDR).Value
		TS_USER_REBOOTS := RegExReplace(TS_USER_REBOOTS, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_REBOOTS := RegExReplace(TS_USER_REBOOTS, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get SF Case
		TS_USER_SF_CASE_ADDR := TS_COL_SF_CASE . TS_TRACKING_TAB_ROW
		TS_USER_SF_CASE := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_SF_CASE_ADDR).Value
		TS_USER_SF_CASE := RegExReplace(TS_USER_SF_CASE, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_SF_CASE := RegExReplace(TS_USER_SF_CASE, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get Reason
		TS_USER_REASON_ADDR := TS_COL_REASON . TS_TRACKING_TAB_ROW
		TS_USER_REASON := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_REASON_ADDR).Value
		TS_USER_REASON := RegExReplace(TS_USER_REASON, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_REASON := RegExReplace(TS_USER_REASON, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get Contact Method
		TS_USER_CONTACT_METHOD_ADDR := TS_COL_CONTACT_METHOD . TS_TRACKING_TAB_ROW
		TS_USER_CONTACT_METHOD := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_CONTACT_METHOD_ADDR).Value
		TS_USER_CONTACT_METHOD := RegExReplace(TS_USER_CONTACT_METHOD, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_CONTACT_METHOD := RegExReplace(TS_USER_CONTACT_METHOD, "\r\n.*$", "")  ; (Strip linebreaks)
		
		; Get Site
		TS_USER_SITE_ADDR := TS_COL_SITE . TS_TRACKING_TAB_ROW
		TS_USER_SITE := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_SITE_ADDR).Value
		TS_USER_SITE := RegExReplace(TS_USER_SITE, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_SITE := RegExReplace(TS_USER_SITE, "\r\n.*$", "")  ; (Strip linebreaks)
		StringUpper TS_USER_SITE_CAPS, TS_USER_SITE  ; (Upper case)
		
		; Get Access Type
		TS_USER_ACCESS_TYPE_ADDR := TS_COL_ACCESS_TYPE . TS_TRACKING_TAB_ROW
		TS_USER_ACCESS_TYPE := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_ACCESS_TYPE_ADDR).Value
		TS_USER_ACCESS_TYPE := RegExReplace(TS_USER_ACCESS_TYPE, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_ACCESS_TYPE := RegExReplace(TS_USER_ACCESS_TYPE, "\r\n.*$", "")  ; (Strip linebreaks)
		TS_USER_ACCESS_TYPE2 := RegExReplace(TS_USER_ACCESS_TYPE, "^VSS ", "")
		TS_USER_ACCESS_TYPE2 := RegExReplace(TS_USER_ACCESS_TYPE2, " Access", "")
		TS_USER_ACCESS_TYPE2 := RegExReplace(TS_USER_ACCESS_TYPE2, "\s.*\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_ACCESS_TYPE2 := RegExReplace(TS_USER_ACCESS_TYPE2, "\r\n.*$", "")  ; (Strip linebreaks)
		
		Clipboard := TS_USER_ACCESS_TYPE2
		MsgBox, %TS_USER_ACCESS_TYPE2%
		
		; Get Algorithm
		TS_USER_ALGORITHM_ADDR := TS_COL_ALGORITHM . TS_TRACKING_TAB_ROW
		TS_USER_ALGORITHM := XL.Sheets(TS_TRACKING_TAB).Range(TS_USER_ALGORITHM_ADDR).Value
		TS_USER_ALGORITHM := RegExReplace(TS_USER_ALGORITHM, "\t.*\r\n.*$", "")  ; (Strip spaces and linebreaks)
		TS_USER_ALGORITHM := RegExReplace(TS_USER_ALGORITHM, "\r\n.*$", "")  ; (Strip linebreaks)
		

	if (TS_USER_REBOOTS = 1)
	{
		REBOOTS := "reboot"
	}
	else
	{
		REBOOTS := "reboots"
	}


	if (TS_USER_ALGORITHM != "")
	{
		ALGORITHM := "_ALG" TS_USER_ALGORITHM
	}
	else
	{
		ALGORITHM := ""
	}

	if (TS_USER_ACCESS_TYPE2 = "Ticket")
	{
		VSS_FILENAME =
		(
		%DateTime%_%TS_USER_TID_SSC%_%TS_USER_MINUTES%M_%TS_USER_REBOOTS%R%ALGORITHM%.tsx
		)
		
		TS_USER_ACCESS_TYPE2A := "EMAILED FILE: " VSS_FILENAME "`r`n"
	}
	else
	{
		TS_USER_ACCESS_TYPE2A := ""
		VSS_FILENAME := ""
	}




SF_SUBJ := TS_USER_SITE_CAPS " - FSK - " TS_USER_TID ", " TS_USER_ACCESS_TYPE " " TS_USER_MINUTES " minutes " TS_USER_REBOOTS " " REBOOTS

SF_DESC =
(
%TS_USER_TID%, %TS_USER_ACCESS_TYPE% %TS_USER_MINUTES% minutes %TS_USER_REBOOTS% %REBOOTS%, %TS_USER_REASON%
)



Clipboard =
(
ISSUE: %TS_USER_REASON%
TID: %TS_USER_TID%
VSS ACCESS: %TS_USER_ACCESS_TYPE2%
MINUTES: %TS_USER_MINUTES%
REBOOTS: %TS_USER_REBOOTS%
ALGORITHM: %TS_USER_ALGORITHM%
%TS_USER_ACCESS_TYPE2A%
%SF_SUBJ%
)


; MsgBox,
; (
; ISSUE: %TS_USER_REASON%
; TID: %TS_USER_TID%
; VSS ACCESS: %TS_USER_ACCESS_TYPE2%
; VSS MINUTES: %TS_USER_MINUTES%
; VSS REBOOTS: %TS_USER_REBOOTS%
; %TS_USER_ACCESS_TYPE2A%
; %SF_SUBJ%
; )


return 

get_current_book_sheet()
{
	global
	
	; Activate EXCEL
	SetTitleMatchMode, 2
	WinActivate, ahk_class XLMAIN
	Sleep, 50
	WinWaitActive, ahk_class XLMAIN
	Sleep, 15
	
	; XL Get Current Workbook And Worksheet Names
	START_WORKBOOK_PATH := ComObjActive("Excel.Application").ActiveWorkbook.Path	;	Active Workbook Path
	START_WORKBOOK_FILE := ComObjActive("Excel.Application").ActiveWorkbook.Name	;	Active Workbook Name
	START_WORKBOOK := START_WORKBOOK_PATH "\" START_WORKBOOK_FILE
	XL := ComObjGet(TRACKING_FILE) 			; Load the Worksheet
	START_SHEET := XL.ActiveSheet.Name		; Get current sheet name
}


get_worksheets()
{
	global
	
	; Get Worksheets
	Progress, zh0 fs16 B cwFF0000 ctFFFFFF, Gathering list of worksheet names...
	WORK_SHEETS := 
	Clipboard :=
	For Sheet in XL.ActiveWorkbook.Worksheets
	{
		if (Clipboard = "")
		{
			Clipboard := Sheet.Name
		}
		else
		{
			Clipboard := Clipboard "`n" Sheet.Name
		}
	}
	WORK_SHEETS := Clipboard
	Progress, Off
}

return


^!6:: ; Format Date
DateTime := A_Now
FormatTime, DateTime, DateTime, yyyyMMddHHmm
SetKeyDelay, 15

ClipboardBak := Clipboard
Clipboard := CurTime

return


^T::	; Copy case info from Excel
SetKeyDelay, 0
SetFormat, float, 0.0

TS_USER_TID := "NVMGLX*"

;TS_USER_TID_SSC := RegExReplace(TS_USER_TID, "([a-zA-Z0-9]+)", "$1")
TS_USER_TID_SSC := RegExReplace(TS_USER_TID, "([a-zA-Z0-9]+).*", "$1")


MsgBox,
(
%TS_USER_TID_SSC%
)
return 





^!0::reload
Sleep 2000
MsgBox reloaded
return