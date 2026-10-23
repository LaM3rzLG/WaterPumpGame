	CPU Z80
	org $19ef
    ; BASIC "header" / program starter code
    db    $0F,$0A,$0,$DD ; "10 PRINT" - basic token
    db    " USR"            ; " USR"
    db    $96               ; "("
    db    "6659"           ; "6659" <- decimal address
    db    $95,$FF        ; ")"
    db    0,0,0,0,0       ; BASIC header length is 20 bytes with this 5 zero bytes, and the code starting address is 6659 ($1A03)
    ; assembly code start
;    jp    $1A03            ; <- this is the decimal 6659 ($1A03) memory address.
FALSE EQU $00
TRUE EQU $01
TVC_BORDER_BLACK EQU $00
TVC_BORDER_BLACK2 EQU $80
TVC_BORDER_BLUE EQU $82
TVC_BORDER_CYAN EQU $a2
TVC_BORDER_DARKBLUE EQU $02
TVC_BORDER_DARKCYAN EQU $22
TVC_BORDER_DARKGREEN EQU $20
TVC_BORDER_DARKMAGENTA EQU $0a
TVC_BORDER_DARKRED EQU $08
TVC_BORDER_DARKYELLOW EQU $28
TVC_BORDER_GRAY EQU $2a
TVC_BORDER_GREEN EQU $a0
TVC_BORDER_MAGENTA EQU $8a
TVC_BORDER_RED EQU $88
TVC_BORDER_WHITE EQU $aa
TVC_BORDER_YELLOW EQU $a8
TVC_FILE_BUFFER_TYPE EQU $b6b
TVC_GR16_BLACK EQU $00
TVC_GR16_BLACK2 EQU $08
TVC_GR16_BLUE EQU $09
TVC_GR16_CYAN EQU $0d
TVC_GR16_DARKBLUE EQU $01
TVC_GR16_DARKCYAN EQU $05
TVC_GR16_DARKGREEN EQU $04
TVC_GR16_DARKMAGENTA EQU $03
TVC_GR16_DARKRED EQU $02
TVC_GR16_DARKYELLOW EQU $06
TVC_GR16_GRAY EQU $07
TVC_GR16_GREEN EQU $0c
TVC_GR16_MAGENTA EQU $0b
TVC_GR16_RED EQU $0a
TVC_GR16_WHITE EQU $0f
TVC_GR16_YELLOW EQU $0e
TVC_GRAPHICS16 EQU $02
TVC_GRAPHICS2 EQU $00
TVC_GRAPHICS4 EQU $01
TVC_GRAPH_MODE_PORT EQU $06
TVC_JOY_DOWN EQU $04
TVC_JOY_FIRE EQU $08
TVC_JOY_LEFT EQU $40
TVC_JOY_RIGHT EQU $20
TVC_JOY_UP EQU $02
TVC_LINE_MODE_AND EQU $02
TVC_LINE_MODE_DEFAULT EQU $00
TVC_LINE_MODE_OR EQU $01
TVC_LINE_MODE_XOR EQU $03
TVC_MAX_VOLUME EQU $0f
TVC_MEM_48K_VID EQU $03
TVC_MEM_DEFAULT EQU $00
TVC_MEM_FULL_64K EQU $02
TVC_MEM_VID_ON EQU $01
TVC_PALETTE_BLACK EQU $00
TVC_PALETTE_BLACK2 EQU $40
TVC_PALETTE_BLUE EQU $41
TVC_PALETTE_CYAN EQU $51
TVC_PALETTE_DARK_BLUE EQU $01
TVC_PALETTE_DARK_CYAN EQU $11
TVC_PALETTE_DARK_GREEN EQU $10
TVC_PALETTE_DARK_MAGENTA EQU $05
TVC_PALETTE_DARK_RED EQU $04
TVC_PALETTE_DARK_YELLOW EQU $14
TVC_PALETTE_GRAY EQU $15
TVC_PALETTE_GREEN EQU $50
TVC_PALETTE_MAGENTA EQU $45
TVC_PALETTE_RED EQU $44
TVC_PALETTE_WHITE EQU $55
TVC_PALETTE_YELLOW EQU $54
TVC_PORT_3_MEM_MIRROR EQU $b11
TVC_PORT_5_MEM_MIRROR EQU $b12
TVC_PORT_6_MEM_MIRROR EQU $b13
TVC_SILENT_SOUND EQU $fff
TVC_SOUND_HI_PORT EQU $05
TVC_SOUND_LO_PORT EQU $04
TVC_SOUND_VOLUME_PORT EQU $06
TVC_SYS_BORDER_COLOR EQU $b4f
TVC_SYS_BORDER_PORT EQU $00
TVC_SYS_GRAPH_MODE EQU $b13
TVC_SYS_INK_COLOR EQU $b4d
TVC_SYS_LINE_MODE EQU $b4b
TVC_SYS_LINE_STYLE EQU $b4c
TVC_SYS_PAPER_COLOR EQU $b4e
TVC_SYS_TEXT_STYLE_FLAG EQU $b50
TVC_SYS_TIMER EQU $b1d
TVC_TEXT_STYLE_DEFAULT EQU $00
TVC_TEXT_STYLE_INVISIBLE EQU $03
TVC_TEXT_STYLE_NO_INK EQU $01
TVC_TEXT_STYLE_TRANSPARENT EQU $02
StartBlock19ef:
	jp block1
