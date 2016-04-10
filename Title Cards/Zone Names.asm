; ===========================================================================
; ---------------------------------------------------------------------------
; Title card zone names...
; ---------------------------------------------------------------------------

	;	dcnl	Name,	Act (0 = No act numbers)

TC_CS_Levels:	dcnl	TC_GHZ,	1
		dcnl	TC_GHZ,	2
		dcnl	TC_GHZ,	3
		dcnl	TC_GHZ,	4

		dcnl	TC_LZ,	1
		dcnl	TC_LZ,	2
		dcnl	TC_LZ,	3
		dcnl	TC_SBZ,	3

		dcnl	TC_MZ,	1
		dcnl	TC_MZ,	2
		dcnl	TC_MZ,	3
		dcnl	TC_MZ,	4

		dcnl	TC_SLZ,	1
		dcnl	TC_SLZ,	2
		dcnl	TC_SLZ,	3
		dcnl	TC_SLZ,	4

		dcnl	TC_SYZ,	1
		dcnl	TC_SYZ,	2
		dcnl	TC_SYZ,	3
		dcnl	TC_SYZ,	4

		dcnl	TC_SBZ,	1
		dcnl	TC_SBZ,	2
		dcnl	TC_FZ,	0
		dcnl	TC_SBZ,	4

; ---------------------------------------------------------------------------
; ASCII text (Please use CAPITAL LETTERS ONLY)
; ---------------------------------------------------------------------------

TC_GHZ:		dc.b	"GREEN HILL",$00
TC_MZ:		dc.b	"MARBLE",$00
TC_SYZ:		dc.b	"SPRING YARD",$00
TC_LZ:		dc.b	"LABYRINTH",$00
TC_SLZ:		dc.b	"STAR LIGHT",$00
TC_SBZ:		dc.b	"SCRAP BRAIN",$00
TC_FZ:		dc.b	"FINAL",$00
		even

; ===========================================================================