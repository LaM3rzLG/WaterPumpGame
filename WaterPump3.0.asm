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
GE_BACK_SCREEN_ADDR EQU $c000
GE_BORDER_BLACK EQU $00
GE_BORDER_BLACK2 EQU $80
GE_BORDER_BLUE EQU $82
GE_BORDER_CYAN EQU $a2
GE_BORDER_DARKBLUE EQU $02
GE_BORDER_DARKCYAN EQU $22
GE_BORDER_DARKGREEN EQU $20
GE_BORDER_DARKMAGENTA EQU $0a
GE_BORDER_DARKRED EQU $08
GE_BORDER_DARKYELLOW EQU $28
GE_BORDER_GRAY EQU $2a
GE_BORDER_GREEN EQU $a0
GE_BORDER_MAGENTA EQU $8a
GE_BORDER_RED EQU $88
GE_BORDER_WHITE EQU $aa
GE_BORDER_YELLOW EQU $a8
GE_CRTC_DATA_PORT EQU $71
GE_CRTC_REG_PORT EQU $70
GE_CRTC_VSYNC_POS EQU $07
GE_DIGI_FREQ_2_KHZ EQU $9e
GE_DIGI_FREQ_4_KHZ EQU $ce
GE_DIGI_FREQ_8_KHZ EQU $e8
GE_DIGI_TYPE_1X4BIT EQU $00
GE_DIGI_TYPE_2X4BIT EQU $01
GE_DIRECT_TO_SCREEN EQU $00
GE_EXT_SLOT_COUNT EQU $04
GE_GAMECARD_JOY_DOWN EQU $02
GE_GAMECARD_JOY_FIRE EQU $10
GE_GAMECARD_JOY_LEFT EQU $04
GE_GAMECARD_JOY_RIGHT EQU $08
GE_GAMECARD_JOY_UP EQU $01
GE_GR16_COLOR_BLACK EQU $00
GE_GR16_COLOR_BLACK2 EQU $c0
GE_GR16_COLOR_BLUE EQU $c3
GE_GR16_COLOR_CYAN EQU $f3
GE_GR16_COLOR_DARKBLUE EQU $03
GE_GR16_COLOR_DARKCYAN EQU $33
GE_GR16_COLOR_DARKGREEN EQU $30
GE_GR16_COLOR_DARKMAGENTA EQU $0f
GE_GR16_COLOR_DARKRED EQU $0c
GE_GR16_COLOR_DARKYELLOW EQU $3c
GE_GR16_COLOR_GRAY EQU $3f
GE_GR16_COLOR_GREEN EQU $f0
GE_GR16_COLOR_MAGENTA EQU $cf
GE_GR16_COLOR_RED EQU $cc
GE_GR16_COLOR_WHITE EQU $ff
GE_GR16_COLOR_YELLOW EQU $fc
GE_GR4_COLOR0 EQU $00
GE_GR4_COLOR1 EQU $f0
GE_GR4_COLOR2 EQU $0f
GE_GR4_COLOR3 EQU $ff
GE_GRAPHICS16 EQU $02
GE_GRAPHICS2 EQU $00
GE_GRAPHICS4 EQU $01
GE_GRAPH_MODE_PORT EQU $06
GE_IMAGE_CLASS_SIZE EQU $0b
GE_JOY1_ACC EQU $1008
GE_JOY1_DOWN EQU $408
GE_JOY1_FIRE EQU $808
GE_JOY1_LEFT EQU $4008
GE_JOY1_RIGHT EQU $2008
GE_JOY1_STATE EQU $b59
GE_JOY1_UP EQU $208
GE_JOY2_ACC EQU $1009
GE_JOY2_DOWN EQU $409
GE_JOY2_FIRE EQU $809
GE_JOY2_LEFT EQU $4009
GE_JOY2_RIGHT EQU $2009
GE_JOY2_STATE EQU $b5a
GE_JOY2_UP EQU $209
GE_JOY_DOWN EQU $04
GE_JOY_FIRE EQU $08
GE_JOY_LEFT EQU $40
GE_JOY_RIGHT EQU $20
GE_JOY_UP EQU $02
GE_KEYBOARD_0 EQU $b51
GE_KEYBOARD_1 EQU $b52
GE_KEYBOARD_2 EQU $b53
GE_KEYBOARD_3 EQU $b54
GE_KEYBOARD_4 EQU $b55
GE_KEYBOARD_5 EQU $b56
GE_KEYBOARD_6 EQU $b57
GE_KEYBOARD_7 EQU $b58
GE_KEYBOARD_ROW_SEL_PORT EQU $03
GE_KEY_$ EQU $802
GE_KEY_0 EQU $800
GE_KEY_1 EQU $4000
GE_KEY_2 EQU $400
GE_KEY_3 EQU $200
GE_KEY_4 EQU $8000
GE_KEY_5 EQU $100
GE_KEY_6 EQU $1000
GE_KEY_7 EQU $8001
GE_KEY_8 EQU $201
GE_KEY_9 EQU $401
GE_KEY_A EQU $4004
GE_KEY_AA EQU $805
GE_KEY_ALT EQU $107
GE_KEY_AT EQU $2002
GE_KEY_B EQU $106
GE_KEY_BACKSLASH EQU $804
GE_KEY_BRACKET1 EQU $1003
GE_KEY_BRACKET2 EQU $103
GE_KEY_C EQU $206
GE_KEY_CARET EQU $101
GE_KEY_COMMA EQU $207
GE_KEY_CTRL EQU $1007
GE_KEY_D EQU $204
GE_KEY_DEL EQU $105
GE_KEY_DOT EQU $407
GE_KEY_E EQU $202
GE_KEY_EE EQU $4005
GE_KEY_EQUAL EQU $4007
GE_KEY_ESC EQU $807
GE_KEY_F EQU $8004
GE_KEY_G EQU $104
GE_KEY_H EQU $1004
GE_KEY_I EQU $203
GE_KEY_II EQU $2000
GE_KEY_INS EQU $108
GE_KEY_J EQU $8005
GE_KEY_K EQU $205
GE_KEY_L EQU $405
GE_KEY_LESS EQU $2004
GE_KEY_LOCK EQU $2006
GE_KEY_M EQU $8007
GE_KEY_N EQU $1006
GE_KEY_O EQU $403
GE_KEY_OE EQU $4001
GE_KEY_OO EQU $2001
GE_KEY_OOE EQU $803
GE_KEY_P EQU $4003
GE_KEY_Q EQU $4002
GE_KEY_R EQU $8002
GE_KEY_READ_PORT EQU $58
GE_KEY_RET EQU $1005
GE_KEY_S EQU $404
GE_KEY_SHIFT EQU $806
GE_KEY_SPACE EQU $2007
GE_KEY_STAR EQU $1001
GE_KEY_T EQU $102
GE_KEY_U EQU $8003
GE_KEY_UE EQU $801
GE_KEY_UU EQU $2003
GE_KEY_UUE EQU $2005
GE_KEY_V EQU $8006
GE_KEY_W EQU $402
GE_KEY_X EQU $406
GE_KEY_Y EQU $4006
GE_KEY_Z EQU $1002
GE_LOOP_BACKWARD EQU $02
GE_LOOP_FORWARD EQU $00
GE_LOOP_PINGPONG EQU $01
GE_MAX_VOLUME EQU $0f
GE_MEM_48K_VID EQU $90
GE_MEM_DEFAULT EQU $70
GE_MEM_FULL_64K EQU $b0
GE_MEM_VID_ON EQU $50
GE_MIRROR_TABLE EQU $1700
GE_MIRROR_TABLE_HI EQU $17
GE_PALETTE_BLACK EQU $00
GE_PALETTE_BLACK2 EQU $40
GE_PALETTE_BLUE EQU $41
GE_PALETTE_CYAN EQU $51
GE_PALETTE_DARKBLUE EQU $01
GE_PALETTE_DARKCYAN EQU $11
GE_PALETTE_DARKGREEN EQU $10
GE_PALETTE_DARKMAGENTA EQU $05
GE_PALETTE_DARKRED EQU $04
GE_PALETTE_DARKYELLOW EQU $14
GE_PALETTE_GRAY EQU $15
GE_PALETTE_GREEN EQU $50
GE_PALETTE_MAGENTA EQU $45
GE_PALETTE_RED EQU $44
GE_PALETTE_WHITE EQU $55
GE_PALETTE_YELLOW EQU $54
GE_PORT_3_MEM_MIRROR EQU $b11
GE_PORT_5_MEM_MIRROR EQU $b12
GE_PORT_6_MEM_MIRROR EQU $b13
GE_SCREEN_ADDR EQU $8000
GE_SCREEN_HEIGHT EQU $f0
GE_SCREEN_SIZE EQU $3c00
GE_SCREEN_WIDTH EQU $40
GE_SCROLL_DOWN EQU $05
GE_SCROLL_DOWN_LEFT EQU $06
GE_SCROLL_DOWN_RIGHT EQU $04
GE_SCROLL_LEFT EQU $07
GE_SCROLL_RIGHT EQU $03
GE_SCROLL_UP EQU $01
GE_SCROLL_UP_LEFT EQU $08
GE_SCROLL_UP_RIGHT EQU $02
GE_SILENT_SOUND EQU $fff
GE_SLOT_0_BASE_ADDR EQU $40
GE_SLOT_0_JOY3_PORT EQU $12
GE_SLOT_0_JOY4_PORT EQU $13
GE_SLOT_1_BASE_ADDR EQU $70
GE_SLOT_1_JOY3_PORT EQU $22
GE_SLOT_1_JOY4_PORT EQU $23
GE_SLOT_2_BASE_ADDR EQU $a0
GE_SLOT_2_JOY3_PORT EQU $32
GE_SLOT_2_JOY4_PORT EQU $33
GE_SLOT_3_BASE_ADDR EQU $d0
GE_SLOT_3_JOY3_PORT EQU $42
GE_SLOT_3_JOY4_PORT EQU $43
GE_SLOT_RAM_AREA_SIZE EQU $30
GE_SOUND_HI_PORT EQU $05
GE_SOUND_IT_50HZ EQU $4d
GE_SOUND_LO_PORT EQU $04
GE_SOUND_VOLUME_PORT EQU $06
GE_SPRITE_CLASS_SIZE EQU $27
GE_SYS_BORDER_COLOR EQU $b4f
GE_SYS_BORDER_PORT EQU $00
GE_SYS_GRAPH_MODE EQU $b13
GE_SYS_IT_PORT EQU $07
GE_USE_BACK_SCREEN EQU $01
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
GE_ScreenAddr:	dw	$8000
GE_LastSpritePtr:	dw	$17fe
GE_SpriteCount:	db	$00
GE_MemAllocPtr:	dw	$aff
GE_FreeMemSize:	dw	$a00
GE_MemAllocPage:	db	$00
GE_CursorITPos:	dw	$eff
GE_CursorIT_TVline:	db	$03
GE_CharSetPtr: dw  0
GE_CharSetImgWidth:	dw	$76
GE_CharWidth:	db	$02
GE_CharHeight:	db	$06
GE_i:	db	0
GE_NumStr:	db $0, $0, $0, $0, $0, $0
GE_GameCardFound:	db	$00
GE_GameCardJoy3Port:	db	0
GE_GameCardJoy4Port:	db	0
GE_Joy3State:	db	$00
GE_Joy4State:	db	$00
GE_UseBackScreen equ $e70
GE_GetBackgroundBuffer equ $e71
GE_UpdateSpritePos equ $e72
GE_Width equ $e73
GE_Height equ $e74
GE_Count equ $e75
GE_Pattern equ $e76
GE_Mode equ $e77
GE_Nr equ $e78
GE_Color equ $e79
GE_X equ $e7a
GE_Y equ $e7b
GE_AnimPhaseCount equ $e7c
GE_AnimDelay equ $e7d
GE_JoyCode equ $e7e
GE_Value equ $e7f
GE_SoundVolume equ $e80
GE_MemAddr equ $e81
GE_Position equ $e83
GE_Size equ $e85
GE_DelayTicks equ $e87
GE_Pitch equ $e89
GE_IntNum equ $e8b
GE_IntNum2 equ $e8d
GE_ImagePtr: dw  0
GE_ItemAddr equ $e96
GE_KeyCode equ $e9a
GE_GroupNr equ $e9b
GE_LineNr equ $e9c
GE_CharNr equ $e9d
GE_StartX equ $e9e
GE_StartY equ $e9f
GE_Frequency equ $ea0
GE_DigiSoundType equ $ea1
GE_ScreenLines equ $ea2
GE_VertSyncPos equ $ea3
GE_AnimType equ $ea4
GE_ScrollDirection equ $ea7
GE_Text: dw  0
GE_Sprite_this: dw  0
GE_Image_this: dw  0
GE_List_this: dw  0
Pumpa_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/Pumpa.bin"
end_incbin_Pumpa_Data:
Talaj1_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/talaj1.bin"
end_incbin_Talaj1_Data:
Keret_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/keret.bin"
end_incbin_Keret_Data:
Pumpa:
	org Pumpa+39