TVC_Mode equ $e48
TVC_Nr equ $e49
TVC_Color equ $e4a
TVC_X equ $e4b
TVC_Y equ $e4c
TVC_Style equ $e4d
TVC_X1 equ $e4e
TVC_Y1 equ $e50
TVC_X2 equ $e52
TVC_Y2 equ $e54
TVC_DelayTicks equ $e56
TVC_SoundVolume equ $e58
TVC_Duration equ $e59
TVC_Pitch equ $e5a
TVC_KeyCode equ $e5c
TVC_counter equ $e5d
TVC_CharCode equ $e5f
TVC_Width equ $e62
TVC_Height equ $e63
TVC_FillPattern equ $e64
TVC_GraphMode equ $e65
TVC_Background equ $e66
TVC_Count equ $e67
TVC_PortNr equ $e68
TVC_Value equ $e69
TVC_LineNr equ $e6a
TVC_Pattern equ $e6b
TVC_Size equ $e6c
TVC_Text: dw  0
TVC_len:	db	0
varPrefixed_i:	db	0
SzP:	db	$47
SzPNext:	 ds 72
SzK2:	 ds 72
SzK2b:	 ds 72
SzRt:	 ds 72
SzSzin:	db $44, $50, $41, $54, $51, $45, $44, $50
	db $41, $54, $51, $45
pp:	db	0
kk:	db	0
qq:	db	0
	;====================================================
; //	  TRSE TVC unit for VIDEOTON TV-Computer 
; //    
; //    VIDEOTON TV-Computer (TVC)
; //    Screen, Memory, Text, Graphic, Keyboard, Sound and 
; //		File sytem ROM functions and some helpers
; //    
; //		Author:  Bery (Zsolt Bertók), 2023
; //		Version: March 4, 2023
; //====================================================
; // Global procedure / function params and internal use variables
; // mapped to freely usable memory addresses.
; // $0E48 - $0E97 -> TV-Computer text Editor working area. Size: 80 bytes.
; // used by Delay procedure
; // Text helpers
; // It is used to calculate the text length for Write and WriteAt procedures
; // Sound helper
; // System sound sign is ON
; // CreateCharImage helpers
; // Graphics 4 color tables
; // pixel #0, #1, #2, #3 in byte by palette color #0
; // pixel #0, #1, #2, #3 in byte by palette color #1 
; // pixel #0, #1, #2, #3 in byte by palette color #2 
; // pixel #0, #1, #2, #3 in byte by palette color #3 	
; // File I/O
; // 0: buffered; $FF: not buffered - is used when creating a new file
; // Consts
; // 0: buffered file; otherwise not buffered file
; // Memory mapping
; // System
; // 16-bit counter, incremented in nterrupt Handler at every 20.096 ms
; // Graphics  / Screen
; // Graphics modes
; // Text	
; // text / line / point color
; // text background
; // text overwriting flag → 0: overwrite; 1: invisible ink; 2: transparent background; 3: invisible + transparent
; // Text styles
; // Line
; // Line overwriting mode → 0: overwrite; 1: OR; 2: AND; 3: XOR
; // Line drawing styles 1..14
; // Line modes
; // Sound
; // Sound PITCH low 8 bit
; // Bits 0-3.: sound PITCH high 4 bits
; // Bits 2-5: sound VOLUME (0-15)
; // Joystick
; // Palette colors
; // Border colors
; // Graphics 16 colors================================================
; //  		            S C R E E N 
; //=================================================*
; //Sets graphics mode. 
; //<ul>
; //<li>GRAPHICS_2:  512x240  2 color mode (code: 0)</li>
; //<li>GRAPHICS_4:  256x240  4 color mode (code: 1)</li>
; //<li>GRAPHICS_16: 128x240 16 color mode (code: 2).</li>
; //</ul>
; //<br/>
; //Example: SetGraphicsMode(TVC::GRAPHICS_16);<br/>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : TVC_SetGraphicsMode
	;    Procedure type : User-defined procedure
 ; Temp vars section
	; Declaring string asmz80
MainProgram_stringassignstr810:		db	"VIDEOTON TV-COMPUTER GRAPHICS 2 MODE"
	db	0
 ; Temp vars section ends
TVC_SetGraphicsMode_block2:
TVC_SetGraphicsMode:
	; generic assign 
	ld a,[TVC_Mode]
	ld [TVC_GraphMode], a
	ld a, $0
	ld [TVC_FillPattern], a
			ld  A,[TVC_Mode]
			ld 	C,A 							// C = graphics mode code
			rst $30 							// system function call
			db $4 								// VMODE function code
			
	ret
end_procedure_TVC_SetGraphicsMode:
	
