; ===========================================================================
; ---------------------------------------------------------------------------
; Macro functions
; ---------------------------------------------------------------------------

	; --- Padding/Alignment ---

align		macro
		dcb.b	\1-(*%\1),$FF
		endm

	; --- DMA to (a6) containing C00004 ---

DMA:		macro	Size, Source, Destination
		move.l	#(((((Size/$02)<<$08)&$FF0000)+((Size/$02)&$FF))+$94009300),(a6)
		move.l	#((((((Source&$FFFFFF)/$02)<<$08)&$FF0000)+(((Source&$FFFFFF)/$02)&$FF))+$96009500),(a6)
		move.l	#(((((Source&$FFFFFF)/$02)&$7F0000)+$97000000)+((Destination>>$10)&$FFFF)),(a6)
		move.w	#((Destination&$FF7F)|$80),(a6)
		endm

	; --- incbin for DMA required data ---

incdma:		macro	*
		if ((*+filesize(\1))&$FE0000)>(*&$FE0000)
			align $20000
		endc
\*:
		if (*+filesize(\1))>($20000)
			incbin	\1, $0000, $20000
			even
		else
			incbin	\1
			even
		endc
		endm

; ===========================================================================