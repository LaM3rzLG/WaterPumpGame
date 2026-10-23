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
NB_DB EQU $0c
NB_VX EQU $01
NB_VY EQU $03
NB_WP EQU $05
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
GE_SpriteListPtr:	dw	$1800
GE_LastSpritePtr:	dw	$17fe
GE_SpriteCount:	db	$00
GE_SpritePtr:	dw	0
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
GE_Sprite_this: dw  0
GE_Image_this: dw  0
GE_List_this: dw  0
NukeBlob_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/nukebomb.bin"
end_incbin_NukeBlob_Data:
CharSet:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/CharSetGR4.bin"
end_incbin_CharSet:
Parts:
	org Parts+468
PX:	 ds 12
PY:	 ds 12
Act:	 ds 12
WI:	 ds 12
W_X:	db $21, $1e, $1e, $1e, $1f, $1b, $1e, $1e
	db $1e, $1d, $23, $1e, $1e, $20, $22, $19
	db $1e, $1e, $1c, $1a, $25, $1e, $1e, $22
	db $25, $17, $1e, $1e, $1a, $17, $27, $1e
	db $1e, $24, $28, $15, $1e, $1e, $18, $14
	db $29, $1e, $1e, $25, $29, $13, $1e, $1e
	db $17, $13, $2b, $1e, $1e, $24, $27, $11
	db $1e, $1e, $18, $15
W_Y:	db $ac, $a0, $5a, $54, $58, $ac, $a0, $5a
	db $54, $58, $ac, $a0, $5a, $54, $58, $ac
	db $a0, $5a, $54, $58, $ac, $a0, $5a, $54
	db $5a, $ac, $a0, $5a, $54, $5a, $ac, $a0
	db $5a, $56, $5e, $ac, $a0, $5a, $56, $5e
	db $ac, $a0, $5a, $58, $64, $ac, $a0, $5a
	db $58, $64, $ac, $a0, $5a, $5a, $6a, $ac
	db $a0, $5a, $5a, $6a
Dly:	db $0, $3, $6, $9, $c, $f, $12, $15
	db $18, $1b, $1e, $21
NB_I:	db	$00
NB_X:	db	$00
NB_Y:	db	$00
NB_V:	db	$00
Fr:	db	$00
Dirty:	db	$01
Space_Volt:	db	$00
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
	; Sprite.ScrollDraw *
; //	  A Visible = False állapotú, eddig nem kirakott sprite-ot megjeleníti a GE::RenderAllSprites() következő hívásakor, és a sprite.Visible értékét True-ra állítja.<br/>
; //    <br/>
; //    Ezzel az utasítással lehet megjeleníteni egy eddig nem megjelenített, Visible = False állapotú sprite-ot. Például egy éppen kilőtt lövedéket, vagy egy pályára most érkező ellenséget.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //	  MissileSprite.Init(#MissileBitmap, 0, 0, False);<br/>
; //	  MissileSprite.Visible := False;<br/>
; //	  <br/>
; //	  ...<br>
; //	  <br/>
; //	  if (GE::Joystick(1, GE::JOY_FIRE))<br>
; //	  begin<br>
; //	  &nbsp;&nbsp;&nbsp;&nbsp;MissileSprite.State := LAUNCHED;<br/>
; //	  &nbsp;&nbsp;&nbsp;&nbsp;MissileSprite.Y := PlayerSprite.Y + 5;<br/>
; //	  &nbsp;&nbsp;&nbsp;&nbsp;MissileSprite.X := PlayerSprite.X + PlayerSprite.Width;<br/>
; //	  &nbsp;&nbsp;&nbsp;&nbsp;MissileSprite.SetPosition();<br/>
; //	  &nbsp;&nbsp;&nbsp;&nbsp;MissileSprite.Show();<br/>
; //	  end;<br>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //	  If the sprite Visible = False (not rendered), the sprite will be rendered by the next GE::RenderAllSprites(), and Visible will be True.<br/>
; //	  *
	; ***********  Defining procedure : GE_Sprite_Show
	;    Procedure type : User-defined procedure
GE_Sprite_Show:
													  		
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
		      ld  A,(IX+0)            ;// A = sprite.Visible
          or  A                   ;// Visible = False?
          ret nz                  ;// if Visible <> False, then return to caller
		      ld  (IX+10),1						;// sprite.VisibleState = 1
					
	ret
end_procedure_GE_Sprite_Show:
	; Sprite.Show *
; //	  Egy Visible = True állapotú, eddig kirakott sprite-ot eltünteti a GE::RenderAllSprites() következő hívásakor, és a sprite.Visible értékét False-ra állítja.<br/>
; //    <br/>
; //    Ezzel az utasítással lehet eltüntetni a képernyőről egy eddig megjelenített, Visible = True állapotú sprite-ot. Például egy célba ért lövedéket, vagy felrobbant ellenséget.<br/>
; //    <br/>
; //    Példa a használatára:<br/>
; //	  if (MissileSprite.Collided(EnemySprite))<br>
; //	  begin<br>
; //	  &nbsp;&nbsp;MissileSprite.State := DESTROYED;<br/>
; //	  &nbsp;&nbsp;MissileSprite.Hide();<br/>
; //	  end;<br>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //	  If the sprite is Visible = True (rendered), the sprite will be hidden/removed by the next GE::RenderAllSprites(), and the Visible will be False.<br/>
; //	  *
	; ***********  Defining procedure : GE_Sprite_Hide
	;    Procedure type : User-defined procedure
GE_Sprite_Hide:
													  		
	        ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
		      ld  A,(IX+0)            ;// A = sprite.Visible
          or  A                   ;// Visible = False?
          ret z                   ;// if Visible = False, then return to caller
		      ld  (IX+10),2						;// sprite.VisibleState = 2
					
	ret
end_procedure_GE_Sprite_Hide:
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
	; Sprite.ScrollPut *
