
#include <GUIConstantsEx.au3>
#include <GUIScrollbars_Ex.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

#include <array.au3>

#include<SF2XCommands.au3>

; ----------------------------------------------------------------
;                      Création de la GUI 
; ----------------------------------------------------------------

$mainGUI = GUICreate("Randomizer", 330 , 400, -1, -1, Default, $WS_EX_TOPMOST)
_GUIScrollbars_Generate($mainGUI, 0, 2650)

Opt("GUIOnEventMode", 1)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSE")

$neutre = GUICtrlCreateRadio ( "Neutral", 60, 5)
$gardeHaute = GUICtrlCreateRadio ( "Blocking up", 180, 5)
$gardeBasse = GUICtrlCreateRadio ( "Blocking low", 60, 25)

$min = GUICtrlCreateInput ( "", 70, 2505, 30, 30, $ES_NUMBER)
$max = GUICtrlCreateInput ( "", 120, 2505, 30, 30, $ES_NUMBER)

$jumpAttackFrames = GUICtrlCreateInput ( "", 70, 2590, 30, 30, $ES_NUMBER)

; ------------------ Disposition des checkboxes --------------------------
; première colonne : 70 à gauche; deuxième colonne : 200 à gauche 
; espace entre le titre et les cases : 25 / espace entre les sections : 30
;--------------------------------------------------------------------------

global $checkboxes[100]


GUICtrlCreateLabel ( "Stand", 70, 55)
For $i = 0 to 2 ;st.P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 80 + (20*$i))
Next
local $c = 0
For $i = 3 to 5 ;st.K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 80 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Crouch", 70, 150)
$c = 0
For $i = 6 to 8 ;cr.P
	$checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 175 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 9 to 11 ;cr.K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 175 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Jump", 70, 245)
$c = 0
For $i = 12 to 14 ;j.P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 270 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 15 to 17 ;j.K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 270 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "QCF", 70, 340)
$c = 0
For $i = 18 to 20 ;QCF P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70,  365 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 21 to 23 ; QCF K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 365 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "QCB", 70, 435)
$c = 0
For $i = 24 to 26 ; QCB K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 460 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "HCF", 70, 530)
$c = 0
For $i = 27 to 29 ; HCF P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 555 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 30 to 32 ; HCF K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 555 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Dragon", 70, 625)
$c = 0
For $i = 33 to 35 ; DP P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 650 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 36 to 38 ; DP K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 650 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Flame Kick", 70, 720)
$c = 0
For $i = 39 to 41 ; Flame Kick
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 745 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Tiger Knee", 70, 815)
$c = 0
For $i = 42 to 44 ; TK K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 840 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Charge horizontale", 70, 910)
$c = 0
For $i = 45 to 47 ; Charge Horizontale P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 935 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 48 to 50 ; Charge Horizontale K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 935 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Charge verticale", 70, 1005)
$c = 0
For $i = 51 to 53 ; Charge Verticale P
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1030 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 54 to 56 ; Charge Verticale K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 1030 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Super QCF", 70, 1100)
$c = 0
For $i = 57 to 58 ; Super QCF
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1125 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Super charge horizontale", 70, 1175)
$c = 0
For $i = 59 to 60 ; Super à charge
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1200 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Super chara spé", 70, 1250)
$c = 0
$checkboxes[61] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1275 + (20*$c)) ; Super dhalsim
$checkboxes[94] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1295 + (20*$c)) ; Super Guile