Talaj1:
	org Talaj1+39
Keret:
	org Keret+39
CharSet:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/CharSetGR4.bin"
end_incbin_CharSet:
	; Declaring string asmz80
CashStr:		db	"CASH$:"
	db	0
	; Declaring string asmz80
PosStr:		db	"POZ-X:   POZ-Y:"
	db	0
Keret_X_ScreenPOS:	db	$1d
Keret_Y_ScreenPOS:	db	$80
Keret_X_Pos:	db	$0f
Keret_Y_Pos:	db	$09
Map:	 ds 540
MapPos:	dw	0
MapRefreshKezd:	dw	0
MapRefreshY:	db	$01
Drill_Cash:	db	0
PumpaMap:	db	$01
Talaj1Map:	db	$0a
	; ***********  Defining procedure : GE_Sprite_Init
	;    Procedure type : User-defined procedure
 ; Temp vars section
 ; Temp vars section ends
GE_Sprite_Init_block2:
GE_Sprite_Init:
          ;// Init Sprite class
          ld  IX,[GE_Sprite_this]			;// IX -> Sprite class
          ld  (IX+0),1								;// this.Visible = True
			    ;// init sprite width, height, sprite bitmap and mask
			    ld  HL,[GE_ImagePtr]
			    ld  A,(HL)									;// A = sprite type
			    ld  (IX+1),A                ;// this.SpriteType = A
			    inc HL
			    ld  A,(HL)									;// A = sprite width
			    ld  (IX+11),A               ;// this.Width = A
			    inc HL
			    ld  A,(HL)									;// A = sprite height
			    ld  (IX+12),A               ;// this.Height = A
			    inc HL
			    ld  (IX+2),L
			    ld  (IX+3),H                ;// this.Data = HL
			    ld  (IX+4),0
			    ld  (IX+5),0                ;// this.Background := 0
			    ld  (IX+10),0               ;// this.RedrawIsRequired := False
			    ld  (IX+27),0               ;// this.UseBackground := False;
			    ld  (IX+28),0               ;// this.GroupNr := 0;
			    ld  (IX+33),0               ;// this.Mirrored := False;
					;// calc Size -> this.Size := this.Width * this.Height;
					ld  D,0
					ld  E,(IX+12)								;// DE: this.Height
					ld  HL,0
					ld  B,(IX+11)								;// B: this.Width
			spr_init_calc_spr_size:
			    add HL,DE               		;// HL += this.Height
			    djnz spr_init_calc_spr_size
			    ld  (IX+13),L
			    ld  (IX+14),H								;// this.Size = HL
			    ld  (GE_Size),HL			      ;// Size := HL - for TRSE bug fix
			    ;// calc ToNextRow -> this.ToNextRow := SCREEN_WIDTH - this.Width;
			    ld  A,GE_SCREEN_WIDTH   		;// A: SCREEN_WIDTH
			    sub (IX+11)            			;// A = SCREEN_WIDTH - this.Width
			    ld  (IX+19),A			      		;// this.ToNextRow := SCREEN_WIDTH - this.Width;
			    ;// set sprite X, Y
			    ld  A,[GE_X]
			    ld  (IX+15),A	              ;// this.X = X
			    ld  A,[GE_Y]
			    ld  (IX+16),A	              ;// this.Y = Y			   
			    call GE_Sprite_SetPosition
			    ;// update last position
			    ld  A,(IX+6)	;// A = Lo(Position)
					ld  (IX+8),A	;// Lo(LastPosition) = A
					ld  A,(IX+7)  ;// A = Hi(Position)
					ld  (IX+9),A  ;// Hi(LastPosition) = A
					ld  A,[IX+15] ;// A = X
					ld  (IX+17),A ;// LastX := X
					ld  A,[IX+16] ;// A = Y
					ld  (IX+18),A ;// LastY := Y
			    ;// add sprite to SpriteList
			    ld  HL,(GE_LastSpritePtr)
			    inc HL
			    inc HL
			    ld  (GE_LastSpritePtr),HL		;// LastSpritePtr := LastSpritePtr + 2
			    ld  DE,[GE_Sprite_this]
			    ld  (HL),E
			    inc HL
			    ld  (HL),D									;// LastSpritePtr^ := this
			    ld  HL,GE_SpriteCount
			    inc (HL)									  ;// Inc(SpriteCount)
			    ;// ========================================================
          ;// Allocating a buffer to save the background of the sprite
          ;// ========================================================
			    ld  A,[GE_GetBackgroundBuffer]
			    or  A                      	;// GetBackgroundBuffer = False?
			    jp  z,spr_init_end
			    ;// if (MemAllocPage = 0)
			    ld  A,(GE_MemAllocPage)
			    or  A                      	;// MemAllocPage = 0?
			    jr  nz,spr_init_alloc_background
			    ;// if (FreeMemSize < Size) then
			    ld  BC,(GE_Size)						;// DE = sprite.Size
			    ld  HL,(GE_FreeMemSize)			;// HL = FreeMemSize
					or  A 											;// clear carry flag
					sbc HL,BC
					add HL,BC
					;// if HL equals BC: 				Z=1, C=0
					;// if HL is less than BC: 	Z=0, C=1
					;// if HL is more than BC: 	Z=0, C=0
					jr  z,spr_init_alloc_background
					jr  nc,spr_init_alloc_background
					;// set MemAllocPtr
					ld  HL,4096
					ld  (GE_FreeMemSize),HL			;// FreeMemSize := 4096
					;// if (UseBackScreen) 
					ld  A,(GE_UseBackScreen)
			    or  A                      	;// UseBackScreen = false?
			    jr  z,spr_init_not_use_backscreen
			    ;// UseBackScreen = true
			    ld  A,2
			    ld  (GE_MemAllocPage),A    	;// MemAllocPage := 2
			    ld  HL,$BFFF; 							;// HL = top of the Page #2 (49151)
			    ld  (GE_MemAllocPtr),HL			;// MemAllocPtr	:= $BFFF;
			    jp 	spr_init_alloc_background			    
			    ;// else
			spr_init_not_use_backscreen:
					;// UseBackScreen = false
			    ld  A,3
			    ld  (GE_MemAllocPage),A    	;// MemAllocPage := 3
			    ;// if Peek(2842) = 191
			    ld  A,($0B1A)               ;// A = high byte of HI_MEM system variable 
			    cp  191
			    jr  nz,spr_init_set_page1_top
			    ld  HL,$FFFF  							;// top of the Page #3 (65535)
			    ld  (GE_MemAllocPtr),HL			;// MemAllocPtr	:= $FFFF;
			    jp 	spr_init_alloc_background
			    ;// else			    
			spr_init_set_page1_top:
					ld  A,1
			    ld  (GE_MemAllocPage),A    	;// MemAllocPage := 1
			    ld  HL,$7FFF  							;// top of the Page #1 (32767)
			    ld  (GE_MemAllocPtr),HL			;// MemAllocPtr	:= $7FFF;
			spr_init_alloc_background:
			    ;// if (FreeMemSize >= Size) 
					ld  BC,(GE_Size)            ;// BC = sprite.Size
			    ld  HL,(GE_FreeMemSize)			;// HL = FreeMemSize
					or  A 											;// clear carry flag
					sbc HL,BC
					add HL,BC
					jp  c,spr_init_end					;// if HL is less than BC: Z=0, C=1
					;// allocating a buffer to save the background of the sprite
					;// FreeMemSize := FreeMemSize - Size;
					ld  BC,(GE_Size)            ;// BC := Size
					ld  HL,(GE_FreeMemSize)     ;// HL := FreeMemSize
					or  A                  			;// clear carry flag
					sbc HL,BC					          ;// HL := FreeMemSize - Size
					ld  (GE_FreeMemSize),HL   	;// FreeMemSize := FreeMemSize - Size;
					;// MemAllocPtr := MemAllocPtr - Size;
					ld  HL,(GE_MemAllocPtr)     ;// HL := MemAllocPtr
					or  A                  			;// clear carry flag
					sbc HL,BC					          ;// HL := MemAllocPtr - Size
					ld  (GE_MemAllocPtr),HL   	;// MemAllocPtr := MemAllocPtr - Size;
					;// this.Background := MemAllocPtr;
					ld  IX,[GE_Sprite_this]			;// IX -> Sprite class
					ld  (IX+4),L
					ld  (IX+5),H              	;// this.Background := MemAllocPtr;					
				  ld  (IX+27),1 							;// this.UseBackground := true;
			spr_init_end:
					
	ret
end_procedure_GE_Sprite_Init:
	; Sprite.ScrollFastDraw *
; //		Maszkolt (átlátszó hátterű) sprite kirakása a hátterének elmentésével<br/>
; //    <br/>
; //		Digitális hangeffekt lejátszása mellett is használható.<br/>
; //		<br/>
; //    Példa a használatára:<br/>    
; //	  var<br/>
; //			Player : GE::Sprite;<br/>
; //		begin<br/>			  
; //		  Player.Init(#SpriteBitmap, 4, 20, True);<br/>
; //		  Player.X := 30;<br/>
; //		  Player.Y := 100;<br/>		  
; //		  Player.SetPosition();<br/>
; //		  Player.Draw;<br/>	
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Save sprite's background and draws masked sprite to the screen.<br/> 
; //		It does not use the SP register or disable interrupts.<br/> 
; //		<br/>
; //    Example:<br/>
; //		var<br/>
; //			Player : GE::Sprite;<br/>
; //		begin<br/>			  
; //		  Player.Init(#SpriteBinData, 4, 20, True);<br/>
; //		  Player.X := 30;<br/>
; //		  Player.Y := 100;<br/>		  
; //		  Player.SetPosition();<br/>
; //		  Player.Draw;<br/>	
; //		*
	; ***********  Defining procedure : GE_Sprite_Draw
	;    Procedure type : User-defined procedure
GE_Sprite_Draw:
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
	    draw_sprite:
	        ld  H,0
	        ld  L,(IX+19)    ;// HL = Sprite.ToNextRow (SCREEN_WDITH - Sprite.Width)
	        ld  (draw_next_row+1),HL ;// self-modifying code: ld BC,10 -> ld BC,SCREEN_WDITH - Sprite.Width
	        ld  L,(IX+2)
	        ld  H,(IX+3)     ;// HL -> sprite mask and image
	        ld  C,(IX+4)
			    ld  B,(IX+5)     ;// BC -> Sprite.Background		      
	        ld  E,(IX+6)
			    ld  D,(IX+7)     ;// DE -> Sprite.Position
			    ld  A,(IX+11)    ;// A: Sprite.Width
	        ld  IYL,A        ;// IYL: Sprite.Width
			    ld  A,(IX+12)    ;// A: Sprite.Height
	        ld  IXL,A        ;// IXL: Sprite.Height
			draw_spr:
				  ld  IYH,IYL      ;// IXH: sprite width
			draw_spr_row:
	        ld  A,(DE)       ;// A: screen byte
	        ld (BC),A        ;// save the background of the sprite
	        inc BC           ;// BC -> next byte on the background buffer
	        and (HL)         ;// and mask
	        inc HL           ;// HL -> sprite image byte
	        or  (HL)         ;// or sprite
	        inc HL           ;// HL -> next mask byte
	        ld  (DE),A       ;// put the mixed sprite byte to the screen
	        inc DE					 ;// DE -> next byte on the screen
	        dec IYH          ;// decrement remaining bytes from the sprite width
	        jp  nz,draw_spr_row ;// continue if the remaining bytes is not zero
	        push BC
	        ex  DE,HL
			draw_next_row:
	        ld  BC,10        ;// will be overwritten with the required value (SCREEN_WDITH - Sprite.Width)
	        add HL,BC	        
	        ex  DE,HL        ;// DE -> next line on the screen
	        pop BC
	        dec IXL          ;// decrement remaining rows from the sprite height
	        jp  nz,draw_spr  ;// continue if the remaining rows is not zero
	        
	ret