; // Black color, or palette #0 color*
; //Gets graphics mode.<br/>
; //Result:
; //<ul>
; //<li>0: GRAPHICS 2</li>
; //<li>1: GRAPHICS 4</li>
; //<li>2: GRAPHICS 16</li>
; //</ul>
; //<br/>
; //Example: if (TVC::GetGraphicsMode() <> TVC::GRAPHICS_4) then TVC::SetGraphicsMode(TVC::GRAPHICS_4);<br/>
; //<br/>
; 

	; ***********  Defining procedure : TVC_GetGraphicsMode
	;    Procedure type : User-defined procedure
TVC_GetGraphicsMode:
			ld	A,($0B13)		// A = port #6 mirror system variable
			and 3						// A = bit #1 and #2 of port #6 mirror -> graphics mode
			
	ret
end_procedure_TVC_GetGraphicsMode:
	;*
; //Clear screen using the background color<br/>
; //<br/>
; //Example:<br/>
; //TVC::TextBackground(0);<br/>
; //TVC::ClearScreen();<br/>
; //<br/>
; 

	; ***********  Defining procedure : TVC_ClearScreen
	;    Procedure type : User-defined procedure
TVC_ClearScreen:
				// save memory mapping
				ld  A,($3)				// A = current memory mapping from system variable
				ld  [TVC_Mode],A	// save current memory mapping to Mode variable
				// mapping the VideoRAM to $8000-BFFF
        ld  A,$50					// Memory pages: U0, U1, VID, SYS -> set VIDEORAM to memory page #2
				ld  ($3),A				// set memory mapping to system variable
				out ($2),A				// send memory mapping to port #2
				// clear screen
				ld  A,[TVC_FillPattern] // A := fill pattern byte
				ld  HL,$8000			// HL -> VIDEORAM start address				
				ld  (HL),A        // put fill pattern to VIDEORAM first byte
				ld  DE,$8001		  // DE -> VIDEORAM 2nd byte
				ld  BC,16383	    // BC = 16K - 1 -> VIDEORAM size - 1
				ldir				      // copy fill pattern to all bytes of the VIDEORAM
				// restore memory mapping
				ld	A,[TVC_Mode]	// A = saved memory mapping
				ld	($3),A				// restore memory mapping to system variable
				out ($2),A				// restore memory mapping on port #2
				
	ret
end_procedure_TVC_ClearScreen:
	; ***********  Defining procedure : TVC_SetPalette
	;    Procedure type : User-defined procedure
TVC_SetPalette_block5:
TVC_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[TVC_Nr]
	or a
	jr c, TVC_SetPalette_edblock9