GUICtrlCreateLabel ( "Spéciaux chara spé", 70, 1325)
$c = 0
For $i = 62 to 63 ; 3P3K
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1350+ (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Blanka", 70, 1400)
$c = 0
For $i = 64 to 65 ; Dash
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1425 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Boxer", 70, 1475)
$c = 0
For $i = 66 to 67 ; Dash Upper et TAP
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1500 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 95 to 97 ; Dash Low
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1540 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Dhalsim", 70, 1610)
$c = 0
For $i = 68 to 69 ; TP 
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1635 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Cammy", 70, 1685)
$c = 0
$checkboxes[70] = GUICtrlCreateCheckbox("Checkbox" & 70, 70, 1710 + (20*$c)) ; Hooligan

GUICtrlCreateLabel ( "Hawk", 70, 1740)
$checkboxes[71] = GUICtrlCreateCheckbox("Checkbox" & 71, 70, 1765 + (20*$c)) ; Condor Dive

GUICtrlCreateLabel ( "Zangief", 70, 1795)
$checkboxes[72] = GUICtrlCreateCheckbox("Checkbox" & 72, 70, 1820 + (20*$c)) ; Main verte


GUICtrlCreateLabel ( "Command moves", 70, 1850)

GUICtrlCreateLabel ( "Blanka", 70, 1880)
$checkboxes[73] = GUICtrlCreateCheckbox("Checkbox" & 72, 70, 1905 + (20*$c)) ; Slide

GUICtrlCreateLabel ( "Dhalsim", 70, 1935)
GUICtrlCreateLabel ( "Stand", 70, 1965)
$c = 0
For $i = 74 to 76 ; st. punch
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 1990 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 77 to 79 ; st.kick
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 1990 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Crouch", 70, 2060)
$c = 0
For $i = 80 to 82 ; cr.punch
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 2085 + (20*$c))
	$c += 1
Next
$c = 0
For $i = 83 to 85 ; cr.kick
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 200, 2085 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Drills", 70, 2155)
$c = 0
For $i = 86 to 89 ; Drills
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 2180 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Guile", 70, 2270)
$c = 0
For $i = 90 to 91 ; Knee Bazooka / Forward kick
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 2295 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Ryu", 70, 2345)
$c = 0
For $i = 92 to 93 ; Overhead / Solar Plexus
    $checkboxes[$i] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 2370 + (20*$c))
	$c += 1
Next

GUICtrlCreateLabel ( "Misc", 70, 2420)
$c = 0
$checkboxes[99] = GUICtrlCreateCheckbox("Checkbox" & $i+1, 70, 2445 + (20*$c)) ; Fake Hadoken

GUICtrlCreateLabel ( "Intervalle entres les coups : min - max (en frames)", 70, 2480)

GUICtrlCreateLabel ( "Intervalle entres un saut et son coup (en frames)", 70, 2565)

GUICtrlSetState ($neutre,$GUI_CHECKED) ; Place la garde sur neutre

;--------------------------------------------
;		Etiquettage des checkboxes  
;--------------------------------------------

;-------------- Normaux -----------------

GUICtrlSetData($checkboxes[0], "lp")
GUICtrlSetData($checkboxes[1], "mp")
GUICtrlSetData($checkboxes[2], "hp")

GUICtrlSetData($checkboxes[3], "lk")
GUICtrlSetData($checkboxes[4], "mk")
GUICtrlSetData($checkboxes[5], "hk")

GUICtrlSetData($checkboxes[6], "lp")
GUICtrlSetData($checkboxes[7], "mp")
GUICtrlSetData($checkboxes[8], "hp")

GUICtrlSetData($checkboxes[9], "lk")
GUICtrlSetData($checkboxes[10],"mk")
GUICtrlSetData($checkboxes[11],"hk")

GUICtrlSetData($checkboxes[12], "lp")
GUICtrlSetData($checkboxes[13], "mp")
GUICtrlSetData($checkboxes[14], "hp")

GUICtrlSetData($checkboxes[15], "lk")
GUICtrlSetData($checkboxes[16], "mk")
GUICtrlSetData($checkboxes[17], "hk")


;------------ Spéciaux à quarts de cercle --------------


GUICtrlSetData($checkboxes[18], "lp")
GUICtrlSetData($checkboxes[19], "mp")
GUICtrlSetData($checkboxes[20], "hp")

GUICtrlSetData($checkboxes[21], "lk")
GUICtrlSetData($checkboxes[22], "mk")
GUICtrlSetData($checkboxes[23], "hk")

GUICtrlSetData($checkboxes[24], "lk")
GUICtrlSetData($checkboxes[25], "mk")
GUICtrlSetData($checkboxes[26], "hk")