end_procedure_GE_Sprite_Draw:
	; Sprite.SetBackground *
; //	  Elmenti a sprite hátterét<br/>
; //    <br/>
; //    Leginkább a játék pályájának kirajzolása után, egy első, inicializáló háttér mentéshez érdemes használni.<br/>
; //    Több sprite esetén praktikusabb a GE::SaveAllSpritesBackground() eljárás használata.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //		begin<br/>
; //		  Player.Init(#PlayerBitmap, 0, 0, False);<br/>
; //		  Player.SaveBackground();<br/>
; //		end;<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //	  Saves the background of the sprite to the background buffer.<br/>
; //	  *
	; ***********  Defining procedure : GE_Sprite_SaveBackground
	;    Procedure type : User-defined procedure
GE_Sprite_SaveBackground:
													  		
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
	        ld  E,(IX+4)
			    ld  D,(IX+5)         ;// DE -> Sprite.Backgound
			    ld  A,(IX+11)        ;// A: sprite width
			    ld  (save_spr_bg+1),A ;// self-modifying code: ld C,10 -> ld C,Sprite.Width
			    ld  A,(IX+19)        ;// A = SCREEN_WDITH - Sprite.Width (value for new row)
			    ld  (save_spr_bg_next_row+1),A ;// self-modifying code: ld C,20 -> ld C,SCREEN_WDITH - Sprite.Width
			    ld  A,(IX+12)        ;// A: sprite height
			    ld  L,(IX+6)
			    ld  H,(IX+7)         ;// HL -> Sprite.Position
			    ld  B,0
				save_spr_bg:
	        ld  C,10             ;// BC = Width (will be overwritten with the Sprite.Width value -> ld C,Width)
	        ldir                 ;// copy a sprite background row to the background buffer
				save_spr_bg_next_row:
					ld  C,20             ;// will be overwritten with the required value (SCREEN_WDITH - Sprite.Width)
					add HL,BC						    ;// HL -> next line on the screen
					dec A                ;// decrement remaining rows from the sprite height
					jp  nz,save_spr_bg   ;// continue if the remaining rows is not zero
					
	ret
end_procedure_GE_Sprite_SaveBackground:
	; Sprite.ScrollSaveBackground *
; //		Visszamásolja a képernyőre a sprite korábban elmentett hátterét.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //    GE::WaitForSync();<br/>
; //    PlayerSprite.RestoreBackground();<br/>
; //    PlayerSprite.MoveUp();<br/>
; //    PlayerSprite.SaveBackground();<br/>
; //    PlayerSprite.Put();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Restores the background of the sprite<br/>
; //    Copy the sprite's saved background back to the screen.<br/>
; //		*
	; ***********  Defining procedure : GE_Sprite_RestoreBackground
	;    Procedure type : User-defined procedure
GE_Sprite_RestoreBackground:
		          
		      ld  IX,[GE_Sprite_this]	;// IX -> Sprite class          
		      ld  A,(IX+19)        ;// A = SCREEN_WDITH-Sprite.Width (value for new row)
		      ld  (restore_spr_bg_next_row+1),A ;// self-modifying code: ld C,10 -> ld C,SCREEN_WDITH-Sprite.Width
		      add A,A               ;// A = 2*(SCREEN_WDITH-Sprite.Width)
		      ld  B,0
					ld  C,A	              ;// BC = 2*(SCREEN_WIDTH-Sprite.Width)
					ld  HL,restore_spr_bg_ldi
					add HL,BC							;// HL -> restore_spr_bg_ldi + 2*(SCREEN_WIDTH-Sprite.Width) => for jump out (SCREEN_WIDTH-Sprite.Width) x LDI instruction
		      ld  (restore_spr_bg_jump+1),HL     ;// self-modifying code: overwrite address of jp restore_spr_bg_ldi
		  		ld  (restore_spr_bg_loop_end+1),HL	;// self-modifying code: overwrite address of jp nz,restore_spr_bg_ldi		      
		      ld  L,(IX+4)
		      ld  H,(IX+5)				 ;// DE -> Sprite.Backgound
		      ld  E,(IX+8)
		      ld  D,(IX+9)				 ;// DE -> Sprite.LastPosition
		      ld  A,(IX+12)        ;// A: sprite height
 		  restore_spr_bg_jump:
		      jp  restore_spr_bg_ldi ;// jump to the first LDI instruction for putting a sprite row
			restore_spr_bg_ldi:
					repeat 64
					ldi
					repend	
					ex  DE,HL
			restore_spr_bg_next_row:
					ld  C,10             ;// will be overwritten with the required value (SCREEN_WDITH - Sprite.Width)
					add HL,BC						 
					ex  DE,HL						 ;// DE -> next line on the screen
					dec A                ;// decrement remaining rows from the sprite height
			restore_spr_bg_loop_end:		
					jp  nz,restore_spr_bg_ldi;// continue if the remaining rows is not zero
					
	ret
end_procedure_GE_Sprite_RestoreBackground:
	; Sprite.ScrollRestoreBackground *
; //	  NEM maszkolt (NEM átlátszó hátterű) sprite kirakása a képernyőre.<br/>
; //    Hosszabb, de gyorsabb kirakó eljárás. Lásd még a SmallPut eljárást, ami rövidebb, de kicsitvel lassabb.<br/>
; //    <br/>
; //		Digitális hangeffekt lejátszása mellett is használható.<br/>
; //		<br/>
; //    Példa a használatára:<br/>    
; //	  var<br/>
; //			Player : GE::Sprite;<br/>
; //		begin<br/>			  
; //		  Player.Init(#PlayerBitmap, 0, 0, False);<br/>
; //		  Player.X := 30;<br/>
; //		  Player.Y := 100;<br/>		  
; //		  Player.SetPosition();<br/>
; //		  Player.Put();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Put sprite to screen by overwrite mode. Faster but larger Put method.<br/> 
; //		<br/>
; //		*
	; ***********  Defining procedure : GE_Sprite_Put
	;    Procedure type : User-defined procedure
GE_Sprite_Put:
													  		
		      ld  IX,[GE_Sprite_this]	;// IX -> Sprite class		      
		      ld  A,(IX+19)       	;// A = SCREEN_WIDTH - Sprite.Width (value for new row)
		      ld  (put_spr_next_row+1),A ;// self-modifying code: ld BC,20 -> ld BC,SCREEN_WDITH-Sprite.Width
		      add A,A               ;// A = 2*(SCREEN_WDITH-Sprite.Width)
		      ld  B,0
					ld  C,A	              ;// BC = 2*(SCREEN_WIDTH-Sprite.Width)
					ld  HL,put_spr_ldi ;// HL -> fastput_64_ldi
					add HL,BC							;// HL -> fastput_64_ldi + 2*(SCREEN_WIDTH-Sprite.Width) => for jump out (SCREEN_WIDTH-Sprite.Width) x LDI instruction
		      ld  (put_spr_jump+1),HL     ;// self-modifying code: overwrite address of jp put_spr_ldi
		  		ld  (put_spr_loop_end+1),HL	;// self-modifying code: overwrite address of jp nz,put_spr_ldi
		      ld  L,(IX+2)
		      ld  H,(IX+3)        	;// HL -> Sprite.Data (sprite bitmap)
		      ld  E,(IX+6)
		      ld  D,(IX+7)         	;// DE -> sprite.Position
		      ld  A,(IX+12)       	;// A: sprite height
		  put_spr_jump:
		      jp  put_spr_ldi       ;// jump to the first LDI instruction for putting a sprite row
		  put_spr_ldi:
		      repeat 64
					ldi
					repend					         	
         	ex  DE,HL
			put_spr_next_row:
         	ld  BC,20             ;// will be overwritten with the required value (SCREEN_WDITH - Sprite.Width)
         	add HL,BC
         	ex  DE,HL            	;// DE -> new line on the screen
         	dec A                	;// decrement remaining rows from the sprite height
      put_spr_loop_end:
         	jp  nz,put_spr_ldi    ;// continue if the remaining height is not zero
					
	ret
end_procedure_GE_Sprite_Put:
	; Sprite.CopyToScreen *
; //		A sprite X, Y pozíciója alapján kiszámolja a sprite képernyőpizícióját.<br/>
; //    <br/>
; //    Több sprite használata esetén érdemesebb a GE::RenderAllSprites() eljárást használni, ami egy lépésben elvégez mindent a sprite-ok kirakásával kapcsolatban.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //	  var<br/>
; //			Player : GE::Sprite;<br/>
; //		begin<br/>			  
; //		  Player.Init(#SpriteBinData, 0, 0, True);<br/>
; //		  Player.X := 30;<br/>
; //		  Player.Y := 100;<br/>		  
; //		  Player.SetPosition();<br/>
; //		  Player.Draw();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Adjust the sprite's screen position using the sprite's X and Y values.<br/> 
; //		*
	; ***********  Defining procedure : GE_Sprite_SetPosition
	;    Procedure type : User-defined procedure
GE_Sprite_SetPosition:
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
	        xor A
	        ld  H,A        ;// H = 0
	        ld  L,(IX+16)  ;// HL = Sprite.Y
	        srl H
	        rr  L
	        rra
	        srl H
	        rr  L
	        rra
	        ld  H,L
	        ld  L,A        ;// HL = Y * 64
	        ld  BC,(GE_ScreenAddr) ;// BC -> screen start address
	        add HL,BC      ;// HL = screen start + (Y * 64)
	        ld  A,(IX+15)  ;// A  = Sprite.X
	        ld  B,0				
	        ld  C,A        ;// BC = X
	        add HL,BC      ;// HL -> screen start address + (Y * 64) + X
	        ld  (IX+6),L
	        ld  (IX+7),H   ;// Sprite.Position := HL
	        
	ret
end_procedure_GE_Sprite_SetPosition:
	; Sprite.SetPosition *
; //		Beállítja a sprite utolsó pozícióját.<br/>
; //    <br/>
; //    A sprite X, Y és Position változóit értékül adja a LastX, LastY, és LastPosition változóknak.<br/>
; //    A sprite RestoreBackground() és CopyToScreen() eljárásai ezek a változók alapjn másolják vissza a sprite mögötti hátteret.<br/>
; //    Az alábbi esetekben érdemes használni:<br/> 
; //    1. Ha a sprite RestoreBackground és FastDraw/Draw/Put eljárásait használjuk a GE::RenderAllSprites() helyett.<br/>
; //    2. Ha a sprite CopyToScreen eljárását használjuk a GE::CopyAllSpritesToScreen() eljárás helyett.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //	  Sprite.RestoreBackground;<br/>
; //		Sprite.Draw;<br/>
; //		Sprite.UpdateLastPos;<br/>
; //		<br/>
; //		vagy<br/>
; //		<br/>
; //		Sprite.RestoreBackground;<br/>
; //		Sprite.SaveBackground;<br/>
; //		Sprite.Put;<br/>
; //		Sprite.UpdateLastPos;<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Updates the last position of sprite with the current position.<br/> 
; //		It does this:<br/>
; //		Sprite.LastPosition := Sprite.Position;<br/>
; //		Sprite.LastX := Sprite.X;<br/>
; //		Sprite.LastY := Sprite.Y;<br/>
; //		<br/>
; //		It should be called when:<br/> 
; //    1. If you render your sprites using RestoreBackground and FastDraw/Draw/Put instead of RenderAllSprites.<br/>
; //    2. If you copy your sprites from BackScreen to screen using CopyToScreen instead of using the CopyAllSpritesToScreen.<br/>
; //		<br/>
; //		*
	; ***********  Defining procedure : GE_Sprite_UpdateLastPos
	;    Procedure type : User-defined procedure