; //	  Sprite kimásolás a háttér képernyőről a képernyőre.<br/>
; //    <br/>
; //    Több sprite használata esetén érdemes helyette a GE::CopyAllSpritesToScreen() eljárást használni.<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //	  var<br/>
; //			Player : GE::Sprite;<br/>
; //		begin<br/>			  		  
; //		  Player.MoveLeft();<br/>
; //		  Player.Draw();<br/>
; //		  Player.CopyToScreen();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //	  Copy sprite from the BackScreen to the Screen
; //	  *
	; ***********  Defining procedure : GE_Sprite_CopyToScreen
	;    Procedure type : User-defined procedure
GE_Sprite_CopyToScreen:
													  		
		      ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
		      ;// init copy rectangle
			    ld  A,(IX+16)     ;// A = Y
			    ld  B,(IX+18)     ;// B = LastY
			    cp  B             
			    jp  c,cTos_Y_less ;// if Y < LastY then jump
			    ;// Y >= LastY
          sub B             ;// A = Y - LastY
          add A,(IX+12)     ;// A = (Y - LastY) + Sprite.Height
          ld  IYL,A					;// IYL = (Y - LastY) + Sprite.Height -> IYL = the rectangle height in pixels
          ld  L,(IX+8)
			    ld  H,(IX+9)      ;// HL -> Sprite.LastPosition (the top-left position of the rectangle )
			    ;// check LastX
			    ld  A,(IX+17)     ;// A = LastX
			    ld  B,(IX+15)     ;// B = X
			    cp  B
			    jp  c,cTos_LastX_less
			    jp  z,cTos_LastX_equal
     			;// LastX > X
          sub B             ;// A = LastX - X
          ld  C,A           ;// C = LastX - X
          add A,(IX+11)     ;// A = (LastX - X) + Sprite.Width;
          ld  IYH,A         ;// IYH = the rectangle width in bytes
          ld  A,L						;// A = LastPosition low byte
          sub C             ;// A = LastPosition low byte - (LastX - X)
          ld  L,A					  ;// HL -> Sprite.LastPosition - (LastX - X) -> the top-left position of the rectangle
          jp  cTos_set_screen_pos
      cTos_LastX_equal:
          ld  A,(IX+11)     ;// B = Sprite.Width
          ld  IYH,A         ;// IYH = the rectangle width in bytes
          jp  cTos_set_screen_pos
      cTos_LastX_less:
          ;// LastX < X
          ld  C,A           ;// C = LastX
          ld  A,B           ;// A = X
          sub C             ;// A = X - LastX
          add A,(IX+11)     ;// A = (X - LastX) + Sprite.Width;
          ld  IYH,A         ;// IYH = the rectangle width in bytes
          jp  cTos_set_screen_pos
      cTos_Y_less:
          ;// LastY > Y (A = Y; B = LastY)
          ld  C,A						;// C = Y
          ld  A,B           ;// A = LastY
          sub C             ;// A = LastY - Y
          add A,(IX+12)     ;// A = (LastY - Y) + Sprite.Height
          ld  IYL,A					;// IYL = (LastY - Y) + Sprite.Height -> IYL = the rectangle height in pixels
          ld  L,(IX+6)
			    ld  H,(IX+7)      ;// HL -> Sprite.Position
			    ;// check X
			    ld  A,(IX+15)     ;// A = X
			    ld  B,(IX+17)     ;// B = LastX
			    cp  B
			    jp  c,cTos_X_less
			    jp  z,cTos_LastX_equal
			    ;// X >= LastX
			    sub B             ;// A = X - LastX
          ld  C,A           ;// C = X - LastX
          add A,(IX+11)     ;// A = (X - LastX) + Sprite.Width;
          ld  IYH,A         ;// IYH = the rectangle width in bytes
          ld  A,L						;// A = Sprite.Position low byte
          sub C             ;// A = Sprite.Position low byte - (X - LastX)
          ld  L,A					  ;// HL -> Sprite.Position - (X - LastX)
          jp  cTos_set_screen_pos
      cTos_X_less:
          ;// X < LastX
          ld  C,A           ;// C = X
          ld  A,B           ;// A = LastX
          sub C             ;// A = LastX - X
          add A,(IX+11)     ;// A = (X - LastX) + Sprite.Width;
          ld  IYH,A         ;// IYH = the rectangle width in bytes
      cTos_set_screen_pos:
		      ld  A,H
		      sub 64						;// A = A - 64 (64*256 = 16384)
		      ld  D,A							
		      ld  E,L						;// DE = HL - 16384 -> sprite position on the screen     			    
			    ;// set rectangle width depended jumps
          ld  A,GE_SCREEN_WIDTH
          sub IYH           ;// A = SCREEN_WIDTH - rectangle width
          ld  (copy_sprToscr_next_row+1),A ;// self-modifying code: ld C,SCREEN_WDITH - rectangle width          					
          add A,A           ;// A = 2*(SCREEN_WIDTH - rectangle with)
          ld  B,0
					ld  C,A	          ;// BC = 2*(SCREEN_WIDTH - rectangle with)
					push HL
					ld  HL,copy_sprToscr_ldi	;// HL -> copy_sprToscr_ldi					
					add HL,BC							;// HL -> put_img_ldi + 2*(SCREEN_WIDTH-Image.Width) => for jump out (SCREEN_WIDTH-Image.Width) x LDI instruction
		      ld  (copy_sprToscr+1),HL     ;// self-modifying code: overwrite address of jp  copy_sprToscr_ldi
		  		ld  (copy_sprToscr_loop_end+1),HL	;// self-modifying code: overwrite address of jp  nz,copy_sprToscr
          pop HL						;// HL -> Sprite.Position - (X - LastX)
          ld  A,IYL         ;// A = height
			copy_sprToscr:
		      jp  copy_sprToscr_ldi ;// jump to the first LDI instruction to copy a sprite row - overwrite by self-modifying code
		  copy_sprToscr_ldi:
		      repeat 64
					ldi
					repend
			copy_sprToscr_next_row:
					ld  BC,10         ;// will be overwritten with the required value (SCREEN_WDITH - rectangle width)
					add	HL,BC					;// HL -> next line on the Back Screen
					ex	DE,HL			
					add	HL,BC
					ex	DE,HL         ;// DE -> next line on the screen
					dec A             ;// decrement remaining rows from the sprite height
			copy_sprToscr_loop_end:
					jp  nz,copy_sprToscr ;// overwrite by self-modifying code
					
	ret