TVC_SetPalette_localsuccess11: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[TVC_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,TVC_SetPalette_edblock9
TVC_SetPalette_localsuccess12: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[TVC_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,TVC_SetPalette_edblock9
TVC_SetPalette_ctb7: ;Main true block ;keep :
				ld A,[TVC_Nr]
				ld C,$60
				add A,C
				ld C,A									// C = $60 + Nr
				ld A,[TVC_Color]				// A = Color code
				out (C),A								// send Color code to desired palette port
				
TVC_SetPalette_edblock9:
	ret
end_procedure_TVC_SetPalette:
	;*
; //Sets the border color<br/>
; //<br/>
; //Example: TVC::SetBorder(TVC::BORDER_BLUE);<br/><br/>
; //<br/>
; //Border colors:
; //<ul>
; //<li>BORDER_BLACK</li>
; //<li>BORDER_DARKBLUE</li>
; //<li>BORDER_DARKRED</li>
; //<li>BORDER_DARKMAGENTA</li>
; //<li>BORDER_DARKGREEN</li>
; //<li>BORDER_DARKCYAN</li>
; //<li>BORDER_DARKYELLOW</li>
; //<li>BORDER_GRAY</li>
; //<li>BORDER_BLACK2</li>
; //<li>BORDER_BLUE</li>
; //<li>BORDER_RED</li>
; //<li>BORDER_MAGENTA</li>
; //<li>BORDER_GREEN</li>
; //<li>BORDER_CYAN</li>
; //<li>BORDER_YELLOW</li>
; //<li>BORDER_WHITE</li>
; //</ul>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : TVC_SetBorder
	;    Procedure type : User-defined procedure
TVC_SetBorder_block14:
TVC_SetBorder:
		
    ld A,[TVC_Color]
    ld (TVC_SYS_BORDER_COLOR),A
		out (TVC_SYS_BORDER_PORT),A
	
	ret
end_procedure_TVC_SetBorder:
	;*
; //Set the raster-interrupt position on the screen<br/>
; //Params:
; //<ul>
; //<li>LineNr: 0-239</li>
; //</ul>
; //<br/>
; //Example: SetRasterInterruptPos(200);<br/>
; //<br/>
; 

	; ***********  Defining procedure : TVC_SetRasterInterruptPos
	;    Procedure type : User-defined procedure
TVC_SetRasterInterruptPos_block15:
TVC_SetRasterInterruptPos:
			ld  A,[TVC_LineNr]
			srl A
			srl A       	// A = LineNr div 4
			ld  H,0
			ld 	L,A				// HL = LineNr div 4
			add HL,HL			// HL = HL * 2
			add HL,HL			// HL = HL * 4
			add HL,HL			// HL = HL * 8
			add HL,HL			// HL = HL * 16
			add HL,HL			// HL = HL * 32
			add HL,HL			// HL = (LineNr div 4) * 64			
			ld	DE,63			// last byte in the line
			add	HL,DE			// HL = ((LineNr div 4) * 64) + 63
			ld	A,14
			out	($70),A		// select CRTC R14 register - register of raster-interrupt position high byte
			ld	A,H
			out	($71),A		// send hight byte of raster-interrupt position to CRTC R14 register
			ld	A,15
			out	($70),A		// select CRTC R15 register - register of raster-interrupt position low byte
			ld	A,L
			out	($71),A		// send low byte of raster-interrupt position to CRTC R15 register
			ret
			
	ret
end_procedure_TVC_SetRasterInterruptPos:
	; ***********  Defining procedure : TVC_WriteAt
	;    Procedure type : User-defined procedure
TVC_WriteAt_block16:
TVC_WriteAt:
	ld a, $0
	ld [TVC_len], a
TVC_WriteAt_while17:
TVC_WriteAt_loopstart21:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[TVC_len]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,[TVC_Text]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	or a
	jr c, TVC_WriteAt_edblock20
	jr z, TVC_WriteAt_edblock20
TVC_WriteAt_ctb18: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[TVC_len]
	add  a,$1
	ld [TVC_len], a
	jr TVC_WriteAt_while17
TVC_WriteAt_edblock20:
TVC_WriteAt_loopend22:
			// 
			ld A,[TVC_X]
			ld B,A
			ld A,[TVC_Y]
			ld C,A
			rst $30 				// TV-Computer ROM routine call
			db $3 					// BTEXT function - set position
			// Write
			ld DE,[TVC_Text]	// text 
			ld B,0
			ld A,[TVC_len]
			ld C,A
			rst $30 				// TV-Computer ROM routine call
			db $2 					// VID_BKOUT function - write text
	
	ret
end_procedure_TVC_WriteAt:
	;*
; //Sets text or line ink color.<br/>
; //Params:
; //<ul>
; //<li> Graphics2: 0 - 1</li>
; //<li> Graphics2: 0 - 3</li>
; //<li>Graphics16: 1 - 15</li>
; //</ul>
; //<br/>
; //Example: SetColor(1);
; //<br/>
; //Uses the System ROM (firmware) variable.
; 

	; ***********  Defining procedure : TVC_SetColor
	;    Procedure type : User-defined procedure
TVC_SetColor_block25:
TVC_SetColor:
			ld A,[TVC_Color]
			ld (TVC_SYS_INK_COLOR),A
	
	ret
end_procedure_TVC_SetColor:
	
; //	
; // set VLinePattern for VByteLine
; //	GraphMode := GetGraphicsMode();
; //	if (GraphMode = GRAPHICS2) then
; //  begin
; //		if (Color = 0) then
; //			VLinePattern := 0
; //		else
; //			VLinePattern := 128; 
; // left bit set
; //	end
; //	else
; //	if (GraphMode = GRAPHICS4) then
; //  begin
; //		case (Color) of
; //			0: VLinePattern := 0;	 	
; // clear all bits
; //			1: VLinePattern := 128; 
; // set bit #7 -> left bit set to Color #1
; //			2: VLinePattern := 8;  	
; // set bit #3 -> left bit set to Color #2
; //			3: VLinePattern := 136; 
; // set bit #7 and #3 -> left bit set to Color #3
; //		end;
; //	end
; //	else
; //	if (GraphMode = GRAPHICS16) then
; //	begin
; //		case (Color) of
; //			0: VLinePattern := 0;
; //			1: VLinePattern := 2;
; //			2: VLinePattern := 8;
; //			3: VLinePattern := 10;
; //			4: VLinePattern := 32;
; //			5: VLinePattern := 34;
; //			6: VLinePattern := 40;
; //			7: VLinePattern := 42;
; //			8: VLinePattern := 128;
; //			9: VLinePattern := 130;
; //			10: VLinePattern := 136;
; //			11: VLinePattern := 138;
; //			12: VLinePattern := 160;
; //			13: VLinePattern := 162;
; //			14: VLinePattern := 168;
; //			15: VLinePattern := 170;
; //		end;
; //	end;
; //	*
; //Sets text background color<br/>
; //Params:
; //<ul>
; //<li> Graphics2: 0 - 1</li>
; //<li> Graphics2: 0 - 3</li>
; //<li>Graphics16: 1 - 15</li>
; //</ul>
; //<br/>
; //Example: TextBackground(3);
; //<br/>
; //Uses the System ROM (firmware) variable.
; 

	; ***********  Defining procedure : TVC_TextBackground
	;    Procedure type : User-defined procedure
TVC_TextBackground_block26:
TVC_TextBackground:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[TVC_Color]
	ld b,a
	ld a,$f
	cp b
	jp c,TVC_TextBackground_edblock30
TVC_TextBackground_ctb28: ;Main true block ;keep :
				ld A,[TVC_Color]
				ld (TVC_SYS_PAPER_COLOR),A
		
	
; // set TextBackground to system variable
; // set FillPattern for FillRect
	; generic assign 
	call TVC_GetGraphicsMode
	ld [TVC_GraphMode], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	or a
	jp nz,TVC_TextBackground_eblock399
TVC_TextBackground_ctb398: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[TVC_Color]
	or a
	jr nz,TVC_TextBackground_eblock584
TVC_TextBackground_ctb583: ;Main true block ;keep :
	
; // Graphincs 2
	ld a, $0
	ld [TVC_FillPattern], a
	jr TVC_TextBackground_edblock585
TVC_TextBackground_eblock584:
	ld a, $ff
	ld [TVC_FillPattern], a
TVC_TextBackground_edblock585:
	jp TVC_TextBackground_edblock400
TVC_TextBackground_eblock399:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[TVC_GraphMode]
	cp $1
	jp nz,TVC_TextBackground_eblock593
TVC_TextBackground_ctb592: ;Main true block ;keep :
	ld a,[TVC_Color]
	cp $0
	jr nz,TVC_TextBackground_casenext680
	
; // Graphincs 4
	ld a, $0
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend679
TVC_TextBackground_casenext680:
	ld a,[TVC_Color]
	cp $1
	jr nz,TVC_TextBackground_casenext682
	
; // clear all bits
	ld a, $f0
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend679
TVC_TextBackground_casenext682:
	ld a,[TVC_Color]
	cp $2
	jr nz,TVC_TextBackground_casenext684
	
; // set high 4 bits (128+64+32+16)
	ld a, $f
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend679
TVC_TextBackground_casenext684:
	ld a,[TVC_Color]
	cp $3
	jr nz,TVC_TextBackground_casenext686
	
; // set low 4 bits  (1+2+4+8)
	ld a, $ff
	ld [TVC_FillPattern], a
TVC_TextBackground_casenext686:
TVC_TextBackground_caseend679:
	jp TVC_TextBackground_edblock594
TVC_TextBackground_eblock593:
	; case (Color) 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[TVC_GraphMode]
	cp $2
	jp nz,TVC_TextBackground_edblock692
TVC_TextBackground_ctb690: ;Main true block ;keep :
	ld a,[TVC_Color]
	cp $0
	jr nz,TVC_TextBackground_casenext729
	
; // set all bits
; // Graphincs 16
	ld a, $0
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext729:
	ld a,[TVC_Color]
	cp $1
	jr nz,TVC_TextBackground_casenext731
	ld a, $3
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext731:
	ld a,[TVC_Color]
	cp $2
	jr nz,TVC_TextBackground_casenext733
	ld a, $c
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext733:
	ld a,[TVC_Color]
	cp $3
	jr nz,TVC_TextBackground_casenext735
	ld a, $f
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext735:
	ld a,[TVC_Color]
	cp $4
	jr nz,TVC_TextBackground_casenext737
	ld a, $30
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext737:
	ld a,[TVC_Color]
	cp $5
	jr nz,TVC_TextBackground_casenext739
	ld a, $33
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext739:
	ld a,[TVC_Color]
	cp $6
	jr nz,TVC_TextBackground_casenext741
	ld a, $3c
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext741:
	ld a,[TVC_Color]
	cp $7
	jr nz,TVC_TextBackground_casenext743
	ld a, $3f
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext743:
	ld a,[TVC_Color]
	cp $8
	jr nz,TVC_TextBackground_casenext745
	ld a, $c0
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext745:
	ld a,[TVC_Color]
	cp $9
	jr nz,TVC_TextBackground_casenext747
	ld a, $c3
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext747:
	ld a,[TVC_Color]
	cp $a
	jr nz,TVC_TextBackground_casenext749
	ld a, $cc
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext749:
	ld a,[TVC_Color]
	cp $b
	jr nz,TVC_TextBackground_casenext751
	ld a, $cf
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext751:
	ld a,[TVC_Color]
	cp $c
	jr nz,TVC_TextBackground_casenext753
	ld a, $f0
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext753:
	ld a,[TVC_Color]
	cp $d
	jr nz,TVC_TextBackground_casenext755
	ld a, $f3
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext755:
	ld a,[TVC_Color]
	cp $e
	jr nz,TVC_TextBackground_casenext757
	ld a, $fc
	ld [TVC_FillPattern], a
	jp TVC_TextBackground_caseend728
TVC_TextBackground_casenext757:
	ld a,[TVC_Color]
	cp $f
	jr nz,TVC_TextBackground_casenext759
	ld a, $ff
	ld [TVC_FillPattern], a
TVC_TextBackground_casenext759:
TVC_TextBackground_caseend728:
TVC_TextBackground_edblock692:
TVC_TextBackground_edblock594:
TVC_TextBackground_edblock400:
TVC_TextBackground_edblock30:
	ret
end_procedure_TVC_TextBackground:
block1:
main_block_begin_:
	ld a, $0
	ld [TVC_Mode], a
	call TVC_SetGraphicsMode
	ld a, $ef
	ld [TVC_LineNr], a
	call TVC_SetRasterInterruptPos
	
; // a VMODE után: raszter-IT a 239. sor végére
	ld a, $0
	ld [TVC_Nr], a
	ld [TVC_Color], a
	call TVC_SetPalette
	ld a, $0
	ld [TVC_Color], a
	call TVC_SetBorder
	; fázistáblák 
	ld a, $0
	ld [pp], a
	ld [kk], a
	ld [qq], a
MainProgram_while761:
MainProgram_loopstart765:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[pp]
	cp $48
	jp nc,MainProgram_edblock764
MainProgram_ctb762: ;Main true block ;keep :
	; Storing to array  
	; RHS is pure numeric optimisation
	ld a,[pp]
	add  a, $1
	push af
	ld a,[pp]
	ld e,a
	ld d,0
	ld hl,SzPNext
	add hl,de
	pop af
	ld [hl],a 
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[kk]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,[pp]
	ld e,a
	ld d,0
	ld hl,SzK2
	add hl,de
	pop af
	ld [hl],a 
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[kk]
	ld b,a
	ld a,$b
	sub  b
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,[pp]
	ld e,a
	ld d,0
	ld hl,SzK2b
	add hl,de
	pop af
	ld [hl],a 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[qq]
	or a
	jr nz,MainProgram_eblock789
MainProgram_ctb788: ;Main true block ;keep :
	; Storing to array  
	ld a,[pp]
	ld e,a
	ld d,0
	ld hl,SzRt
	add hl,de
	ld a,$0
	ld [hl],a 
	jr MainProgram_edblock790
MainProgram_eblock789:
	; Storing to array  
	ld a,[qq]
	ld b,a
	ld a,$6
	sub  b
	push af
	ld a,[pp]
	ld e,a
	ld d,0
	ld hl,SzRt
	add hl,de
	pop af
	ld [hl],a 
MainProgram_edblock790:
	; 'a:=a + const'  optimization 
	ld a,[kk]
	add  a,$1
	ld [kk], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $c
	jr nz,MainProgram_edblock798
MainProgram_ctb796: ;Main true block ;keep :
	ld a, $0
	ld [kk], a
	; 'a:=a + const'  optimization 
	ld a,[qq]
	add  a,$1
	ld [qq], a
MainProgram_edblock798:
	; 'a:=a + const'  optimization 
	ld a,[pp]
	add  a,$1
	ld [pp], a
	jp MainProgram_while761
MainProgram_edblock764:
MainProgram_loopend766:
	; Storing to array  
	ld a,$0
	ld [SzPNext+$47],a
	; képernyő törlése feketére (papír = 0. paletta); csak a szöveg tinta 
	call TVC_ClearScreen
	; szöveg 10x egymás alá, a kép közepére (ROM kiírás, még a ROM megszakítás-kezelőjével):
; //	   36 karakter -> X = (64-36)/2+1 = 15; 10 sor a 24-ből -> a 8..17. szövegsor (80..179. pixelsor).
; //	   Színes betűk (tinta = 1. paletta, a csíkok színe), fekete háttéren (papír = 0. paletta). 
	ld a, $1
	ld [TVC_Color], a
	call TVC_SetColor
	ld a, $0
	ld [TVC_Color], a
	call TVC_TextBackground
	ld a, $8
	ld [varPrefixed_i], a
MainProgram_while801:
MainProgram_loopstart805:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[varPrefixed_i]
	cp $12
	jr nc,MainProgram_edblock804
MainProgram_ctb802: ;Main true block ;keep :
	ld a, $f
	ld [TVC_X], a
	; generic assign 
	ld a,[varPrefixed_i]
	ld [TVC_Y], a
	; Assigning a string : TVC_Text
	ld hl,MainProgram_stringassignstr810
	; Loading pointer
	ld [TVC_Text],hl
	call TVC_WriteAt
	; 'a:=a + const'  optimization 
	ld a,[varPrefixed_i]
	add  a,$1
	ld [varPrefixed_i], a
	jr MainProgram_while801
MainProgram_edblock804:
MainProgram_loopend806:
		di
		;// saját megszakítás-kezelő: $38 -> JP SzG_Isr
		ld hl,$38
		ld (hl),195
		ld de,SzG_Isr
		inc hl
		ld (hl),e
		inc hl
		ld (hl),d
		;// hang ki, hang-megszakítás tiltva (port $05: bit4 = hang tiltás, bit5 = 0 -> nincs hang-IT)
		ld a,$10
		out ($5),a
		;// szinkron, utána nincs több megszakítás. A di alatt beragadt régi IT-kérést előbb
		;// nyugtázzuk, és két halt: az első egy esetleg még függő kérésre ébredhet, a második a valódi
		out ($7),a
		ei
		halt
		halt
		di
		;// egyszeri fázis-eltolás 157 T: a szinkrontól az első out-ig ugyanannyi idő (14819 T),
		;// mint az álló változatban (ott mérve: a sor 1. out-ja a látható rész bal szélén)
		ld b,11				;// 7
SzG_F:
		djnz SzG_F			;// 10 x 13 + 8 = 138  (= 145)
		nop					;// 4
		nop					;// 4
		nop					;// 4  (= 157)
		jp SzG_Var			;// 10
		;// ===== egy képkocka = PONTOSAN 62800 T =====
SzG_Kep:
		;// --- p := SzPNext[p] (65) ---
		ld a,[SzP]			;// 13
		ld e,a				;// 4
		ld d,0				;// 7
		ld hl,SzPNext		;// 10
		add hl,de			;// 11
		ld a,(hl)			;// 7
		ld [SzP],a			;// 13
		;// --- a := k*2 (32) ---
		ld e,a				;// 4
		ld hl,SzK2			;// 10
		add hl,de			;// 11
		ld a,(hl)			;// 7
		;// --- ugrás a k T-s késleltetőre, vissza az SzG_K1-re (74) ---
		ld hl,SzG_DT		;// 10
		ld c,a				;// 4
		ld b,0				;// 7
		add hl,bc			;// 11
		ld a,(hl)			;// 7
		inc hl				;// 6
		ld h,(hl)			;// 7
		ld l,a				;// 4
		ld ix,SzG_K1		;// 14
		jp (hl)				;// 4   (65 + 32 + 74 = 171)
SzG_K1:
		;// --- színek a regiszterekbe, r-rel elforgatva (168) ---
		ld a,[SzP]			;// 13
		ld e,a				;// 4
		ld d,0				;// 7
		ld hl,SzRt			;// 10
		add hl,de			;// 11
		ld e,(hl)			;// 7   e = r
		ld hl,SzSzin		;// 10
		add hl,de			;// 11
		ld b,(hl)			;// 7   1. szín
		inc hl				;// 6
		ld d,(hl)			;// 7   2.
		inc hl				;// 6
		ld e,(hl)			;// 7   3.
		inc hl				;// 6
		ld c,(hl)			;// 7   4. (átmenetileg C-ben)
		inc hl				;// 6
		ld a,(hl)			;// 7   5. (átmenetileg A-ban)
		inc hl				;// 6
		ld l,(hl)			;// 7   6. (átmenetileg L-ben)
		ld h,c				;// 4   H = 4.
		ld c,a				;// 4
		ld a,l				;// 4   A = 6.
		ld l,c				;// 4   L = 5.
		ld c,$61			;// 7   C = tinta paletta port   (= 168)
		exx					;// 4
		ld b,240			;// 7   sorszámláló (a másik készletben)
		jp SzG_Sor			;// 10  (= 189)
		;// egy sor = PONTOSAN 200 T (240 sor = 48000 T, az utolsó djnz 5 T-vel rövidebb)
SzG_Sor:
		exx					;// 4   -> színregiszterek
		out (c),b			;// 12
		out (c),d			;// 12
		out (c),e			;// 12
		out (c),h			;// 12
		out (c),l			;// 12
		out (c),a			;// 12
		out (c),b			;// 12
		out (c),d			;// 12
		out (c),e			;// 12
		out (c),h			;// 12
		out (c),l			;// 12
		out (c),a			;// 12
		out (c),b			;// 12
		out (c),a			;// 12  (14 x 12 = 168) - a kör 1. színe ELŐTTI szín (a 6.): a sor eleji, az 1. out előtti rész ezt mutatja, így görgetéskor balról az előző csík csúszik be
		nop					;// 4
		ld c,$61			;// 7   (kitöltés, C változatlan)
		exx					;// 4   -> számláló
		djnz SzG_Sor		;// 13  (= 200)
		exx					;// 4
		;// --- kiegyenlítő késleltetés: (11-k) T, vissza az SzG_K2-re (126) ---
		ld a,[SzP]			;// 13
		ld e,a				;// 4
		ld d,0				;// 7
		ld hl,SzK2b			;// 10
		add hl,de			;// 11
		ld a,(hl)			;// 7
		ld hl,SzG_DT		;// 10
		ld c,a				;// 4
		ld b,0				;// 7
		add hl,bc			;// 11
		ld a,(hl)			;// 7
		inc hl				;// 6
		ld h,(hl)			;// 7
		ld l,a				;// 4
		ld ix,SzG_K2		;// 14
		jp (hl)				;// 4   (= 126)
SzG_K2:
		;// a képkocka többi része: 62800 - 48538 = 14262 T
		;// (171 + 16+k + 189 + 47995 + 4 + 126 + 16+(11-k) + 10 = 48538)
SzG_Var:
		ld c,71				;// 7
SzG_V1:
		ld b,14				;// 7
SzG_V2:
		djnz SzG_V2			;// 177
		dec c				;// 4
		jr nz,SzG_V1		;// 12 (utolsó: 7)  -> 71 x 200 - 5 + 7 = 14202
		ld b,4				;// 7
SzG_V3:
		djnz SzG_V3			;// 3 x 13 + 8 = 47  (= 14256)
		inc hl				;// 6   (= 14262)
		jp SzG_Kep			;// 10
		;// --- késleltetők: 8+k T + jp (ix) 8 T = 16+k T (k = 0..11) ---
SzG_D0:
		nop					;// 4
		nop					;// 4   (8)
		jp (ix)
SzG_D1:
		ld a,i				;// 9
		jp (ix)
SzG_D2:
		nop					;// 4
		inc hl				;// 6   (10)
		jp (ix)
SzG_D3:
		nop					;// 4
		ld a,0				;// 7   (11)
		jp (ix)
SzG_D4:
		nop
		nop
		nop					;// 12
		jp (ix)
SzG_D5:
		nop					;// 4
		ld a,i				;// 9   (13)
		jp (ix)
SzG_D6:
		nop
		nop					;// 8
		inc hl				;// 6   (14)
		jp (ix)
SzG_D7:
		nop
		nop					;// 8
		ld a,0				;// 7   (15)
		jp (ix)
SzG_D8:
		nop
		nop
		nop
		nop					;// 16
		jp (ix)
SzG_D9:
		nop
		nop					;// 8
		ld a,i				;// 9   (17)
		jp (ix)
SzG_D10:
		nop
		nop
		nop					;// 12
		inc hl				;// 6   (18)
		jp (ix)
SzG_D11:
		nop
		nop
		nop					;// 12
		ld a,0				;// 7   (19)
		jp (ix)
SzG_DT:
		dw SzG_D0, SzG_D1, SzG_D2, SzG_D3, SzG_D4, SzG_D5
		dw SzG_D6, SzG_D7, SzG_D8, SzG_D9, SzG_D10, SzG_D11
SzG_Isr:
		out ($7),a			;// IT nyugtázása
		ei
		ret
	
main_block_end_:
; Copy BC bytes from HL to DE.
z80_copy_mem:
    ld      a,b
    or      c
    ret     z
    ld      a,16
    sub     c
    and     15
    add     a,a
    ld      (z80_copy_lp-1),a
    jr      z80_copy_lp ; will be overwritten
z80_copy_lp:
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    ldi
    jp      pe,z80_copy_lp
    ret
mul_8x8:
    sla h  ; optimised 1st iteration
    jr nc,mul_8x8_s1
    ld l,e
mul_8x8_s1:
    add hl,hl
    jr nc,mul_8x8_s2
    add hl,de
mul_8x8_s2:
    add hl,hl
    jr nc,mul_8x8_s3
    add hl,de
mul_8x8_s3:
    add hl,hl
    jr nc,mul_8x8_s4
    add hl,de
mul_8x8_s4:
    add hl,hl
    jr nc,mul_8x8_s5
    add hl,de
mul_8x8_s5:
    add hl,hl
    jr nc,mul_8x8_s6
    add hl,de
mul_8x8_s6:
    add hl,hl
    jr nc,mul_8x8_s7
    add hl,de
mul_8x8_s7:
    add hl,hl
    jr nc,mul_8x8_s8
    add hl,de
mul_8x8_s8:
    ret
mul_16x8:
    add a,a  ; optimised 1st iteration
    jr nc,mul_16x8_s1
    ld h,d
    ld l,e
mul_16x8_s1:
    add hl,hl
    rla
    jr nc,mul_16x8_s2
    add hl,de
    adc a,c
mul_16x8_s2:
    add hl,hl
    rla
    jr nc,mul_16x8_s3
    add hl,de
    adc a,c
mul_16x8_s3:
    add hl,hl
    rla
    jr nc,mul_16x8_s4
    add hl,de
    adc a,c
mul_16x8_s4:
    add hl,hl
    rla
    jr nc,mul_16x8_s5
    add hl,de
    adc a,c
mul_16x8_s5:
    add hl,hl
    rla
    jr nc,mul_16x8_s6
    add hl,de
    adc a,c
mul_16x8_s6:
    add hl,hl
    rla
    jr nc,mul_16x8_s7
    add hl,de
    adc a,c
mul_16x8_s7:
    add hl,hl
    rla
    jr nc,mul_16x8_s8
    add hl,de
    adc a,c
mul_16x8_s8:
    ret
div_16x8:
;div_hl_c:
   xor	a
   ld	b, 16
_loop:
   add	hl, hl
   rla
   jr	c, $+5
   cp	c
   jr	c, $+4
   sub	c
   inc	l
   djnz	_loop
   ret
div_16x16:
   ld	hl, 0
   ld	b, 16
_loop16:
   sll	c
   rla
   adc	hl, hl
   sbc	hl, de
   jr	nc, $+4
   add	hl, de
   dec	c
   djnz	_loop16
   ret
_Mod_16:
    ld hl,0
    ld a,b
    ld b,8
_Mod_Loop1:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,_Mod_NoAdd1
    add hl,de
_Mod_NoAdd1:
    djnz _Mod_Loop1
    rla
    cpl
    ld b,a
    ld a,c
    ld c,b
    ld b,8
_Mod_Loop2:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,_Mod_NoAdd2
    add hl,de
_Mod_NoAdd2:
    djnz _Mod_Loop2
    rla
    cpl
    ld b,c
    ld c,a
    ret
EndBlock19ef:
	end