GUICtrlSetData($checkboxes[27], "lp")
GUICtrlSetData($checkboxes[28], "mp")
GUICtrlSetData($checkboxes[29], "hp")

GUICtrlSetData($checkboxes[30], "lk")
GUICtrlSetData($checkboxes[31], "mk")
GUICtrlSetData($checkboxes[32], "hk")


GUICtrlSetData($checkboxes[33], "lp")
GUICtrlSetData($checkboxes[34], "mp")
GUICtrlSetData($checkboxes[35], "hp")

GUICtrlSetData($checkboxes[36], "lk")
GUICtrlSetData($checkboxes[37], "mk")
GUICtrlSetData($checkboxes[38], "hk")

GUICtrlSetData($checkboxes[39], "lk")
GUICtrlSetData($checkboxes[40], "mk")
GUICtrlSetData($checkboxes[41], "hk")


GUICtrlSetData($checkboxes[42], "lk")
GUICtrlSetData($checkboxes[43], "mk")
GUICtrlSetData($checkboxes[44], "hk")

;--------------- Spéciaux à charge --------------

GUICtrlSetData($checkboxes[45], "lp")
GUICtrlSetData($checkboxes[46], "mp")
GUICtrlSetData($checkboxes[47], "hp")

GUICtrlSetData($checkboxes[48], "lk")
GUICtrlSetData($checkboxes[49], "mk")
GUICtrlSetData($checkboxes[50], "hk")


GUICtrlSetData($checkboxes[51], "lp")
GUICtrlSetData($checkboxes[52], "mp")
GUICtrlSetData($checkboxes[53], "hp")

GUICtrlSetData($checkboxes[54], "lk")
GUICtrlSetData($checkboxes[55], "mk")
GUICtrlSetData($checkboxes[56], "hk")

;-------------------  Supers ---------------------------

GUICtrlSetData($checkboxes[57], "Punch")
GUICtrlSetData($checkboxes[58], "Kick")


GUICtrlSetData($checkboxes[59], "Punch")
GUICtrlSetData($checkboxes[60], "Kick")


GUICtrlSetData($checkboxes[61], "Dhalsim")

;-------------------- Spéciaux spécifiques ------------

GUICtrlSetData($checkboxes[62], "3P")
GUICtrlSetData($checkboxes[63], "3K")

GUICtrlSetData($checkboxes[64], "F Dash")
GUICtrlSetData($checkboxes[65], "B Dash")

GUICtrlSetData($checkboxes[66], "Upper Rush")
GUICtrlSetData($checkboxes[67], "TAP")

GUICtrlSetData($checkboxes[68], "TP 3P")
GUICtrlSetData($checkboxes[69], "TP 3K")

GUICtrlSetData($checkboxes[70], "Hooligan")

GUICtrlSetData($checkboxes[71], "Condor dive")

GUICtrlSetData($checkboxes[72], "Main verte")


;--------------------- Command Moves ------------------

GUICtrlSetData($checkboxes[73], "Slide")


GUICtrlSetData($checkboxes[74], "lp")
GUICtrlSetData($checkboxes[75], "mp")
GUICtrlSetData($checkboxes[76], "hp")
GUICtrlSetData($checkboxes[77], "lk")
GUICtrlSetData($checkboxes[78], "mk")
GUICtrlSetData($checkboxes[79], "hk")

GUICtrlSetData($checkboxes[80], "lp")
GUICtrlSetData($checkboxes[81], "mp")
GUICtrlSetData($checkboxes[82], "hp")
GUICtrlSetData($checkboxes[83], "lk")
GUICtrlSetData($checkboxes[84], "mk")
GUICtrlSetData($checkboxes[85], "hk")

GUICtrlSetData($checkboxes[86], "hp")
GUICtrlSetData($checkboxes[87], "lk")
GUICtrlSetData($checkboxes[88], "mk")
GUICtrlSetData($checkboxes[89], "hk")