end_procedure_GE_Sprite_CopyToScreen:
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
	; InitSpriteMirroring *
; //Minden sprite kirakása a képernyőre<br/>
; //Az összes sprite.Init aljárással inicializált sprite-ot kirakja a képernyőre az inicialilás sorrendjében.<br/>
; //<br/>
; //Az alábbi műveleteket végzi el:<br/>
; //<ul>
; //<li>Visszamásolja az összes olyan sprite hátterét, aminek van háttérbuffere.</li>
; //<li>Kirajzolja az összes sprite-ot. Amelyik sprite-nak el kell menteni a hátterét, azoknál előtte elmenti azt.</li>
; //</ul>
; //<br/>
; //Példa a használatára:<br/> 
; //GE::WaitForSync();<br/> 
; //GE::RenderAllSprites();<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Render all sprites<br/>
; //1. Restore all sprites' background<br/>
; //2. Draws all sprites and saves sprite backgrounds<br/>
; //<br/>
; //Example: GE::RenderAllSprites;<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_RenderAllSprites
	;    Procedure type : User-defined procedure
GE_RenderAllSprites:
	    ld  A,(GE_SpriteCount)
	    or  A                   ;// SpriteCount == 0?
	    ret Z                   ;// if yes then return to caller
	    ld  A,($3)
	    ld  (GE_Mode),A		      ;// save current memory mapping
	    ld  A,$90								;// set memory mapping to U0, U1, VID, U3
			ld  ($3),A							;// set value to the system variable
			out ($2),A							;// send value to the memory pages port
			;// Restore all sprites' background	
	    ld  DE,(GE_LastSpritePtr)
	    ld  HL,GE_SpritePtr
	    ld  (HL),E
	    inc HL
	    ld  (HL),D							;// SpritePtr := LastSpritePtr;
	    ld  A,[GE_SpriteCount]
	    ld  [GE_i],A            ;// i := SpriteCount
	restore_all_spr_loop:
			ld  HL,[GE_SpritePtr]
			ld  E,(HL)
			inc HL
			ld  D,(HL)							;// DE -> sprite class
			dec HL
			dec HL
			dec HL
			ld  [GE_SpritePtr],HL	  ;// SpritePtr := prev. sprite
			ld  [GE_Sprite_this],DE	;// init Sprite class
			ld  A,(DE)							;// A = Sprite.Visible
			or  A                   ;// Sprite.Visible = False?			
			jp  z,restore_all_spr_next
			ex  DE,HL								;// HL -> Sprite.Visible
			ld  BC,27
			add HL,BC								;// HL -> Sprite.UseBackground
			ld  A,(HL)
			or  A                   ;// Sprite.UseBackground == False?
			jp  z,restore_all_spr_next
			call GE_Sprite_RestoreBackground ;// restores the background of the sprite (and set IX -> GE_Sprite_this)
			;// execute the sprite.Hide()
			ld  A,(IX+10)        		;// A = sprite.VisibleState
			cp  2                   ;// sprite.VisibleState = HIDE?
			jp  nz,restore_all_spr_next
			ld  (IX+0),0            ;// sprite.Visible = False
	restore_all_spr_next:
			ld  HL,GE_i
			dec (HL)                ;// dec (i)
			jp  nz,restore_all_spr_loop
			;// Draws all sprites and saves sprite backgrounds	
	    ld  DE,(GE_SpriteListPtr)
	    ld  HL,GE_SpritePtr
	    ld  (HL),E
	    inc HL
	    ld  (HL),D							;// SpritePtr := SpriteListPtr;
	    ld  A,[GE_SpriteCount]
	    ld  [GE_i],A            ;// i := SpriteCount
	render_all_spr_loop:
			ld  HL,(GE_SpritePtr)
			ld  E,(HL)
			inc HL
			ld  D,(HL)							;// DE -> sprite class
			inc HL									;// HL -> next sprite
			ld  (GE_SpritePtr),HL		;// SpritePtr := next sprite
			ld  (GE_Sprite_this),DE	;// init Sprite class
			;// execute the sprite.Show()
      ld  IXL,E
			ld  IXH,D               ;// IX -> sprite class			
			ld  A,(IX+10)        		;// A = sprite.VisibleState
			cp  1                   ;// sprite.VisibleState = SHOW?
			jp  nz,render_all_spr_draw_check_visible
			ld  (IX+0),1            ;// sprite.Visible = True
			ld  (IX+10),0           ;// sprite.VisibleState = 0
			jp  render_all_spr_draw_check_type
	render_all_spr_draw_check_visible:		
			ld  A,(DE)							;// A = Sprite.Visible
			or  A                   ;// Sprite.Visible == False?
			jp  z,render_all_spr_next
	render_all_spr_draw_check_type:						
			inc DE                  ;// DE -> Sprite.SpriteType
			ld  A,(DE)              ;// A = Sprite.SpriteType
			dec A                   ;// if Sprite.SpriteType == 1 then dec A -> A = 0
			jp  z,render_all_spr_type_1;// if SpriteType = 1, this is a sprite without a mask; jump to put
			call GE_Sprite_Draw
	render_all_spr_next:
			ld  HL,GE_i
			dec (HL)                ;// dec (i)
			jp  nz,render_all_spr_loop
			;// restore memory mapping
	    ld  A,(GE_Mode) 	  		;// last memory mapping
			ld ($3),A								;// set value to the system variable
			out ($2),A							;// send value to the memory pages port
			;// check ScreenAddr
			ld  HL,GE_ScreenAddr+1
			ld  A,(HL)		          ;// A = ScreenAddr hight byte
			cp  $80							 		;// ScreenAddr = $8000 (DIRECT_TO_SCREEN)
			ret nz									;// if not direct to screen then return
			;// Update last position of all sprites
			ld  HL,(GE_SpriteListPtr) ;// HL = SpriteListPtr
			ld  A,[GE_SpriteCount]
	    ld  B,A                 ;// B := SpriteCount
	upd_all_spr_lastpos_loop:			
			ld  E,(HL)
			inc HL
			ld  D,(HL)							;// DE -> sprite class
			inc HL									;// HL -> next sprite
			;// reset VisibleState
			ld  IXL,E
			ld  IXH,D               ;// IX -> sprite class
			ld  A,(IX+10)        		;// A = sprite.VisibleState
			cp  2                   ;// sprite.VisibleState = HIDE?
			jp  nz,upd_all_spr_lastpos_check_visible
			ld  (IX+10),0           ;// sprite.VisibleState = 0
	upd_all_spr_lastpos_check_visible:
			ld  A,(DE)							;// A = Sprite.Visible
			or  A                   ;// Sprite.Visible == False?
			jp  z,upd_all_spr_lastpos_next
			;// update sprites last position			
			ld  A,(IX+6)	;// A = Lo(Position)
			ld  (IX+8),A	;// Lo(LastPosition) = A
			ld  A,(IX+7)  ;// A = Hi(Position)
			ld  (IX+9),A  ;// Hi(LastPosition) = A
			ld  A,[IX+15] ;// A = X
			ld  (IX+17),A ;// LastX := X
			ld  A,[IX+16] ;// A = Y
			ld  (IX+18),A ;// LastY := Y
	upd_all_spr_lastpos_next:
			djnz upd_all_spr_lastpos_loop
			ret
			;// put sprite without mask
	render_all_spr_type_1:
			ex  DE,HL								;// HL -> Sprite.SpriteType
			ld  BC,26
			add HL,BC								;// HL -> Sprite.UseBackground
			ld  A,(HL)
			or  A                   ;// Sprite.UseBackground = false?
			call nz,GE_Sprite_SaveBackground ;// if the sprite used a background buffer, its background will be saved
	    call GE_Sprite_Put
	    jp  render_all_spr_next	    
	    
	
