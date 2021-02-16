#include<mapInput.au3>

;--------- Basic inputs ------------

Func oneFrameInput($key)
	inputHold($key)
	waitFrames(1)
	inputRelease($key)
EndFunc

Func inputHold($key)
	Send("{" & $key & " down}");
EndFunc

Func inputRelease($key)
	Send("{" & $key & " up}");
EndFunc

Func input3P($frames)
inputHold($LP)
inputHold($MP)
inputHold($HP)
waitFrames($Frames)
inputRelease($LP)
inputRelease($MP)
inputRelease($HP)
EndFunc

Func input3K($frames)
inputHold($LK)
inputHold($MK)
inputHold($HK)
waitFrames($Frames)
inputRelease($LK)
inputRelease($MK)
inputRelease($HK)
EndFunc

;---------- Wait --------------------

Func waitFrames($nb)
	Sleep(16.7 * $nb)
EndFunc
;1000, 5000
Func waitRandomNeutral($min, $max) ; wait x frames, x being randomized
Local $interval = Random ($min*16.7, $max*16.7, 1)
Sleep($interval)
EndFunc 

Func waitRandomBlocking($min, $max) ; wait x frames while holding backward
Local $interval = Random ($min*16.7, $max*16.7, 1)
inputHold($RIGHT)
Sleep($interval)
inputRelease($RIGHT)
EndFunc

Func waitRandomBlockingLow($min, $max) ; wait x frames while holding down-back
Local $interval = Random ($min*16.7, $max*16.7, 1)
inputHold($RIGHT)
inputHold($DOWN)
Sleep($interval)
inputRelease($RIGHT)
inputRelease($DOWN)
EndFunc

;------------------- Déplacements ---------------------

Func WalkForwardP2($NbFrames)

	InputHold($LEFT)
	waitFrames($NbFrames)
	inputRelease($LEFT)

EndFunc

Func WalkBackwardP2($NbFrames)

	InputHold($RIGHT)
	waitFrames($NbFrames)
	inputRelease($RIGHT)

EndFunc

Func ForwardJumpP2()

	InputHold($LEFT)
	InputHold($UP)
	waitFrames(1)
	inputRelease($LEFT)
	inputRelease($UP)
	
EndFunc

Func BackwardJumpP2()

	InputHold($RIGHT)
	InputHold($UP)
	waitFrames(1)
	inputRelease($RIGHT)
	inputRelease($UP)
	
EndFunc

;--------------Crouching / Jumping attacks ------------

Func JumpAttackP2($inputFinal)

	ForwardJumpP2()
	waitFrames(24)
	oneFrameInput($inputFinal)
EndFunc

Func CrouchAttack($inputFinal)
inputHold($DOWN)
oneFrameInput($inputFinal)
inputRelease($DOWN)
EndFunc

;------------------- Coups spéciaux -------------------

Func HadokenP2($inputFinal)

	inputHold($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($inputFinal)

EndFunc

Func HadokenP1($inputFinal)

	inputHold($DOWN)
	waitFrames(2)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($RIGHT)
	inputRelease($inputFinal)

EndFunc

Func ShoryukenP2($inputFinal)

	inputHold($LEFT)
	waitFrames(2)
	inputRelease($LEFT)
	inputHold($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($inputFinal)
	inputRelease($LEFT)
	inputRelease($DOWN)
EndFunc

Func ShoryukenP1($inputFinal)

	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($RIGHT)
	inputHold($DOWN)
	waitFrames(1)
	inputHold($RIGHT)
	waitFrames(1)
	InputHold($inputFinal)
	waitFrames(1)
	inputRelease($inputFinal)
	inputRelease($RIGHT)
	inputRelease($DOWN)
EndFunc

Func ChargeHorizontaleP2($inputFinal, $gardeChoisie)
	if $gardeChoisie = 1 Then
	inputHold($DOWN)
	EndIf 
	inputHold($RIGHT)
	waitFrames(80)
	inputRelease($RIGHT)
	inputRelease($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($inputFinal)
EndFunc

Func ChargeVerticaleP2($inputFinal)
	inputHold($RIGHT)
	inputHold($DOWN)
	waitFrames(80)
	inputRelease($RIGHT)
	inputRelease($DOWN)
	waitFrames(1)
	inputHold($UP)
	waitFrames(1)
	inputHold($inputFinal)
	waitFrames(2)
	inputRelease($UP)
	inputRelease($inputFinal)
EndFunc

Func HalfCircleForwardP2($inputFinal)
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
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($inputFinal)

EndFunc

Func HalfCircleBackwardP2($inputFinal)
	inputHold($LEFT)
	waitFrames(2)
	inputHold($DOWN)
	waitFrames(2)
	inputRelease($LEFT)
	waitFrames(2)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($RIGHT)
	inputRelease($inputFinal)
EndFunc

Func TigerKneeP2($inputFinal)
	inputHold($RIGHT)
	inputHold($DOWN)
	waitFrames(2)
	inputRelease($RIGHT)
	waitFrames(1)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(1)
	inputHold($UP)
	waitFrames(1)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($UP)
	inputRelease($inputFinal)

EndFunc

Func TigerKneeP1($inputFinal)
	inputHold($LEFT)
	inputHold($DOWN)
	waitFrames(2)
	inputRelease($LEFT)
	waitFrames(2)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	inputHold($UP)
	waitFrames(1)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($RIGHT)
	inputRelease($UP)
	inputRelease($inputFinal)

EndFunc

;------------- Super -------------------

Func SuperQuartDeCercleP2($inputFinal)
	inputHold($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	inputRelease($LEFT)
	inputHold($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($inputFinal)

EndFunc

Func SuperQuartDeCercleP1($inputFinal)
	inputHold($DOWN)
	waitFrames(2)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	inputRelease($RIGHT)
	inputHold($DOWN)
	waitFrames(2)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	waitFrames(2)
	InputHold($inputFinal)
	waitFrames(2)
	inputRelease($RIGHT)
	inputRelease($inputFinal)
EndFunc

Func SuperChargeHorizontaleP2($inputFinal, $gardeChoisie)

	if $gardeChoisie = 1 Then
	inputHold($DOWN)
	EndIf
	inputHold($RIGHT)
	waitFrames(80)
	inputRelease($RIGHT)
	inputRelease($DOWN)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($LEFT)
	waitFrames(2)
	inputHold($RiGHT)
	waitFrames(2)
	inputRelease($RIGHT)
	waitFrames(2)
	inputHold($LEFT)
	waitFrames(2)
	inputHold($inputFinal)
	waitFrames(2)
	inputRelease($LEFT)
	inputRelease($inputFinal)
EndFunc

Func SuperChargeVerticaleP2($inputFinal)
	inputHold($RIGHT)
	inputHold($DOWN)
	waitFrames(80)
	inputRelease($RIGHT)
	inputHold($LEFT)
	waitFrames(2)
	inputRelease($LEFT)
	inputHold($RIGHT)
	waitFrames(2)
	inputRelease($DOWN)
	inputHold($UP)
	inputHold($inputFinal)
	waitFrames(2)
	inputRelease($UP)
	inputRelease($inputFinal)
EndFunc 