GUICtrlSetData($checkboxes[90], "Knee lk")
GUICtrlSetData($checkboxes[91], "Forward kick")

GUICtrlSetData($checkboxes[92], "Overhead")
GUICtrlSetData($checkboxes[93], "Solar plexus")

;--------------- Misc ------------------

GUICtrlSetData($checkboxes[99], "Fake Hado")


;----------- Les oubliés ---------------
GUICtrlSetData($checkboxes[94], "Guile")
GUICtrlSetData($checkboxes[95], "Dash Low lp")
GUICtrlSetData($checkboxes[96], "Dash Low mp")
GUICtrlSetData($checkboxes[97], "Dash Low hp")


;------------------------------------------------------
;                 		  Main 
;------------------------------------------------------

; ------------------ Variables ------------------------
; La portée est un peu aléatoire
; il y a très certainement des erreurs
; -----------------------------------------------------

Global $nMSG 
Global $nbCheckboxed
Global $walkBackard = 0
Global $clearCheckboxes = 0

Local  $r
Local  $minFrames
Local  $maxFrames
Local  $sautFrames
Local  $gardeChoisie

; ------------------- Hotkeys -------------------------

HotKeySet($back, "WalkBackwardP2HotKey")
HotKeySet($clear, "ClearCheckboxesHotKey") ;Actuellement, à cause du WinWaitActive, les checkboxes ne sont vidées qu'après avoir recliqué sur la fenêtre de fightcade. Trouver une solution à terme 

GUISetState(@SW_SHOW)


; ---------------- Boucle principale -------------------

While $nMSG <> $GUI_EVENT_CLOSE ; J'ai eu divers problèmes pour fermer la GUI. J'ai rajouté le OnEventMode et ce While qui sont certainement redondant mais dans le doute... au moins ça marche

	$nMSG = GUIgetMSg()

	WinWaitActive("[CLASS:FinalBurn Neo]")
	
	$minFrames = GUICtrlRead($min)
	$maxFrames = GUICtrlRead($max)
	
	If $minFrames = 0 Then ; à corriger pour que le test soit plutôt if $minFrames = blank, mais c'est un détail
		$minFrames = 60
	EndIf
	If $maxFrames = 0 Then ; pareil, à corriger
		$maxFrames = 300
	EndIf
	If $minFrames > $maxFrames Then
		$minFrames = 60
		$maxFrames = 300
	EndIf 
	
	$sautFrames = GUICtrlRead($jumpAttackFrames) ; Paramètre le nombre de frames entre le saut et l'attaque
	
	If $sautFrames = 0 Then 
		$sautFrames = 24
	EndIf
	
	If _IsChecked($neutre) Then ; paramètre la garde
		Release()
		waitRandomNeutral($minFrames, $maxFrames)
		$gardeChoisie = 1 ;Indique qu'il faut passer en position crouch pour les coups à charge horizontaux
	ElseIf _IsChecked($gardeHaute) Then
		Release()
		waitRandomBlocking($minFrames, $maxFrames)
		$gardeChoisie = 0 ; indique qu'il suffit de maintenir arrière pour les coups à charge horizontaux
	ElseIf _IsChecked($gardeBasse) Then
		waitRandomBlockingLowNoRelease($minFrames, $maxFrames) ; Cette fonction maintient la garde basse jusqu'à ce que la fonction Release() soit appelée. J'avais d'abord écrit une fonction appelée waitRandomBlockingLow qui enlevait la garde à la fin de son exécution mais cela créeait 1 ou 2 frames pendant lesquelles le personnage se relevait avant qu'un coup, même low, ne soit exécuté. Ma solution n'est pas forcément très élégante mais c'est la seule que j'ai trouvée pour l'instant
		$gardeChoisie = 1
	Endif 
	
	Local $optionCheckboxed[99]
	$nbCheckboxed = -1 ; Compte le nombre de coups choisis

	For $i = 0 to 99 ;Place dans un tableau les coups choisis
		If GuiCtrlRead($checkboxes[$i]) = $GUI_CHECKED Then
		$nbCheckboxed += 1
		$optionCheckboxed[$nbCheckboxed] = $checkboxes[$i]
		Endif
	Next

	If $nbCheckboxed = 0 Then ; Une seule option choisie	
		Randomizer($optionCheckboxed[0])
	ElseIf $nbCheckboxed > 0 Then ; Plusieurs options choisies
		$r = Random(0, $nbCheckboxed, 1)
		Randomizer($optionCheckboxed[$r])
	EndIf
	
	If $walkBackard = 1 Then
		Release()
		WalkBackwardP2(100)
		$walkBackard = 0
	EndIf
	
	If $clearCheckboxes = 1 Then
		ClearCheckboxes()
		$clearCheckboxes = 0
	EndIf

	$optionCheckboxed = 0 ; Ligne censée vider le tableau, mais peut-être pas essentielle ? la déclaration dans la boucle le fait peut-être déjà, je m'y connais trop peu