; // so that the optimizer keeps this procedures
	call GE_Sprite_Put
	call GE_Sprite_Draw
	call GE_Sprite_RestoreBackground
	call GE_Sprite_SaveBackground
	ret
end_procedure_GE_RenderAllSprites:
	; RenderScrollSprites *
; //Minden sprite kimásolása a háttérképernyőről a képernyőre<br/>
; //<br/>
; //Akkor kell használni, ha a Game Engine háttér képernyő (Backscreen) használatával lett inicializálva - GE::Init(GE::USE_BACK_SCREEN)<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::RenderAllSprites();<br/>
; //GE::CopyAllSpritesToScreen;<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Copy all sprites from the Back Screen to the screen<br/>
; //<br/>
; //Example:<br/>
; //GE::RenderAllSprites();<br/>
; //GE::CopyAllSpritesToScreen;<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_CopyAllSpritesToScreen
	;    Procedure type : User-defined procedure
GE_CopyAllSpritesToScreen:
	    ld  A,(GE_SpriteCount)
	    or  A                   ;// SpriteCount == 0?
	    ret Z                   ;// if yes then return to caller
	    ld  DE,(GE_SpriteListPtr)
	    ld  HL,GE_SpritePtr
	    ld  (HL),E
	    inc HL
	    ld  (HL),D							;// SpritePtr := SpriteListPtr;
	    ld  A,($3)
	    ld  (GE_Mode),A		      ;// save current memory mapping
	    ;// set memory to: U0, U1, VID, U3
	    ld A,$90		
			ld ($3),A
			out ($2),A
			;// copy all sprites to screen
			ld  A,[GE_SpriteCount]
	    ld  [GE_i],A            ;// i := SpriteCount
	copy_all_spr_loop:
			ld  HL,(GE_SpritePtr)
			ld  E,(HL)
			inc HL
			ld  D,(HL)							;// DE -> sprite class
			inc HL									;// HL -> next sprite
			ld  (GE_SpritePtr),HL		;// SpritePtr := next sprite
			ld  (GE_Sprite_this),DE	;// init Sprite class
			;// execute the sprite.Hide()
			ld  IXL,E
			ld  IXH,D               ;// IX -> sprite class
			ld  A,(IX+10)        		;// A = sprite.VisibleState
			cp  2                   ;// sprite.VisibleState = HIDE?
			jp  nz,copy_all_spr_check_visible
			ld  (IX+10),0           ;// sprite.VisibleState = 0
			call GE_Sprite_CopyToScreen(); ;// copies the place of the removed sprite to the screen
			jp  copy_all_spr_upd_last_pos			
	copy_all_spr_check_visible:			
			ld  A,(DE)							;// A = Sprite.Visible
			or  A                   ;// Sprite.Visible = False?
			call nz,GE_Sprite_CopyToScreen ;// if Sprite.Visible then call
	copy_all_spr_upd_last_pos:			
			;// update sprites last position			
			ld  A,(IX+6)	;// A = Lo(Position)
			ld  (IX+8),A	;// Lo(LastPosition) = A
			ld  A,(IX+7)  ;// A = Hi(Position)
			ld  (IX+9),A  ;// Hi(LastPosition) = A
			ld  A,[IX+15] ;// A = X
			ld  (IX+17),A ;// LastX := X
			ld  A,[IX+16] ;// A = Y
			ld  (IX+18),A ;// LastY := Y
			;// loop test
			ld  HL,GE_i
			dec (HL)                ;// dec (i)
			jp  nz,copy_all_spr_loop
	    ;// restore memory mapping
	    ld  A,(GE_Mode) 	  		;// last memory mapping
			ld ($3),A								;// set value to the system variable
			out ($2),A							;// send value to the memory pages port
			ret
	    
	