GE_Sprite_UpdateLastPos:
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
	        ld  A,(IX+6)  ;// A = Lo(Position)
	        ld  (IX+8),A  ;// Lo(LastPosition) = A
	        ld  A,(IX+7)  ;// A = Hi(Position)
	        ld  (IX+9),A  ;// Hi(LastPosition) = A
	        ld  A,[IX+15] ;// A = X
	        ld  (IX+17),A ;// LastX := X
	        ld  A,[IX+16] ;// A = Y
	        ld  (IX+18),A ;// LastY := Y
					
	ret
end_procedure_GE_Sprite_UpdateLastPos:
	; ***********  Defining procedure : GE_Sprite_InitAnimation
	;    Procedure type : User-defined procedure
GE_Sprite_InitAnimation_block9:
GE_Sprite_InitAnimation:
			    ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
				  ld  L,(IX+2)
				  ld  H,(IX+3)            ;// HL -> this.Data
				  ld  (IX+20),L
				  ld  (IX+21),H           ;// this.AnimSet = this.Data
				  ld  A,[GE_AnimPhaseCount]
				  ld  (IX+23),A           ;// this.AnimPhaseCount = GE_AnimPhaseCount
				  ld  (IX+24),A           ;// this.AnimPhaseNr = GE_AnimPhaseCount
				  ld  A,[GE_AnimDelay]
				  ld  (IX+29),A           ;// this.AnimDelay = AnimDelay
				  ld  (IX+30),A           ;// this.AnimDelayCountdown = AnimDelay				  
				  xor A                   ;// A = 0
				  ld  (IX+26),A           ;// this.AnimDirection = 0 (forward)
				  ld  (IX+25),0           ;// this.WasAnimated = False
				  ld  A,[GE_AnimType]
				  ld  (IX+22),A           ;// this.AnimType = GE_AnimType
				  cp  GE_LOOP_BACKWARD		;// this.AnimType = LOOP_BACKWARD?
				  ret nz		              ;// if not then return to caller
				  ;// calc LastAnimSprite address (HL -> this.AnimSet - the first anim sprite)
				  ex  DE,HL               ;// DE -> this.AnimSet
					ld  L,(IX+13)
			    ld  H,(IX+14)           ;// HL = this.Size
			    ld  A,(IX+1)            ;// A = this.SpriteType
			    dec A                   ;// if A = 0 then SpriteType is none masked sprite
			    jp  z,calc_last_anim_spr_init
			    add HL,HL               ;// HL = 2*this.Size (sprite + mask)
			calc_last_anim_spr_init:
			    ex  DE,HL               ;// HL -> this.AnimSet; DE = anim sprite size
					ld  A,[GE_AnimPhaseCount]
					dec A
					ld  B,A                 ;// B = AnimPhaseCount - 1
			calc_last_anim_spr_loop:
					add HL,DE               ;// HL -> next anim sprite
				  djnz calc_last_anim_spr_loop
				  ld  (IX+31),L
				  ld  (IX+32),H           ;// this.LastAnimSprite = HL
				  ld  (IX+2),L
				  ld  (IX+3),H            ;// this.Data = HL
					
	ret
end_procedure_GE_Sprite_InitAnimation:
	; InitAnimation *
; //		Sprite animáció<br/>
; //    <br/>
; //    A sprite következő animációs fázisát állítja be. Az utolsó animációs fázis után ismét az elsőt állítja be.<br/>
; //  	<br/>
; //  	Példa a használatára:<br/>
; //  	PlayerSprite.Animation();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Sets the next phase of the sprite animation.<br/>
; //    The animation is set to the beginning if it has reached the end.<br/>
; //    <br/>
; //		Example:<br/> 
; //		PlayerSprite.Animation();<br/> 
; //		<br/>
; //		*
	; ***********  Defining procedure : GE_Sprite_Animation
	;    Procedure type : User-defined procedure
GE_Sprite_Animation:
			    ld  IX,[GE_Sprite_this]	;// IX -> Sprite class				    
				  dec (IX+30)             ;// Dec(this.AnimDelayCountdown)
			    ret nz                  ;// if this.AnimDelayCountdown > 0 then return to the caller
			    ld  A,(IX+29)           ;// A = this.AnimDelay
			    ld  (IX+30),A           ;// this.AnimDelayCountdown = this.AnimDelay (reset)
			    ld  (IX+25),1           ;// this.WasAnimated = True
			    ld  A,[IX+22]						;// A = this.AnimType
			    cp  GE_LOOP_PINGPONG    ;// this.AnimType == LOOP_PINGPONG?
			    jp  z,spr_anim_pingpong
			    cp  GE_LOOP_BACKWARD    ;// this.AnimType == LOOP_BACKWARD?
			    jp  z,spr_anim_backward
			    ;// LOOP_FORWARD
			    dec (IX+24)             ;// Dec(this.AnimPhaseNr)
			    jp  z,spr_anim_reset    ;// if this.AnimPhaseNr == 0 then jump
			set_next_anim_spr:    
			    ld  C,(IX+13)
			    ld  B,(IX+14)           ;// BC = this.Size
			    ld  L,(IX+2)
			    ld  H,(IX+3)            ;// HL = this.Data (sprite + mask)
			    add HL,BC               ;// HL -> the next anim sprite without mask
			    ld  A,(IX+1)            ;// A = this.SpriteType
			    dec A
			    jp  z,spr_anim_save_phase
			    add HL,BC               ;// HL -> the next anim sprite with mask
			spr_anim_save_phase:
			    ld  (IX+2),L
			    ld  (IX+3),H            ;// this.Data = the next anim sprite
			    ret                     ;// return to the caller
			spr_anim_reset:
			    ld  L,(IX+20)
			    ld  H,(IX+21)           ;// HL = this.AnimSet (the first sprite of the animation)
			    ld  (IX+2),L
			    ld  (IX+3),H            ;// this.Data = the first anim sprite
			    ld  A,(IX+23)           ;// this.AnimPhaseCount
			    ld  (IX+24),A           ;// this.AnimPhaseNr = this.AnimPhaseCount
			    ret			    
			    ;// LOOP_BACKWARD
			spr_anim_backward:
			    dec (IX+24)             ;// Dec(this.AnimPhaseNr)
			    jp  nz,spr_anim_to_back ;// if this.AnimPhaseNr <> 0 then jump
			spr_anim_backward_reset:
			    ld  L,(IX+31)
			    ld  H,(IX+32)           ;// HL = this.LastAnimSprite (the last sprite of the animation)
			    ld  (IX+2),L
			    ld  (IX+3),H            ;// this.Data = the last anim sprite
			    ld  A,(IX+23)           ;// this.AnimPhaseCount
			    ld  (IX+24),A           ;// this.AnimPhaseNr = this.AnimPhaseCount
			    ret
          ;// LOOP_PINGPONG
			spr_anim_pingpong:
					dec (IX+24)             ;// Dec(this.AnimPhaseNr)
					jp  nz,spr_anim_by_direction ;// if this.AnimPhaseNr <> 0 then jump
					;// if this.AnimPhaseNr == 0
					ld  A,(IX+26)           ;// A = this.AnimDirection
					or  A
					jp  z,spr_anim_set_dir_back  ;// if this.AnimDirection == 0 then jump
					;// switch anim direction to forward
					ld  (IX+26),0           ;// this.AnimDirection = forward (0)
					ld  A,(IX+23)           ;// this.AnimPhaseCount
					dec A                   ;// A = this.AnimPhaseCount - 1
			    ld  (IX+24),A           ;// this.AnimPhaseNr = this.AnimPhaseCount
			    jp  set_next_anim_spr	  ;// jump to set the next anim sprite
			spr_anim_set_dir_back:
					;// switch anim direction to back
			    ld  (IX+26),1           ;// this.AnimDirection = back (1)
					ld  A,(IX+23)           ;// A = this.AnimPhaseCount
					dec A                   ;// A = this.AnimPhaseCount - 1
			    ld  (IX+24),A           ;// this.AnimPhaseNr = this.AnimPhaseCount - 1
			    jp  spr_anim_to_back
			spr_anim_by_direction:
					ld  A,(IX+26)           ;// A = this.AnimDirection
			    or  A										;// this.AnimDirection == 0?
			    jp  z,set_next_anim_spr	;// jump to set the next anim sprite
			spr_anim_to_back:
			    ld  C,(IX+13)
			    ld  B,(IX+14)           ;// BC = this.Size
			    ld  L,(IX+2)
			    ld  H,(IX+3)            ;// HL = this.Data (sprite + mask)
			    or  A                   ;// clear carry flag for SBC instruction
			    sbc HL,BC               ;// HL -> the prev anim sprite without mask
			    ld  A,(IX+1)            ;// A = this.SpriteType
			    dec A
			    jp  z,spr_anim_save_phase ;// if this.SptiteType == 1 then jump
			    or  A                   ;// clear carry flag for SBC instruction
			    sbc HL,BC               ;// HL -> the next anim sprite with mask
			    ld  (IX+2),L
			    ld  (IX+3),H            ;// this.Data = the prev anim sprite
					
	ret
end_procedure_GE_Sprite_Animation:
	; List.Clear  List class ================================================
; //          M E M O R Y   M A P P I N G 
; //          
; //  TV-Computer has 32 KB or 64 KB RAM models
; //  and 16 KB VIDEO RAM (or 4x16 KB on 64k+ model)
; //	and with 20 KB ROM, of which 16 KB can be mapped.
; //  4x16 KB memory pages can be used and addressed at
; //  the same time.
; //  
; //	U0, U1, U2, U3 - user RAM (4 x 16 KB)
; //	VID  - video RAM (16 KB)
; //	SYS  - system ROM (16 KB)
; //	CART - external cartridge (max. 16 KB)
; //	EXT  - memory on external card (max. 16 KB)
; //=================================================*
; //Memória lapozás beállítása<br/>
; //<br/>
; //Paraméterek:
; //<ul>
; //<li>MEM_DEFAULT : U0, U1, U2,  SYS</li>
; //<li>MEM_VID_ON  : U0, U1, VID, SYS</li>
; //<li>MEM_FULL_64K: U0, U1, U2,  U3</li>
; //<li>MEM_48K_VID : U0, U1, VID, U3</li>
; //<li>vagy bármilyen egyéb numerikus érték (0-255), amiket például az Operációs Rendszer könyvből ki lehet nézni.</li>
; //</ul>
; //<br/>
; //A memória 16 kbyte-os  lapokból áll. Ezek jelölése:<br/>
; //U0,U1,U2,U3: felhasználói memória (RAM); VID: VIDEORAM; SYS: sysem ROM<br/>
; //<br/>
; //Például a VIDEORAM belapozása:<br/>
; //GE::SetMemory(GE::MEM_VID_ON);<br/>
; //<br/>
; //vagy a teljes 64k RAM belapozása:<br/>
; //GE::SetMemory(GE::MEM_FULL_64K);<br/>
; //<br/>
; //vagy 48k RAM + VIDEORAM belapozása (U0,U1,VID,U3):<br/>
; //GE::SetMemory(GE::MEM_48K_VID);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Set memory mapping<br/>
; //Params:
; //<ul>
; //<li>MEM_DEFAULT : U0, U1, U2,  SYS</li>
; //<li>MEM_VID_ON  : U0, U1, VID, SYS</li>
; //<li>MEM_FULL_64K: U0, U1, U2,  U3</li>
; //<li>MEM_48K_VID : U0, U1, VID, U3</li>
; //<li>or any other value</li>
; //</ul>
; //<br/>
; //16K pages:<br/>
; //U0-U3: user memory; VID: video RAM; SYS: sysem ROM<br/>
; //<br/>
; //Example: GE::SetMemory(GE::MEM_VID_ON);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_SetMemory
	;    Procedure type : User-defined procedure
GE_SetMemory_block11:
GE_SetMemory:
	    ld  A,[GE_Mode]
			ld  ($3),A
			out ($2),A
	    
	ret
end_procedure_GE_SetMemory:
	; EnableTVCITHandler *