WEnd


;--------------------------------------------------------
;					Fonctions 
;--------------------------------------------------------

Func Randomizer($option)

	Switch $option
	
	;--------------- Normaux ---------------------
	
		Case $checkboxes[0]
		Release()
		oneFrameInput($LP)
		Case $checkboxes[1]
		Release()
		oneFrameInput($MP)
		Case $checkboxes[2]
		Release()
		oneFrameInput($HP)
		Case $checkboxes[3]
		Release()
		oneFrameInput($LK)
		Case $checkboxes[4]
		Release()
		oneFrameInput($MK)
		Case $checkboxes[5]
		Release()
		oneFrameInput($HK)
			
		Case $checkboxes[6]
		crouchAttackNoRelease($LP)
		Case $checkboxes[7]
		crouchAttackNoRelease($MP)
		Case $checkboxes[8]
		crouchAttackNoRelease($HP)
		Case $checkboxes[9]
		crouchAttackNoRelease($LK)
		Case $checkboxes[10]
		crouchAttackNoRelease($MK)
		Case $checkboxes[11]
		crouchAttackNoRelease($HK)
		
		Case $checkboxes[12]
		Release()
		JumpAttackP2($LP, $sautFrames)
		BackToP2Side()
		Case $checkboxes[13]
		Release()
		JumpAttackP2($MP, $sautFrames)
		BackToP2Side()
		Case $checkboxes[14]
		Release()
		JumpAttackP2($HP, $sautFrames)
		BackToP2Side()
		Case $checkboxes[15]
		Release()
		JumpAttackP2($LK, $sautFrames)
		BackToP2Side()
		Case $checkboxes[16]
		Release()
		JumpAttackP2($MK, $sautFrames)
		BackToP2Side()
		Case $checkboxes[17]
		Release()
		JumpAttackP2($HK, $sautFrames)
		BackToP2Side()
		
	;--------------- Spéciaux quarts de cercle / DP -------------------
	
		Case $checkboxes[18]
		Release()
		HadokenP2($LP)
		Case $checkboxes[19]
		Release()
		HadokenP2($MP)
		Case $checkboxes[20]
		Release()
		HadokenP2($HP)

		Case $checkboxes[21]
		Release()
		HadokenP2($LK)
		Case $checkboxes[22]
		Release()
		HadokenP2($MK)
		Case $checkboxes[23]
		Release()
		HadokenP2($HK)

		Case $checkboxes[24]
		Release()
		HadokenP1($LK)
		Case $checkboxes[25]
		Release()
		HadokenP1($MK)
		Case $checkboxes[26]
		Release()
		HadokenP1($HK)

		Case $checkboxes[27]
		Release()
		HalfCircleForwardP2($LP)
		Case $checkboxes[28]
		Release()
		HalfCircleForwardP2($MP)
		Case $checkboxes[29]
		Release()
		HalfCircleForwardP2($HP)

		Case $checkboxes[30]
		Release()
		HalfCircleForwardP2($LK)
		Case $checkboxes[31]
		Release()
		HalfCircleForwardP2($MK)
		Case $checkboxes[32]
		Release()
		HalfCircleForwardP2($HK)


		Case $checkboxes[33]
		Release()
		ShoryukenP2($LP)
		Case $checkboxes[34]
		Release()
		ShoryukenP2($MP)
		Case $checkboxes[35]
		Release()
		ShoryukenP2($HP)

		Case $checkboxes[36]
		Release()
		ShoryukenP2($LK)
		Case $checkboxes[37]
		Release()
		ShoryukenP2($MK)
		Case $checkboxes[38]
		Release()
		ShoryukenP2($HK)

		Case $checkboxes[39]
		Release()
		ShoryukenP1($LK)
		Case $checkboxes[40]
		Release()
		ShoryukenP1($MK)
		Case $checkboxes[41]
		Release()
		ShoryukenP1($HK)


		Case $checkboxes[42]
		Release()
		TigerKneeP2($LK)
		Case $checkboxes[43]
		Release()
		TigerKneeP2($MK)
		Case $checkboxes[44]
		Release()
		TigerKneeP2($HK)
		
		;--------------- Spéciaux à charge --------------

		Case $checkboxes[45]
		ChargeHorizontaleP2($LP, $gardeChoisie)
		Case $checkboxes[46]
		ChargeHorizontaleP2($MP, $gardeChoisie)
		Case $checkboxes[47]
		ChargeHorizontaleP2($HP, $gardeChoisie)

		Case $checkboxes[48]
		ChargeHorizontaleP2($LK, $gardeChoisie)
		Case $checkboxes[49]
		ChargeHorizontaleP2($MK, $gardeChoisie)
		Case $checkboxes[50]
		ChargeHorizontaleP2($HK, $gardeChoisie)
		

		Case $checkboxes[51]
		ChargeVerticaleP2($LP)
		Case $checkboxes[52]
		ChargeVerticaleP2($MP)
		Case $checkboxes[53]
		ChargeVerticaleP2($HP)

		Case $checkboxes[54]
		ChargeVerticaleP2($LK)
		Case $checkboxes[55]
		ChargeVerticaleP2($MK)
		Case $checkboxes[56]
		ChargeVerticaleP2($HK)