; // so that the optimizer keeps the procedure
	call GE_Sprite_CopyToScreen
	ret
end_procedure_GE_CopyAllSpritesToScreen:
	
; // an empty call so that the optimizer keeps the procedure PutAllSpritesWithMirroring *
; //A teljes háttérképernyőt kimásolja a képernyőre.<br/>
; //<br/>
; //Például akkor érdemes használni, ha a háttérképernyőn elkészült a játék kezdőképernyőjének megrajzolása, így azt ezzel az egy utasítással ki lehet másolni a képernyőre.<br/>
; //Ahhoz viszont túl lassú, hogy a játék főciklusában mindig meghívásra kerüljön, ílyen módon kifrissítve a háttérképernyőt a képernyőre. Erre a GE::CopyAllSpritesToScreen() eljárást kell használni.<br/>
; //Példa a használatása:<br/>
; //GE::CopyBackScreenToScreen();
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Copies the entire Back Screen to the screen<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_CopyBackScreenToScreen
	;    Procedure type : User-defined procedure
GE_CopyBackScreenToScreen:
	    ;// save memory mapping
			ld  A,($3)				;// A = current memory mapping from system variable
			ld  [GE_Mode],A		;// save current memory mapping to Mode variable
			;// mapping the VideoRAM to $8000-BFFF; and U3 ($C000-$FFFF)
      ld  A,$90				  ;// memory mapping: U0, U1, VID, U3
			ld  ($3),A				;// set memory mapping to system variable
			out ($2),A				;// send memory mapping to port #2
			;// Copy the Back Screen to the screen
			ld  HL,GE_BACK_SCREEN_ADDR
			ld  DE,GE_SCREEN_ADDR
			ld  BC,GE_SCREEN_SIZE
			ldir
			;// restore memory mapping
			ld	A,[GE_Mode]		;// A = saved memory mapping
			ld	($3),A				;// restore memory mapping to system variable
			out ($2),A				;// restore memory mapping on port #2
	    
	ret
end_procedure_GE_CopyBackScreenToScreen:
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
GE_SetGraphics_block17:
GE_SetGraphics:
			ld  A,[GE_Mode]
			ld 	C,A 							;// C = graphics mode code
			rst $30 							;// system function call
			db $4 								;// VMODE function code			
			
	ret
end_procedure_GE_SetGraphics:
	; ***********  Defining procedure : GE_SetPalette
	;    Procedure type : User-defined procedure
GE_SetPalette_block18:
GE_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	or a
	jr c, GE_SetPalette_edblock22
GE_SetPalette_localsuccess24: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,GE_SetPalette_edblock22
GE_SetPalette_localsuccess25: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,GE_SetPalette_edblock22
GE_SetPalette_ctb20: ;Main true block ;keep :
				ld A,[GE_Nr]
				ld C,$60
				add A,C
				ld C,A					;// C = $60 + Nr
				ld A,[GE_Color]	;// A = Color code
				out (C),A				;// send Color code to desired palette port
				
GE_SetPalette_edblock22:
	ret
end_procedure_GE_SetPalette:
	;*
; //A keret színének beállítása<br/>
; //<br/>
; //Példa a használatára:<br/>
; //
; // Kék keretszín beállítása:<br/>
; //GE::SetBorder(GE::BORDER_BLUE);<br/>
; //<br/>
; //A használható keret színek:
; //<ul>
; //<li>GE::BORDER_BLACK</li>
; //<li>GE::BORDER_DARKBLUE</li>
; //<li>GE::BORDER_DARKRED</li>
; //<li>GE::BORDER_DARKMAGENTA</li>
; //<li>GE::BORDER_DARKGREEN</li>
; //<li>GE::BORDER_DARKCYAN</li>
; //<li>GE::BORDER_DARKYELLOW</li>
; //<li>GE::BORDER_GRAY</li>
; //<li>GE::BORDER_BLACK2</li>
; //<li>GE::BORDER_BLUE</li>
; //<li>GE::BORDER_RED</li>
; //<li>GE::BORDER_MAGENTA</li>
; //<li>GE::BORDER_GREEN</li>
; //<li>GE::BORDER_CYAN</li>
; //<li>GE::BORDER_YELLOW</li>
; //<li>GE::BORDER_WHITE</li>
; //</ul>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Sets the border color<br/>
; //<br/>
; //Example: GE::SetBorder(GE::BORDER_BLUE);<br/><br/>
; //<br/>
; //Border colors:
; //<ul>
; //<li>GE::BORDER_BLACK</li>
; //<li>GE::BORDER_DARKBLUE</li>
; //<li>GE::BORDER_DARKRED</li>
; //<li>GE::BORDER_DARKMAGENTA</li>
; //<li>GE::BORDER_DARKGREEN</li>
; //<li>GE::BORDER_DARKCYAN</li>
; //<li>GE::BORDER_DARKYELLOW</li>
; //<li>GE::BORDER_GRAY</li>
; //<li>GE::BORDER_BLACK2</li>
; //<li>GE::BORDER_BLUE</li>
; //<li>GE::BORDER_RED</li>
; //<li>GE::BORDER_MAGENTA</li>
; //<li>GE::BORDER_GREEN</li>
; //<li>GE::BORDER_CYAN</li>
; //<li>GE::BORDER_YELLOW</li>
; //<li>GE::BORDER_WHITE</li>
; //</ul>
; 

	; ***********  Defining procedure : GE_SetBorder
	;    Procedure type : User-defined procedure
GE_SetBorder_block27:
GE_SetBorder:
		
    ld A,[GE_Color]
    ld (GE_SYS_BORDER_COLOR),A
		out (GE_SYS_BORDER_PORT),A
	
	ret
end_procedure_GE_SetBorder:
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
GE_SetRasterInterruptPos_block29:
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
	; ResetScroll ===============================================
