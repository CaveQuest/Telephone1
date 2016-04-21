
; ===============================================================
; Mega PCM Driver Include File
; (c) 2012, Vladikcomper
; ===============================================================

; ---------------------------------------------------------------
; Variables used in DAC table
; ---------------------------------------------------------------

; flags
panLR	= $C0
panL	= $80
panR	= $40
pcm	= 0
dpcm	= 4
loop	= 2
pri	= 1

; ---------------------------------------------------------------
; Macros
; ---------------------------------------------------------------

z80word macro Value
	dc.w	((\Value)&$FF)<<8|((\Value)&$FF00)>>8
	endm

DAC_Entry macro Pitch,Offset,Flags
	dc.b	\Flags			; 00h	- Flags
	dc.b	\Pitch			; 01h	- Pitch
	dc.b	(\Offset>>15)&$FF	; 02h	- Start Bank
	dc.b	(\Offset\_End>>15)&$FF	; 03h	- End Bank
	z80word	(\Offset)|$8000		; 04h	- Start Offset (in Start bank)
	z80word	(\Offset\_End-1)|$8000	; 06h	- End Offset (in End bank)
	endm
	
IncludeDAC macro Name,Extension
\Name:
	if strcmp('\extension','wav')
		incbin	'dac/\Name\.\Extension\',$3A
	else
		incbin	'dac/\Name\.\Extension\'
	endc
\Name\_End:
	endm

; ---------------------------------------------------------------
; Driver's code
; ---------------------------------------------------------------

MegaPCM:
	incbin	'MegaPCM.z80'

; ---------------------------------------------------------------
; DAC Samples Table
; ---------------------------------------------------------------

	DAC_Entry	$10, Kick, pcm			; $81	- Chaotix Kick
	DAC_Entry	$10, Snare, pcm		        ; $82	- Chaotix Snare
	DAC_Entry	$23, Timpani, pcm		; $83	- Chaotix Timpani
	DAC_Entry       $10, Clap, pcm			; $84	- Chaotix Clap
	DAC_Entry       $10, Cymbal, pcm		; $85	- Chaotix Crash Cymbal
	DAC_Entry	$10, Splash, pcm		; $86	- Chaotix Splash Cymbal
	DAC_Entry       $10, Hihat, pcm         	; $87	- Chaotix Hi-Hat
	DAC_Entry	$1A, Timpani, pcm		; $88	- Chaotix High Tom
	DAC_Entry	$1D, Timpani, pcm		; $89	- Chaotix Mid-High Tom
	DAC_Entry	$23, Timpani, pcm		; $8A	- Chaotix Mid-Low Tom
	DAC_Entry	$25, Timpani, pcm		; $8B	- Chaotix Low Tom
	DAC_Entry       $10, AltKick, pcm               ; $8C   - Chaotix Acoustic Kick
	DAC_Entry       $10, AltSnare, pcm              ; $8D   - Chaotix Acoustic Snare
	DAC_Entry       $06, RRZ1Tom, dpcm              ; $8E   - Rusty Ruin High Tom
	DAC_Entry       $0A, RRZ1Tom, dpcm              ; $8F   - Rusty Ruin Mid-High Tom
	DAC_Entry       $0D, RRZ1Tom, dpcm              ; $90   - Rusty Ruin Mid-Low Tom
	DAC_Entry       $12, RRZ1Tom, dpcm              ; $91   - Rusty Ruin Low Tom
	DAC_Entry       $06, S3KKick, dpcm              ; $92   - S3K Kick
	DAC_Entry       $06, S3KSnare, dpcm             ; $93   - S3K Snare
        DAC_Entry       $0C, S3KRide, dpcm              ; $94   - S3K Ride Cymbal
        DAC_Entry       $0C, S3KGo, dpcm                ; $95   - S3K "Go!"
        DAC_Entry       $08, S1Kick, dpcm               ; $96   - S1/S2 Kick
        DAC_Entry       $04, S1Snare, dpcm              ; $97   - S1/S2 Snare
        DAC_Entry       $08, S3KCrash, dpcm             ; $98   - S3K Crash Cymbal
        DAC_Entry       $08, S3KMuffSnare, dpcm         ; $99   - S3K Muffled Snare
        DAC_Entry       $0C, MiracleNineKick, pcm       ; $9A   - Miracle Nine Kick
        DAC_Entry       $0C, MiracleNineSnare, pcm      ; $9B   - Miracle Nine Snare
        DAC_Entry       $10, S3KTom, dpcm               ; $9C   - S3K High Tom
        DAC_Entry       $16, S3KTom, dpcm               ; $9D   - S3K Mid-High Tom
        DAC_Entry       $1C, S3KTom, dpcm               ; $9E   - S3K Mid-Low Tom
        DAC_Entry       $22, S3KTom, dpcm               ; $9F   - S3K Low Tom
        DAC_Entry       $0E, S2BTom, dpcm               ; $A0   - S2B Low Tom
        DAC_Entry       $08, SCDAlright, pcm            ; $A1   - SCD "Alright!"

MegaPCM_End:

; ---------------------------------------------------------------
; DAC Samples Files
; ---------------------------------------------------------------

	IncludeDAC	Kick, wav
	IncludeDAC	Snare, wav
	IncludeDAC	Timpani, wav
	IncludeDAC      Cymbal, wav
	IncludeDAC      Clap, wav
	IncludeDAC      Splash, wav
	IncludeDAC      Hihat, wav
	IncludeDAC      AltKick, wav
	IncludeDAC      AltSnare, wav
	IncludeDAC      RRZ1Tom, bin
	IncludeDAC      S3KKick, bin
        IncludeDAC      S3KSnare, bin
        IncludeDAC      S3KRide, bin
        IncludeDAC      S3KGo, bin
        IncludeDAC      S1Kick, bin
        IncludeDAC      S1Snare, bin
        IncludeDAC      S3KCrash, bin
        IncludeDAC      S3KMuffSnare, bin
        IncludeDAC      MiracleNineKick, bin
        IncludeDAC      MiracleNineSnare, bin
	IncludeDAC      S3KTom, bin
	IncludeDAC      S2BTom, bin
        IncludeDAC      SCDAlright, wav