;-------------------  Supers ---------------------------

		Case $checkboxes[57]
		Release()
		SuperQuartDeCercleP2($LP)
		Case $checkboxes[58]
		Release()
		SuperQuartDeCercleP2($LK)


		Case $checkboxes[59]
		SuperChargeHorizontaleP2($LP, $gardeChoisie)
		Case $checkboxes[60]
		SuperChargeHorizontaleP2($LK, $gardeChoisie)

		Case $checkboxes[61] ; "Super Dhalsim"
		Release()
		inputHold($RIGHT)
		waitFrames(2)
		inputHold($DOWN)
		waitFrames(2)
		inputRelease($RIGHT)
		waitFrames(2)
		inputHold($LEFT)
		waitFrames(2)
		inputRelease($DOWN)
		waitFrames(2)
		inputRelease($LEFT)
		waitFrames(2)
		inputHold($RIGHT)
		waitFrames(2)
		inputHold($DOWN)
		waitFrames(2)
		inputRelease($RIGHT)
		waitFrames(2)
		inputHold($LEFT)
		waitFrames(2)
		inputRelease($DOWN)
		waitFrames(2)
		InputHold($LP)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($LP)
		
		Case $checkboxes[94] ;"Guile Super"
		SuperChargeVerticaleP2($LK)
	