; //               G R A P H I C S 
; //===============================================*
; //Képernyő törlése egy megadott byte mintával<br/>
; //<br/>
; //Paramétere:<br/>
; //Pattern: a byte minta (0-255)<br/>
; //Például, ha a Pattern 0, akkor a 0. palette színnel, vagy Graphics 16 esetén fekete színnel törli a képernyőt.<br/>
; //<br/>
; //Példa a használatára:<br/>
; //GE::ClearScreen(0);<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Clear screen<br/>
; //<br/>
; //Param:<br/>
; //Patter: byte for clear<br/>
; //For example 0: color of palette #0 or black in Graphics 16<br/>
; //<br/>
; //Example:<br/>
; //GE::ClearScreen(0);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_ClearScreen
	;    Procedure type : User-defined procedure
GE_ClearScreen_block30:
GE_ClearScreen:
				;// save memory mapping
				ld  A,($3)				;// A = current memory mapping from system variable
				ld  [GE_Mode],A		;// save current memory mapping to Mode variable
				// mapping the VideoRAM to $8000-BFFF; and U3 ($C000-$FFFF)
        ld  A,$90					;// memory mapping: U0, U1, VID, U3
				ld  ($3),A				;// set memory mapping to system variable
				out ($2),A				;// send memory mapping to port #2
				;// clear screen
				ld  A,[GE_Pattern];// A := fill pattern byte
				ld  HL,(GE_ScreenAddr) ;// HL -> VIDEORAM / BACK-BUFFER start address				
				ld  (HL),A        ;// put fill pattern to VIDEORAM first byte
				ld  D,H
				ld  E,L           ;// DE = HL
				inc DE            ;// DE -> HL + 1
				ld  BC,16383	    ;// BC = 16K - 1 -> VIDEORAM size - 1
				ldir				      ;// copy fill pattern to all bytes of the VIDEORAM
				;// restore memory mapping
				ld	A,[GE_Mode]		;// A = saved memory mapping
				ld	($3),A				;// restore memory mapping to system variable
				out ($2),A				;// restore memory mapping on port #2
				
	ret
end_procedure_GE_ClearScreen:
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
GE_Pressed_block32:
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
GE_InitCharSet_block33:
GE_InitCharSet:
	ret
end_procedure_GE_InitCharSet:
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
	; nukebomb.ras - a bomba-robbanás (gombafelhő) animációjának kísérleti helye.
; //   Ugyanaz a mód/paletta, mint a WaterPumpGame.ras-ban: GRAPHICS4, szürke/fekete/zöld/kék, szürke border.
; //
; //   HÁTTÉRKÉPERNYŐS (GE::USE_BACK_SCREEN) működés - a GE saját, erre tervezett módja:
; //     * a sprite-ok a háttérképernyőre ($C000, Page 3) rajzolódnak: GE::RenderAllSprites()
; //       (fordított sorrendű háttér-visszaállítás + sorrendi Draw; a sprite-ok háttérpuffereit a GE
; //       foglalja az Init(...,True)-val) - ez semmit nem mutat a képernyőn, nem is villog;
; //     * GE::WaitForSync() után GE::CopyAllSpritesToScreen() csak a sprite-ok (régi+új) téglalapjait
; //       másolja át a látható képernyőre (a kép alján indul, a vblank alatt fut).
; //   Sorrend egy képkockán: mozgás -> RenderAllSprites -> WaitForSync -> CopyAllSpritesToScreen.
; //
; //   RÉSZECSKÉK: NB_DB db 8x8-as MASZKOLT blob = a felhő "buborékjai" (GE::Sprite tömb).
; //   A mozgás-fázisok (útvonal-pontok) a W_X/W_Y tömbben vannak (részecske*NB_WP + pont);
; //   a tömböket a resources\nukebomb_gen.ps1 generálja/írja át.
; //   ★ TRSE-hiba: sprite-tömb elem MEZŐjének írása (Parts[i].X := ..) hibás címet generálhat
; //   (byte index: 8 bitre vágott eltolás; X: az offset helyett az indexet adja hozzá) ->
; //   a mezőket KÉZI ASM-helperek írják (NB_Place / NB_Lathato), metódushívás (Show/Hide/Init) jó.  NukeBlob.bmp-ből, MASZKOLT 8x8  részecskék száma  útvonal-pontok részecskénként  max függőleges lépés pixel/képkocka  max vízszintes lépés byte/képkocka  maszkolt -> Init(...,True): a GE foglal háttérpuffert  Részecskénként: aktuális X (byte-ban, 1 byte = 4 px) és Y (pixel), állapot  1 = már elindult  hányadik útvonal-pont felé tart  ÚTVONAL-PONTOK (generált): 0 talaj, 1 behúzódás középre, 2 emelkedés középen, 3 ív a szél felé, 4 a kalap pereme (befordulva)  inditasi keses (kep)  asm-helperek paraméterei  képkocka-számláló az indítás óta (255-nél megáll)  1 = ezen a képkockán változott valami (kell Render+Copy)  Az NB_I. részecske X/Y mezőinek beírása + SetPosition (kézi ASM: elem-eltolás = NB_I*39) 
	; ***********  Defining procedure : NB_Place
	;    Procedure type : User-defined procedure
NB_Place:
			ld  a,[NB_I]
			ld  hl,Parts
			ld  de,39
			or  a
			jr  z,nb_place_go
			ld  b,a
nb_place_add:
			add hl,de
			djnz nb_place_add
nb_place_go:
			ld  [GE_Sprite_this],hl
			push hl
			pop  ix
			ld  a,[NB_X]
			ld  (ix+15),a
			ld  a,[NB_Y]
			ld  (ix+16),a
			call GE_Sprite_SetPosition
		
	ret
end_procedure_NB_Place:
	; Az NB_I. részecske Visible mezőjének beírása (NB_V: 0/1) 
	; ***********  Defining procedure : NB_Lathato
	;    Procedure type : User-defined procedure
NB_Lathato:
			ld  a,[NB_I]
			ld  hl,Parts
			ld  de,39
			or  a
			jr  z,nb_lat_go
			ld  b,a
nb_lat_add:
			add hl,de
			djnz nb_lat_add