; //A TV-Computer rendszer megszakítás-kezelő letiltása<br/>
; //Más szavakkal: beállítja a Game Engine saját megszakítás-kezelőjét a TVC eredeti megszakítás-kezelője helyett.<br/>
; //<br/>
; //A GE::Init() eljárás automatikusan meghívja ezt az eljárást, mert a rendszer megszakítás-kezelő sok olyan műveletet végez, ami csak lassítja a programot, de egy játékhoz általában nincs szükség ezekre.<br/>
; //A Game Engine megszakítás-kezelője nem tölti fel a billentyűzet mátrixot, ezért ilyenkor minden billentyűzet lekérdezés előtt meg kell hívni a GE:Getkeyboard() eljárást.<br/>
; //<br/>
; //Ha a program futásához mégis szükség lenne az eredeti megszakítás-kezelő működésére, akkor az a GE::EnableTVCITHandler() eljárással visszaállítható.<br/>
; //<br/>
; //Példa a használatra:<br/>
; //GE::DisableTVCITHandler();
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Disable the TV-Computer's Interrupt Handler<br/>
; //<br/>
; //The Game Engine's Init calls this procedure.<br/>
; //This procedure redirects the Interrupt Handler to the Game Engine's minimal functionality interrupt handler.<br/>
; //<br/>
; //You can save CPU time with this. You can save up to 1-2 sprites drawing time every screen refresh by disabling the TV-Computer's interrupt handler.
; 

	; ***********  Defining procedure : GE_DisableTVCITHandler
	;    Procedure type : User-defined procedure
GE_DisableTVCITHandler:
			di										;// disable interruptsű
			ld	HL,$38						;// HL -> start address of System Interrupt Handler
			;// Overwrite the first 3 bytes of the TVC Interrupt Handler
			;// to redirect it to its own interrupt handler
			ld	(HL),195					;// 195: JP
			ld  DE,GE_IT_HANLDER
			inc	HL
			ld	(HL),E
			inc	HL
			ld	(HL),D 						;// $38: JP IT_HANLDER
			ei			
	    ret
	    ;// The Game Engine minimal Interrupt Handler
	GE_IT_HANLDER:
			out	($7),A	          ;// reset interrupt
			ei              			;// enable interrupts
			ret
			
	ret
end_procedure_GE_DisableTVCITHandler:
	; DisableTVCITHandler ===============================================
; //                  I N I T                           
; //===============================================*
; //A Game Engine inicializálása<br/>
; //<br/>
; //Minden sprite inicializálást és képernyőre történő műveletet meg kell, hogy előzzön.
; //<br/>
; //Paraméter:<br/>
; //<ul>
; //<li>USE_BACK_SCREEN  - háttér képernyő használata (64k memória szükséges hozzá)</li>
; //<li>DIRECT_TO_SCREEN - direkt a képernyő használata</li>
; //</ul>
; //Háttér képernyő használata esetén a legfelső 16k memórialapot (U3) használja a Game Engine, mint egy másolataként az eredeti képernyőnek. Minden sprite- és image kirakás, és bármilyen képernyőre rajzoló, író művelet a háttér képernyőre fog írni. A háttér képernyőről (Backscreen) külön utasításokkal (sprite.CopyToScreen, GE::CopyBackScreenRectToScreen, GE::CopyBackScreenToSceen) másolhatóak ki ezek a tartalmak a valódi képernyőre.<br/>
; //<br/>
; //Példa a használatra:<br/>
; //GE::Init(GE::DIRECT_TO_SCREEN);<br/>
; //vagy háttér képernyő használata esetén:<br/>
; //GE::Init(GE::USE_BACK_SCREEN);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Init game engine<br/>
; //Param:<br/>
; //<ul>
; //<li>USE_BACK_SCREEN - drawing to the back-screen on memory Page 3 (64K memory required)</li>
; //<li>DIRECT_TO_SCREEN - drawing to the screen</li>
; //</ul>
; //<br/>
; //Example: GE::Init(GE::DIRECT_TO_SCREEN);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_Init
	;    Procedure type : User-defined procedure
GE_Init_block13:
GE_Init:
	
	    ;// init ScreenAddr
	    ld  HL,GE_SCREEN_ADDR
      ld  A,[GE_UseBackScreen]
      or  A
      jr  z,set_screen_addr      
      ;// set memory mapping to U0, U1, U2, U3
      ld  A,$B0
			ld  ($3),A
			out ($2),A
      ld  HL,GE_BACK_SCREEN_ADDR
      ;// set ScreenAddr
  set_screen_addr:
      ld (GE_ScreenAddr),HL
			
	call GE_DisableTVCITHandler
	    ret
	    
	
; // So that the optimizer keeps the SetPosition procedure for the Init method of the Sprite class.
	call GE_Sprite_SetPosition
	ret
end_procedure_GE_Init:
	; CopyBackScreenRectToScreen ================================================
; //  		            S C R E E N 
; //=================================================*
; //Grafikus mód beállítása ROM funkcióval.<br/>
; //<br/>
; //A grafikus mód beállítása mellett a képernyőt is letörli és inicializálja a TVC rendszer szöveg kiíró rutinját.<br/>
; //Paraméterek:
; //<ul>
; //<li>GE::GRAPHICS2:  2 színű mód</li>
; //<li>GE::GRAPHICS4:  4 színű mód</li>
; //<li>GE::GRAPHICS16: 16 színű mód</li>
; //</ul>
; //<br/>
; //Példa a használatára:<br/>
; //GE::SetGraphics(GE::GRAPHICS_16);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Sets graphics mode. 
; //<ul>
; //<li>GRAPHICS2:  512x240  2 color mode (code: 0)</li>
; //<li>GRAPHICS4:  256x240  4 color mode (code: 1)</li>
; //<li>GRAPHICS16: 128x240 16 color mode (code: 2).</li>
; //</ul>
; //<br/>
; //Example: GE::SetGraphics(GE:GRAPHICS_16);<br/>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : GE_SetGraphics
	;    Procedure type : User-defined procedure
GE_SetGraphics_block14:
GE_SetGraphics:
			ld  A,[GE_Mode]
			ld 	C,A 							;// C = graphics mode code
			rst $30 							;// system function call
			db $4 								;// VMODE function code			
			
	ret
end_procedure_GE_SetGraphics:
	; ***********  Defining procedure : GE_SetPalette
	;    Procedure type : User-defined procedure
GE_SetPalette_block15:
GE_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	or a
	jr c, GE_SetPalette_edblock19
GE_SetPalette_localsuccess21: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,GE_SetPalette_edblock19
GE_SetPalette_localsuccess22: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,GE_SetPalette_edblock19
GE_SetPalette_ctb17: ;Main true block ;keep :
				ld A,[GE_Nr]
				ld C,$60
				add A,C
				ld C,A					;// C = $60 + Nr
				ld A,[GE_Color]	;// A = Color code
				out (C),A				;// send Color code to desired palette port
				
GE_SetPalette_edblock19:
	ret
end_procedure_GE_SetPalette:
	;*
; //Képernyőfrissítéshez történő időzítés.<br/>
; //<br/>
; //Várakozás a raster-megszakításra, azaz arra, hogy a képernyőfrissítés a raster-megszakítás pozíciójába érjen, ami alapértelmezetten a képernyő jobb alsó sarka.<br/>
; //Az összes sprite kirakás és egyéb képernyőművelet előtt célszerű meghívni.<br/>
; //<br/>
; //A raster-megszakítás pozíciója a GE::SetRasterInterruptPos eljárással átállítható be.<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::WaitForSync();<br/>
; //GE::RenderAllSprites();<br/>
; //<br/>
; //FIGYELEM! Ha digitális hangeffekt lejátszás inicializálva lett a GE::DigiSoundOn() eljárással, akkor a GE::WaitForDigiSoundSync() eljárást kell helyette használni.<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Waits until a vertical sync (raster-interrupt) has been performed.<br/>
; //Example:<br/>
; //GE::WaitForSync();<br/>
; //GE::RenderAllSprites();<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_WaitForSync
	;    Procedure type : User-defined procedure
GE_WaitForSync:
			halt
			
	ret
end_procedure_GE_WaitForSync:
	;*
; //A raster-megszakítás pozíciójának beállítása<br/>
; //<br/>
; //Megadható, hogy akkor váltódjon ki a raster-megszakítás, amikor a képernyőfrissítés a megadott sor végére ér.<br/>
; //Paraméterek:
; //<ul>
; //<li>LineNr: a képernyősor, aminek a végén a raster-megszakítás kiváltódjon. Értéke 0-239 között lehet.</li>
; //</ul>
; //<br/>
; //Példa a használatára:<br/>
; //
; // Beállítás a 200. sorra:<br/>
; //GE::SetRasterInterruptPos(200);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Set the raster-interrupt position on the screen<br/>
; //Params:
; //<ul>
; //<li>LineNr: 0-239</li>
; //</ul>
; //<br/>
; //Example: GE::SetRasterInterruptPos(200);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_SetRasterInterruptPos
	;    Procedure type : User-defined procedure
GE_SetRasterInterruptPos_block25:
GE_SetRasterInterruptPos:
			ld  A,[GE_LineNr]
		  ld  C,A       ;// C = LineNr
			srl A
			srl A       	;// A = LineNr div 4
			ld  L,A       ;// C = LineNr div 4
			// calc the cursor starting and ending line in the TV line
			add A,A
			add A,A       ;// A = (LineNr div 4)*4
			ld  B,A       ;// B = (LineNr div 4)*4
			ld  A,C       ;// A = LineNr
			sub B         ;// A = LineNr - (LineNr div 4)*4 -> LineNr mod 4
			ld  [GE_CursorIT_TVline],A
			ld  E,A       ;// E = LineNr - int(LineNr/4) <- the cursor starting and ending line in the TV line
			// calc cursor_it position
			xor A         ;// A = 0
			ld  H,A				;// H = 0 -> HL = LineNr div 4 (because L = LineNr div 4)
			srl H                                          
      rr  L                                          
      rra                                             
      srl H                                          
      rr  L                                          
      rra
      ld  H,L                                        
      ld  L,A       ;// HL = (LineNr div 4) * 64
			ld  BC,63     ;// last logical character in the line
      add HL,BC     ;// HL = int(LineNr/4)*64+63
      ld  [GE_CursorITPos],HL
			// sends the calculated values to the CRTC ports
			ld  C,$71     ;// C = port $71
			ld	A,14
			out	($70),A		;// select CRTC R14 register - register of raster-interrupt position high byte
			out	(C),H 		;// send the hight byte of raster-interrupt position to CRTC R14 register
			ld	A,15
			out	($70),A		;// select CRTC R15 register - register of raster-interrupt position low byte
			out	(C),L  		;// send the low byte of raster-interrupt position to CRTC R15 register
			ld	A,10
			out	($70),A		;// select CRTC R10 register - the cursor starting line in the TV line
			out	(C),E 		;// set the cursor starting line (R10) in the TV line
			ld	A,11
			out	($70),A		;// select CRTC R11 register - the cursor ending line in the TV line
			out	(C),E 		;// set the cursor ending line (R11) in the TV line
			ret
			
	ret
end_procedure_GE_SetRasterInterruptPos:
	; ***********  Defining procedure : GE_FillRect
	;    Procedure type : User-defined procedure
GE_FillRect_block26:
GE_FillRect:
				// calc left top pos. on the screen
				ld  A,[GE_Y]      ;// A = param Y
				ld  L,A						;// L = param Y
				xor A             ;// A = 0
				ld  H,A						;// H = 0 -> HL = param Y
 				srl H
 				rr  L
 				rra
 				srl H
 				rr  L
 				rra
 				ld  H,L
 				ld  L,A           ;// HL = Y * 64
				ld 	BC,(GE_ScreenAddr) ;// BC -> screen start address
				add HL,BC					;// HL := screen start + (Y * 64)
				ld  A,[GE_X]			;// A  := X
				ld  B,0				
				ld  C,A						;// BC := X
				add HL,BC					;// HL -> screen start address + (Y * 64) + X -> left top pos. on the screen
				// set Width, Height, Pattern				
        ld  A,[GE_Height] ;// A := Height
				ld  C,A						;// C := Height
				ld  A,[GE_Width]	;// A := Width
				ld  IXL,A					;// IXL := width				
				ld  B,A						;// B := Width
				ld  A,64
				sub B						  ;// A := 64 - Width
				ld  D,0
				ld  E,A						;// DE := 64 - Width
				ld  A,[GE_Pattern];// A := fill pattern byte
				// draw filled rectangle
	fill_rect_lines:			
				ld  B,IXL					;// B := Width
	fill_rect_line:
				ld  (HL),A				;// put a byte to the screen
				inc HL					  ;// HL -> next byte
				djnz fill_rect_line
				add  HL,DE				;// HL -> next line
				dec  C						;// decrement remaining lines
				jp nz,fill_rect_lines
			
	ret