;-------------------- Spéciaux spécifiques ------------

		Case $checkboxes[62]
		Release()
		input3P(2)
		Case $checkboxes[63]
		Release()
		input3K(2)

		Case $checkboxes[64]
		Release()
		inputHold($LEFT)
		input3K(2)
		inputRelease($LEFT)
		Case $checkboxes[65]
		Release()
		inputHold($RIGHT)
		input3K(2)
		inputRelease($RIGHT)

		Case $checkboxes[66]
		If $gardeChoisie = 1 Then
		inputHold($DOWN)
		Endif
		inputHold($RIGHT)
		waitFrames(80)
		inputRelease($RIGHT)
		inputHold($DOWN)
		inputHold($LEFT)
		waitFrames(2)
		inputHold($LK)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($DOWN)
		inputRelease($LK)
		
		Case $checkboxes[95] ; "Boxer Ground Straight Rush lp"
		If $gardeChoisie = 1 Then
		inputHold($DOWN)
		Endif
		inputHold($RIGHT)
		waitFrames(80)
		inputRelease($RIGHT)
		inputHold($DOWN)
		inputHold($LEFT)
		waitFrames(2)
		inputHold($LP)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($DOWN)
		inputRelease($LP)
		Case $checkboxes[96] ; "Boxer Ground Straight Rush mp"
		If $gardeChoisie = 1 Then
		inputHold($DOWN)
		Endif
		inputHold($RIGHT)
		waitFrames(80)
		inputRelease($RIGHT)
		inputHold($DOWN)
		inputHold($LEFT)
		waitFrames(2)
		inputHold($MP)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($DOWN)
		inputRelease($MP)
		Case $checkboxes[97] ; "Boxer Ground Straight Rush hp"
		If $gardeChoisie = 1 Then
		inputHold($DOWN)
		Endif
		inputHold($RIGHT)
		waitFrames(80)
		inputRelease($RIGHT)
		inputHold($DOWN)
		inputHold($LEFT)
		waitFrames(2)
		inputHold($HP)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($DOWN)
		inputRelease($HP)
		
		Case $checkboxes[67] ; Boxer TAP
		input3K(40)
		
		Case $checkboxes[68] ; TP Dhalsim
		Release()
		inputHold($RIGHT)
		waitFrames(2)
		inputRelease($RIGHT)
		inputHold($DOWN)
		waitFrames(1)
		inputHold($RIGHT)
		waitFrames(1)
		input3P(1)
		inputRelease($RIGHT)
		inputRelease($DOWN)
		Case $checkboxes[69]
		Release()
		inputHold($RIGHT)
		waitFrames(2)
		inputRelease($RIGHT)
		inputHold($DOWN)
		waitFrames(1)
		inputHold($RIGHT)
		waitFrames(1)
		input3K(1)
		inputRelease($RIGHT)
		inputRelease($DOWN)

		Case $checkboxes[70]
		Release()
		inputHold($RIGHT)
		waitFrames(2)
		inputRelease($RIGHT)
		inputHold($DOWN)
		waitFrames(2)
		inputHold($LEFT)
		waitFrames(2)
		inputRelease($DOWN)
		inputHold($UP)
		waitFrames(2)
		InputHold($HP)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($UP)
		inputRelease($HP)
		waitFrames(25)
		inputHold($LEFT)
		inputHold($HK)
		waitFrames(2)
		inputRelease($LEFT)
		inputRelease($HK)

		Case $checkboxes[71]
		Release()
		ForwardJumpP2()
		waitFrames($sautFrames)
		input3P(1)
		
		Case $checkboxes[72]
		Release()
		inputHold($LEFT)
		waitFrames(2)
		inputHold($DOWN)
		waitFrames(2)
		inputRelease($LEFT)
		waitFrames(2)
		inputHold($LP)
		waitFrames(2)
		inputRelease($DOWN)
		inputRelease($LP)