nb_lat_go:
			ld  a,[NB_V]
			ld  (hl),a
		
	ret
end_procedure_NB_Lathato:
	; ***********  Defining procedure : ProgramInit
	;    Procedure type : User-defined procedure
localVariable_ProgramInit_varPrefixed_i:	db	0
ProgramInit_block37:
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
	ld a, $2a
	ld [GE_Color], a
	call GE_SetBorder
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
	ld a, $1
	ld [GE_UseBackScreen], a
	call GE_Init
	ld a, $50
	ld [GE_Mode], a
	call GE_SetMemory
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	; kezdetben rejtett: az első Show()-ig a GE nem nyúl hozzá 
	ld a, $0
	ld [localVariable_ProgramInit_varPrefixed_i], a
ProgramInit_forloop38:
	; Generic assign 16-bit pointer
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$27
	push af
	; Variable is 16-bit
	ld a,[localVariable_ProgramInit_varPrefixed_i]
	ld l,a
	ld h,0
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,Parts
	add hl,de
	; Store 16-bit address
	ld [GE_Sprite_this],hl
	ld hl,NukeBlob_Data
	ld [GE_ImagePtr],hl
	ld a, $1e
	ld [GE_X], a
	ld a, $ac
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; generic assign 
	ld a,[localVariable_ProgramInit_varPrefixed_i]
	ld [NB_I], a
	ld a, $0
	ld [NB_V], a
	call NB_Lathato
ProgramInit_loopstart39:
	ld a,[localVariable_ProgramInit_varPrefixed_i]
	add a,1
	ld [localVariable_ProgramInit_varPrefixed_i],a
	cp $c
	jr nz,ProgramInit_forloop38
ProgramInit_loopend40:
 di 
	; háttér: a szürke pálya a HÁTTÉRKÉPERNYŐRE (U3, $C000), majd egyszer át a látható képernyőre 
	ld a, $90
	ld [GE_Mode], a
	call GE_SetMemory
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ld a, $50
	ld [GE_Mode], a
	call GE_SetMemory
 ei 
	call GE_CopyBackScreenToScreen
	ret
end_procedure_ProgramInit:
	; Robbanás (újra)indítása: a látható részecskék eltüntetése (Hide -> a következő RenderAllSprites
; //   visszaállítja a hátterüket, a CopyAllSpritesToScreen kimásolja), minden részecske a talajról indul, késleltetve 
	; ***********  Defining procedure : Robbanas_Reset
	;    Procedure type : User-defined procedure
localVariable_Robbanas_Reset_varPrefixed_i:	db	0
localVariable_Robbanas_Reset_o:	db	0
Robbanas_Reset_block45:
Robbanas_Reset:
	; a 0. pont a kezdőhely, az 1. felé tart 
	ld a, $0
	ld [localVariable_Robbanas_Reset_varPrefixed_i], a
Robbanas_Reset_forloop46:
	; Generic assign 16-bit pointer
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$27
	push af
	; Variable is 16-bit
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld l,a
	ld h,0
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,Parts
	add hl,de
	; Store 16-bit address
	ld [GE_Sprite_this],hl
	call GE_Sprite_Hide
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$5
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Robbanas_Reset_o], a
	; Storing to array  
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,W_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PX
	add hl,de
	pop af
	ld [hl],a 
	; Storing to array  
	ld a,[localVariable_Robbanas_Reset_o]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,W_Y
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PY
	add hl,de
	pop af
	ld [hl],a 
	; Storing to array  
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,Act
	add hl,de
	ld a,$0
	ld [hl],a 
	; Storing to array  
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	ld e,a
	ld hl,WI
	add hl,de
	ld a,$1
	ld [hl],a 
Robbanas_Reset_loopstart47:
	ld a,[localVariable_Robbanas_Reset_varPrefixed_i]
	add a,1
	ld [localVariable_Robbanas_Reset_varPrefixed_i],a
	cp $c
	jp nz,Robbanas_Reset_forloop46
Robbanas_Reset_loopend48:
	ld a, $0
	ld [Fr], a
	ld a, $1
	ld [Dirty], a
	ret
end_procedure_Robbanas_Reset:
	; Egy képkocka mozgása: a részecskék sorban követik az útvonal-pontjaikat 
	; ***********  Defining procedure : Reszecskek_Lep
	;    Procedure type : User-defined procedure
localVariable_Reszecskek_Lep_varPrefixed_i:	db	0
localVariable_Reszecskek_Lep_o:	db	0
localVariable_Reszecskek_Lep_tx:	db	0
localVariable_Reszecskek_Lep_ty:	db	0
localVariable_Reszecskek_Lep_varPrefixed_d:	db	0
localVariable_Reszecskek_Lep_ox:	db	0
localVariable_Reszecskek_Lep_oy:	db	0
Reszecskek_Lep_block55:
Reszecskek_Lep:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Fr]
	cp $ff
	jr nc,Reszecskek_Lep_edblock59
Reszecskek_Lep_ctb57: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Fr]
	add  a,$1
	ld [Fr], a
Reszecskek_Lep_edblock59:
	ld a, $0
	ld [localVariable_Reszecskek_Lep_varPrefixed_i], a
Reszecskek_Lep_forloop62:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Act
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	or a
	jp nz,Reszecskek_Lep_edblock296
Reszecskek_Lep_ctb294: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[Fr]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Dly
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c,Reszecskek_Lep_edblock310
Reszecskek_Lep_ctb308: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,Act
	add hl,de
	ld a,$1
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld [NB_I], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [NB_X], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [NB_Y], a
	call NB_Place
	; Generic assign 16-bit pointer
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$27
	push af
	; Variable is 16-bit
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld l,a
	ld h,0
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,Parts
	add hl,de
	; Store 16-bit address
	ld [GE_Sprite_this],hl
	call GE_Sprite_Show
	ld a, $1
	ld [Dirty], a