end_procedure_GE_FillRect:
	;================================================
; //    K E Y B O A R D   A N D   J O Y S T I C K 
; //=================================================*
; //A billentyűzet állapotának lekérdezése.<br/>
; //Lekérdezi, hogy melyik gombok vannak lenyomva a két joystick-kel együtt.<br/>
; //Meg kell hívni mielőtt a GE::Pressed vagy a GE::KeyPressed függvényeket használnánk.<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::GetKeyboard();<br/>
; //if (GE::Pressed(GE::KEY_SPACE)) then Fire();<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Get keyboard.<br/>
; //It must be called before using keyboard functions (such as GE::KeyPressed, GE::SpacePressed, etc.)<br/>
; //It fills the keyboard matrix as KEYBOARD_0 - KEYBOARD_7, JOY1_STATE, JOY2_STATE<br/>
; //<br/>
; //Example:<br/>
; //GE::GetKeyboard();<br/>
; //if (GE::Pressed(GE::KEY_SPACE)) then Fire();<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_GetKeyboard
	;    Procedure type : User-defined procedure
GE_GetKeyboard:
		  ld	A,(GE_PORT_3_MEM_MIRROR)      ;// 0-3 bits: keyboard row select
			and	240                           ;// clear 0-3 bits
			ld	C,A
			ld	HL,GE_KEYBOARD_0              ;// HL -> Keyboard matrix row #0
			ld	B,10                          ;// Keyboard matrix length in bytes
	fill_keyboard_matrix:
			ld	A,C                           ;// A: value to select keyboard matrix row
			out	(GE_KEYBOARD_ROW_SEL_PORT),A  ;// select keyboard matrix row
			in	A,(GE_KEY_READ_PORT)          ;// read keyboard matrix row data
			cpl                               ;// invert bits
			ld	(HL),A                        ;// store keyboard matrix row data
			inc	HL                            ;// HL -> next row in the keyboard matrix
			inc	C                             ;// next value to select keyboard matrix row
			djnz fill_keyboard_matrix
		  
	ret
end_procedure_GE_GetKeyboard:
	; GetKeyboard *
; //Visszaadja, hogy a paraméterben megadott gomb le van-e nyomva.<br/>
; //Paramétere:<br/>
; //KeyCode: a lekérdezni kíván billentyű Game Engine kódja<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::GetKeyboard();<br/>
; //if (GE::Pressed(GE::KEY_SPACE)) then Fire();<br/>
; //<br/>
; //Minden gombra van egy KeyCode konstans definiálva a Game Engine-ban. Pélául:<br/>
; //KEY_A<br/>
; //KEY_B<br/>
; //KEY_ESC<br/>
; //KEY_RET<br/>
; //KEY_CRTL<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Returns whether the specified button is pressed.<br/>
; //<br/>
; //Param:<br/>
; //KeyCode: key code of the specified button<br/>
; //<br/>
; //Example:<br/>
; //GE::GetKeyboard();<br/>
; //if (GE::Pressed(GE::KEY_SPACE)) then Fire();<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_Pressed
	;    Procedure type : User-defined procedure
GE_Pressed_block28:
GE_Pressed:
      ld  DE,[GE_KeyCode]		;// KeyCode = hi byte: key code; lo byte: number of keyboard matrix row
      ld  HL,GE_KEYBOARD_0	;// HL -> keyboard matrix row 0
      ld  B,0
      ld  C,E								;// BC: number of keyborad matrix row
      add HL,BC							;// HL -> the KeyCode specified keyboard matrix row
			ld  A,(HL)						;// A: the specified keyboard matrix row
			and D                 ;// D: the specified key code
			jp  nz,PressedTrue    ;// if A <> 0, the specified key is pressed
			ret										;// A = 0 -> the result = False (the specified key is not pressed)
	PressedTrue:
			ld  A,1								;// A = 1 -> the result = True
			ret      
      
	ret
end_procedure_GE_Pressed:
	;*
; //A joystick-ek állapotát kérdezi le.<br/>
; //Meg kell hívni mielőtt a GE::Joystick függvényt használnánk.<br/>
; //A GE::GetKeyboard() eljárás meghívása kiváltja, annak használata esetén nem kell a GE::GetJoysticks() eljárást meghívni.<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::GetJoysticks();<br/>
; //if (GE::Joystick(1, GE::JOY_LEFT)) then PlayerMoveLeft();<br/>
; //if (GE::Joystick(1, GE::JOY_RIGHT)) then PlayerMoveRight();<br/>
; //<br/>
; //A GameCard joystick-jainak használatához a program inicializációs részében meg kell hívni a GE::InitGameCard() eljárást.<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Gets the state of the joysticks.<br/>
; //It must be called before using the GE::Joystick function unless you have already called GE::GetKeyboard.<br/>
; //<br/>
; //Example:<br/>
; //GE::GetJoysticks();<br/>
; //if (GE::Joystick(1, GE::JOY_LEFT)) then PlayerMoveLeft();<br/>
; //if (GE::Joystick(1, GE::JOY_RIGHT)) then PlayerMoveRight();<br/>
; //<br/>
; //If you also want to query the GameCard joysticks, call the InitGameCard() procedure in an initialization section.<br/>
; 

	; ***********  Defining procedure : GE_GetJoysticks
	;    Procedure type : User-defined procedure
GE_GetJoysticks:
  		ld	A,(GE_PORT_3_MEM_MIRROR)			;// 0-3 bit of Port #3: select keyboard matrix line
			and	128+64+32+16									;// clear 0-3 bits
			;// get Joystick #1
			add	A,8														;// set bits 0-3 to keyboard matrix line #8
			ld  C,A                       		;// save A register value to C register
			out	(GE_KEYBOARD_ROW_SEL_PORT),A	;// select keyboard mátrix line #8
			in	A,(GE_KEY_READ_PORT)					;// read joystick #1 line
			cpl																;// invert bits
			ld	(GE_JOY1_STATE),A							;// store to JOY1_STATE
			;// get Joystick #2
			ld  A,C
			inc A
			out	(GE_KEYBOARD_ROW_SEL_PORT),A	;// select keyboard mátrix line #9
			in	A,(GE_KEY_READ_PORT)					;// read joystick #2 line
			cpl																;// invert bits
			ld	(GE_JOY2_STATE),A							;// store to JOY2_STATE
			;// get GameCard joysticks
			ld  A,(GE_GameCardFound)
			or  A
			ret z
			;// Joystick #3 (GameCard joystick #1)
			ld	A,(GE_GameCardJoy3Port)
			ld	C,A														;// read joystick port
			in	A,(C)													;// GameCard első joystick port kiolvasása
			cpl																;// invert bits -> 0: not pressd; 1: pressed
			ld	(GE_Joy3State),A							;// save joystick #3 state
			;// Joystick #4 (GameCard joystick #2)
			ld	A,(GE_GameCardJoy4Port)
			ld	C,A
			in	A,(C)													;// read joystick port
			cpl																;// invert bits -> 0: not pressd; 1: pressed
			ld	(GE_Joy4State),A							;// save joystick #4 state
  		
	ret
end_procedure_GE_GetJoysticks:
	; ***********  Defining procedure : GE_Joystick
	;    Procedure type : User-defined procedure
GE_Joystick_block30:
GE_Joystick:
	    ld  A,[GE_Nr]
	    cp  1
	    jp  z,joy1_test
	    cp  2
	    jp  z,joy2_test
	    cp  3
	    jp  z,joy3_test
	    cp  4
	    jp  z,joy4_test
			ret
	    ;// Joystick #1
	joy1_test:
			ld  A,[GE_JoyCode]
			ld  C,A							;// C = JoyCode
			ld	A,($0B59)				;// A = Line #8 of Keyboard Matrix -> Joystick #2
			and	C
			ret z								;// if A = 0 then return with 0 (FALSE)
			ld  A,1							;// set return value to 1 (TRUE)
			ret
			; // Joystick #2
	joy2_test:
			ld  A,[GE_JoyCode]
			ld  C,A							;// C = JoyCode
			ld	A,($0B5A)				;// A = Line #9 of Keyboard Matrix -> Joystick #2
			and	C
			ret z								;// if A = 0 then return with 0 (FALSE)
			ld  A,1							;// set return value to 1 (TRUE)
			ret
			;// Joystick #3
	joy3_test:
			ld  A,[GE_JoyCode]
			ld  C,A							;// C = JoyCode
			ld	A,(GE_Joy3State);// A = Joy3State
			and	C
			ret z								;// if A = 0 then return with 0 (FALSE)
			ld  A,1							;// set return value to 1 (TRUE)
			ret
	joy4_test:
			ld  A,[GE_JoyCode]
			ld  C,A							;// C = JoyCode
			ld	A,(GE_Joy4State);// A = Joy4State
			and	C
			ret z								;// if A = 0 then return with 0 (FALSE)
			ld  A,1							;// set return value to 1 (TRUE)
			ret
			
	ret
end_procedure_GE_Joystick:
	; Is2x4bitDigiSoundPlaying ===============================================
; //                  W R I T E 
; //===============================================*
; //Karakterkészlet beállítása. A WriteText használata előtt meg kell hívni.<br/>
; //<br/>
; //Paraméterek:
; //<ul>
; //<li>CharSetPtr: a karaterkészletet tartalmazó bitmap memóriacíme</li>
; //<li>CharSetImgWidth: a karaterkészletet tartalmazó bitmap szélessége byte-okban<li> 
; //<li>CharWidth: egy karakter szélessége byte-okban<li> 
; //<li>CharHeight: egy karakter magassága pixelekben<li> 
; //</ul>
; //Példa a használatára:<br/>
; //var CharSet	: incbin("resources/images/CharSet2.bin");<br/>
; //GE::InitCharSet(#CharSet, 118, 2, 8);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Initialization of the character set<br/>
; //<br/>
; //This procedure must be called before using GE::WriteText.<br/>
; //<br/>
; //<br/>
; //Params:
; //<ul>
; //<li>CharSetPtr: address of charset bitmap</li>
; //<li>CharSetImgWidth: with of the charset image in bytes<li> 
; //<li>CharWidth: width of a character in bytes<li> 
; //<li>CharHeight: height of a character in pixels<li> 
; //</ul>
; //<br/>
; 

	; ***********  Defining procedure : GE_InitCharSet
	;    Procedure type : User-defined procedure
GE_InitCharSet_block31:
GE_InitCharSet:
	ret
end_procedure_GE_InitCharSet:
	; ***********  Defining procedure : GE_WriteText
	;    Procedure type : User-defined procedure
