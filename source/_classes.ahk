class Salesforce
{
	CaseDetails()
	{
		global
		Status :=
		ProductFamily :=
		CaseReason := 
		RootCause1 := 
		RootCause2 := 
		
		if (ClipifyService = "ARCA")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Currency Handling"
			CaseReason := "ARCA Recyclers"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "ATM")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Cash Access"
			CaseReason := "91x-ATM"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "CageXchange")
		{
			CaseStatus := "01-New"
			ProductFamily := "Kiosk FSK"
			CaseReason := "CageXchange"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Call Center App")
		{
			If InStr(ClipifyMerchant, "Everi", false)
			{
				If InStr(ClipifySummary, "Authentication failure", false)
				{
					ClipifySubject := RegExReplace(ClipifySubject, "Call Center App", "AD")
					CaseStatus := "01-Working"
					ProductFamily := "Everi ID"
					CaseReason := "Everi"
					RootCause1 := "Password Reset"
					RootCause2 := ""
				}
			}
		}
		
		if (ClipifyService = "Cash Club")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Cash Access"
			CaseReason := "Cash Club"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Casino Direct")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Cash Access"
			CaseReason := "Cash Club"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "CCI Legacy")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Central Credit"
			CaseReason := "Central Credit (legacy)"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "CCI 2.0")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Central Credit"
			CaseReason := "Central Credit 2.0"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Check Prove")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Compliance Products"
			CaseReason := "NEWave"
			RootCause1 := "CheckProve"
			RootCause2 := "--None--"
		}
		
		if (ClipifyService = "EGM")
		{
			CaseStatus := "01-New"
			ProductFamily := "Games"
			CaseReason := "--None--"
			RootCause1 := ""
			RootCause2 := ""
		}
		
		if (ClipifyService = "EVERI Compliance")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Compliance Products"
			CaseReason := "NEWave"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Full-Service Kiosk")
		{
			CaseStatus := "01-New"
			ProductFamily := "Kiosk FSK"
			CaseReason := "Xchange FSK"
			RootCause1 := "Xchange FSK Hardware"
			RootCause2 := "--None--"
		}
		
		if (ClipifyService = "Jackpot Dispense Unit")
		{
			CaseStatus := "01-New"
			ProductFamily := "Kiosk JXC"
			CaseReason := "JXC"
			RootCause1 := "Xchange FSK Hardware"
			RootCause2 := "--None--"
		}
		
		if (ClipifyService = "Ticket Redemption Unit")
		{
			CaseStatus := "01-New"
			ProductFamily := "Kiosk FSK"
			CaseReason := "Xchange FSK"
			RootCause1 := "Xchange FSK Hardware"
			RootCause2 := "--None--"
		}
		
		if (ClipifyService = "QuikCash")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Cash Access"
			CaseReason := "Cash Club"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Networking")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Payment Network"
			CaseReason := "Networking"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "Resort Advantage")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Compliance Products"
			CaseReason := "Resort Advantage"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		if (ClipifyService = "XE")
		{
			CaseStatus := "01-New"
			ProductFamily := "Kiosk FSK"
			CaseReason := "Xchange FSK"
			RootCause1 := "Xchange FSK Software"
			RootCause2 := "Xchange Explorer"
		}
		
		if (ClipifyService = "XView")
		{
			CaseStatus := "10-Working"
			ProductFamily := "Cash Access"
			CaseReason := "Xview"
			RootCause1 := "--None--"
			RootCause2 := ""
		}
		
		return
	}
	
	Chrome()
	{
		global
		
		; DETECT: Case Record Type 	x1138 y432 | 1157 436
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 936, 392, 1204, 703, *150 %Resources%\CaseRecordType.jpg ; (x440 y450)
		}
		If ErrorLevel = 0
		{
			; Case Record Type
			FoundX := FoundX+136
			FoundY := FoundY+5
			Click, %FoundX%, %FoundY% Left, 1
			Click 2
			Sleep 150
			Send {LCtrl down}c{LCtrl up}
			Sleep 150
			CaseRecordType := Clipboard
			CaseRecordType := RegExReplace(CaseRecordType, "^\s+", "")  ; (Strip leading spaces)
			CaseRecordType := RegExReplace(CaseRecordType, "\s+$", "")  ; (Strip trailing spaces)
			CaseRecordType := RegExReplace(CaseRecordType, "`r`n.*", "")
			CaseRecordType := RegExReplace(CaseRecordType, "`r`n", "")
			Clipboard := CaseRecordType
		}
		
		; FILL IN: Contact Email  442, 607
		if (CaseRecordType = "LVHD")
		{
			WinGetClass, WINclass, A
			InputBox, UEMAIL, Contact Email Required, , , 250, 100
			if (UEMAIL = "")
			{
				UEMAIL := "null@null.com"
			}
			WinActivate, ahk_class %WINclass%
			
			Loop, 5
			{
				CoordMode, Pixel, Client
				ImageSearch, FoundX, FoundY, 222, 570, 544, 670, *150 %Resources%\Email.jpg ; (x440 y450)
			}
			If ErrorLevel = 0
			{
				; Caller Email
				FoundX := FoundX+130
				FoundY := FoundY+10
				Click, %FoundX%, %FoundY% Left, 1
				Send {LCtrl down}a{LCtrl up}{Del}
				Sleep 50
				Send %UEMAIL%
				Sleep 150
				Send {Esc}
				Sleep 150
			}
		}
		
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
	}
	
	Firefox()
	{
		global
		
		;**************************************************
		; DETECT: Case Record Type 	x1138 y432 | 1157 436
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 925, 375, 1140, 420, *150 %Resources%\CaseRecordType-FF.jpg ; (x440 y450)
		}
		If ErrorLevel = 0
		{
			FoundX := FoundX+136
			FoundY := FoundY+5
			Click, %FoundX%, %FoundY% Left, 1
			Click 2
			Sleep 150
			Send {LCtrl down}c{LCtrl up}
			Sleep 150
			CaseRecordType := Clipboard
			CaseRecordType := RegExReplace(CaseRecordType, "^\s+", "")  ; (Strip leading spaces)
			CaseRecordType := RegExReplace(CaseRecordType, "\s+$", "")  ; (Strip trailing spaces)
			CaseRecordType := RegExReplace(CaseRecordType, "`r`n.*", "")
			CaseRecordType := RegExReplace(CaseRecordType, "`r`n", "")
			Clipboard := CaseRecordType
		}

		;**************************************************
		; FILL IN: Contact Email  442, 607
		if (CaseRecordType = "LVHD")
		{
			WinGetClass, WINclass, A
			InputBox, UEMAIL, Contact Email Required, , , 250, 100
			if (UEMAIL = "")
			{
				UEMAIL := "null@null.com"
			}
			WinActivate, ahk_class %WINclass%
			
			Loop, 5
			{
				CoordMode, Pixel, Client
				ImageSearch, FoundX, FoundY, 225, 555, 500, 595, *150 %Resources%\Email-FF.jpg ; (x440 y450)
			}
			If ErrorLevel = 0
			{
				; Caller Email
				FoundX := FoundX+130
				FoundY := FoundY+10
				Click, %FoundX%, %FoundY% Left, 1
				Send {LCtrl down}a{LCtrl up}{Del}
				Sleep 50
				Send %UEMAIL%
				Sleep 150
				Send {Esc}
				Sleep 150
			}
		}
		
		;**************************************************
		; FILL IN: Status, Severity Level
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 230, 405, 521, 440, *150 %Resources%\Status-FF.jpg ; (x440 y450)
		}
		If ErrorLevel = 0
		{
			; Status
			FoundX := FoundX+75
			FoundY := FoundY+10
			Click, %FoundX%, %FoundY% Left, 1
			Sleep 150
			Send %CaseStatus%{Enter}
			Sleep 150
		
			; Severity Level
			FoundY := FoundY+28
			Click, %FoundX%, %FoundY% Left, 1
			Sleep 150
			Send 4{Enter}
			Sleep 150
		}	

		;**************************************************
		; FILL IN: Case Origin
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 935, 420, 1220, 630, *150 %Resources%\CaseOrigin-FF.jpg ; (x440 y450)
		}
		If ErrorLevel = 0
		{
			Msgbox CaseOrigin found
			; Case Origin
			FoundX := FoundX+100
			FoundY := FoundY+10
			
			Sleep 500
			Send {Click, %FoundX%, %FoundY% Left, 1}Phone{Esc}
			Sleep 5000
		}
		If ErrorLevel = 1
		{
			Msgbox CaseOrigin Not found
		}
		Msgbox STOP
		;**************************************************
		; FILL IN: Caller Name, Caller Phone
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 950, 535, 1175, 570, *150 %Resources%\CallerName-FF.jpg ; (x1050 y571)
		}
		If ErrorLevel = 0
		{
			; Caller Name
			Sleep 150
			FoundX := FoundX+130
			FoundY := FoundY+9
			Sleep 150
			Click, %FoundX%, %FoundY% Left, 1
			Sleep 150
			Msgbox STOP
			Send {LCtrl down}a{LCtrl up}{Del}
			Sleep 2000
			Send %ClipifyName%
			Msgbox STOP
			Sleep 150
			Send {Esc}
			Sleep 150
			
			; Caller Phone
			FoundY := FoundY+28
			Click, %FoundX%, %FoundY% Left, 1
			Msgbox STOP
			Send {LCtrl down}a{LCtrl up}{Del}
			Sleep 50
			Send %ClipifyPhone%
			Sleep 150
			Send {Esc}
			Sleep 150
		}
		
		;**************************************************
		; FILL IN: Subject
		Loop, 5
		{
			CoordMode, Pixel, Client
			ImageSearch, FoundX, FoundY, 230, 820, 525, 855, *150 %Resources%\Subject.jpg ; (x434 y854)
		}
		If ErrorLevel = 0
		{
			Msgbox Subject found
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
		If ErrorLevel = 1
		{
			Msgbox Subject not found
		}
		Msgbox STOP
		
			FoundX := FoundX-150
			Click, %FoundX%, %FoundY% Left, 1
			Sleep 50
			Send {PgDn}
			Sleep 150
			
		;**************************************************
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
	}
}