Reszecskek_Lep_edblock310:
Reszecskek_Lep_edblock296:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Act
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jp nz,Reszecskek_Lep_edblock318
Reszecskek_Lep_ctb316: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Reszecskek_Lep_ox], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Reszecskek_Lep_oy], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$5
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Reszecskek_Lep_o], a
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,WI
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_o]
	add  a, b
	ld [localVariable_Reszecskek_Lep_o], a
	; generic assign 
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,W_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Reszecskek_Lep_tx], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_o]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,W_Y
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Reszecskek_Lep_ty], a
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Reszecskek_Lep_edblock424
	jr z, Reszecskek_Lep_edblock424
Reszecskek_Lep_ctb422: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_ty]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $3
	jr c, Reszecskek_Lep_edblock436
	jr z, Reszecskek_Lep_edblock436
Reszecskek_Lep_ctb434: ;Main true block ;keep :
	ld a, $3
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
Reszecskek_Lep_edblock436:
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_d]
	ld b,a
	pop af
	sub  b
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PY
	add hl,de
	pop af
	ld [hl],a 
Reszecskek_Lep_edblock424:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_ty]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nc,Reszecskek_Lep_edblock442
Reszecskek_Lep_ctb440: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_ty]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $3
	jr c, Reszecskek_Lep_edblock454
	jr z, Reszecskek_Lep_edblock454
Reszecskek_Lep_ctb452: ;Main true block ;keep :
	ld a, $3
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
Reszecskek_Lep_edblock454:
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_d]
	ld b,a
	pop af
	add  a, b
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PY
	add hl,de
	pop af
	ld [hl],a 
Reszecskek_Lep_edblock442:
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_tx]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Reszecskek_Lep_edblock460
	jr z, Reszecskek_Lep_edblock460
Reszecskek_Lep_ctb458: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_tx]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $1
	jr c, Reszecskek_Lep_edblock472
	jr z, Reszecskek_Lep_edblock472
Reszecskek_Lep_ctb470: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
Reszecskek_Lep_edblock472:
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_d]
	ld b,a
	pop af
	sub  b
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PX
	add hl,de
	pop af
	ld [hl],a 
Reszecskek_Lep_edblock460:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_tx]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nc,Reszecskek_Lep_edblock478
Reszecskek_Lep_ctb476: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_tx]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $1
	jr c, Reszecskek_Lep_edblock490
	jr z, Reszecskek_Lep_edblock490
Reszecskek_Lep_ctb488: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Reszecskek_Lep_varPrefixed_d], a
Reszecskek_Lep_edblock490:
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_d]
	ld b,a
	pop af
	add  a, b
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,PX
	add hl,de
	pop af
	ld [hl],a 
Reszecskek_Lep_edblock478:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_tx]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,Reszecskek_Lep_edblock496
Reszecskek_Lep_localsuccess504: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_ty]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,Reszecskek_Lep_edblock496
Reszecskek_Lep_ctb494: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,WI
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $4
	jr nc,Reszecskek_Lep_edblock509
Reszecskek_Lep_ctb507: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,WI
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,$1
	ld b,a
	pop af
	add  a, b
	push af
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,WI
	add hl,de
	pop af
	ld [hl],a 
Reszecskek_Lep_edblock509:
Reszecskek_Lep_edblock496:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_ox]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Reszecskek_Lep_localfailed517
	jr Reszecskek_Lep_ctb513
Reszecskek_Lep_localfailed517: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Reszecskek_Lep_oy]
	ld b,a
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Reszecskek_Lep_edblock515
Reszecskek_Lep_ctb513: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld [NB_I], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PX
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [NB_X], a
	; generic assign 
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,PY
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [NB_Y], a
	call NB_Place
	ld a, $1
	ld [Dirty], a
Reszecskek_Lep_edblock515:
Reszecskek_Lep_edblock318:
Reszecskek_Lep_loopstart63:
	ld a,[localVariable_Reszecskek_Lep_varPrefixed_i]
	add a,1
	ld [localVariable_Reszecskek_Lep_varPrefixed_i],a
	cp $c
	jp nz,Reszecskek_Lep_forloop62
Reszecskek_Lep_loopend64:
	ret
end_procedure_Reszecskek_Lep:
block1:
main_block_begin_:
	call ProgramInit
	call Robbanas_Reset
	ld a, $0
	ld [Dirty], a
MainProgram_while519:
MainProgram_loopstart523:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jr MainProgram_ctb520
MainProgram_ctb520: ;Main true block ;keep :
	call GE_GetKeyboard
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$2007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_eblock571
MainProgram_ctb570: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Space_Volt]
	or a
	jr nz,MainProgram_eblock586
MainProgram_ctb585: ;Main true block ;keep :
	call Robbanas_Reset
	; ezen a képkockán nincs Lep: a Hide-ot előbb végre kell hajtania a RenderAllSprites-nak 
	ld a, $2
	ld [Space_Volt], a
	jr MainProgram_edblock587
MainProgram_eblock586:
	ld a, $1
	ld [Space_Volt], a
MainProgram_edblock587:
	jr MainProgram_edblock572
MainProgram_eblock571:
	ld a, $0
	ld [Space_Volt], a
MainProgram_edblock572:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Space_Volt]
	cp $2
	jr z, MainProgram_edblock596
MainProgram_ctb594: ;Main true block ;keep :
	call Reszecskek_Lep
MainProgram_edblock596:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Dirty]
	cp $1
	jr nz,MainProgram_edblock602
MainProgram_ctb600: ;Main true block ;keep :
	call GE_RenderAllSprites
MainProgram_edblock602:
	; a háttérképernyőre rajzol 
	call GE_WaitForSync
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Dirty]
	cp $1
	jr nz,MainProgram_edblock608
MainProgram_ctb606: ;Main true block ;keep :
	call GE_CopyAllSpritesToScreen
MainProgram_edblock608:
	; a változott téglalapok át a látható képernyőre 
	ld a, $0
	ld [Dirty], a
	jr MainProgram_while519
MainProgram_edblock522:
MainProgram_loopend524:
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