;--------------------- Command Moves ------------------

		Case $checkboxes[73] ; Blanka slide
		Release()
		inputHold($LEFT)
		inputHold($DOWN)
		oneFrameInput($HP)
		inputRelease($LEFT)
		inputRelease($DOWN)


		Case $checkboxes[74] ; Dhalsim command moves
		Release()
		inputHold($RIGHT)
		oneFrameInput($LP)
		inputRelease($RIGHT)
		Case $checkboxes[75]
		Release()
		inputHold($RIGHT)
		oneFrameInput($MP)
		inputRelease($RIGHT)
		Case $checkboxes[76]
		Release()
		inputHold($RIGHT)
		oneFrameInput($HP)
		inputRelease($RIGHT)
		Case $checkboxes[77]
		Release()
		inputHold($LEFT)
		oneFrameInput($LK)
		inputRelease($RIGHT)
		Case $checkboxes[78]
		Release()
		inputHold($RIGHT)
		oneFrameInput($MK)
		inputRelease($RIGHT)
		Case $checkboxes[79]
		Release()
		inputHold($RIGHT)
		oneFrameInput($HK)
		inputRelease($RIGHT)

		Case $checkboxes[80] ; Il s'agit en fait des normaux crouch de Dhalsim (la version ""far""). Utiliser crouchAttackNoRelease() plus haut m'oblige à inverser les normaux et les command moves de Dhalsim dans ce cas précis
		Release()
		crouchAttack($LP)
		Case $checkboxes[81]
		Release()
		crouchAttack($MP)
		Case $checkboxes[82]
		Release()
		crouchAttack($HP)
		Case $checkboxes[83]
		Release()
		crouchAttack($LK)
		Case $checkboxes[84]
		Release()
		crouchAttack($MK)
		Case $checkboxes[85]
		Release()
		crouchAttack($HK)

		Case $checkboxes[86] ; Drills
		Release()
		ForwardJumpP2()
		waitFrames($sautFrames)
		inputHold($DOWN)
		oneFrameInput($HP)
		inputRelease($DOWN)
		Case $checkboxes[87]
		Release()
		ForwardJumpP2()
		waitFrames($sautFrames)
		inputHold($DOWN)
		oneFrameInput($LK)
		inputRelease($DOWN)
		Case $checkboxes[88]
		Release()
		ForwardJumpP2()
		waitFrames($sautFrames)
		inputHold($DOWN)
		oneFrameInput($MK)
		inputRelease($DOWN)
		Case $checkboxes[89]
		Release()
		ForwardJumpP2()
		waitFrames($sautFrames)
		inputHold($DOWN)
		oneFrameInput($HK)
		inputRelease($DOWN)

		Case $checkboxes[90] ; Knee Bazooka Guile
		Release()
		inputHold($RIGHT)
		oneFrameInput($LK)
		inputRelease($RIGHT)
		Case $checkboxes[91] ; Forward kick
		Release()
		inputHold($LEFT)
		oneFrameInput($MK)
		inputRelease($LEFT)

		Case $checkboxes[92] ;Overhead Ryu
		Release()
		inputHold($LEFT)
		oneFrameInput($MP)
		inputRelease($LEFT)
		Case $checkboxes[93] ; Solar Plexus
		Release()
		inputHold($LEFT)
		oneFrameInput($HP)
		inputRelease($LEFT)
		
		
	;------------ Misc -------------
	
		Case $checkboxes[99] ;Fake Hadoken
		Release()
		inputHold($DOWN)
		inputHold($RIGHT)
		waitFrames(4)
		inputRelease($DOWN)
		inputRelease($RIGHT)
			Case Else
		EndSwitch
	
EndFunc

Func waitRandomBlockingLowNoRelease($min, $max) ; wait x frames while holding down-back
Local $interval = Random ($min*16.7, $max*16.7, 1)
inputHold($RIGHT)
inputHold($DOWN)
Sleep($interval)
EndFunc

Func CrouchAttackNoRelease($inputFinal)
inputHold($DOWN)
inputHold($RIGHT)
oneFrameInput($inputFinal)
EndFunc

Func Release()
inputRelease($RIGHT)
inputRelease($DOWN)
EndFunc

Func BackToP2Side()
	waitFrames(50)
	BackwardJumpP2()
	WalkBackwardP2(60)
EndFunc

Func WalkBackwardP2HotKey()
	$walkBackard = 1
EndFunc

Func ClearCheckboxes()
for $i = 0 to 99
GUICtrlSetState ($checkboxes[$i],$GUI_UNCHECKED)
Next
EndFunc

Func ClearCheckboxesHotKey()
	$clearCheckboxes = 1
EndFunc


Func CLOSE()
Exit
EndFunc

Func _IsChecked($idControlID) ; Reprise à une ancienne version mais certainement dispensable
    Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc