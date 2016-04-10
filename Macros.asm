; ===========================================================================
; lets put all the assembler options here! Much cleaner commandline, go!
	opt op+
	opt os+
	opt ow+
	opt oz+
	opt oaq+
	opt osq+
	opt omq+
	opt ae-

; ---------------------------------------------------------------------------
; Macro functions
; ---------------------------------------------------------------------------

	; --- Padding/Alignment ---

align		macro align, val
	if narg=2
		dcb.b	\align-(*%\align),\val
	else
		dcb.b	\align-(*%\align),$FF
	endif
    endm

	; --- DMA to (a6) containing C00004 ---

DMA		macro	size, source, destination
	move.l	#(((((\size/$02)<<$08)&$FF0000)+((\size/$02)&$FF))+$94009300),(a6)
	move.l	#((((((\source&$FFFFFF)/$02)<<$08)&$FF0000)+(((\source&$FFFFFF)/$02)&$FF))+$96009500),(a6)
	move.l	#(((((\source&$FFFFFF)/$02)&$7F0000)+$97000000)+((\destination>>$10)&$FFFF)),(a6)
	move.w	#((\destination&$FF7F)|$80),(a6)
    endm

	; --- incbin for DMA required data ---

incdma		macro	file
	if ((*+filesize(\file))&$FE0000)>(*&$FE0000)
		align $20000
	endc
\*:
	if (*+filesize(\file))>($20000)
		incbin	\file, $0000, $20000
		even
	else
		incbin	\file
		even
	endc
    endm

; ===========================================================================