class xchange
{
	getposition()
	{
		global
		; Get GUI Position and Save
		Gui, 99: +LastFound
		;WinGetPos,x,y,w,h
		WinGetPos,x,y
		GuiPosX := x
		GuiPosY := y
		
		SetTimer, getGuiPosition, 1000
		return
		getGuiPosition:
		{
			IniWrite, %GuiPosX%, %SettingsINI%, TechOpsCaseBuilder, GuiPosX
			IniWrite, %GuiPosY%, %SettingsINI%, TechOpsCaseBuilder, GuiPosY
			SetTimer, getGuiPosition, off
		}
		return
	}
	
	checkposition() ; Check GUI Position is in viewable desktop range
	{
		global
		SysGet, DesktopWidth, 78
		SysGet, DesktopHeight, 79
		DesktopMaximumX := (DesktopWidth - GuiW - 10)
		DesktopMaximumY := (DesktopHeight - 65)
		
		if (GuiPosX > DesktopMaximumX)
		{
			;MsgBox, GUI X out of range x=%DesktopMaximumX%
			GuiPosX := DesktopMaximumX
		}
		
		if (GuiPosY > DesktopMaximumY)
		{
			;MsgBox, GUI Y out of range y=%DesktopMaximumY%
			GuiPosY := DesktopMaximumY
		}
		return
	}
	