GE_WriteText_block32:
GE_WriteText:
  
      ;// init
      ld  IX,(GE_Text]  ;// IX -> Text
      ld  A,(GE_CharWidth)
      ld  B,0      
			ld  C,A           ;// HL = CharWidth
			ld  (write_text_char_loop+1),BC ;// modify the ld BC,2 -> ld BC,CharWidth
			ld  (write_text_calc_char+1),A ;// modify the ld B,2 -> ld B,CharWidth
			ld  (write_text_next_char+1),A ;// modify the ld BC,2 -> ld BC,CharWidth
			ld  HL,(GE_CharSetImgWidth)
			or  A             ;// clear Carry flag
			sbc HL,BC         ;// HL = CharSetImgWidth-CharWidth
			ld  (write_text_charset_next_line+1),HL ;// modify the ld BC,116 -> ld BC,CharSetImgWidth-CharWidth
			ld  A,GE_SCREEN_WIDTH
			sub C             ;// A = SCREEN_WIDTH - CharWidth
			ld  L,A           ;// L = SCREEN_WIDTH - CharWidth
			ld  H,0           ;// HL = SCREEN_WIDTH - CharWidth
			ld (write_text_set_next_line+1),HL ;// modify the ld BC,62 -> ld BC,SCREEN_WIDTH-CharWidth
			ld	A,[GE_CharHeight]
			ld (write_text_init_char_loop+1),A ;// modify the ld A,8 -> ld A,CharHeight
      ;// calc screen position      
      ld  A,[GE_Y]			;// A = Y pos
			ld  L,A
			xor A             ;// A = 0
			ld  H,A						;// H = 0
			srl H
			rr  L
			rra
			srl H
			rr  L
			rra
			ld  H,L
			ld  L,A           ;// HL = Y * 64
			ld 	BC,(GE_ScreenAddr);// BC -> screen start address
			add HL,BC					;// HL = ScreenAddr + (Y * 64)
			ld 	A,[GE_X]  		;// A  = X pos
			ld 	B,0
			ld 	C,A						;// BC = X
			add HL,BC
			ex  DE,HL					;// DE -> screen start address + (Y * 64) + X
			;// write text
	write_text:      
			ld	A,(IX+0)			;// A = character from the text
			or	A							;// A == 0?
			ret	z							;// end of the text -> return to caller
			cp	32						;// char < SPACE?
			jp	c,write_text_skip_char
			cp  144           ;// 144: á
			jp  nc,write_text_small_accent_letters
			cp  128           ;// 128: Á
			jp  c,write_text_check_skip
	    sub 11            ;// init Á,É,Í,Ó,Ö,Ő,Ú,Ü,Ű chars: Á=Z+1(144->91); É=Z+2(145->92), etc.
	    jp  write_text_set_charset
	write_text_small_accent_letters:
	    sub 18
	    jp  write_text_set_charset
  write_text_check_skip:			
      cp	123 					;// char >= { -> z+1
			jp	nc,write_text_skip_char  
  		cp  97            ;// char < a
			jp	c,write_text_set_charset
      sub 6             ;// skip 6 chars between Z and a
	write_text_set_charset:
      ld	HL,(GE_CharSetPtr) ;// HL -> character set image
			sub	32            ;// A = char - 32
			jp	Z,write_text_char
			;// calc current char address in the CharSet
			ld  B,0
			ld	C,A           ;// BC = char - 32
  write_text_calc_char:      
  		ld  A,2           ;// modified in the init section to ld B,CharWidth
  write_text_calc_char_loop:    
			add	HL,BC					;// HL -> current character in the charset image
			dec A
			jp  nz,write_text_calc_char_loop
	write_text_char:
      push DE
  write_text_init_char_loop:
      ld  A,8           ;// modified in the init section to ld IYL,CharHeight
	write_text_char_loop:
	    ld  BC,2          ;// modified in the init section to ld BC,CharWidth
	    ldir              ;// copy one character line to the screen
  write_text_charset_next_line:
	    ld	BC,116        ;// modified in the init section to ld BC,CharSetImgWidth-CharWidth
			add	HL,BC					;// HL -> next line in the charset
			ex	DE,HL			
	write_text_set_next_line:
			ld  BC,62         ;// modified in the init section to ld BC,SCREEN_WIDTH-CharWidth
			add	HL,BC
			ex	DE,HL					;// DE -> next line on the screen
			dec	A             ;// decrement the remaining lines of the character
			jp	NZ,write_text_char_loop
			pop	DE
	write_text_next_char:
	    ld  BC,2          ;// modified in the init section to ld BC,CharWidth
	    ex  DE,HL
	    add HL,BC
	    ex  DE,HL					;// DE -> next char screen pos.
	write_text_skip_char:
			inc	IX						;// IX -> next character in the text
			jp	write_text
			
	ret
end_procedure_GE_WriteText:
	;*
; //A paraméterben átadott integer típusú változót vagy értéket string-re konvertálja<br/>
; //<br/>
; //A konvertálás után a numerikus érték kiíratható lesz a GE::WriteText utasítással.<br/>
; //<br/>
; //Paraméter:<br/>
; //IntNum: tetszőleges integer típusú változó vagy érték<br/>
; //<br/>
; //A konvertálás eredménye a GE::NumStr változóban lesz, amit a példában mutatott módon lehet kiratni.
; //<br/>
; //Példa a használatára:<br/>
; //var Szam : integer = 12345;<br/>
; //<br/>
; //GE::IntToStr(Szam);<br/>
; //GE::WriteText(0, 0, #GE_NumStr);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Convert an integer to a string<br/> 
; //The result is placed in the GE::NumStr variable.
; //<br/>
; //Example:<br/>
; //GE::IntToStr(Number);<br/>
; //GE::WriteText(0, 0, #GE_NumStr);<br/>
; 

	; ***********  Defining procedure : GE_IntToStr
	;    Procedure type : User-defined procedure
GE_IntToStr_block33:
GE_IntToStr:
	ld a, $0
	ld [GE_i], a
GE_IntToStr_forloop34:
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$0
	ld [hl],a 
GE_IntToStr_loopstart35:
	ld a,[GE_i]
	add a,1
	ld [GE_i],a
	cp $5
	jr nz,GE_IntToStr_forloop34
GE_IntToStr_loopend36:
	ld a, $0
	ld [GE_i], a
	; generic assign 
	ld hl,$2710
	; Loading pointer
	ld [GE_IntNum2],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_edblock42
GE_IntToStr_ctb40: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while53:
GE_IntToStr_loopstart57:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[GE_IntNum2]
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_edblock56
GE_IntToStr_ctb54: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[GE_IntNum2]
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	xor a ; clear carry
	sbc hl,de
	ld [GE_IntNum],hl
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_IntToStr_while53
GE_IntToStr_edblock56:
GE_IntToStr_loopend58:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_IntToStr_edblock42:
	; generic assign 
	ld hl,$3e8
	; Loading pointer
	ld [GE_IntNum2],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_eblock63
GE_IntToStr_ctb62: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while82:
GE_IntToStr_loopstart86:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[GE_IntNum2]
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_edblock85
GE_IntToStr_ctb83: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[GE_IntNum2]
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	xor a ; clear carry
	sbc hl,de
	ld [GE_IntNum],hl
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_IntToStr_while82
GE_IntToStr_edblock85:
GE_IntToStr_loopend87:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
	jr GE_IntToStr_edblock64
GE_IntToStr_eblock63:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock94
	jr z, GE_IntToStr_edblock94
GE_IntToStr_ctb92: ;Main true block ;keep :
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$30
	ld [hl],a 
	
; // ASCII "0"
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_IntToStr_edblock94:
GE_IntToStr_edblock64:
	; generic assign 
	ld hl,$64
	; Loading pointer
	ld [GE_IntNum2],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_eblock99
GE_IntToStr_ctb98: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while118:
GE_IntToStr_loopstart122:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[GE_IntNum2]
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_edblock121
GE_IntToStr_ctb119: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[GE_IntNum2]
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	xor a ; clear carry
	sbc hl,de
	ld [GE_IntNum],hl
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_IntToStr_while118
GE_IntToStr_edblock121:
GE_IntToStr_loopend123:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
	jr GE_IntToStr_edblock100
GE_IntToStr_eblock99:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock130
	jr z, GE_IntToStr_edblock130
GE_IntToStr_ctb128: ;Main true block ;keep :
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$30
	ld [hl],a 
	
; // ASCII "0"
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_IntToStr_edblock130:
GE_IntToStr_edblock100:
	; generic assign 
	ld hl,$0a
	; Loading pointer
	ld [GE_IntNum2],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_eblock135
GE_IntToStr_ctb134: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while154:
GE_IntToStr_loopstart158:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[GE_IntNum2]
	push hl
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, GE_IntToStr_edblock157
GE_IntToStr_ctb155: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[GE_IntNum2]
	; Variable is 16-bit
	ld hl,[GE_IntNum]
	xor a ; clear carry
	sbc hl,de
	ld [GE_IntNum],hl
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_IntToStr_while154
GE_IntToStr_edblock157:
GE_IntToStr_loopend159:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
	jr GE_IntToStr_edblock136
GE_IntToStr_eblock135:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock166
	jr z, GE_IntToStr_edblock166
GE_IntToStr_ctb164: ;Main true block ;keep :
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$30
	ld [hl],a 
	
; // ASCII "0"
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_IntToStr_edblock166:
GE_IntToStr_edblock136:
	; generic assign 
	ld a,[GE_IntNum]
	ld [GE_X], a
	; Storing to array  
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; Variable is 16-bit
	ld hl,GE_NumStr
	ret
end_procedure_GE_IntToStr:
	;*
; //A paraméterben átadott byte típusú változót vagy értéket string-re konvertálja<br/>
; //<br/>
; //A konvertálás után a numerikus érték kiíratható lesz a GE::WriteText utasítással.<br/>
; //<br/>
; //Paraméter:<br/>
; //Nr: tetszőleges byte típusú változó vagy érték<br/>
; //<br/>
; //A konvertálás eredménye a GE::NumStr változóban lesz, amit a példában mutatott módon lehet kiratni.
; //<br/>
; //Példa a használatára:<br/>
; //GE::IntToStr(Sprite.X);<br/>
; //GE::WriteText(0, 0, #GE_NumStr);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Convert a byte to a string<br/> 
; //The result is placed in the NumStr variable.
; //<br/>
; //Example:<br/>
; //GE::ByteToStr(Sprite.X);<br/>
; //GE::WriteText(0, 0, #GE_NumStr);<br/>
; 

	; ***********  Defining procedure : GE_ByteToStr
	;    Procedure type : User-defined procedure
GE_ByteToStr_block169:
GE_ByteToStr:
	ld a, $0
	ld [GE_i], a
GE_ByteToStr_forloop170:
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$0
	ld [hl],a 
GE_ByteToStr_loopstart171:
	ld a,[GE_i]
	add a,1
	ld [GE_i],a
	cp $3
	jr nz,GE_ByteToStr_forloop170
GE_ByteToStr_loopend172:
	ld a, $0
	ld [GE_i], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock178
GE_ByteToStr_ctb176: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while195:
GE_ByteToStr_loopstart199:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock198
GE_ByteToStr_ctb196: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $64
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while195
GE_ByteToStr_edblock198:
GE_ByteToStr_loopend200:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr nc,GE_ByteToStr_edblock206
GE_ByteToStr_ctb204: ;Main true block ;keep :
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$30
	ld [hl],a 
	
; // ASCII "0"
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_ByteToStr_edblock206:
GE_ByteToStr_edblock178:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock212
GE_ByteToStr_ctb210: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while223:
GE_ByteToStr_loopstart227:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock226
GE_ByteToStr_ctb224: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $a
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while223
GE_ByteToStr_edblock226:
GE_ByteToStr_loopend228:
	; Storing to array  
	ld a,[GE_X]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[GE_i]
	add  a,$1
	ld [GE_i], a
GE_ByteToStr_edblock212:
	; Storing to array  
	ld a,[GE_Nr]
	ld b,a
	ld a,$30
	add  a, b
	push af
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	pop af
	ld [hl],a 
	ret
end_procedure_GE_ByteToStr:
	;*
; //	Generates 16-bit random number
; 

	; ***********  Defining procedure : Random_Random1
	;    Procedure type : User-defined procedure
Random_Random1:
; 16-bit xorshift pseudorandom number generator by John Metcalf
; 20 bytes, 86 cycles (excluding ret)
; returns   hl = pseudorandom number
; corrupts   a
; generates 16-bit pseudorandom numbers with a period of 65535
; using the xorshift method:
; hl ^= hl << 7
; hl ^= hl >> 9
; hl ^= hl << 8
; some alternative shift triplets which also perform well are:
; 6, 7, 13; 7, 9, 13; 9, 7, 13.
xrnd:
  ld hl,1       ; seed must not be 0
  ld a,h
  rra
  ld a,l
  rra
  xor h
  ld h,a
  ld a,l
  rra
  ld a,h
  rra
  xor l
  ld l,a
  xor h
  ld h,a
  ld (xrnd+1),hl
	
	ret
end_procedure_Random_Random1:
	;		MAP értékadások jelentései
; //		Pumpa animációs fázisok:	1-8
; //		Talaj típusok:			10-19
; //		Vírusos talaj:			20-29								 Talaj1 sprite értéke 
	; ***********  Defining procedure : ProgramInit
	;    Procedure type : User-defined procedure