	cleanfieldtext()
	{
		global

		If (GuiFieldPrev="UEMAIL")
		{
			GuiControlGet, UEMAIL
			UEMAIL := RegExReplace(UEMAIL, "^\s+", "")  ; (Strip leading spaces)
			UEMAIL := RegExReplace(UEMAIL, "\s+$", "")  ; (Strip trailing spaces)
			StringLower UEMAIL, UEMAIL  ; (Lower case)
			GuiControl, 99: ,UEMAIL, %UEMAIL%
			;Send, {end}
		}
		
		If (GuiFieldPrev="SFCASE")
		{
			GuiControlGet, SFCASE
			SFCASE := RegExReplace(SFCASE, "^\s+", "")  ; (Strip leading spaces)
			SFCASE := RegExReplace(SFCASE, "\s+$", "")  ; (Strip trailing spaces)
			SFCASE := RegExReplace(SFCASE, "^0+", "")	; (Strip leading zeros)
			GuiControl, 99: ,SFCASE, %SFCASE%
			;Send, {end}
		}
		
		If (GuiFieldPrev="SITENAME")
		{
			GuiControlGet, SITENAME
			SITENAME := RegExReplace(SITENAME, "^\s+", "")  ; (Strip leading spaces)
			SITENAME := RegExReplace(SITENAME, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper SITENAME, SITENAME, U  ; (Upper case)
			GuiControl, 99: ,SITENAME, %SITENAME%
			;Send, {end}
		}
		
		If (GuiFieldPrev="ALT_AVAILABILITY")
		{
			GuiControlGet, ALT_AVAILABILITY
			ALT_AVAILABILITY := RegExReplace(ALT_AVAILABILITY, "^\s+", "")  ; (Strip leading spaces)
			ALT_AVAILABILITY := RegExReplace(ALT_AVAILABILITY, "\s+$", "")  ; (Strip trailing spaces)
			GuiControl, 99: ,ALT_AVAILABILITY, %ALT_AVAILABILITY%
			;Send, {end}
		}
		
		If (GuiFieldPrev="TID")
		{
			GuiControlGet, TID
			TID := RegExReplace(TID, "^\s+", "")  ; (Strip leading spaces)
			TID := RegExReplace(TID, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper TID, TID, U  ; (Upper case)
			GuiControl, 99: ,TID, %TID%
			;Send, {end}
		}
		
		If (GuiFieldPrev="GAMENAME")
		{
			GuiControlGet, GAMENAME
			GAMENAME := RegExReplace(GAMENAME, "^\s+", "")  ; (Strip leading spaces)
			GAMENAME := RegExReplace(GAMENAME, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper GAMENAME, GAMENAME, U  ; (Upper case)
			GuiControl, 99: ,GAMENAME, %GAMENAME%
			;Send, {end}
		}

		If (GuiFieldPrev="SERIALNUM")
		{
			GuiControlGet, SERIALNUM
			SERIALNUM := RegExReplace(SERIALNUM, "^\s+", "")  ; (Strip leading spaces)
			SERIALNUM := RegExReplace(SERIALNUM, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper SERIALNUM, SERIALNUM, U  ; (Upper case)
			GuiControl, 99: ,SERIALNUM, %SERIALNUM%
			Send, {end}
		}

		If (GuiFieldPrev="ASSETNUM")
		{
			GuiControlGet, ASSETNUM
			ASSETNUM := RegExReplace(ASSETNUM, "^\s+", "")  ; (Strip leading spaces)
			ASSETNUM := RegExReplace(ASSETNUM, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper ASSETNUM, ASSETNUM, U  ; (Upper case)
			GuiControl, 99: ,ASSETNUM, %ASSETNUM%
			;Send, {end}
		}
		
		If (GuiFieldPrev="LOCATION")
		{
			GuiControlGet, LOCATION
			LOCATION := RegExReplace(LOCATION, "^\s+", "")  ; (Strip leading spaces)
			LOCATION := RegExReplace(LOCATION, "\s+$", "")  ; (Strip trailing spaces)
			StringUpper LOCATION, LOCATION, U  ; (Upper case)
			GuiControl, 99: ,LOCATION, %LOCATION%
			;Send, {end}
		}

		If (GuiFieldPrev="DESC_SUB")
		{
			GuiControlGet, DESC_SUB
			DESC_SUB := RegExReplace(DESC_SUB, "^\s+", "")  ; (Strip leading spaces)
			DESC_SUB := RegExReplace(DESC_SUB, "\s+$", "")  ; (Strip trailing spaces)
			GuiControl, 99: ,DESC_SUB, %DESC_SUB%
			;Send, {end}
		}
		
	}
	
	guiopt()
	{
		global
		
		GuiControlGet, SVC_TYPE
		GuiControlGet, TID
		GuiControlGet, GAMENAME
		GuiControlGet, SERIALNUM
		GuiControlGet, ASSETNUM
		GuiControlGet, LOCATION
		GuiControlGet, STAT_DOWN
		GuiControlGet, STAT_ATM
		GuiControlGet, STAT_BREAK
		GuiControlGet, STAT_REDEMPTION
		GuiControlGet, ISSUE_HARDWARE
		GuiControlGet, ISSUE_SOFTWARE
		GuiControlGet, ISSUE_CONNECTIVITY
		GuiControlGet, IN_ROUTER_YES
		GuiControlGet, IN_ROUTER_NO
		GuiControlGet, DESC_SUB
		GuiControlGet, DESC_ISSUE
		GuiControlGet, SITE_TS
		GuiControlGet, PV_ERRORS
		GuiControlGet, RESOLUTION
		GuiControlGet, ESCALATE
		
		If (A_GuiControl="UNAME") ; Change text color if field blank/filled
		{
			GuiControlGet, UNAME
			if (UNAME = "")
			{
				GuiControl, 99: Show, UNAME_TEXT1
				GuiControl, 99: Hide, UNAME_TEXT2
			}
			else
			{
				GuiControl, 99: Hide, UNAME_TEXT1
				GuiControl, 99: Show, UNAME_TEXT2
			}
		}
		
		If (A_GuiControl="UPHONE") ; Change text color if field blank/filled
		{
			GuiControlGet, UPHONE
			if (UPHONE = "")
			{
				GuiControl, 99: Show, UPHONE_TEXT1
				GuiControl, 99: Hide, UPHONE_TEXT2
			}
			else
			{
				GuiControl, 99: Hide, UPHONE_TEXT1
				GuiControl, 99: Show, UPHONE_TEXT2
			}
		}
		
		If (A_GuiControl="SFCASE") ; Change text color if field blank/filled
		{
			GuiControlGet, SFCASE
			if (SFCASE = "")
			{
				GuiControl, 99: Show, SFCASE_TEXT1
				GuiControl, 99: Hide, SFCASE_TEXT2
			}
			else
			{
				GuiControl, 99: Hide, SFCASE_TEXT1
				GuiControl, 99: Show, SFCASE_TEXT2
			}
		}
		
		If (A_GuiControl="SITENAME") ; Change text color if field blank/filled
		{
			GuiControlGet, SITENAME
			if (SITENAME = "")
			{
				GuiControl, 99: Show, SITENAME_TEXT1
				GuiControl, 99: Hide, SITENAME_TEXT2
			}
			else
			{
				GuiControl, 99: Hide, SITENAME_TEXT1
				GuiControl, 99: Show, SITENAME_TEXT2
			}
		}
		
		If (A_GuiControl="AVAILABILITY") ; Change text color if field blank/filled
		{
			GuiControlGet, AVAILABILITY
			if (AVAILABILITY = "No Dispatch Required")
			{
				GuiControl, 99: Show, SITEAVAIL_TEXT1
				GuiControl, 99: Hide, SITEAVAIL_TEXT2
			}
			else
			{
				GuiControl, 99: Hide, SITEAVAIL_TEXT1
				GuiControl, 99: Show, SITEAVAIL_TEXT2
			}
		}
		
		If (A_GuiControl="DESC_SUB") ; Change text color if field blank/filled
		{
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
		}
		
		If (A_GuiControl="DESC_ISSUE") ; Change text color if field blank/filled
		{
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
		
; MOVED A_GUICONTROLS TO SEPARATE FUNCTION PROCESS

		If (A_GuiControl="SFCASE")
		{
			GuiControlGet, SFCASE
			SFCASE := RegExReplace(SFCASE, "^\s+", "")  ; (Strip leading spaces)
			SFCASE := RegExReplace(SFCASE, "\s+$", "")  ; (Strip trailing spaces)
			SFCASE := RegExReplace(SFCASE, "^0+", "")	; (Strip leading zeros)
			GuiControl, 99: ,SFCASE, %SFCASE%
			Send, {end}
		}
		
		If (A_GuiControl="ISSUE_HARDWARE")
		{
			GuiControlGet, ISSUE_HARDWARE
			If (ISSUE_HARDWARE=1)
			{
				ISSUE_SOFTWARE := 0
				ISSUE_CONNECTIVITY := 0
				IN_ROUTER_YES := 0
				IN_ROUTER_NO := 0
				GuiControl, 99: ,ISSUE_SOFTWARE,0
				GuiControl, 99: ,ISSUE_CONNECTIVITY,0
				GuiControl, 99: ,IN_ROUTER_YES,0
				GuiControl, 99: ,IN_ROUTER_NO,0
				GuiControl, 99: Hide, IN_ROUTER_TEXT
				GuiControl, 99: Hide, IN_ROUTER_YES
				GuiControl, 99: Hide, IN_ROUTER_NO
			}
		}
		
		If (A_GuiControl="ISSUE_SOFTWARE")
		{
			GuiControlGet, ISSUE_SOFTWARE
			If (ISSUE_SOFTWARE=1)
			{
				ISSUE_HARDWARE := 0
				ISSUE_CONNECTIVITY := 0
				IN_ROUTER_YES := 0
				IN_ROUTER_NO := 0
				GuiControl, 99: ,ISSUE_HARDWARE,0
				GuiControl, 99: ,ISSUE_CONNECTIVITY,0
				GuiControl, 99: ,IN_ROUTER_YES,0
				GuiControl, 99: ,IN_ROUTER_NO,0
				GuiControl, 99: Hide, IN_ROUTER_TEXT
				GuiControl, 99: Hide, IN_ROUTER_YES
				GuiControl, 99: Hide, IN_ROUTER_NO
			}
		}
		
		If (A_GuiControl="ISSUE_CONNECTIVITY")
		{
			GuiControlGet, ISSUE_CONNECTIVITY
			If (ISSUE_CONNECTIVITY=1)
			{
				ISSUE_HARDWARE := 0
				ISSUE_SOFTWARE := 0
				GuiControl, 99: ,ISSUE_HARDWARE,0
				GuiControl, 99: ,ISSUE_SOFTWARE,0
				GuiControl, 99: Show, IN_ROUTER_YES
				GuiControl, 99: Show, IN_ROUTER_NO
				GuiControl, 99: Show, IN_ROUTER_TEXT
			}
		}
		
		If (A_GuiControl="AVAILABILITY")
		{
			GuiControlGet, AVAILABILITY
			If (AVAILABILITY="Other")
			{
				GuiControl, 99: Show, ALT_AVAILABILITY
				GuiControl, 99: Show, AVAIL_TEXT
			}
			else
			{
				GuiControl, 99: Hide, ALT_AVAILABILITY
				GuiControl, 99: Hide, AVAIL_TEXT
			}
		}
		if (AVAILABILITY = "Other")
		{
			AVAIL := ALT_AVAILABILITY
		}
		else
		{
			AVAIL := AVAILABILITY
		}
		
		;########################################
		If (A_GuiControl="SVC_TYPE")
		{
			STAT_DOWN := 1
			STAT_ATM := 0
			STAT_BREAK := 0
			STAT_REDEMPTION := 0
			GuiControl, 99: ,STAT_DOWN,1
			GuiControl, 99: ,STAT_ATM,0
			GuiControl, 99: ,STAT_BREAK,0
			GuiControl, 99: ,STAT_REDEMPTION,0
			
			xchange.svc_type_subj()
			
		}
		;########################################
		
		If (A_GuiControl="STAT_DOWN")
		{
			GuiControlGet, STAT_DOWN
			If (STAT_DOWN=1)
			{
				STAT_ATM := 0
				STAT_BREAK := 0
				STAT_REDEMPTION := 0
				GuiControl, 99: ,STAT_ATM,0
				GuiControl, 99: ,STAT_BREAK,0
				GuiControl, 99: ,STAT_REDEMPTION,0
			}
		}
		
		If (A_GuiControl="STAT_ATM" or "STAT_BREAK" or "STAT_REDEMPTION")
		{
			GuiControlGet, STAT_ATM
			GuiControlGet, STAT_BREAK
			GuiControlGet, STAT_REDEMPTION
			If (SVC_TYPE !="EGM")
			{
				If (STAT_ATM or STAT_BREAK or STAT_REDEMPTION=1)
				{
					STAT_DOWN := 0
					GuiControl, 99: ,STAT_DOWN,0
				}
				else
				{
					STAT_DOWN := 1
					GuiControl, 99: ,STAT_DOWN,1
				}
			}
		}
		
		;MsgBox, STAT_DOWN:  %STAT_DOWN% `nSTAT_ATM:  %STAT_ATM% `nSTAT_BREAK:  %STAT_BREAK% `nSTAT_REDEMPTION: %STAT_REDEMPTION%
		
		xchange.format_subj()
		xchange.format_issue()
		
		GuiControl, 99: ,DESC_SUB_PREVIEW,%SUBJECT%
		GuiControl, 99: ,DESC_SUB_PREVIEW2,%SUBJECT%
		GuiControl, 99: ,ISSUE_PREVIEW,%CASE_DESC%
		
		;If (A_GuiControl="DESC_SUB" or A_GuiControl="SITENAME" or A_GuiControl="SVC_TYPE" or A_GuiControl="TID" or A_GuiControl="GAMENAME")
		;{
		;	
		;	
		;	
		;	xchange.format_subj()
		;	xchange.format_issue()
		;	
		;	GuiControl, 99: ,DESC_SUB_PREVIEW,%SUBJECT%
		;	GuiControl, 99: ,DESC_SUB_PREVIEW2,%SUBJECT%
		;	GuiControl, 99: ,ISSUE_PREVIEW,%CASE_DESC%
		;}
		
		return
	}
	
	svc_type_subj()
	{
			global
			
			GuiControlGet, SVC_TYPE
			If (SVC_TYPE="ATM")
			{
				SVC_TYPE_SUBJ := "ATM"
				
				;STAT_DOWN := 1
				;STAT_ATM := 0
				;STAT_BREAK := 0
				;STAT_REDEMPTION := 0
				;GuiControl, 99: ,STAT_DOWN,1
				;GuiControl, 99: ,STAT_ATM,0
				;GuiControl, 99: ,STAT_BREAK,0
				;GuiControl, 99: ,STAT_REDEMPTION,0
				
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
				GuiControl, 99: Hide, STAT_BREAK
				GuiControl, 99: Hide, STAT_REDEMPTION
				
				GuiControl, 99: Move, STAT_DOWN, x228 y25	; x330 y143
				GuiControl, 99: Move, STAT_REDEMPTION, x348 y25	; x450 y143
			}
			If (SVC_TYPE="FSK")
			{
				SVC_TYPE_SUBJ := "Full-Service Kiosk"
				
				;STAT_DOWN := 1
				;STAT_ATM := 0
				;STAT_BREAK := 0
				;STAT_REDEMPTION := 0
				;GuiControl, 99: ,STAT_DOWN,1
				;GuiControl, 99: ,STAT_ATM,0
				;GuiControl, 99: ,STAT_BREAK,0
				;GuiControl, 99: ,STAT_REDEMPTION,0
				
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
				
				GuiControl, 99: Move, STAT_DOWN, x228 y25	; x330 y143
				GuiControl, 99: Move, STAT_REDEMPTION, x448 y25
			}
			If (SVC_TYPE="EGM")
			{
				SVC_TYPE_SUBJ := "EGM"
				
				;STAT_DOWN := 1
				;STAT_ATM := 0
				;STAT_BREAK := 0
				;STAT_REDEMPTION := 0
				;GuiControl, 99: ,STAT_DOWN,1
				;GuiControl, 99: ,STAT_ATM,0
				;GuiControl, 99: ,STAT_BREAK,0
				;GuiControl, 99: ,STAT_REDEMPTION,0
				
				GuiControl, 99: Hide, TID_TEXT
				GuiControl, 99: Hide, TID
				GuiControl, 99: Show, GAMENAME_TEXT
				GuiControl, 99: Show, GAMENAME
				GuiControl, 99: Show, SERIALNUM_TEXT
				GuiControl, 99: Show, SERIALNUM
				GuiControl, 99: Show, ASSETNUM_TEXT
				GuiControl, 99: Show, ASSETNUM
				GuiControl, 99: Show, LOCATION_TEXT
				GuiControl, 99: Show, LOCATION
				
				GuiControl, 99: Hide, STAT_TEXT
				GuiControl, 99: Show, STAT_TEXT2
				GuiControl, 99: Show, STAT_DOWN
				GuiControl, 99: Hide, STAT_ATM
				GuiControl, 99: Hide, STAT_BREAK
				GuiControl, 99: Hide, STAT_REDEMPTION
				
				GuiControl, 99: Move, STAT_DOWN, x448 y25	; x330 y143
				GuiControl, 99: Move, STAT_REDEMPTION, x448 y25
			}
			If (SVC_TYPE="JXC")
			{
				SVC_TYPE_SUBJ := "Jackpot Dispense Unit"
				
				;STAT_DOWN := 1
				;STAT_ATM := 0
				;STAT_BREAK := 0
				;STAT_REDEMPTION := 0
				;GuiControl, 99: ,STAT_DOWN,1
				;GuiControl, 99: ,STAT_ATM,0
				;GuiControl, 99: ,STAT_BREAK,0
				;GuiControl, 99: ,STAT_REDEMPTION,0
				
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
				GuiControl, 99: Hide, STAT_ATM
				GuiControl, 99: Hide, STAT_BREAK
				GuiControl, 99: Show, STAT_REDEMPTION
				
				GuiControl, 99: Move, STAT_DOWN, x228 y25	; x330 y143
				GuiControl, 99: Move, STAT_REDEMPTION, x328 y25
			}
			;MsgBox, %SVC_TYPE%`n%SVC_TYPE_SUBJ%
	}
	
	format_subj()
	{
		global
		GuiControlGet, UEMAIL
		GuiControlGet, SITENAME
		GuiControlGet, SVC_TYPE
		GuiControlGet, TID
		GuiControlGet, GAMENAME
		GuiControlGet, DESC_SUB
		GuiControlGet, SFCASE
		
		xchange.svc_type_subj()
		
		UEMAIL := RegExReplace(UEMAIL, "^\s+", "")  ; (Strip leading spaces)
		UEMAIL := RegExReplace(UEMAIL, "\s+$", "")  ; (Strip trailing spaces)
		StringLower UEMAIL, UEMAIL  ; (Lower case)
		
		;StringUpper TS_USER_CONTACT_FNAME, TS_USER_CONTACT_FNAME, T  ; (Title case)
		SITENAME := RegExReplace(SITENAME, "^\s+", "")  ; (Strip leading spaces)
		SITENAME := RegExReplace(SITENAME, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper SITENAME, SITENAME, U  ; (Upper case)
		
		DESC_SUB := RegExReplace(DESC_SUB, "^\s+", "")  ; (Strip leading spaces)
		DESC_SUB := RegExReplace(DESC_SUB, "\s+$", "")  ; (Strip trailing spaces)
		
		TID := RegExReplace(TID, "^\s+", "")  ; (Strip leading spaces)
		TID := RegExReplace(TID, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper TID, TID, U  ; (Upper case)
		
		GAMENAME := RegExReplace(GAMENAME, "^\s+", "")  ; (Strip leading spaces)
		GAMENAME := RegExReplace(GAMENAME, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper GAMENAME, GAMENAME, U  ; (Upper case)
		
		SERIALNUM := RegExReplace(SERIALNUM, "^\s+", "")  ; (Strip leading spaces)
		SERIALNUM := RegExReplace(SERIALNUM, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper SERIALNUM, SERIALNUM, U  ; (Upper case)
		
		ASSETNUM := RegExReplace(ASSETNUM, "^\s+", "")  ; (Strip leading spaces)
		ASSETNUM := RegExReplace(ASSETNUM, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper ASSETNUM, ASSETNUM, U  ; (Upper case)
		
		LOCATION := RegExReplace(LOCATION, "^\s+", "")  ; (Strip leading spaces)
		LOCATION := RegExReplace(LOCATION, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper LOCATION, LOCATION, U  ; (Upper case)
		
		if (SITENAME!="" and DESC_SUB!="")
		{
			if (SVC_TYPE="EGM")
			{
				if (GAMENAME!="")
				{
					if (SFCASE!="")
					{
						SUBJECT := "SF#" SFCASE " " SITENAME " -- " SVC_TYPE_SUBJ " - " GAMENAME ", " DESC_SUB
						ClipifySubject := GAMENAME ", " DESC_SUB
					}
					else
					{
						SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " GAMENAME ", " DESC_SUB
						ClipifySubject := GAMENAME ", " DESC_SUB
					}
				}
				else
				{
					if (SFCASE!="")
					{
						SUBJECT := "SF#" SFCASE " " SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " DESC_SUB
						ClipifySubject := DESC_SUB
					}
					else
					{
						SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " DESC_SUB
						ClipifySubject := DESC_SUB
					}
				}
			}
			if (SVC_TYPE="ATM" or SVC_TYPE="FSK" or SVC_TYPE="JXC")
			{
				if (TID!="")
				{
					if (SFCASE!="")
					{
						SUBJECT := "SF#" SFCASE " " SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " TID ", " DESC_SUB
						ClipifySubject := TID ", " DESC_SUB
					}
					else
					{
						SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " TID ", " DESC_SUB
						ClipifySubject := TID ", " DESC_SUB
					}
				}
				else
				{
					if (SFCASE!="")
					{
						SUBJECT := "SF#" SFCASE " " SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " DESC_SUB
						ClipifySubject := DESC_SUB
					}
					else
					{
						SUBJECT := SITENAME " -- " SVC_TYPE_SUBJ " - " DESC_SUB
						ClipifySubject := DESC_SUB
					}
				}
			}
		}
		else
		{
			SUBJECT := 
		}
		return
	}
	
	format_issue()
	{
		global
		SetFormat, float, 0.0
		
		GuiControlGet, UNAME
		GuiControlGet, UPHONE
		GuiControlGet, ALT_AVAILABILITY
		GuiControlGet, SVC_TYPE
		GuiControlGet, TID
		GuiControlGet, GAMENAME
		GuiControlGet, SERIALNUM
		GuiControlGet, ASSETNUM
		GuiControlGet, LOCATION
		GuiControlGet, STAT_DOWN
		GuiControlGet, STAT_ATM
		GuiControlGet, STAT_BREAK
		GuiControlGet, STAT_REDEMPTION
		GuiControlGet, ISSUE_HARDWARE
		GuiControlGet, ISSUE_SOFTWARE
		GuiControlGet, ISSUE_CONNECTIVITY
		GuiControlGet, IN_ROUTER_YES
		GuiControlGet, IN_ROUTER_NO
		GuiControlGet, DESC_SUB
		GuiControlGet, DESC_ISSUE
		GuiControlGet, SITE_TS
		GuiControlGet, PV_ERRORS
		GuiControlGet, RESOLUTION
		GuiControlGet, ESCALATE		
		
		TID := RegExReplace(TID, "^\s+", "")  ; (Strip leading spaces)
		TID := RegExReplace(TID, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper TID, TID, U  ; (Upper case)
		
		GAMENAME := RegExReplace(GAMENAME, "^\s+", "")  ; (Strip leading spaces)
		GAMENAME := RegExReplace(GAMENAME, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper GAMENAME, GAMENAME, U  ; (Upper case)
		
		SERIALNUM := RegExReplace(SERIALNUM, "^\s+", "")  ; (Strip leading spaces)
		SERIALNUM := RegExReplace(SERIALNUM, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper SERIALNUM, SERIALNUM, U  ; (Upper case)
		
		ASSETNUM := RegExReplace(ASSETNUM, "^\s+", "")  ; (Strip leading spaces)
		ASSETNUM := RegExReplace(ASSETNUM, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper ASSETNUM, ASSETNUM, U  ; (Upper case)
		
		LOCATION := RegExReplace(LOCATION, "^\s+", "")  ; (Strip leading spaces)
		LOCATION := RegExReplace(LOCATION, "\s+$", "")  ; (Strip trailing spaces)
		StringUpper LOCATION, LOCATION, U  ; (Upper case)
		
		; SITE DISPATCH AVAILABILITY
		
		if (AVAILABILITY != "No Dispatch Required")
		{
			if (AVAILABILITY = "24-7 Always Open")
			{
				SITE_AVAIL := "24-7 Always Open"
			}
			if (AVAILABILITY = "8AM-5PM Business Hours")
			{
				SITE_AVAIL := "Business hours 8:00AM - 5:00PM"
			}
			if (AVAILABILITY = "5PM-8AM After Hours")
			{
				SITE_AVAIL := "After hours 5:00PM - 8:00AM"
			}
			if (AVAILABILITY = "Standard Business Hours")
			{
				SITE_AVAIL := "Standard Business Hours"
			}
			if (AVAILABILITY = "Other")
			{
				if (ALT_AVAILABILITY != "")
				{
					SITE_AVAIL := ALT_AVAILABILITY
				}
				else
				{
					SITE_AVAIL := 
				}
			}
			
			if (SITE_AVAIL != "")
			{
				if (ESCALATE = 1)
				{
					DISPATCH := "*** DISPATCH SERVICE TECH SITE REQUESTING ESCALATION ***`r`nSITE AVAILABLE: " SITE_AVAIL "`r`n"
				}
				else
				{
					DISPATCH := "*** DISPATCH SERVICE TECH ***`r`nSITE AVAILABLE: " SITE_AVAIL "`r`n"
				}
			}
			else
			{
				if (ESCALATE = 1)
				{
					DISPATCH := "*** DISPATCH SERVICE TECH SITE REQUESTING ESCALATION ***"
				}
				else
				{
					DISPATCH := "*** DISPATCH SERVICE TECH ***"
				}
			}
		}
		if (AVAILABILITY="No Dispatch Required" or AVAILABILITY="")
		{
			DISPATCH := 
		}
		
		
		; DEVICE STATUS
		DEV_STATUS := "Machine "
		if (STAT_DOWN = 1) ; Down
		{
			DEV_STATUS := DEV_STATUS "is currently down"
		}
		if (STAT_ATM = 1 or STAT_BREAK = 1 or STAT_REDEMPTION = 1)
		{
			DEV_STATUS := DEV_STATUS "has "
		}
		if (STAT_ATM = 1) ; ATM
		{
			DEV_STATUS := DEV_STATUS "ATM functionality"
		}
		if (STAT_BREAK = 1) ; Bill break
		{
			if (STAT_ATM = 1)
			{
				DEV_STATUS := DEV_STATUS ", "
			}
			DEV_STATUS := DEV_STATUS "bill breaking functionality"
		}
		if (STAT_REDEMPTION = 1) ; Redemption
		{
			if (STAT_ATM = 1 or STAT_BREAK = 1)
			{
				DEV_STATUS := DEV_STATUS ", "
			}
			DEV_STATUS := DEV_STATUS "ticket redemption functionality"
		}
		
		if (STAT_DOWN = 0 and SVC_TYPE = "EGM") ; Up
		{
			DEV_STATUS := DEV_STATUS "is currently up and functional"
		}
		
		DEV_STATUS := DEV_STATUS ", "
		
		; DEVICE ISSUE TYPE
		if (STAT_DOWN = 1) ; Down
		{
			ISSUE_TYPE := "and has a "
		}
		if (STAT_DOWN = 0) ; Up
		{		
			ISSUE_TYPE := "however it has a "
		}
		
		if (ISSUE_HARDWARE = 1) ; Down
		{
			ISSUE_TYPE := ISSUE_TYPE "hardware "
		}
		if (ISSUE_SOFTWARE = 1) ; Down
		{
			ISSUE_TYPE := ISSUE_TYPE "software "
		}
		if (ISSUE_CONNECTIVITY = 1) ; Down
		{
			ISSUE_TYPE := ISSUE_TYPE "connectivity "
		}
		ISSUE_TYPE := ISSUE_TYPE "issue. "
		
		; ROUTER STATUS
		DEV_ROUTER_STATUS := 
		if (ISSUE_CONNECTIVITY = 1) ; Down
		{ 
			DEV_ROUTER_STATUS := "Device "
			if (IN_ROUTER_NO = 1) ; Down
			{
				DEV_ROUTER_STATUS := DEV_ROUTER_STATUS "does not "
			}
			if (IN_ROUTER_YES = 1) ; Down
			{
				DEV_ROUTER_STATUS := DEV_ROUTER_STATUS "does "
			}
			if (IN_ROUTER_NO = 0 and IN_ROUTER_YES = 0) ; Down
			{
				DEV_ROUTER_STATUS := "It is unknown if device shows in router. "
			}
			else
			{
				DEV_ROUTER_STATUS := DEV_ROUTER_STATUS "show in router. "
			}
		}
		
		; SITE TROUBLESHOOTING
		SITE_TS_DESC :=
		if (SITE_TS != "")
		{
			SITE_TS_DESC := "SITE TROUBLESHOOTING:`r`n" SITE_TS
		}
		
		; PROVIEW ERRORS
		PV_ERRORS_DESC :=
		if (PV_ERRORS != "")
		{
			PV_ERRORS_DESC := "PROVIEW ERRORS:`r`n" PV_ERRORS
		}
		
		; RESOLUTION
		RESOLUTION_DESC :=
		if (RESOLUTION != "")
		{
			RESOLUTION_DESC := "RESOLUTION-NOTES:`r`n" RESOLUTION
		}
		
		; CASE DESCRIPTION
		CASE_DESC := 
		
		;	if (UNAME != "")
		;	{
		;		CASE_DESC := CASE_DESC "CONTACT NAME: " . UNAME "`r`n"
		;	}
		;	
		;	if (UEMAIL != "")
		;	{
		;		CASE_DESC := CASE_DESC "CONTACT EMAIL: " . UEMAIL "`r`n"
		;	}
        ;	
		;	if (UPHONE != "")
		;	{
		;		CASE_DESC := CASE_DESC "CONTACT PHONE: " . UPHONE "`r`n"
		;	}
        ;	
		;	if (UNAME OR UPHONE != "")
		;	{
		;		CASE_DESC := CASE_DESC "`r`n"
		;	}
		
		if (DISPATCH != "")
		{
			CASE_DESC := CASE_DESC . DISPATCH "`r`n"
		}
		
		; ISSUE DESCRIPTION
		ISSUE_DESC :=
		if (SVC_TYPE="ATM" or SVC_TYPE="FSK" or SVC_TYPE="JXC")
		{
			if (TID != "")
			{
				if (DESC_ISSUE != "")
				{
					ISSUE_DESC := "ISSUE: " TID ", " DEV_STATUS . ISSUE_TYPE . DEV_ROUTER_STATUS . DESC_ISSUE
				}
			}
			else if (DESC_ISSUE != "")
			{
				ISSUE_DESC := "ISSUE: " DEV_STATUS . ISSUE_TYPE . DEV_ROUTER_STATUS . DESC_ISSUE
			}
		}
		
		if (SVC_TYPE="EGM")
		{
			
			if (GAMENAME != "")
			{
				if (DESC_ISSUE != "")
				{
					ISSUE_DESC := "ISSUE: " GAMENAME ", " DEV_STATUS . ISSUE_TYPE . DEV_ROUTER_STATUS . DESC_ISSUE
				}
			}
			else if (DESC_ISSUE != "")
			{
				ISSUE_DESC := "ISSUE: " DEV_STATUS . ISSUE_TYPE . DEV_ROUTER_STATUS . DESC_ISSUE
			}
			
			EGM_DETAILS :=
			if (GAMENAME != "")
			{
				if (EGM_DETAILS != "")
				{
					EGM_DETAILS := EGM_DETAILS "`r`n"
				}
				EGM_DETAILS := EGM_DETAILS "GAME: " GAMENAME
			}
			if (SERIALNUM != "")
			{
				if (EGM_DETAILS != "")
				{
					EGM_DETAILS := EGM_DETAILS "`r`n"
				}
				EGM_DETAILS := EGM_DETAILS . "SERIAL#: " . SERIALNUM
			}
			if (ASSETNUM != "")
			{
				if (EGM_DETAILS != "")
				{
					EGM_DETAILS := EGM_DETAILS "`r`n"
				}
				EGM_DETAILS := EGM_DETAILS . "ASSET#: " . ASSETNUM
			}
			if (LOCATION != "")
			{
				if (EGM_DETAILS != "")
				{
					EGM_DETAILS := EGM_DETAILS "`r`n"
				}
				EGM_DETAILS := EGM_DETAILS . "LOCATION: " . LOCATION
			}
			
			if (EGM_DETAILS != "")
			{
				ISSUE_DESC := ISSUE_DESC "`r`n`r`n" EGM_DETAILS
			}
			
		}
		
		CASE_DESC := CASE_DESC . ISSUE_DESC
		
		; ADDITIONAL NOTES
		if (SITE_TS_DESC != "")
		{
			CASE_DESC := CASE_DESC "`r`n`r`n" SITE_TS_DESC
		}
		if (PV_ERRORS_DESC != "")
		{
			CASE_DESC := CASE_DESC "`r`n`r`n" PV_ERRORS_DESC
		}
		if (RESOLUTION_DESC != "")
		{
			CASE_DESC := CASE_DESC "`r`n`r`n" RESOLUTION_DESC
		}
		CASE_DESC := RegExReplace(CASE_DESC, "`r`n", "`n")
		CASE_DESC := RegExReplace(CASE_DESC, "`n", "`r`n")
		
		return
	}
}