ProgramInit:
	ld a, $1
	ld [GE_Mode], a
	call GE_SetGraphics
	ld a, $0
	ld [GE_Nr], a
	ld a, $15
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $1
	ld [GE_Nr], a
	ld a, $0
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $2
	ld [GE_Nr], a
	ld a, $50
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $3
	ld [GE_Nr], a
	ld a, $41
	ld [GE_Color], a
	call GE_SetPalette
	ld hl,CharSet
	ld [GE_CharSetPtr],hl
	; generic assign 
	ld hl,$76
	; Loading pointer
	ld [GE_CharSetImgWidth],hl
	ld a, $2
	ld [GE_CharWidth], a
	ld a, $7
	ld [GE_CharHeight], a
	call GE_InitCharSet
	ld a, $0
	ld [GE_UseBackScreen], a
	call GE_Init
	ld a, $50
	ld [GE_Mode], a
	call GE_SetMemory
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	ld hl,Pumpa_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	ld a, $7
	ld [GE_AnimPhaseCount], a
	ld a, $1
	ld [GE_AnimDelay], a
	ld a, $0
	ld [GE_AnimType], a
	call GE_Sprite_InitAnimation
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	ld hl,Talaj1_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[Keret_X_Pos]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,$1
	ld b,a
	pop af
	sub  b
	ld [Keret_X_ScreenPOS], a
	; generic assign 
	ld a,$1c
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Keret_Y_Pos]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Keret_Y_ScreenPOS], a
	ld hl,Keret
	ld [GE_Sprite_this],hl
	ld hl,Keret_Data
	ld [GE_ImagePtr],hl
	; generic assign 
	ld a,[Keret_X_ScreenPOS]
	ld [GE_X], a
	; generic assign 
	ld a,[Keret_Y_ScreenPOS]
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa_Data
	add hl,de
	ld a,l
	ld [Pumpa+$14],a
	ld a,h
	ld [Pumpa+$14+1],a
	; Storing to array  
	ld a,$1
	ld [Pumpa+$18],a
	ret
end_procedure_ProgramInit:
	; ***********  Defining procedure : MapReset
	;    Procedure type : User-defined procedure
localVariable_MapReset_mapx:	db	0
localVariable_MapReset_mapy:	db	0
localVariable_MapReset_data:	dw	0
MapReset_block235:
MapReset:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapReset_data],hl
	ld a, $1
	ld [localVariable_MapReset_mapy], a
MapReset_forloop236:
	ld a, $1
	ld [localVariable_MapReset_mapx], a
MapReset_forloop246:
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_MapReset_data]
	ld hl,Map
	add hl,de
	ld a,[Talaj1Map]
	ld [hl],a 
	; Talaj1 sprite értéke 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	add  hl,de
	ld [localVariable_MapReset_data],hl
MapReset_loopstart247:
	ld a,[localVariable_MapReset_mapx]
	add a,1
	ld [localVariable_MapReset_mapx],a
	cp $1e+1
	jr nz,MapReset_forloop246
MapReset_loopend248:
MapReset_loopstart237:
	ld a,[localVariable_MapReset_mapy]
	add a,1
	ld [localVariable_MapReset_mapy],a
	cp $12+1
	jr nz,MapReset_forloop236
MapReset_loopend238:
	ret
end_procedure_MapReset:
	; ***********  Defining procedure : MapToScreen
	;    Procedure type : User-defined procedure
localVariable_MapToScreen_mapx:	db	0
localVariable_MapToScreen_mapy:	db	0
localVariable_MapToScreen_data:	dw	0
MapToScreen_block251:
MapToScreen:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapToScreen_data],hl
	ld a, $1
	ld [localVariable_MapToScreen_mapy], a
MapToScreen_forloop252:
	ld a, $1
	ld [localVariable_MapToScreen_mapx], a
MapToScreen_forloop302:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj1Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_MapToScreen_data]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,MapToScreen_edblock330
MapToScreen_ctb328: ;Main true block ;keep :
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapToScreen_mapx]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [Talaj1+$f],a
	; Storing to array  
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapToScreen_mapy]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Talaj1+$10],a
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
MapToScreen_edblock330:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_MapToScreen_data]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,MapToScreen_edblock340
MapToScreen_ctb338: ;Main true block ;keep :
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapToScreen_mapx]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapToScreen_mapy]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
MapToScreen_edblock340:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapToScreen_data]
	add  hl,de
	ld [localVariable_MapToScreen_data],hl
MapToScreen_loopstart303:
	ld a,[localVariable_MapToScreen_mapx]
	add a,1
	ld [localVariable_MapToScreen_mapx],a
	cp $1e+1
	jp nz,MapToScreen_forloop302
MapToScreen_loopend304:
MapToScreen_loopstart253:
	ld a,[localVariable_MapToScreen_mapy]
	add a,1
	ld [localVariable_MapToScreen_mapy],a
	cp $12+1
	jp nz,MapToScreen_forloop252
MapToScreen_loopend254:
	ld a, $1
	ld [GE_X], a
	ld a, $c
	ld [GE_Y], a
	ld a, $3e
	ld [GE_Width], a
	ld a, $2
	ld [GE_Height], a
	ld a, $ff
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $4
	ld [GE_X], a
	ld [GE_Y], a
	ld hl,CashStr
	ld [GE_Text],hl
	call GE_WriteText
	ld a, $20
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,PosStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	; Variable is 16-bit
	ld a,[Drill_Cash]
	ld l,a
	ld h,0
	; Loading pointer
	ld [GE_IntNum],hl
	call GE_IntToStr
	ld a, $10
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [GE_Nr], a
	call GE_ByteToStr
	ld a, $2a
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [GE_Nr], a
	call GE_ByteToStr
	ld a, $3a
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	ret
end_procedure_MapToScreen:
	; ***********  Defining procedure : Keret_OSD
	;    Procedure type : User-defined procedure
Keret_OSD:
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [GE_Nr], a
	call GE_ByteToStr
	ld a, $2a
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [GE_Nr], a
	call GE_ByteToStr
	ld a, $3a
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	ret
end_procedure_Keret_OSD:
	; ***********  Defining procedure : Keret_XY_Calc
	;    Procedure type : User-defined procedure
Keret_XY_Calc:
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[Keret_X_Pos]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,$1
	ld b,a
	pop af
	sub  b
	ld [Keret_X_ScreenPOS], a
	; generic assign 
	ld a,$1c
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Keret_Y_Pos]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Keret_Y_ScreenPOS], a
	; Storing to array  
	ld a,[Keret_X_ScreenPOS]
	ld [Keret+$f],a
	; Storing to array  
	ld a,[Keret_Y_ScreenPOS]
	ld [Keret+$10],a
	ret
end_procedure_Keret_XY_Calc:
	; ***********  Defining procedure : Keret_SpriteKirak
	;    Procedure type : User-defined procedure
Keret_SpriteKirak:
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	ret
end_procedure_Keret_SpriteKirak:
	; ***********  Defining procedure : Keret_Kirak
	;    Procedure type : User-defined procedure
Keret_Kirak:
	; generic assign 
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 0
	ld a,$1e
	push af
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld a,[Keret_Y_Pos]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	push de
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld a,[Keret_X_Pos]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [MapPos],hl
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret_OSD
	ret
end_procedure_Keret_Kirak:
	; ***********  Defining procedure : MapRefresher
	;    Procedure type : User-defined procedure
localVariable_MapRefresher_mapx:	db	0
localVariable_MapRefresher_mapy:	db	0
MapRefresher_block354:
MapRefresher:
	; generic assign 
	ld a,[MapRefreshY]
	ld [localVariable_MapRefresher_mapy], a
	ld a, $1
	ld [localVariable_MapRefresher_mapx], a
MapRefresher_forloop355:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[MapRefreshKezd]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,MapRefresher_edblock373
MapRefresher_ctb371: ;Main true block ;keep :
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapRefresher_mapx]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_MapRefresher_mapy]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
MapRefresher_edblock373:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[MapRefreshKezd]
	add  hl,de
	ld [MapRefreshKezd],hl
MapRefresher_loopstart356:
	ld a,[localVariable_MapRefresher_mapx]
	add a,1
	ld [localVariable_MapRefresher_mapx],a
	cp $1e+1
	jr nz,MapRefresher_forloop355
MapRefresher_loopend357:
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$21b
	push hl
	; Variable is 16-bit
	ld hl,[MapRefreshKezd]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MapRefresher_edblock383
	jr z, MapRefresher_edblock383
MapRefresher_ctb381: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [MapRefreshKezd],hl
MapRefresher_edblock383:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[MapRefreshY]
	cp $12
	jr nc,MapRefresher_eblock388
MapRefresher_ctb387: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[MapRefreshY]
	add  a,$1
	ld [MapRefreshY], a
	jr MapRefresher_edblock389
MapRefresher_eblock388:
	ld a, $1
	ld [MapRefreshY], a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Animation
MapRefresher_edblock389:
	ret
end_procedure_MapRefresher:
	; ***********  Defining procedure : Keret_MoveLeft
	;    Procedure type : User-defined procedure
Keret_MoveLeft:
	; 'a:=a + const'  optimization 
	ld a,[Keret_X_Pos]
	sub $1
	ld [Keret_X_Pos], a
	ret
end_procedure_Keret_MoveLeft:
	; ***********  Defining procedure : Keret_MoveRight
	;    Procedure type : User-defined procedure
Keret_MoveRight:
	; 'a:=a + const'  optimization 
	ld a,[Keret_X_Pos]
	add  a,$1
	ld [Keret_X_Pos], a
	ret
end_procedure_Keret_MoveRight:
	; ***********  Defining procedure : Keret_MoveUp
	;    Procedure type : User-defined procedure
Keret_MoveUp:
	; 'a:=a + const'  optimization 
	ld a,[Keret_Y_Pos]
	sub $1
	ld [Keret_Y_Pos], a
	ret
end_procedure_Keret_MoveUp:
	; ***********  Defining procedure : Keret_MoveDown
	;    Procedure type : User-defined procedure
Keret_MoveDown:
	; 'a:=a + const'  optimization 
	ld a,[Keret_Y_Pos]
	add  a,$1
	ld [Keret_Y_Pos], a
	ret
end_procedure_Keret_MoveDown:
	; ***********  Defining procedure : DrillLerak
	;    Procedure type : User-defined procedure
DrillLerak:
	; generic assign 
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 0
	ld a,$1e
	push af
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld a,[Keret_Y_Pos]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	push de
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld a,[Keret_X_Pos]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [MapPos],hl
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a keret alatti valós talajt tesszük láthatóvá lerakás előtt 
	; Storing to array  
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	ld a,$1
	ld [hl],a 
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[Keret_X_Pos]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Keret_Y_Pos]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; a pumpa azonnal megjelenik, nem kell rá várni a MapRefresher-re 
	call Keret_SpriteKirak
	; elmenti a friss (pumpát tartalmazó) hátteret, majd ráteszi a keretet 
	call Keret_OSD
	ret
end_procedure_DrillLerak:
block1:
main_block_begin_:
	call ProgramInit
	call MapReset
	call MapToScreen
	call Keret_Kirak
MainProgram_while402:
MainProgram_loopstart406:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jp MainProgram_ctb403
MainProgram_ctb403: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock447
MainProgram_localsuccess449: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Keret_X_Pos]
	cp $1
	jr c, MainProgram_edblock447
	jr z, MainProgram_edblock447
MainProgram_ctb445: ;Main true block ;keep :
	call Keret_MoveLeft
MainProgram_edblock447:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock454
MainProgram_localsuccess456: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Keret_X_Pos]
	cp $1e
	jr nc,MainProgram_edblock454
MainProgram_ctb452: ;Main true block ;keep :
	call Keret_MoveRight
MainProgram_edblock454:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock461
MainProgram_localsuccess463: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Keret_Y_Pos]
	cp $1
	jr c, MainProgram_edblock461
	jr z, MainProgram_edblock461
MainProgram_ctb459: ;Main true block ;keep :
	call Keret_MoveUp
MainProgram_edblock461:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock468
MainProgram_localsuccess470: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Keret_Y_Pos]
	cp $12
	jr nc,MainProgram_edblock468
MainProgram_ctb466: ;Main true block ;keep :
	call Keret_MoveDown
MainProgram_edblock468:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$2007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock475
MainProgram_ctb473: ;Main true block ;keep :
	call DrillLerak
MainProgram_edblock475:
	call GE_WaitForSync
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	call MapRefresher
	call Keret_Kirak
	jp MainProgram_while402
MainProgram_edblock405:
MainProgram_loopend407:
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
