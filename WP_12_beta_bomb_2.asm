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
ENEMY_FAZ_DB EQU $05
ENEMY_MAX_FAZIS EQU $04
ENEMY_MAX_KOLONIA EQU $0a
ENEMY_PROBA_DB EQU $06
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
METEOR_FAZIS_MERET EQU $a0
METEOR_FAZ_DB EQU $04
METEOR_LE_PX EQU $03
METEOR_OLDAL_UTEM EQU $03
METEOR_START_Y EQU $1a
METEOR_X_CEL EQU $02
METEOR_X_MIN EQU $06
METEOR_X_RND EQU $34
METEOR_Y_MIN EQU $46
METEOR_Y_RND EQU $82
MEZO_BX_DB EQU $1f
MEZO_SY_DB EQU $13
PUMPAK_CHUNK EQU $0f
PUMPA_FAZISOK EQU $08
PUMPA_FAZIS_MERET EQU $10
PUMPA_STEP EQU $07
TERKEP_MERET EQU $21c
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
WATERPUMP_PUMPA_FAZISOK EQU $08
WATERPUMP_PUMPA_FAZIS_MERET EQU $10
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
WaterPump_SCREEN_ADDR:	dw	$8000
WaterPump_ScreenAddrTab:	 ds 1080
WaterPump_BuildIdx:	dw	0
WaterPump_BuildX:	db	0
WaterPump_BuildY:	db	0
WaterPump_Idx:	dw	0
WaterPump_Faz:	db	0
WaterPump_PumpaFazPtr_Tab:	 ds 16
Pumpa_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/Pumpa.bin"
end_incbin_Pumpa_Data:
Talaj1_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/talaj1.bin"
end_incbin_Talaj1_Data:
Talaj2_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/talaj2.bin"
end_incbin_Talaj2_Data:
Keret_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/keret.bin"
end_incbin_Keret_Data:
Enemy_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/enemy.bin"
end_incbin_Enemy_Data:
Fal_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/fal.bin"
end_incbin_Fal_Data:
Meteor_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/meteor.bin"
end_incbin_Meteor_Data:
Bomba_Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/bomba.bin"
end_incbin_Bomba_Data:
Pumpa:
	org Pumpa+39
Talaj1:
	org Talaj1+39
Talaj2:
	org Talaj2+39
Keret:
	org Keret+39
Enemy:
	org Enemy+39
Fal:
	org Fal+39
Meteor:
	org Meteor+39
Bomba:
	org Bomba+39
CharSet:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/CharSetGR4.bin"
end_incbin_CharSet:
	; Declaring string asmz80
CashStr:		db	"CASH$:"
	db	0
	; Declaring string asmz80
PumpStr:		db	"PUMP:"
	db	0
Keret_X_ScreenPOS:	db	$1d
Keret_Y_ScreenPOS:	db	$80
Keret_X_Pos:	db	$0f
Keret_Y_Pos:	db	$09
Keret_Elozo_X_Pos:	db	$0f
Keret_Elozo_Y_Pos:	db	$09
Keret_Mozog_Utem:	db	$02
Keret_Mozog_Frame:	db	$00
Map:	 ds 540
MapPos:	dw	0
Drill_Cash:	dw	$2328
Pumpa_price:	dw	$32
Tegla_price:	dw	$0a
Bomba_price:	dw	$3e8
Pumpa_termel:	dw	$01
Pumpa_db:	db	$00
Termel_Frame:	dw	$00
Termel_Utem:	dw	$28
PumpaScanPos:	dw	$00
Pumpa_Uj_Faz:	db	$00
Mezo_ByteX_Tab:	 ds 31
Mezo_SorCim_Tab:	 ds 38
Enemy_FazPtr_Tab:	 ds 10
Meteor_FazPtr_Tab:	 ds 8
Rnd_Porgeto:	db	$00
Start_Wait:	db	$01
Enemy_Sec_Frame:	dw	$00
Enemy_Kolonia_db:	db	$00
Enemy_Terjedhet:	db	$00
Enemy_Coin:	db	$00
Enemy_Utem:	db	$01
Enemy_Frame:	db	$00
Meteor_Aktiv:	db	$00
Meteor_Faz:	db	$00
Meteor_UtemFrame:	db	$00
Meteor_Y_Cel:	db	$6e
Meteor_TriggerFrame:	dw	$3c
PumpaMap:	db	$01
Talaj1Map:	db	$0a
FalMap:	db	$0b
Talaj2Map:	db	$0c
VirusMap:	db	$14
	; ***********  Defining procedure : GE_Sprite_Init
	;    Procedure type : User-defined procedure
 ; Temp vars section
	; Declaring string asmz80
Start_Kepernyo_stringassignstr5301:		db	"SPACE-RE INDUL A JATEK"
	db	0
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
	; sprite.MoveDownBy2 *
; //		Lefelé mozgatja a sprite-ot 4 pixelsorral.<br/>
; //    <br/>
; //    Gyorsabb, mint az sprite.Y := sprite.Y + 4, majd sprite.SetPosition().<br/>
; //    <br/>
; //    Példa a használatára:<br/>    
; //	  PlayerSprite.MoveDownBy4();<br/>
; //    <br/>
; //		<br/>
; //		ENGLISH:<br/>
; //		-------------<br/>
; //		Moves the sprite position DOWN by 4 lines.<br/> 
; //		Faster than SetSpritePos.<br/>
; //		<br/>
; //		Example:<br/> 
; //		Player.MoveDownBy4();<br/> 
; //		<br/>
; //		*
	; ***********  Defining procedure : GE_Sprite_MoveDownBy4
	;    Procedure type : User-defined procedure
GE_Sprite_MoveDownBy4:
					ld  IX,[GE_Sprite_this]	;// IX -> Sprite class
					inc (IX+7)							;// increment sprite position hight byte -> pos = pos + 256 (4*SCREENWIDTH = 256)
					ld  A, (IX+16)       		;// A := Sprite.Y
					add A,4               	;// A := A + 4
					ld  (IX+16),A         	;// Sprite.Y := A
					
	ret
end_procedure_GE_Sprite_MoveDownBy4:
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
GE_SetMemory_block10:
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
GE_Init_block12:
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
GE_SetGraphics_block13:
GE_SetGraphics:
			ld  A,[GE_Mode]
			ld 	C,A 							;// C = graphics mode code
			rst $30 							;// system function call
			db $4 								;// VMODE function code			
			
	ret
end_procedure_GE_SetGraphics:
	; ***********  Defining procedure : GE_SetPalette
	;    Procedure type : User-defined procedure
GE_SetPalette_block14:
GE_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	or a
	jr c, GE_SetPalette_edblock18
GE_SetPalette_localsuccess20: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,GE_SetPalette_edblock18
GE_SetPalette_localsuccess21: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,GE_SetPalette_edblock18
GE_SetPalette_ctb16: ;Main true block ;keep :
				ld A,[GE_Nr]
				ld C,$60
				add A,C
				ld C,A					;// C = $60 + Nr
				ld A,[GE_Color]	;// A = Color code
				out (C),A				;// send Color code to desired palette port
				
GE_SetPalette_edblock18:
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
GE_SetBorder_block23:
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
GE_ClearScreen_block26:
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
	; ***********  Defining procedure : GE_FillRect
	;    Procedure type : User-defined procedure
GE_FillRect_block27:
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
GE_Pressed_block29:
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
GE_Joystick_block31:
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
GE_InitCharSet_block32:
GE_InitCharSet:
	ret
end_procedure_GE_InitCharSet:
	; ***********  Defining procedure : GE_WriteText
	;    Procedure type : User-defined procedure
GE_WriteText_block33:
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
GE_IntToStr_block34:
GE_IntToStr:
	ld a, $0
	ld [GE_i], a
GE_IntToStr_forloop35:
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$0
	ld [hl],a 
GE_IntToStr_loopstart36:
	ld a,[GE_i]
	add a,1
	ld [GE_i],a
	cp $5
	jr nz,GE_IntToStr_forloop35
GE_IntToStr_loopend37:
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
	jr c, GE_IntToStr_edblock43
GE_IntToStr_ctb41: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while54:
GE_IntToStr_loopstart58:
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
	jr c, GE_IntToStr_edblock57
GE_IntToStr_ctb55: ;Main true block ;keep :
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
	jr GE_IntToStr_while54
GE_IntToStr_edblock57:
GE_IntToStr_loopend59:
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
GE_IntToStr_edblock43:
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
	jr c, GE_IntToStr_eblock64
GE_IntToStr_ctb63: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while83:
GE_IntToStr_loopstart87:
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
	jr c, GE_IntToStr_edblock86
GE_IntToStr_ctb84: ;Main true block ;keep :
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
	jr GE_IntToStr_while83
GE_IntToStr_edblock86:
GE_IntToStr_loopend88:
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
	jr GE_IntToStr_edblock65
GE_IntToStr_eblock64:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock95
	jr z, GE_IntToStr_edblock95
GE_IntToStr_ctb93: ;Main true block ;keep :
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
GE_IntToStr_edblock95:
GE_IntToStr_edblock65:
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
	jr c, GE_IntToStr_eblock100
GE_IntToStr_ctb99: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while119:
GE_IntToStr_loopstart123:
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
	jr c, GE_IntToStr_edblock122
GE_IntToStr_ctb120: ;Main true block ;keep :
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
	jr GE_IntToStr_while119
GE_IntToStr_edblock122:
GE_IntToStr_loopend124:
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
	jr GE_IntToStr_edblock101
GE_IntToStr_eblock100:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock131
	jr z, GE_IntToStr_edblock131
GE_IntToStr_ctb129: ;Main true block ;keep :
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
GE_IntToStr_edblock131:
GE_IntToStr_edblock101:
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
	jr c, GE_IntToStr_eblock136
GE_IntToStr_ctb135: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_IntToStr_while155:
GE_IntToStr_loopstart159:
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
	jr c, GE_IntToStr_edblock158
GE_IntToStr_ctb156: ;Main true block ;keep :
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
	jr GE_IntToStr_while155
GE_IntToStr_edblock158:
GE_IntToStr_loopend160:
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
	jr GE_IntToStr_edblock137
GE_IntToStr_eblock136:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[GE_i]
	or a
	jr c, GE_IntToStr_edblock167
	jr z, GE_IntToStr_edblock167
GE_IntToStr_ctb165: ;Main true block ;keep :
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
GE_IntToStr_edblock167:
GE_IntToStr_edblock137:
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
GE_ByteToStr_block170:
GE_ByteToStr:
	ld a, $0
	ld [GE_i], a
GE_ByteToStr_forloop171:
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$0
	ld [hl],a 
GE_ByteToStr_loopstart172:
	ld a,[GE_i]
	add a,1
	ld [GE_i],a
	cp $3
	jr nz,GE_ByteToStr_forloop171
GE_ByteToStr_loopend173:
	ld a, $0
	ld [GE_i], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock179
GE_ByteToStr_ctb177: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while196:
GE_ByteToStr_loopstart200:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock199
GE_ByteToStr_ctb197: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $64
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while196
GE_ByteToStr_edblock199:
GE_ByteToStr_loopend201:
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
	jr nc,GE_ByteToStr_edblock207
GE_ByteToStr_ctb205: ;Main true block ;keep :
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
GE_ByteToStr_edblock207:
GE_ByteToStr_edblock179:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock213
GE_ByteToStr_ctb211: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while224:
GE_ByteToStr_loopstart228:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock227
GE_ByteToStr_ctb225: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $a
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while224
GE_ByteToStr_edblock227:
GE_ByteToStr_loopend229:
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
GE_ByteToStr_edblock213:
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
	;*
; //	Generates 8-bit random number
; 

	; ***********  Defining procedure : Random_RandomByte
	;    Procedure type : User-defined procedure
Random_RandomByte:
		call Random_Random1;
		xor l
	
	ret
end_procedure_Random_RandomByte:
	; ============================================================
; //   WaterPump - sajat, kezzel irt Z80 ASM unit a GE melle, a
; //   sebesseg-kritikus reszek gyorsitasara.
; //
; //   NINCS "@use GE" fuggoseg: a Position-szamitashoz szukseges
; //   videomemoria-kezdocim (GE::ScreenAddr, alapertelmezetten $8000,
; //   GE::Init(GE::DIRECT_TO_SCREEN)-nel) ide, a SCREEN_ADDR sajat
; //   VAR-ba van kimasolva (lasd lent - FONTOS: VAR, nem const, kulonben
; //   a teljes projekt optimalizaloja kiszedi, lasd a var-nal levo
; //   megjegyzest) - ha a fo .ras valaha back-screen/double-buffer modra
; //   valt (GE::Init(True) vagy GE::SwapScreens), ezt IS at kell irni,
; //   mert akkor mar nem szinkron a GE sajat (futasidoben valtozhato)
; //   ScreenAddr-javal.
; //
; //   EGYETLEN feladata van: MAP-index (0..539, UGYANAZ az indexeles,
; //   mint a fo .ras Map[]-jenel: (x-1)+(y-1)*30) alapjan, egy elore
; //   kiszamolt kepernyocim-tablabol (ScreenAddrTab) valo tabla-lookuppal
; //   kirakni egy 16 byte-os (2x8 sor, GRAPHICS4, NEM maszkolt) fazis-
; //   kepet a kepernyore - futas kozben SEMMILYEN SetPosition-hivas/Y*64-
; //   szamitas NINCS, csak a lookup + a teljesen kitekert (unrolled) blit.
; //   NINCS kulon Sprite-szeru osztaly (PumpaSprite) sem: mivel a
; //   PutAt() amugy is csak egy MAR KESZ kepernyocimet olvas ki a
; //   tablabol, semmi szukseg X/Y mezokre vagy SetPosition-metodusra -
; //   a tabla FELEPITESEKOR (BuildScreenAddrTab, EGYSZER induláskor)
; //   szamoljuk ki kozvetlen ASM-mel a SCREEN_ADDR+Y*64+X cimet minden
; //   mezore, es azt taroljuk el.
; //
; //   A masik generalt tabla, PumpaFazPtr_Tab: fazis (0..PUMPA_FAZISOK-1) ->
; //   kesz Data-pointer (a pumpa-kep alapcimetol PUMPA_FAZIS_MERET-enkent
; //   szamolva). Ezt is a unit epiti fel (BuildPumpaFazTab), es a PutAt() MAR
; //   CSAK A FAZIST kapja parameterkent (nem a kesz pointert) - a unit maga
; //   keresi ki a hozza tartozo adatcimet a sajat tablajabol. Igy a "pumpa
; //   kepenek merete/fazisainak szama" tudas teljes egeszeben a unitban van,
; //   a fo .ras csak a fazis-ERTEKET (Map[]-bol szamolva) adja at.
; //
; //   Hasznalat:
; //     WaterPump::BuildScreenAddrTab();          -- EGYSZER, induláskor
; //     WaterPump::BuildPumpaFazTab(alapcim);     -- EGYSZER, induláskor (alapcim = Pumpa.AnimSet)
; //     ...
; //     WaterPump::PutAt(mapIndex, fazis);        -- minden kirakasnal (fazis: 0..PUMPA_FAZISOK-1)
; //   ============================================================  A videomemoria kezdocime (GE::ScreenAddr masolata - lasd a fenti
; //	   fejlec-megjegyzest). GRAPHICS4, DIRECT_TO_SCREEN mod eseten $8000.
; //	   FONTOS: EZ NEM LEHET "const"! Egy const, amire kizarolag nyers
; //	   asm()-szovegbol hivatkozunk (sehol nincs valodi Rascal-szintu
; //	   hasznalata), a TELJES PROJEKT build optimalizaloja KISZEDI (a
; //	   sajat unit-onankenti fordites ezt nem szuri, ezert tunt jonak
; //	   allomanyszinten) - a vegso .asm-ben ezert "Symbol ... undefined"
; //	   hibat ad az assembler. A GE::ScreenAddr is pontosan ezert VAR,
; //	   nem const: mint valodi, memoriaba irt globalis, sosem esik ki.  Kepernyocim-tabla: index 0..539 (= (x-1)+(y-1)*30, UGYANAZ mint a
; //	   Map[] indexelese a fo .ras-ban) -> kesz kepernyocim.
; //	   A BuildScreenAddrTab() tolti fel EGYSZER, indulaskor.  Csak a BuildScreenAddrTab() sajat, kezi ASM-es szamitasahoz/
; //	   tarolasahoz kellenek globalisan (a "ScreenAddrTab[idx]:=cim;" sima
; //	   Rascal forma korabban HIBAS kodot generalt: eldobta a tomb
; //	   bazis-cimet, mielott hasznalta volna - ugy tunik, 2-byte-os
; //	   (integer) tombbe torteno IRAS sima Rascal ":="-vel nem mukodik
; //	   megbizhatoan ebben a TRSE build-ben).  0..539, az eppen epitett mezo indexe  az eppen epitett mezo keperny-X-e (byte-ban)  az eppen epitett mezo keperny-Y-a (pixelben)  A PutAt()/PutAtRaw() "global" parametereinek MAR LETEZO valtozokent
; //	   kell szerepelniuk a var blokkban - a "global" kulcsszo NEM hoz letre
; //	   uj valtozot, csak egy MEGLEVO globalishoz kapcsolja a parametert
; //	   (lasd a GE.tru sajat X/Y/ImagePtr stb. deklaraciojat, ugyanigy).  A pumpa-kep ismert merete (ugyanaz, mint korabban a fo .ras-ban
; //	   volt): PUMPA_FAZISOK db fazis, fazisonkent PUMPA_FAZIS_MERET byte.  fazis (0..PUMPA_FAZISOK-1) -> kesz Data-pointer. A
; //	   BuildPumpaFazTab() tolti fel EGYSZER, indulaskor.  EGYSZER hivando (indulaskor): vegigmegy mind az 540 MAP-cellan, es
; //	   kozvetlen ASM-mel (nincs kulon osztaly/SetPosition) kiszamolja +
; //	   eltarolja a kesz kepernyocimet mindegyikre. 
	; ***********  Defining procedure : WaterPump_BuildScreenAddrTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx:	db	0
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy:	db	0
WaterPump_BuildScreenAddrTab_block234:
WaterPump_BuildScreenAddrTab:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [WaterPump_BuildIdx],hl
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy], a
WaterPump_BuildScreenAddrTab_forloop235:
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx], a
WaterPump_BuildScreenAddrTab_forloop249:
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [WaterPump_BuildX], a
	; generic assign 
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy]
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
	ld [WaterPump_BuildY], a
						ld l,a
						ld h,0
						xor a
						srl h
						rr l
						rra
						srl h
						rr l
						rra
						ld h,l
						ld l,a
						ld bc,(WaterPump_SCREEN_ADDR)
						add hl,bc
						ld a,[WaterPump_BuildX]
						ld b,0
						ld c,a
						add hl,bc
						ex de,hl
						ld hl,[WaterPump_BuildIdx]
						add hl,hl
						ld bc,WaterPump_ScreenAddrTab
						add hl,bc
						ex de,hl
						ld a,l
						ld (de),a
						inc de
						ld a,h
						ld (de),a
					
	; HL := SCREEN_ADDR + BuildY*64 + BuildX (Y*64 shiftekkel,
; //					   mint korabban a PumpaSprite.SetPosition()-ben), majd
; //					   kezi tarolas a ScreenAddrTab[BuildIdx] cimre (lasd a
; //					   fenti megjegyzest, miert kezi ASM-mel). 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[WaterPump_BuildIdx]
	add  hl,de
	ld [WaterPump_BuildIdx],hl
WaterPump_BuildScreenAddrTab_loopstart250:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx],a
	cp $1e+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop249
WaterPump_BuildScreenAddrTab_loopend251:
WaterPump_BuildScreenAddrTab_loopstart236:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy],a
	cp $12+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop235
WaterPump_BuildScreenAddrTab_loopend237:
	ret
end_procedure_WaterPump_BuildScreenAddrTab:
	; EGYSZER hivando (indulaskor): a pumpa-kep alapcimebol (Pumpa.AnimSet
; //	   a fo .ras-ban) kiszamolja es eltarolja mind a PUMPA_FAZISOK db kesz
; //	   Data-pointert. Sima Rascal ciklus (nincs benne raw asm) - az "Alap"
; //	   parameter ezert lehet EGYSZERU (nem "global") parameter, nem kell
; //	   hozza elozetes var-deklaracio. 
	; ***********  Defining procedure : WaterPump_BuildPumpaFazTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f:	db	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp:	dw	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap:	dw	0
WaterPump_BuildPumpaFazTab_block258:
WaterPump_BuildPumpaFazTab:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap]
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp],hl
	ld a, $0
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f], a
WaterPump_BuildPumpaFazTab_while259:
WaterPump_BuildPumpaFazTab_loopstart263:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f]
	cp $8
	jr nc,WaterPump_BuildPumpaFazTab_edblock262
WaterPump_BuildPumpaFazTab_ctb260: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp]
	; Storing in 16-bit array index
	push hl
	ld hl,WaterPump_PumpaFazPtr_Tab
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f]
	ld d,0
	ld e,a
	add hl,de
	add hl,de
	pop de
	ld a,e
	ld [hl],a
	ld a,d
	inc hl
	ld [hl],a
	; 16 bit BINOP
	; RHS is pure 
	ld de,$10
	; Variable is 16-bit
	ld hl,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp]
	add  hl,de
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp],hl
	; 'a:=a + const'  optimization 
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f]
	add  a,$1
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f], a
	jr WaterPump_BuildPumpaFazTab_while259
WaterPump_BuildPumpaFazTab_edblock262:
WaterPump_BuildPumpaFazTab_loopend264:
	ret
end_procedure_WaterPump_BuildPumpaFazTab:
	; A TENYLEGES, kepkockankenti gyors kirako: MAP-index (0..539) alapjan
; //	   a ScreenAddrTab-bol nezi ki a kesz kepernyocimet, a fazisbol
; //	   (0..PUMPA_FAZISOK-1) pedig a PumpaFazPtr_Tab-bol a kesz Data-
; //	   pointert - NINCS SetPosition-hivas, NINCS Y*64 szamitas, csak KET
; //	   tabla-lookup + a 16 byte-os blit.
; //	   FONTOS: a "ldi" MELLEKHATASKENT csokkenti BC-t minden lefutasnal
; //	   (ezt hasznalja a ldir ciklusszamlalokent) - ezert a sor-eltolashoz
; //	   (62) NEM szabad egyszer betoltott BC-t ujrahasznalni a ket ldi
; //	   UTAN, mert az mar elcsuszott - minden sor elott UJRA be kell
; //	   tolteni BC=62-t. 
	; ***********  Defining procedure : WaterPump_PutAt
	;    Procedure type : User-defined procedure
WaterPump_PutAt_block267:
WaterPump_PutAt:
			ld hl,[WaterPump_Idx]
			add hl,hl
			ld bc,WaterPump_ScreenAddrTab
			add hl,bc
			ld e,(hl)
			inc hl
			ld d,(hl)
			ld a,[WaterPump_Faz]
			ld l,a
			ld h,0
			add hl,hl
			ld bc,WaterPump_PumpaFazPtr_Tab
			add hl,bc
			ld a,(hl)
			inc hl
			ld h,(hl)
			ld l,a
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
			ex de,hl
			ld bc,62
			add hl,bc
			ex de,hl
			ldi
			ldi
		
	ret
end_procedure_WaterPump_PutAt:
	; Sprite-képek (bináris grafikai adatok)  8x8, NEM maszkolt - a felhasználó saját rajza (talaj2.bmp) alapján konvertálva  20x16, MASZKOLT, 1 fázis - a felhasználó saját rajza (bomba1.bmp) alapján konvertálva  A sprite-objektumok: Pumpa (animált szivattyú), Talaj1 (üres talaj mező),
; //		   Keret (a játékos által mozgatott kurzor - "keretezi" az aktuális mezőt),
; //		   Enemy (zöld "paca" ellenség, 8x8, nem maszkolt, 5 növekvő animfázis),
; //		   Fal (8x8 tégla, nem maszkolt, NEM animált - mint a Talaj1),
; //		   Meteor (20x16 = a vírus 2.5x-e, MASZKOLT áttetsző, fekete+kék pöttyös
; //		   szikladarab - MASZKOLT -> Draw kell -> Init(...,True) KÖTELEZŐ, hogy
; //		   a háttérpuffere ne legyen 0 [lásd CLAUDE.md]).
; //		   FONTOS: KIZÁRÓLAG a Pumpa kirakása megy a WaterPump unit
; //		   WaterPump::PutAt() tábla-alapú rutinján (lásd lent) - ez volt a
; //		   felhasználó kifejezett kérése ("csak a pumpákra vonatkozóan").
; //		   Talaj1/Fal/Enemy TOVÁBBRA IS a Bery-féle GE::Sprite.Put()-tal
; //		   rajzolódik (Mezo_ByteX_Tab/Mezo_SorCim_Tab pozíciótáblákkal,
; //		   lásd lent) - ÚGY, MINT a WaterPump_Meteor_10.ras-ban. (2026-09-14:
; //		   egy korábbi kör ezeket is átállította WaterPump::PutAtRaw-ra,
; //		   de az torz/hiányos vírus- és pumpa-grafikát eredményezett -
; //		   visszaállítva a bevált GE útra, a gyökérok további vizsgálat
; //		   nélkül még nyitott - lásd CLAUDE.md.) Keret és Meteor MARAD
; //		   GE::Sprite.Draw-on (maszkoltak, azt a mi unitunk nem tudja).  2. talajtípus - nem maszkolt, bélyegzőként Put-olva, mint a Talaj1/Fal  Bomba: a B gombos Bomba_Ledob() zuhanás-animációjához (a képernyő
; //		   tetejéről a Keret soráig esik, lásd Bomba_Ledob) - MASZKOLT, ezért
; //		   Init(...,True) kell (Draw különben a $0000-ra írna, lásd CLAUDE.md).  Meteor mozgás: MINDEN képkockán METEOR_LE_PX px LE.
; //		   Oldalra PIXELENKÉNT: MINDEN METEOR_OLDAL_UTEM. képkockán 1 px balra -
; //		   a szikla 4 animfázisa (0..3) van 0/1/2/3 px-lel balra tolva, tehát
; //		   az első 3 oldal-"lépés" csak fázist vált, a 4. után megy egy VALÓDI
; //		   Meteor.X -= 1 byte + vissza a 0. fázisra. Net: 1 px / oldal-lépés.
; //		   BELÉPŐ X: RANDOM (METEOR_X_MIN + rnd%METEOR_X_RND). ÚT-HOSSZ: RANDOM,
; //		   a meteor Y = Meteor_Y_Cel (=METEOR_Y_MIN + rnd%METEOR_Y_RND) -nél áll
; //		   meg és tűnik el (a becsapódási pont -> talaj-roncsolás).  ennyi pixelt megy LEFELÉ képkockánként  HANGOLHATÓ: ennyi képkockánként 1 PIXEL balra (nagyobb = meredekebb).  belépő px-Y (fent) - fix  belépő byte-X minimum (a pálya bal széle felé is essen!)  belépő X szórása -> X = 6..57 (szinte a teljes pályaszélesség)  leállási px-Y minimum  út-hossz szórása -> leáll Y = 70..199  eddig lép balra: az 1. MAP oszlop byte-ja (gx=1 -> byte 2), onnan már csak zuhan  meteor.bin animfázisai (0/1/2/3 px balra tolva)  egy fázis mérete bájtban: MASZKOLT -> Width*Height*2 = 5*16*2  A Keret aktuális képernyő-pozíciója pixelben/byte-ban  A Keret aktuális rács (mező) pozíciója: X: 1-30, Y: 1-18  A Keret ELŐZŐ (legutóbb ténylegesen frissített) rács-pozíciója - ebből
; //		   tudja a Keret_Frissit, hogy mozgott-e a Keret (lásd ott).  A Keret (kurzor) mozgásának lassítása: csak minden Keret_Mozog_Utem.
; //		   képkockán léphet egyet. Nagyobb érték = lassabb kurzor.  A játéktér 30x18 mezős rácsa. EGYETLEN állapot-tömb: a pumpa
; //		   animációs FÁZISA is a Map[]-ben van kódolva (Map[i]=PumpaMap+fázis,
; //		   1..8), a vírusé ugyanígy (Map[i]=VirusMap+fázis) - nincs külön
; //		   pumpa-pool/tömb, a WaterPump unit is ezt az indexelést használja
; //		   a ScreenAddrTab-jában.  a Map[] mérete (540)  Keret alatti mező indexe a Map tömbben  összegyűjtött pénz (kijelzéshez, max 4 jegy)  egy pumpa ára  egy fal-tégla ára (F gomb)  egy bomba ára (B gomb)  egy pumpa hozama Termel_Utem képkockánként - integer, hogy a Pumpa_db*Pumpa_termel szorzat ne csorduljon túl  eddig lerakott pumpák száma (csak számláló, a pumpa a Map[]-ben él)  képkocka-SZÁMLÁLÓ a termeléshez (0-tól Termel_Utem-ig számol)  HANGOLHATÓ: ennyi képkockánként termelnek a pumpák (kb. 50 kép = 1 mp)  -----------------------------------------------------------------
; //		   PUMPA-ANIMÁCIÓ: lépésközös (strided) Map[]-scan, EGYETLEN,
; //		   folyamatosan haladó mutatóval (PumpaScanPos) - lásd WaterPump.tru
; //		   fejlécét is. Képkockánként PUMPAK_CHUNK db Map-mezőt vizsgálunk,
; //		   PUMPA_STEP távolságra egymástól (nem egymás után!), hogy a gyors
; //		   egymásutánban, szomszédos Map-mezőkre lerakott pumpák NE
; //		   tűnjenek "összehangolt" animációnak (lásd a WaterPumpGame.ras
; //		   korábbi, megerősített/működő verzióját).
; //		   PUMPA_STEP-nek relatív prímnek kell lennie TERKEP_MERET-tel
; //		   (540 = 2^2*3^3*5), különben nem fedi le mind az 540 mezőt.
; //		   -----------------------------------------------------------------  lépésköz - relatív prím kell legyen TERKEP_MERET-hez (540)  ennyi mezőt vizsgálunk/frissítünk képkockánként - fő perf-hangoló  hol tartottunk a mintázásban - a következő képkocka innen folytatja  a Pumpa sprite animációs fázisainak száma  egy fázis mérete bájtban (Pumpa.bin/enemy.bin: nem maszkolt 2x8 = 16)  enemy.bin fázisainak száma (0..4)  Körbeforgó induló-fázis számláló pumpa-lerakáskor (KIZÁRÓLAG
; //		   megjelenítési célra - lásd DrillLerak).  --- KÖZÖS POZÍCIÓ-TÁBLÁK a Talaj1/Fal/Enemy-hez (Bery/GE::Sprite
; //		   Put úton maradnak - lásd a var blokk elején lévő megjegyzést:
; //		   a WaterPump::PutAt() KIZÁRÓLAG a pumpánál marad, a felhasználó
; //		   kifejezett kérésére). A ProgramInit tölti fel EGYSZER: rács-
; //		   koordináta -> képernyő. ---  Mezo_ByteX_Tab mérete (rács-X 0..30, a 0 nincs használva)  Mezo_SorCim_Tab mérete (rács-Y 0..18, a 0 nincs használva)  rács-X 1..30 -> képernyő byte-X (x*2)  rács-Y 1..18 -> a képsor kezdő címe (ScreenAddr + (30+y*10)*64)  Vírus-fázis -> kész bitmap-pointer tábla (a Pumpa mintájára, de az
; //		   Enemy sprite-hoz).  vírus-fázis 0..4 -> kész bitmap-pointer (Enemy.AnimSet + faz*16)  meteor-fázis 0..3 -> kész bitmap-pointer (AnimSet + faz*160, MASZKOLT - marad GE-s)  ================================================================
; //		   ENEMY / VÍRUS - a C64-es aqualiquex (units.tru / raster.tru)
; //		   viselkedésének 1:1 lemodellezése. A raszter-időzítés NEM számít:
; //		   a C64 raszter-IRQ-ja = nálunk egy fociklus-iteráció (GE::WaitForSync).
; //
; //		   A vírus TELJES állapota MAGÁBAN A Map-ben van (mint a C64-nél a
; //		   képernyő-karakterekben) - NINCS külön pool/tömb!
; //		     Map[mp] = VirusMap + faz, ahol
; //		     - faz 0 .. ENEMY_MAX_FAZIS-1 : NÖVEKVŐ kolónia   (C64: 192..201)
; //		     - faz = ENEMY_MAX_FAZIS       : KIFEJLETT vírus   (C64: 202..208),
; //		       ez már NEM nő tovább, viszont EBBŐL terjed (ha be van kapcsolva
; //		       a terjedés). NINCS wrap 4->0 (a C64 sem csinál ilyet).
; //		   ================================================================  enemy.bin utolsó (kifejlett) fázisa; C64: virusAnimFramesStart  C64 raster.tru: "for i:=0 to 15" -> képkockánként 16 véletlen minta.
; //		   NÁLUNK viszont egy Enemy_Kirak (SW sprite Put) SOKKAL drágább, mint
; //		   a C64 putChar (1 byte poke), és képkockánként kevés a raszter-idő a
; //		   sprite-ok kirakására. Ezért 16 helyett CSAK ENNYI mintát (=> ennyi
; //		   virus-Put-ot) végzünk hívásonként. Ez a fő RASZTER-BUDGET szabályzó:
; //		   ha akadozik/szakad a kép, csökkentsd; ha van tartalék raszter-idő és
; //		   lassúnak tűnik a vírus, óvatosan növeld (vagy Enemy_Utem-et 1-en).  C64 units.tru: maxColonies=10 - ennyi VETETT (nem terjedéssel
; //		   keletkezett) kolónia után új kolónia már nem jön, csak terjedés.  főciklusonként ide megy egy RandomByte() - entrópia  1 = a kezdőképernyőn állunk, várunk a SPACE-re  --- Kolónia-vetés ütemezése (C64: raster.tru newSecond, ~50 frame) ---  frame-számláló a "másodperchez"  eddig VETETT kolóniák száma (C64: noOfColonies)  C64: doVirusSpread. 1 = a kifejlett vírus terjedhet a szomszédba  a "másodperces" 50%-os érme-dobás (Rnd_Porgeto mod 2)  --- A vírus MŰKÖDÉSE (Enemyk_Mukodnek) --- lásd az ENEMY_Szekcio-t ---  HANGOLHATÓ: ennyi frame-enként fut Enemyk_Mukodnek. 1 = minden
; //		   képkockán (sima, nem bursztös, mert ENEMY_PROBA_DB kicsi). Ha még
; //		   így is sok a virus-Put, emeld 2-3-ra (ritkább, de bursztösebb).  frame-számláló hozzá  --- METEOR (nem blokkoló, a főciklusból random időnként) ---  1 = éppen zuhan  meteor aktuális animfázisa 0..3 (0/1/2/3 px balra tolt szikla)  oldallépés-ütemező (METEOR_OLDAL_UTEM-ig számol)  ennél az Y-nál áll meg és tűnik el a meteor (Meteor_Indit random állítja)  visszaszámláló a következő zuhanásig 		MAP értékadások jelentései
; //		Pumpa (a fázis is IDE van kódolva, lásd fent):	PumpaMap..PumpaMap+PUMPA_FAZISOK-1 (1-8)
; //		Talaj típusok:			10-19
; //		Vírusos talaj:			20-29								 Talaj1 sprite értéke  fal mező (talaj-tartomány 10-19); a vírus NEM megy át rajta  Talaj2 = a Bomba_Ledob() becsapódásakor keletkező "kráter" - nincs rá pumpa-lerakás (a DrillLerak/
; //														   TeglaLerak csak Talaj1Map-ra enged) - és a TELJES rombusz-zóna
; //														   Talaj2Map-pá válik, amikor a bomba becsapódik (lásd Bomba_Ledob).
; //														   A Meteor_Becsapodas() sem rongálja (lásd ott).  vírusos mező alapértéke (Map[]=20+faz)  ============================================================
; //   Játék indításakor egyszer lefutó beállítások: grafikus mód,
; //   paletta, karakterkészlet, Game Engine indítása, sprite-ok
; //   inicializálása, a WaterPump unit tábláinak felépítése.
; //   ============================================================ 
	; ***********  Defining procedure : ProgramInit
	;    Procedure type : User-defined procedure
localVariable_ProgramInit_varPrefixed_f:	db	0
localVariable_ProgramInit_xx:	db	0
localVariable_ProgramInit_yy:	db	0
localVariable_ProgramInit_varPrefixed_p:	dw	0
localVariable_ProgramInit_varPrefixed_a:	dw	0
ProgramInit_block268:
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
	; border szürke = a szürke pályához simul -> plasztikusabb kép 
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
	; Pumpa: EGY megosztott "bélyegző", nincs háttérpuffere (False) -
; //		   a tényleges kirakás a WaterPump unit WaterPump::PutAt() tábla-
; //		   alapú rutinján megy (lásd PumpakKirak/DrillLerak), ez az
; //		   objektum csak az AnimSet-számításhoz kell (BuildPumpaFazTab).
; //		   Talaj1/Fal/Enemy VISZONT továbbra is a saját .Put()-jukkal
; //		   rajzolódnak (lásd Enemy_Kirak/Fal_Kirak/Talaj1_Kirak lent) -
; //		   a felhasználó kérése szerint a WaterPump unit KIZÁRÓLAG a
; //		   pumpánál marad. 
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	ld hl,Pumpa_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa_Data
	add hl,de
	ld a,l
	ld [Pumpa+$14],a
	ld a,h
	ld [Pumpa+$14+1],a
	; +3: átugorja a típus+szélesség+magasság header byte-jait 
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	ld hl,Talaj1_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	ld hl,Talaj2
	ld [GE_Sprite_this],hl
	ld hl,Talaj2_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	ld hl,Fal
	ld [GE_Sprite_this],hl
	ld hl,Fal_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; mint a Talaj1: 1 fázis, bélyegzőként Put 
	ld hl,Enemy
	ld [GE_Sprite_this],hl
	ld hl,Enemy_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; mint a Talaj1: bélyegzőként Put-oljuk egy mezőre 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Enemy_Data
	add hl,de
	ld a,l
	ld [Enemy+$14],a
	ld a,h
	ld [Enemy+$14+1],a
	; 5 növekvő fázis; +3: header átugrása  Meteor: MASZKOLT (áttetsző) -> Draw-val rajzoljuk -> KELL a
; //		   háttérpuffer (True), különben a Draw a $0000-ra írna - ez MARAD
; //		   a Bery-féle GE úton, a mi unitunk nem tud maszkolt sprite-ot. 
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	ld hl,Meteor_Data
	ld [GE_ImagePtr],hl
	ld a, $1e
	ld [GE_X], a
	ld a, $5f
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Meteor_Data
	add hl,de
	ld a,l
	ld [Meteor+$14],a
	ld a,h
	ld [Meteor+$14+1],a
	; 4 fázis; +3: header átugrása  Bomba: MASZKOLT, 1 fázis (nincs AnimSet-re szükség) - a kezdő
; //		   X/Y itt lényegtelen, a Start_Kepernyo() explicit beállítja. 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	ld hl,Bomba_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; --- POZÍCIÓ-TÁBLÁK Talaj1/Fal/Enemy-hez (a fő .ras oldalán,
; //		   Bery/GE::Sprite Put úton maradnak) - rács-koordináta ->
; //		   képernyő, EGYSZER feltöltve. Utána a rajzolás (Enemy_Kirak,
; //		   Fal_Kirak, Talaj1_Kirak) nulla szorzást/osztást végez. ---  rács-X (1..30) -> képernyő byte-X = x*2 
	ld a, $1
	ld [localVariable_ProgramInit_xx], a
ProgramInit_while269:
ProgramInit_loopstart273:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_xx]
	ld b,a
	ld a,$1e
	cp b
	jr c,ProgramInit_edblock272
ProgramInit_ctb270: ;Main true block ;keep :
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_ProgramInit_xx]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,[localVariable_ProgramInit_xx]
	ld e,a
	ld d,0
	ld hl,Mezo_ByteX_Tab
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_ProgramInit_xx]
	add  a,$1
	ld [localVariable_ProgramInit_xx], a
	jr ProgramInit_while269
ProgramInit_edblock272:
ProgramInit_loopend274:
	; rács-Y (1..18) -> a képsor kezdő címe: a Pumpa SetPosition-jével,
; //		   X=0-nál (ez ScreenAddr + (30+y*10)*64-et számol). 
	ld a, $1
	ld [localVariable_ProgramInit_yy], a
ProgramInit_while279:
ProgramInit_loopstart283:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_yy]
	ld b,a
	ld a,$12
	cp b
	jr c,ProgramInit_edblock282
ProgramInit_ctb280: ;Main true block ;keep :
	; Storing to array  
	ld a,$0
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$1e
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_ProgramInit_yy]
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
	; generic assign 
	ld de,$6
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; generic assign 
	; Variable is 16-bit
	; Storing in 16-bit array index
	push hl
	ld hl,Mezo_SorCim_Tab
	ld a,[localVariable_ProgramInit_yy]
	ld d,0
	ld e,a
	add hl,de
	add hl,de
	pop de
	ld a,e
	ld [hl],a
	ld a,d
	inc hl
	ld [hl],a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_ProgramInit_yy]
	add  a,$1
	ld [localVariable_ProgramInit_yy], a
	jr ProgramInit_while279
ProgramInit_edblock282:
ProgramInit_loopend284:
	; --- A WaterPump unit saját tábláinak felépítése (EGYSZER) ---
; //		   BuildScreenAddrTab: MINDEN Map-index (0..539) -> kész
; //		   képernyőcím (a WaterPump::PutAt() ezt használja - KIZÁRÓLAG a
; //		   pumpához). BuildPumpaFazTab: a pumpa fázis (0..7) -> kész
; //		   Data-pointer tábla, szintén a unitban (PumpaFazPtr_Tab), a
; //		   PutAt() belülről használja. 
	call WaterPump_BuildScreenAddrTab
	; generic assign 
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap],hl
	call WaterPump_BuildPumpaFazTab
	; Vírus fázis-pointerek: Enemy.AnimSet + faz*16 (faz 0..4; enemy.bin
; //		   is 8x8 nem maszkolt, tehát egy fázis szintén 16 bájt). 
	; generic assign 
	ld de,$14
	ld hl,Enemy
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	ld a, $0
	ld [localVariable_ProgramInit_varPrefixed_f], a
ProgramInit_while289:
ProgramInit_loopstart293:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $5
	jr nc,ProgramInit_edblock292
ProgramInit_ctb290: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; generic assign 
	; Generic mul
	; Node is pure : 1
	ld a,$10
	push af
	; Variable is 16-bit
	ld de,[localVariable_ProgramInit_varPrefixed_p]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_ProgramInit_varPrefixed_a]
	; Variable is 16-bit
	ld hl,[localVariable_ProgramInit_varPrefixed_p]
	add  hl,de
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; generic assign 
	; Variable is 16-bit
	; Storing in 16-bit array index
	push hl
	ld hl,Enemy_FazPtr_Tab
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	ld d,0
	ld e,a
	add hl,de
	add hl,de
	pop de
	ld a,e
	ld [hl],a
	ld a,d
	inc hl
	ld [hl],a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	add  a,$1
	ld [localVariable_ProgramInit_varPrefixed_f], a
	jr ProgramInit_while289
ProgramInit_edblock292:
ProgramInit_loopend294:
	; meteor fázis-pointerek: AnimSet + faz*160 (MASZKOLT -> W*H*2 / fázis) 
	; generic assign 
	ld de,$14
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	ld a, $0
	ld [localVariable_ProgramInit_varPrefixed_f], a
ProgramInit_while299:
ProgramInit_loopstart303:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $4
	jr nc,ProgramInit_edblock302
ProgramInit_ctb300: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; generic assign 
	; Generic mul
	; Node is pure : 1
	ld a,$a0
	push af
	; Variable is 16-bit
	ld de,[localVariable_ProgramInit_varPrefixed_p]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_ProgramInit_varPrefixed_a]
	; Variable is 16-bit
	ld hl,[localVariable_ProgramInit_varPrefixed_p]
	add  hl,de
	ld [localVariable_ProgramInit_varPrefixed_p],hl
	; generic assign 
	; Variable is 16-bit
	; Storing in 16-bit array index
	push hl
	ld hl,Meteor_FazPtr_Tab
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	ld d,0
	ld e,a
	add hl,de
	add hl,de
	pop de
	ld a,e
	ld [hl],a
	ld a,d
	inc hl
	ld [hl],a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	add  a,$1
	ld [localVariable_ProgramInit_varPrefixed_f], a
	jr ProgramInit_while299
ProgramInit_edblock302:
ProgramInit_loopend304:
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
	; A Keret VAN háttérpufferrel (True), mert maszkolt (átlátszó) sprite:
; //		   mozgás előtt vissza kell tudni állítani az alatta lévő valós képet.
; //		   Ez MARAD a Bery-féle GE úton (a mi unitunk nem tud maszkolt sprite-ot). 
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
	ret
end_procedure_ProgramInit:
	; A pumpának/vírusnak nincs poolja (a Map hordozza az állapotot),
; //		   így itt nincs mit üríteni. A Random unitot sem seedeljük (a
; //		   SetRSeed 0-ra ragadhat); a szórást a fociklusban pörgetett
; //		   RandomByte() adja.  Feltölti a teljes Map tömböt üres talajjal (induláskor mindenhol Talaj1 van). 
	; ***********  Defining procedure : MapReset
	;    Procedure type : User-defined procedure
localVariable_MapReset_mapx:	db	0
localVariable_MapReset_mapy:	db	0
localVariable_MapReset_data:	dw	0
MapReset_block311:
MapReset:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapReset_data],hl
	ld a, $1
	ld [localVariable_MapReset_mapy], a
MapReset_forloop312:
	ld a, $1
	ld [localVariable_MapReset_mapx], a
MapReset_forloop322:
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
MapReset_loopstart323:
	ld a,[localVariable_MapReset_mapx]
	add a,1
	ld [localVariable_MapReset_mapx],a
	cp $1e+1
	jr nz,MapReset_forloop322
MapReset_loopend324:
MapReset_loopstart313:
	ld a,[localVariable_MapReset_mapy]
	add a,1
	ld [localVariable_MapReset_mapy],a
	cp $12+1
	jr nz,MapReset_forloop312
MapReset_loopend314:
	ret
end_procedure_MapReset:
	; Egy integer kiírása a HUD-ra MINDIG 4 karakteren, vezető nullákkal
; //   (pl. 5 -> "0005", 100 -> "0100"). A számjegyeket kézzel bontjuk ki
; //   (ezres/százas/tízes/egyes), és mindet külön kiírjuk - így pontosan 4
; //   karakter íródik x, x+2, x+4, x+6 pozícióra, a vezető nullák magukat
; //   rajzolják, nem kell külön törölni. x = a bal karakterhely byte-pozíciója.
; //   Értéktartomány: 0-9999. 
	; ***********  Defining procedure : HUD_Num4
	;    Procedure type : User-defined procedure
localVariable_HUD_Num4_maradek:	dw	0
localVariable_HUD_Num4_varPrefixed_d:	dw	0
localVariable_HUD_Num4_ertek:	dw	0
localVariable_HUD_Num4_x:	db	0
HUD_Num4_block327:
HUD_Num4:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_ertek]
	; Loading pointer
	ld [localVariable_HUD_Num4_maradek],hl
	; generic assign 
	ld de,$3e8
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	; Loading pointer
	ld [localVariable_HUD_Num4_varPrefixed_d],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [GE_IntNum],hl
	call GE_IntToStr
	; generic assign 
	ld a,[localVariable_HUD_Num4_x]
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; 16 bit BINOP
	; Generic mul
	; Node is pure : 1
	ld a,[localVariable_HUD_Num4_varPrefixed_d]
	ld de,$3e8
	ld hl,0
	ld c,0
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_HUD_Num4_maradek],hl
	; generic assign 
	ld de,$64
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	; Loading pointer
	ld [localVariable_HUD_Num4_varPrefixed_d],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [GE_IntNum],hl
	call GE_IntToStr
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_HUD_Num4_x]
	add  a, $2
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; 16 bit BINOP
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$64
	push af
	; Variable is 16-bit
	ld de,[localVariable_HUD_Num4_varPrefixed_d]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_HUD_Num4_maradek],hl
	; generic assign 
	ld de,$0a
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	; Loading pointer
	ld [localVariable_HUD_Num4_varPrefixed_d],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [GE_IntNum],hl
	call GE_IntToStr
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_HUD_Num4_x]
	add  a, $4
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$a
	push af
	; Variable is 16-bit
	ld de,[localVariable_HUD_Num4_varPrefixed_d]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num4_maradek]
	xor a ; clear carry
	sbc hl,de
	; Loading pointer
	ld [localVariable_HUD_Num4_varPrefixed_d],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [GE_IntNum],hl
	call GE_IntToStr
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_HUD_Num4_x]
	add  a, $6
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	ret
end_procedure_HUD_Num4:
	; Mint a HUD_Num4, de 3 jegyen, vezető nullákkal (000-999). byte bemenet
; //   (a pumpaszám max 540, byte-nak kevés lenne, de a HUD csak 3 jegyet mutat -
; //   Pumpa_db byte marad, mert a gyakorlatban messze a 255 alatt lesz). x, x+2, x+4 pozíció. 
	; ***********  Defining procedure : HUD_Num3
	;    Procedure type : User-defined procedure
localVariable_HUD_Num3_maradek:	db	0
localVariable_HUD_Num3_varPrefixed_d:	db	0
localVariable_HUD_Num3_ertek:	db	0
localVariable_HUD_Num3_x:	db	0
HUD_Num3_block331:
HUD_Num3:
	; generic assign 
	ld a,[localVariable_HUD_Num3_ertek]
	ld [localVariable_HUD_Num3_maradek], a
	; generic assign 
	ld a,$64
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_HUD_Num3_maradek]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_HUD_Num3_varPrefixed_d], a
	; generic assign 
	ld [GE_Nr], a
	call GE_ByteToStr
	; generic assign 
	ld a,[localVariable_HUD_Num3_x]
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_HUD_Num3_varPrefixed_d]
	ld e,a
	ld d,0
	ld a,$64
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	ld a,[localVariable_HUD_Num3_maradek]
	sub  b
	ld [localVariable_HUD_Num3_maradek], a
	; generic assign 
	ld a,$a
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_HUD_Num3_maradek]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_HUD_Num3_varPrefixed_d], a
	; generic assign 
	ld [GE_Nr], a
	call GE_ByteToStr
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_HUD_Num3_x]
	add  a, $2
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; generic assign 
	ld a,[localVariable_HUD_Num3_maradek]
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_HUD_Num3_varPrefixed_d]
	ld e,a
	ld d,0
	ld a,$a
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld [localVariable_HUD_Num3_varPrefixed_d], a
	; generic assign 
	ld [GE_Nr], a
	call GE_ByteToStr
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_HUD_Num3_x]
	add  a, $4
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	ret
end_procedure_HUD_Num3:
	; A teljes térkép egyszeri kirajzolása induláskor (minden mező végigjárása,
; //   Talaj1 kirakása a szokásos Bery/GE::Sprite Put-tal), valamint a felső HUD
; //   sáv (CASH, PUMP feliratok és értékek) kiírása. 
	; ***********  Defining procedure : MapToScreen
	;    Procedure type : User-defined procedure
localVariable_MapToScreen_mapx:	db	0
localVariable_MapToScreen_mapy:	db	0
localVariable_MapToScreen_data:	dw	0
MapToScreen_block334:
MapToScreen:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapToScreen_data],hl
	ld a, $1
	ld [localVariable_MapToScreen_mapy], a
MapToScreen_forloop335:
	ld a, $1
	ld [localVariable_MapToScreen_mapx], a
MapToScreen_forloop365:
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
	jr nz,MapToScreen_edblock383
MapToScreen_ctb381: ;Main true block ;keep :
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
MapToScreen_edblock383:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapToScreen_data]
	add  hl,de
	ld [localVariable_MapToScreen_data],hl
MapToScreen_loopstart366:
	ld a,[localVariable_MapToScreen_mapx]
	add a,1
	ld [localVariable_MapToScreen_mapx],a
	cp $1e+1
	jr nz,MapToScreen_forloop365
MapToScreen_loopend367:
MapToScreen_loopstart336:
	ld a,[localVariable_MapToScreen_mapy]
	add a,1
	ld [localVariable_MapToScreen_mapy],a
	cp $12+1
	jp nz,MapToScreen_forloop335
MapToScreen_loopend337:
	; HUD háttérsáv és feliratok kirajzolása a képernyő tetején 
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
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	ld a, $10
	ld [localVariable_HUD_Num4_x], a
	call HUD_Num4
	ld a, $1c
	ld [GE_X], a
	ld a, $4
	ld [GE_Y], a
	ld hl,PumpStr
	ld [GE_Text],hl
	call GE_WriteText
	; "PUMP:" a CASH mellett, egy sorban 
	; generic assign 
	ld a,[Pumpa_db]
	ld [localVariable_HUD_Num3_ertek], a
	ld a, $26
	ld [localVariable_HUD_Num3_x], a
	call HUD_Num3
	ret
end_procedure_MapToScreen:
	; ***********  Defining procedure : Enemy_Kirak
	;    Procedure type : User-defined procedure
localVariable_Enemy_Kirak_varPrefixed_p:	dw	0
localVariable_Enemy_Kirak_x:	db	0
localVariable_Enemy_Kirak_y:	db	0
localVariable_Enemy_Kirak_faz:	db	0
Enemy_Kirak_block390:
Enemy_Kirak:
	; generic assign 
	ld a,[localVariable_Enemy_Kirak_y]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_SorCim_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Enemy_Kirak_varPrefixed_p],hl
	; 16 bit BINOP
	ld a,[localVariable_Enemy_Kirak_x]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_ByteX_Tab
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	; Casting from byte to integer
	ld l,a
	ld h,0
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_Enemy_Kirak_varPrefixed_p]
	add  hl,de
	ld [localVariable_Enemy_Kirak_varPrefixed_p],hl
	; kész képernyőcím, nulla szorzás/SetPosition 
	; Variable is 16-bit
	; Casting from integer to byte
	ld a,l
	ld [Enemy+$6],a
	ld a,h
	ld [Enemy+$6+1],a
	ld a,[localVariable_Enemy_Kirak_faz]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Enemy+$2],a
	ld a,h
	ld [Enemy+$2+1],a
	; kész fázis-pointer táblából 
	ld hl,Enemy
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Enemy_Kirak:
	; ***********  Defining procedure : Fal_Kirak
	;    Procedure type : User-defined procedure
localVariable_Fal_Kirak_varPrefixed_p:	dw	0
localVariable_Fal_Kirak_x:	db	0
localVariable_Fal_Kirak_y:	db	0
Fal_Kirak_block391:
Fal_Kirak:
	; generic assign 
	ld a,[localVariable_Fal_Kirak_y]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_SorCim_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Fal_Kirak_varPrefixed_p],hl
	; 16 bit BINOP
	ld a,[localVariable_Fal_Kirak_x]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_ByteX_Tab
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	; Casting from byte to integer
	ld l,a
	ld h,0
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_Fal_Kirak_varPrefixed_p]
	add  hl,de
	ld [localVariable_Fal_Kirak_varPrefixed_p],hl
	; Variable is 16-bit
	; Casting from integer to byte
	ld a,l
	ld [Fal+$6],a
	ld a,h
	ld [Fal+$6+1],a
	; Fal nem animált -> a Data-t az Init beállította, csak Position + Put kell 
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Fal_Kirak:
	; ***********  Defining procedure : Talaj1_Kirak
	;    Procedure type : User-defined procedure
localVariable_Talaj1_Kirak_varPrefixed_p:	dw	0
localVariable_Talaj1_Kirak_x:	db	0
localVariable_Talaj1_Kirak_y:	db	0
Talaj1_Kirak_block392:
Talaj1_Kirak:
	; generic assign 
	ld a,[localVariable_Talaj1_Kirak_y]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_SorCim_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Talaj1_Kirak_varPrefixed_p],hl
	; 16 bit BINOP
	ld a,[localVariable_Talaj1_Kirak_x]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_ByteX_Tab
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	; Casting from byte to integer
	ld l,a
	ld h,0
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_Talaj1_Kirak_varPrefixed_p]
	add  hl,de
	ld [localVariable_Talaj1_Kirak_varPrefixed_p],hl
	; Variable is 16-bit
	; Casting from integer to byte
	ld a,l
	ld [Talaj1+$6],a
	ld a,h
	ld [Talaj1+$6+1],a
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Talaj1_Kirak:
	; ***********  Defining procedure : Talaj2_Kirak
	;    Procedure type : User-defined procedure
localVariable_Talaj2_Kirak_varPrefixed_p:	dw	0
localVariable_Talaj2_Kirak_x:	db	0
localVariable_Talaj2_Kirak_y:	db	0
Talaj2_Kirak_block393:
Talaj2_Kirak:
	; generic assign 
	ld a,[localVariable_Talaj2_Kirak_y]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_SorCim_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Talaj2_Kirak_varPrefixed_p],hl
	; 16 bit BINOP
	ld a,[localVariable_Talaj2_Kirak_x]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Mezo_ByteX_Tab
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	; Casting from byte to integer
	ld l,a
	ld h,0
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_Talaj2_Kirak_varPrefixed_p]
	add  hl,de
	ld [localVariable_Talaj2_Kirak_varPrefixed_p],hl
	; Variable is 16-bit
	; Casting from integer to byte
	ld a,l
	ld [Talaj2+$6],a
	ld a,h
	ld [Talaj2+$6+1],a
	ld hl,Talaj2
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Talaj2_Kirak:
	; A Keret 3x3 rács-környezetében lévő vírusos mezők újrarajzolása a SAJÁT
; //   fázisukban. Azért kell, mert a Keret (kurzor) mozgásakor a
; //   Keret.RestoreBackground() a Keret alá/mellé eső mezőkre egy ELAVULT
; //   képkockát ken vissza - a vírus a Map-ben tovább nőtt, de a képernyőn a
; //   régi fázis ragad be. A Keret_Frissit() a restore UTÁN, a Keret
; //   újrarajzolása ELŐTT hívja (csak ha mozgott).
; //   Nincs pool: közvetlenül a Map 9 celláját nézzük a Keret körül (O(9),
; //   akárhány vírusmező van a pályán). A fázis = Map[mi]-VirusMap.
; //   Deklaráció-sorrend miatt itt kell állnia, a Keret_Frissit ELŐTT. 
	; ***********  Defining procedure : Enemyk_Ujrarajzol
	;    Procedure type : User-defined procedure
localVariable_Enemyk_Ujrarajzol_dx:	db	0
localVariable_Enemyk_Ujrarajzol_dy:	db	0
localVariable_Enemyk_Ujrarajzol_cx:	db	0
localVariable_Enemyk_Ujrarajzol_cy:	db	0
localVariable_Enemyk_Ujrarajzol_varPrefixed_f:	db	0
localVariable_Enemyk_Ujrarajzol_mi:	dw	0
Enemyk_Ujrarajzol_block394:
Enemyk_Ujrarajzol:
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
Enemyk_Ujrarajzol_while395:
Enemyk_Ujrarajzol_loopstart399:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock398
Enemyk_Ujrarajzol_ctb396: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
Enemyk_Ujrarajzol_while509:
Enemyk_Ujrarajzol_loopstart513:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock512
Enemyk_Ujrarajzol_ctb510: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Keret_X_Pos]
	sub  $1
	push af
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Ujrarajzol_cx], a
	; Keret_X_Pos-1 .. +1 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Keret_Y_Pos]
	sub  $1
	push af
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Ujrarajzol_cy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	cp $1
	jp c, Enemyk_Ujrarajzol_edblock569
Enemyk_Ujrarajzol_localsuccess592: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Enemyk_Ujrarajzol_edblock569
Enemyk_Ujrarajzol_ctb567: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	cp $1
	jp c, Enemyk_Ujrarajzol_edblock597
Enemyk_Ujrarajzol_localsuccess606: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	ld b,a
	ld a,$12
	cp b
	jp c,Enemyk_Ujrarajzol_edblock597
Enemyk_Ujrarajzol_ctb595: ;Main true block ;keep :
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
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
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
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Enemyk_Ujrarajzol_mi],hl
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[VirusMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Ujrarajzol_mi]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Enemyk_Ujrarajzol_edblock612
Enemyk_Ujrarajzol_ctb610: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Ujrarajzol_mi]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[VirusMap]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Enemyk_Ujrarajzol_varPrefixed_f], a
	; generic assign 
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	ld [localVariable_Enemy_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	ld [localVariable_Enemy_Kirak_y], a
	; generic assign 
	ld a,[localVariable_Enemyk_Ujrarajzol_varPrefixed_f]
	ld [localVariable_Enemy_Kirak_faz], a
	call Enemy_Kirak
Enemyk_Ujrarajzol_edblock612:
Enemyk_Ujrarajzol_edblock597:
Enemyk_Ujrarajzol_edblock569:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
	jp Enemyk_Ujrarajzol_while509
Enemyk_Ujrarajzol_edblock512:
Enemyk_Ujrarajzol_loopend514:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
	jp Enemyk_Ujrarajzol_while395
Enemyk_Ujrarajzol_edblock398:
Enemyk_Ujrarajzol_loopend400:
	ret
end_procedure_Enemyk_Ujrarajzol:
	; Csak a Keret X/Y koordinátáit írja ki a HUD-ra (a szöveges kijelzőt frissíti,
; //   a sprite-okat nem érinti). 
	; ***********  Defining procedure : Keret_OSD
	;    Procedure type : User-defined procedure
Keret_OSD:
	ret
end_procedure_Keret_OSD:
	
; // IDEIGLENESEN KIKAPCSOLVA - nem kell az X/Y pozíció kiírás:
; // HUD_Num2(Keret_X_Pos, 42);
; // HUD_Num2(Keret_Y_Pos, 58); A pénz (Drill_Cash) kiírása a HUD-ra, 4 jegyen, vezető nullákkal. 
	; ***********  Defining procedure : Cash_OSD
	;    Procedure type : User-defined procedure
Cash_OSD:
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	ld a, $10
	ld [localVariable_HUD_Num4_x], a
	call HUD_Num4
	ret
end_procedure_Cash_OSD:
	; A lerakott pumpák száma (Pumpa_db) a HUD-ra, 3 jegyen. 
	; ***********  Defining procedure : Pump_OSD
	;    Procedure type : User-defined procedure
Pump_OSD:
	; generic assign 
	ld a,[Pumpa_db]
	ld [localVariable_HUD_Num3_ertek], a
	ld a, $26
	ld [localVariable_HUD_Num3_x], a
	call HUD_Num3
	ret
end_procedure_Pump_OSD:
	; A rács-koordinátákból (Keret_X_Pos/Keret_Y_Pos) kiszámolja a Keret sprite
; //   képernyő-pozícióját (Keret.X / Keret.Y). Ezt még nem érvényesíti a sprite-on -
; //   ahhoz a Keret.SetPosition() hívás is kell (lásd Keret_SpriteKirak). 
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
	; A Keret sprite tényleges kirajzolása az aktuális (Keret.X/Y-ban beállított)
; //   pozícióra. A Keret MASZKOLT, ezért ez marad a Bery-féle GE::Sprite Draw
; //   úton (a mi unitunk csak nem-maszkolt, fix-méretű blitre való). Sorrend:
; //   pozíció érvényesítése -> a Keret alatti terület elmentése háttérként ->
; //   a keret grafika kirajzolása -> "utolsó pozíció" frissítése. 
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
	; ***********  Defining procedure : Pumpa_Torol
	;    Procedure type : User-defined procedure
localVariable_Pumpa_Torol_mp:	dw	0
localVariable_Pumpa_Torol_x:	db	0
localVariable_Pumpa_Torol_y:	db	0
Pumpa_Torol_block622:
Pumpa_Torol:
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
	ld a,[localVariable_Pumpa_Torol_y]
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
	ld a,[localVariable_Pumpa_Torol_x]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Pumpa_Torol_mp],hl
	; pumpaszám-kijelző frissítése 
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Pumpa_Torol_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Pumpa_Torol_edblock627
Pumpa_Torol_localsuccess635: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_Pumpa_Torol_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,Pumpa_Torol_edblock627
Pumpa_Torol_ctb625: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr c, Pumpa_Torol_edblock640
	jr z, Pumpa_Torol_edblock640
Pumpa_Torol_ctb638: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_db]
	sub $1
	ld [Pumpa_db], a
Pumpa_Torol_edblock640:
	call Pump_OSD
Pumpa_Torol_edblock627:
	ret
end_procedure_Pumpa_Torol:
	; SZÁMOLÁSI fázis (vsync ELŐTT): lépésközös (strided) mintavételezés a
; //   teljes Map[]-en - PUMPAK_CHUNK db mezőt néz meg, egymástól PUMPA_STEP
; //   távolságra (idx, idx+STEP, idx+2*STEP, ...), PumpaScanPos-tól indulva.
; //   Ahol pumpa van, ott lépteti a fázist (közvetlenül a Map[]-ben) -
; //   máskülönben nem csinál semmit, DE a vizsgálandó helyek száma MINDKÉT
; //   esetben fogy. Nem rajzol. A PumpaScanPos-t a PumpakKirak() lépteti
; //   tovább (az UTOLSÓ vizsgált hely UTÁNI pozícióra, lásd ott), hogy a
; //   Szamol és a Kirak ugyanazt a mintát dolgozza fel egy adott képkockán
; //   belül. 
	; ***********  Defining procedure : PumpakSzamol
	;    Procedure type : User-defined procedure
localVariable_PumpakSzamol_idx:	dw	0
localVariable_PumpakSzamol_varPrefixed_i:	db	0
localVariable_PumpakSzamol_faz:	db	0
PumpakSzamol_block643:
PumpakSzamol:
	; generic assign 
	; Variable is 16-bit
	ld hl,[PumpaScanPos]
	; Loading pointer
	ld [localVariable_PumpakSzamol_idx],hl
	ld a, $0
	ld [localVariable_PumpakSzamol_varPrefixed_i], a
PumpakSzamol_while644:
PumpakSzamol_loopstart648:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	cp $f
	jp nc,PumpakSzamol_edblock647
PumpakSzamol_ctb645: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, PumpakSzamol_edblock680
PumpakSzamol_localsuccess688: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,PumpakSzamol_edblock680
PumpakSzamol_ctb678: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[PumpaMap]
	ld b,a
	pop af
	sub  b
	ld [localVariable_PumpakSzamol_faz], a
	; 'a:=a + const'  optimization 
	add  a,$1
	ld [localVariable_PumpakSzamol_faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, PumpakSzamol_edblock693
PumpakSzamol_ctb691: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_PumpakSzamol_faz], a
PumpakSzamol_edblock693:
	; Storing to array  
	ld a,[localVariable_PumpakSzamol_faz]
	ld b,a
	ld a,[PumpaMap]
	add  a, b
	push af
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	pop af
	ld [hl],a 
PumpakSzamol_edblock680:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$07
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	add  hl,de
	ld [localVariable_PumpakSzamol_idx],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, PumpakSzamol_edblock699
PumpakSzamol_ctb697: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakSzamol_idx],hl
PumpakSzamol_edblock699:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakSzamol_varPrefixed_i], a
	jp PumpakSzamol_while644
PumpakSzamol_edblock647:
PumpakSzamol_loopend649:
	ret
end_procedure_PumpakSzamol:
	; KIRAKÁSI fázis (vsync UTÁN, a rajzolási fázisban hívandó): ugyanazt a
; //   lépésközös mintát rajzolja ki, amit a PumpakSzamol() az imént léptetett
; //   (WaterPump::PutAt()-tal, csak a FÁZIS értékét adva át - a unit maga
; //   keresi ki a kész Data-pointert a saját PumpaFazPtr_Tab-jából, és a kész
; //   képernyőcímet a saját ScreenAddrTab-jából). A 10./15. vizsgálat UTÁN a
; //   mutató (idx) OTT áll, ahol abbahagytuk - EZT (nem egy külön +1-et)
; //   mentjük PumpaScanPos-ba. 
	; ***********  Defining procedure : PumpakKirak
	;    Procedure type : User-defined procedure
localVariable_PumpakKirak_idx:	dw	0
localVariable_PumpakKirak_varPrefixed_i:	db	0
localVariable_PumpakKirak_faz:	db	0
PumpakKirak_block702:
PumpakKirak:
	; generic assign 
	; Variable is 16-bit
	ld hl,[PumpaScanPos]
	; Loading pointer
	ld [localVariable_PumpakKirak_idx],hl
	ld a, $0
	ld [localVariable_PumpakKirak_varPrefixed_i], a
PumpakKirak_while703:
PumpakKirak_loopstart707:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	cp $f
	jp nc,PumpakKirak_edblock706
PumpakKirak_ctb704: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_PumpakKirak_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, PumpakKirak_edblock727
PumpakKirak_localsuccess729: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_PumpakKirak_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,PumpakKirak_edblock727
PumpakKirak_ctb725: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_PumpakKirak_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[PumpaMap]
	ld b,a
	pop af
	sub  b
	ld [localVariable_PumpakKirak_faz], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[localVariable_PumpakKirak_faz]
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
PumpakKirak_edblock727:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$07
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	add  hl,de
	ld [localVariable_PumpakKirak_idx],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, PumpakKirak_edblock734
PumpakKirak_ctb732: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakKirak_idx],hl
PumpakKirak_edblock734:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakKirak_varPrefixed_i], a
	jp PumpakKirak_while703
PumpakKirak_edblock706:
PumpakKirak_loopend708:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	; Loading pointer
	ld [PumpaScanPos],hl
	ret
end_procedure_PumpakKirak:
	; idx itt már garantáltan <TERKEP_MERET (a ciklusbeli wrap miatt)  Mindent egy eljárásban végez el a Keret körül, a helyes sorrendben:
; //     1) eldönti, kell-e frissíteni (mozgott VAGY pumpa van alatta - az
; //        animálódhat), és ha igen, MÁR ITT elvégzi a RestoreBackground-ot;
; //     2) lefuttatja a PumpakKirak()-ot (a pumpák animációjának forgó
; //        kirajzolása, a PumpakSzamol() már a vsync ELŐTT lelépegette a
; //        fázisokat) - ez azért van KÖZBEN, mert ha a Keret alatti pumpa
; //        pont ekkor lép fázist, a friss képkockának a RestoreBackground UTÁN,
; //        de a SaveBackground ELŐTT kell megjelennie a képernyőn, különben a
; //        Keret alatti pumpa animációja "befagyna" (a Keret mindig egy régi,
; //        elmentett fázist állítana vissza rá);
; //     3) ha kellett a frissítés, elmenti a (már friss pumpa-animációt is
; //        tartalmazó) hátteret és ráteszi a Keret kerekét;
; //     4) a HUD-ot mindig frissíti, függetlenül attól, hogy a sprite
; //        frissült-e.
; //   (Korábban ez két külön eljárásra volt bontva egy globális boolean
; //   jelzővel közöttük - az ELÉG VOLT, hogy a TRSE fordító összeomoljon
; //   [exit code 3221225477 / access violation]. Ez az egy-eljárásos, csak
; //   lokális boolean-okat használó forma bizonyítottan fordul.) 
	; ***********  Defining procedure : Keret_Frissit
	;    Procedure type : User-defined procedure
localVariable_Keret_Frissit_mozgott:	db	0
localVariable_Keret_Frissit_pumpavan:	db	0
Keret_Frissit_block737:
Keret_Frissit:
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
	; generic assign 
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_X_Pos]
	ld b,a
	ld a,[Keret_X_Pos]
	cp b
	jr z, Keret_Frissit_localfailed741
	jr Keret_Frissit_cfb740
Keret_Frissit_localfailed741: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Keret_Frissit_ctb739
	ld a,$01
	jr Keret_Frissit_cfb740
Keret_Frissit_ctb739: ;Main true block ;keep :
	ld a,$00
Keret_Frissit_cfb740:
	ld [localVariable_Keret_Frissit_mozgott], a
	; generic assign 
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Keret_Frissit_ctb742
Keret_Frissit_localsuccess744: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: PLUS
	; Compare with pure num / var optimization
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nc,Keret_Frissit_ctb745
	ld a,$01
	jr Keret_Frissit_cfb746
Keret_Frissit_ctb745: ;Main true block ;keep :
	ld a,$00
Keret_Frissit_cfb746:
	cp $8
	ld a,$01
	jr Keret_Frissit_cfb743
Keret_Frissit_ctb742: ;Main true block ;keep :
	ld a,$00
Keret_Frissit_cfb743:
	ld [localVariable_Keret_Frissit_pumpavan], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_localfailed752
	jr Keret_Frissit_ctb748
Keret_Frissit_localfailed752: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_pumpavan]
	or a
	jr z, Keret_Frissit_edblock750
Keret_Frissit_ctb748: ;Main true block ;keep :
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Keret_Frissit_edblock750:
	call PumpakKirak
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_localfailed765
	jr Keret_Frissit_ctb755
Keret_Frissit_localfailed765: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_pumpavan]
	or a
	jr z, Keret_Frissit_edblock757
Keret_Frissit_ctb755: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_edblock770
Keret_Frissit_ctb768: ;Main true block ;keep :
	; A RestoreBackground által elkent vírus-mezők helyreállítása a
; //				   valós fázisukra - CSAK ha a Keret MOZGOTT. Álló Keretnél
; //				   (pumpán ülve) a 16x12-es folt nem vándorol, tehát nincs mit
; //				   helyreállítani; viszont ez a sweep MINDEN aktív kolóniát
; //				   Put-ol, és a folyamatosan terjedő vírusnál ez képkockánként
; //				   sok Put -> pumpán állva "minden animáció nagyon lelassul".
; //				   Ezért itt a mozgás a feltétel, nem a (mozgott or pumpavan). 
	call Enemyk_Ujrarajzol
Keret_Frissit_edblock770:
	call Keret_XY_Calc
	call Keret_SpriteKirak
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
Keret_Frissit_edblock757:
	call Keret_OSD
	ret
end_procedure_Keret_Frissit:
	; A Keret_MoveXXX eljárások CSAK a rács-koordinátát (Keret_X_Pos/Y_Pos)
; //   módosítják - a tényleges háttér-visszaállítást és újrarajzolást a
; //   főciklus végi Keret_Frissit() végzi el (ami észleli a mozgást és emiatt
; //   restore-ol+újrarajzol), egyszer képkockánként. Ez azért fontos, mert ha
; //   itt is rajzolnánk, a Keret duplán rajzolódna ki minden mozgásnál. 
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
	; Pumpa lerakása a Keret alatti mezőre (Space lenyomásakor hívódik).
; //   Saját, önálló restore->lerakás->mentés+rajzolás sorrendet használ, hogy a
; //   pumpa AZONNAL látszódjon (lásd a WaterPumpGame.ras korábbi, megerősített
; //   verziójának megjegyzését a sorrend fontosságáról).
; //   Nincs pool-kapacitás-ellenőrzés többé: a Map[] természetes módon korlátoz
; //   (nem lehet több pumpa, mint ahány szabad mező van a pályán). 
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
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj1Map]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,DrillLerak_edblock782
DrillLerak_localsuccess790: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, DrillLerak_edblock782
DrillLerak_ctb780: ;Main true block ;keep :
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a keret alatti valós talajt tesszük láthatóvá lerakás előtt 
	; Storing to array  
	ld a,[Pumpa_Uj_Faz]
	ld b,a
	ld a,[PumpaMap]
	add  a, b
	push af
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	pop af
	ld [hl],a 
	; generic assign 
	; Variable is 16-bit
	ld hl,[MapPos]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[Pumpa_Uj_Faz]
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_Uj_Faz]
	add  a,$1
	ld [Pumpa_Uj_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, DrillLerak_edblock795
DrillLerak_ctb793: ;Main true block ;keep :
	ld a, $0
	ld [Pumpa_Uj_Faz], a
DrillLerak_edblock795:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Pumpa_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
	; a pumpa ára levonva a pénzből 
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_db]
	add  a,$1
	ld [Pumpa_db], a
	; termeléshez: hány pumpa van összesen 
	call Cash_OSD
	; pénz-kijelző frissítése 
	call Pump_OSD
	; pumpaszám-kijelző frissítése 
	call Keret_SpriteKirak
	; elmenti a friss (pumpát tartalmazó) hátteret, majd ráteszi a keretet 
	call Keret_OSD
DrillLerak_edblock782:
	ret
end_procedure_DrillLerak:
	; Fal-tégla lerakása a Keret alatti mezőre (F gomb). A DrillLerak mintájára
; //   önálló restore->lerakás->mentés+rajzolás. Csak SZABAD TALAJRA (Talaj1Map -
; //   ez kizárja a pumpát, vírust és a már lerakott falat is), és csak ha van rá
; //   Tegla_price fedezet. A falra ezután pumpa sem rakható (DrillLerak ugyanígy
; //   Talaj1Map-ot vár), és a vírus sem terjed rá (Enemy_Terjed_Ide). 
	; ***********  Defining procedure : TeglaLerak
	;    Procedure type : User-defined procedure
TeglaLerak:
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
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj1Map]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,TeglaLerak_edblock803
TeglaLerak_localsuccess805: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Tegla_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, TeglaLerak_edblock803
TeglaLerak_ctb801: ;Main true block ;keep :
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; Storing to array  
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	ld a,[FalMap]
	ld [hl],a 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Fal_Kirak_x], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Fal_Kirak_y], a
	call Fal_Kirak
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Tegla_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
	call Cash_OSD
	call Keret_SpriteKirak
	call Keret_OSD
TeglaLerak_edblock803:
	ret
end_procedure_TeglaLerak:
	; BOMBA (B gomb, ha van rá Bomba_price fedezet). KÉT FÁZISBAN fut:
; //
; //   1) BLOKKOLÓ zuhanás-animáció: a Bomba sprite a képernyő TETEJÉRŐL
; //      (Y=0) indul, X-e a Keret OSZLOPÁNAK közepéhez igazítva RÖGZÍTETT
; //      (zuhanás közben nem változik - csak függőlegesen esik, a felhasználó
; //      kérése szerint "semmi extra"), és képkockánként 4 pixelt esik lefelé
; //      (`Bomba.MoveDownBy4()` - a Bery/GE beépített, gyors pozíció-mozgató
; //      eljárása, a Meteor esési mintáját véve alapul), amíg az orra (a
; //      sprite ALJA, Y+16) el nem éri a Keret SORÁNAK közepét. Ez a ciklus a
; //      JÁTÉK FŐCIKLUSÁTÓL FÜGGETLENÜL, ÖNMAGA hívja a GE::WaitForSync()-et
; //      minden lépésnél (mint a Start_Kepernyo() saját várakozó ciklusa) -
; //      amíg tart, semmi más (pumpa-animáció, vírus, termelés) nem fut,
; //      nincs szükség képkocka-számlálásra/ütemezésre - a Meteorral
; //      ELLENTÉTBEN, ami a főciklusba ágyazva, KÉPKOCKÁNKÉNT egy lépést tesz
; //      (nem blokkol), itt viszont egy önálló, blokkoló ciklus fut végig a
; //      teljes eséstől a becsapódásig.
; //      **KRITIKUS, KONFIRMÁLT hiba+javítás (2026-09-14): a `GE.tru` forrása
; //      szerint `RestoreBackground()` NEM a `Sprite.Position`-t használja
; //      célként, hanem a KÜLÖN `Sprite.LastPosition` mezőt - ezt viszont
; //      KIZÁRÓLAG a `Sprite.UpdateLastPos()` (vagy az `Init`) állítja be,
; //      a `Draw()`/`SaveBackground()`/`MoveDownBy4()` egyike SEM. Az első
; //      verzió nem hívta az `UpdateLastPos()`-t minden `Draw()` után, ezért
; //      a `RestoreBackground()` MINDIG a kezdeti (Init-ből maradt) helyre
; //      próbált visszaállítani a tényleges legutóbbi rajzolt hely helyett -
; //      ez adta a "csíkot húz" (a bomba minden korábbi pozíciója a
; //      képernyőn maradt) hibát. Javítás: minden `Draw()` UTÁN azonnal
; //      `Bomba.UpdateLastPos();` (pontosan úgy, ahogy a Keret/Meteor is
; //      teszi a saját rajzoló ciklusában - ez volt az EGYETLEN lépés, ami
; //      hiányzott, a Restore/Save/Draw hármas maga már az első verzióban is
; //      megvolt). Mivel a Keret eközben NEM mozog/rajzolódik újra, nincs
; //      szükség a Meteornál bevezetett z-sorrendes átfedés-kezelésre
; //      (egyetlen mozgó sprite egy statikus háttér fölött).
; //   2) Amint az orra elérte a célt, a bomba eltűnik (RestoreBackground), és
; //      jön a Manhattan-távolság alapú ROMBUSZ (gyémánt) alakú roncsolás -
; //      7x7 befoglaló doboz (Keret_X_Pos-3..+3, Keret_Y_Pos-3..+3), egy mező
; //      akkor tartozik bele, ha |dx|+|dy|<=3 - ez 25 mezőt érint a 49-ből (a
; //      sarkok kimaradnak, ezért "rombusz", nem négyzet). Ha ott PUMPA volt
; //      (bármely fázisban) -> Pumpa_Torol (mint a Meteor_Becsapodas-nál - a
; //      Pumpa_db csökken + PUMP HUD frissül). **A TELJES rombusz Talaj2Map-
; //      pá ("kráter") válik** (NEM Talaj1Map-pá, mint korábban) -
; //      `Map[mp]:=Talaj2Map; Talaj2_Kirak(gx,gy);` minden érintett cellára,
; //      függetlenül attól, mi volt ott (pumpa/fal/vírus/sima talaj -
; //      mindegyiket felülírja). A Talaj2Map mezőre a DrillLerak/TeglaLerak
; //      már eddig sem enged pumpát/falat rakni (csak Talaj1Map-ra enged),
; //      így a kráter automatikusan "beépíthetetlen" marad. A `Meteor_
; //      Becsapodas()` a Talaj2Map mezőket KIHAGYJA (nem rongálja a krátert
; //      - lásd ott). A `dy`/`dx` ciklusváltozók 0..6-ig futnak (a -3..+3 eltolást +3-mal
; //      tolva el, hogy byte maradjon), a tényleges rács-koordinátát (gx/gy)
; //      a Meteor_Becsapodas-nál bevált "kivonás, majd tartomány-ellenőrzés"
; //      mintával számoljuk (byte-alulcsordulásnál a `gy>=1`/`gx>=1` check
; //      biztonságosan kiszűri, lásd CLAUDE.md). 
	; ***********  Defining procedure : Bomba_Ledob
	;    Procedure type : User-defined procedure
localVariable_Bomba_Ledob_dx:	db	0
localVariable_Bomba_Ledob_dy:	db	0
localVariable_Bomba_Ledob_gx:	db	0
localVariable_Bomba_Ledob_gy:	db	0
localVariable_Bomba_Ledob_tavx:	db	0
localVariable_Bomba_Ledob_tavy:	db	0
localVariable_Bomba_Ledob_tav:	db	0
localVariable_Bomba_Ledob_celY:	db	0
localVariable_Bomba_Ledob_noseY:	db	0
localVariable_Bomba_Ledob_mp:	dw	0
Bomba_Ledob_block807:
Bomba_Ledob:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Bomba_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp c, Bomba_Ledob_edblock811
Bomba_Ledob_ctb809: ;Main true block ;keep :
	; --- 1) Zuhanás-animáció --- 
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
	push af
	ld a,$2
	ld b,a
	pop af
	sub  b
	ld [Bomba+$f],a
	; vízszintesen a Keret oszlopának közepére igazítva, nem változik zuhanás közben 
	; Storing to array  
	ld a,$0
	ld [Bomba+$10],a
	; a képernyő tetejéről indul 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	; KRITIKUS: RestoreBackground a LastPosition-t használja (NEM a Position-t!) -
; //												   enélkül a következő RestoreBackground a régi/kezdő helyre állna vissza,
; //												   nem a legutóbb rajzolt helyre -> ez okozta a "csíkot húz" hibát 
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
	push af
	ld a,$6
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Bomba_Ledob_celY], a
	; a Keret sorának közepe (Keret_XY_Calc képlete +6, a Keret magasságának fele) 
	; generic assign 
	ld de,$10
	ld hl,Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$10
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Bomba_Ledob_noseY], a
Bomba_Ledob_while2774:
Bomba_Ledob_loopstart2778:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_celY]
	ld b,a
	ld a,[localVariable_Bomba_Ledob_noseY]
	cp b
	jr nc,Bomba_Ledob_edblock2777
Bomba_Ledob_ctb2775: ;Main true block ;keep :
	; a bomba orra = a sprite alja 
	call GE_WaitForSync
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a LastPosition-ön (= legutóbb rajzolt hely) állítja vissza a hátteret 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_MoveDownBy4
	; Bery-féle beépített mozgatás (Position += 4*SCREEN_WIDTH, Y+=4) - gyorsabb, mint Y:=Y+4 + SetPosition() 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	; az ÚJ (Position-ön lévő) hely hátterét menti el 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	; a most rajzolt hely lesz a KÖVETKEZŐ RestoreBackground célja 
	; generic assign 
	ld de,$10
	ld hl,Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$10
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Bomba_Ledob_noseY], a
	jr Bomba_Ledob_while2774
Bomba_Ledob_edblock2777:
Bomba_Ledob_loopend2779:
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a bomba eltűnik, mielőtt a talaj törlődik  --- 2) Rombusz alakú roncsolás (változatlan) --- 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	ld a, $0
	ld [localVariable_Bomba_Ledob_dy], a
Bomba_Ledob_while2782:
Bomba_Ledob_loopstart2786:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dy]
	cp $7
	jp nc,Bomba_Ledob_edblock2785
Bomba_Ledob_ctb2783: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dy]
	cp $3
	jr nc,Bomba_Ledob_eblock3762
Bomba_Ledob_ctb3761: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_dy]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Bomba_Ledob_tavy], a
	jr Bomba_Ledob_edblock3763
Bomba_Ledob_eblock3762:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_dy]
	sub  $3
	ld [localVariable_Bomba_Ledob_tavy], a
Bomba_Ledob_edblock3763:
	; |dy-3| = távolság a Kerettől függőlegesen 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Keret_Y_Pos]
	sub  $3
	push af
	ld a,[localVariable_Bomba_Ledob_dy]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Bomba_Ledob_gy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Bomba_Ledob_edblock3771
Bomba_Ledob_ctb3769: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Bomba_Ledob_edblock4255
Bomba_Ledob_ctb4253: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Bomba_Ledob_dx], a
Bomba_Ledob_while4494:
Bomba_Ledob_loopstart4498:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dx]
	cp $7
	jp nc,Bomba_Ledob_edblock4497
Bomba_Ledob_ctb4495: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dx]
	cp $3
	jr nc,Bomba_Ledob_eblock4618
Bomba_Ledob_ctb4617: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_dx]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Bomba_Ledob_tavx], a
	jr Bomba_Ledob_edblock4619
Bomba_Ledob_eblock4618:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_dx]
	sub  $3
	ld [localVariable_Bomba_Ledob_tavx], a
Bomba_Ledob_edblock4619:
	; |dx-3| = távolság vízszintesen 
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_tavy]
	ld b,a
	ld a,[localVariable_Bomba_Ledob_tavx]
	add  a, b
	ld [localVariable_Bomba_Ledob_tav], a
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld b,a
	ld a,$3
	cp b
	jp c,Bomba_Ledob_edblock4627
Bomba_Ledob_ctb4625: ;Main true block ;keep :
	; csak a rombuszon belüli mezők (Manhattan-távolság) 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Keret_X_Pos]
	sub  $3
	push af
	ld a,[localVariable_Bomba_Ledob_dx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Bomba_Ledob_gx], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Bomba_Ledob_edblock4683
Bomba_Ledob_ctb4681: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Bomba_Ledob_edblock4711
Bomba_Ledob_ctb4709: ;Main true block ;keep :
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
	ld a,[localVariable_Bomba_Ledob_gy]
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
	ld a,[localVariable_Bomba_Ledob_gx]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Bomba_Ledob_mp],hl
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Bomba_Ledob_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Bomba_Ledob_edblock4726
Bomba_Ledob_localsuccess4728: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_Bomba_Ledob_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,Bomba_Ledob_edblock4726
Bomba_Ledob_ctb4724: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gx]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gy]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
Bomba_Ledob_edblock4726:
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Bomba_Ledob_mp]
	ld hl,Map
	add hl,de
	ld a,[Talaj2Map]
	ld [hl],a 
	; a bomba a TELJES rombuszt "kráterré" (Talaj2) alakítja, nem sima Talaj1-gyé 
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gx]
	ld [localVariable_Talaj2_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gy]
	ld [localVariable_Talaj2_Kirak_y], a
	call Talaj2_Kirak
Bomba_Ledob_edblock4711:
Bomba_Ledob_edblock4683:
Bomba_Ledob_edblock4627:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Bomba_Ledob_dx]
	add  a,$1
	ld [localVariable_Bomba_Ledob_dx], a
	jp Bomba_Ledob_while4494
Bomba_Ledob_edblock4497:
Bomba_Ledob_loopend4499:
Bomba_Ledob_edblock4255:
Bomba_Ledob_edblock3771:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Bomba_Ledob_dy]
	add  a,$1
	ld [localVariable_Bomba_Ledob_dy], a
	jp Bomba_Ledob_while2782
Bomba_Ledob_edblock2785:
Bomba_Ledob_loopend2787:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Bomba_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
	call Cash_OSD
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret_OSD
Bomba_Ledob_edblock811:
	ret
end_procedure_Bomba_Ledob:
	; A lerakott pumpák termelése: a Drill_Cash annyiszor Pumpa_termel értékkel nő,
; //   ahány pumpa le lett rakva (Pumpa_db). A főciklus Termel_Utem képkockánként hívja.
; //   A szorzatot integer-ben számoljuk (Pumpa_db * Pumpa_termel akár 800 is lehet,
; //   ami byte-ban túlcsordulna), és 9999-re vágjuk, mert a HUD_Num4 csak 4 jegyet
; //   tud kiírni. 
	; ***********  Defining procedure : Pumpak_Termelnek
	;    Procedure type : User-defined procedure
localVariable_Pumpak_Termelnek_termeny:	dw	0
Pumpak_Termelnek_block4730:
Pumpak_Termelnek:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr c, Pumpak_Termelnek_edblock4734
	jr z, Pumpak_Termelnek_edblock4734
Pumpak_Termelnek_ctb4732: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld a,[Pumpa_db]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_Pumpak_Termelnek_termeny],hl
	; generic assign 
	; Generic mul
	; Node is pure : 1
	ld a,[localVariable_Pumpak_Termelnek_termeny]
	push af
	; Variable is 16-bit
	ld de,[Pumpa_termel]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_Pumpak_Termelnek_termeny],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_Pumpak_Termelnek_termeny]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	add  hl,de
	ld [Drill_Cash],hl
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$270f
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpak_Termelnek_edblock4748
	jr z, Pumpak_Termelnek_edblock4748
Pumpak_Termelnek_ctb4746: ;Main true block ;keep :
	; generic assign 
	ld hl,$270f
	; Loading pointer
	ld [Drill_Cash],hl
Pumpak_Termelnek_edblock4748:
	call Cash_OSD
Pumpak_Termelnek_edblock4734:
	ret
end_procedure_Pumpak_Termelnek:
	; ***********  Defining procedure : Enemy_Terjed_Ide
	;    Procedure type : User-defined procedure
localVariable_Enemy_Terjed_Ide_mp:	dw	0
localVariable_Enemy_Terjed_Ide_x:	db	0
localVariable_Enemy_Terjed_Ide_y:	db	0
Enemy_Terjed_Ide_block4751:
Enemy_Terjed_Ide:
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
	ld a,[localVariable_Enemy_Terjed_Ide_y]
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
	ld a,[localVariable_Enemy_Terjed_Ide_x]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Enemy_Terjed_Ide_mp],hl
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[FalMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Enemy_Terjed_Ide_edblock4756
Enemy_Terjed_Ide_ctb4754: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Enemy_Terjed_Ide_edblock4769
Enemy_Terjed_Ide_localsuccess4771: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,Enemy_Terjed_Ide_edblock4769
Enemy_Terjed_Ide_ctb4767: ;Main true block ;keep :
	; FAL blokkol 
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_x]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_y]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
Enemy_Terjed_Ide_edblock4769:
	; pumpát megeszi, bármely fázisban 
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	ld a,[VirusMap]
	ld [hl],a 
	; 0. fázisú vírus 
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_x]
	ld [localVariable_Enemy_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_y]
	ld [localVariable_Enemy_Kirak_y], a
	ld a, $0
	ld [localVariable_Enemy_Kirak_faz], a
	call Enemy_Kirak
Enemy_Terjed_Ide_edblock4756:
	ret
end_procedure_Enemy_Terjed_Ide:
	; Egy véletlen rács-mezőre vírust rak (C64: a kolónia-vetés
; //   makeVirus(rnd%40, rnd%23+1) hívása). RandomByte 0-255 -> mod 30/18 -> +1. 
	; ***********  Defining procedure : Enemy_Random_Lerak
	;    Procedure type : User-defined procedure
localVariable_Enemy_Random_Lerak_rx:	db	0
localVariable_Enemy_Random_Lerak_ry:	db	0
Enemy_Random_Lerak_block4773:
Enemy_Random_Lerak:
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemy_Random_Lerak_rx], a
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemy_Random_Lerak_ry], a
	; generic assign 
	ld a,$1
	push af
	ld a,[localVariable_Enemy_Random_Lerak_rx]
	push af
	; Swapping nodes
	; Generic mul
	ld a,$1e
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemy_Random_Lerak_rx]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$1e
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemy_Random_Lerak_rx], a
	; generic assign 
	ld a,$1
	push af
	ld a,[localVariable_Enemy_Random_Lerak_ry]
	push af
	; Swapping nodes
	; Generic mul
	ld a,$12
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemy_Random_Lerak_ry]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$12
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemy_Random_Lerak_ry], a
	; generic assign 
	ld a,[localVariable_Enemy_Random_Lerak_rx]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Enemy_Random_Lerak_ry]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
	ret
end_procedure_Enemy_Random_Lerak:
	; A vírus NÖVEKEDÉSE + TERJEDÉSE - a C64 raster.tru "for i:=0 to 15" ciklusának
; //   1:1 mása. A fociklus Enemy_Utem frame-enként hívja (C64-modell: minden
; //   képkockán, Enemy_Utem=1). Hívásonként ENEMY_PROBA_DB db VÉLETLEN cellát
; //   mintavételez. Minden mintára (rx,ry):
; //   - Map[mp] < VirusMap (nincs ott vírus)         -> semmi;
; //   - NÖVEKVŐ vírus (faz < ENEMY_MAX_FAZIS)        -> faz := faz+1 + újrarajz
; //     (NINCS terjedés, NINCS wrap; faz ENEMY_MAX_FAZIS-nál "beérik");
; //   - KIFEJLETT vírus (faz = ENEMY_MAX_FAZIS)      -> nem nő tovább; ha
; //     Enemy_Terjedhet=1, akkor TERJED: a 3x3 KÖRNYEZET (átlók is!) egy
; //     véletlen mezőjére Enemy_Terjed_Ide (a self-eset (dx=dy=0) visszafiatalítja
; //     a saját mezőjét - ez a C64-ben is így van).
; //   A fázist a Map-ből olvassuk, nincs pool-kereső ciklus mintánként. 
	; ***********  Defining procedure : Enemyk_Mukodnek
	;    Procedure type : User-defined procedure
localVariable_Enemyk_Mukodnek_faz:	db	0
localVariable_Enemyk_Mukodnek_nx:	db	0
localVariable_Enemyk_Mukodnek_ny:	db	0
localVariable_Enemyk_Mukodnek_dx:	db	0
localVariable_Enemyk_Mukodnek_dy:	db	0
localVariable_Enemyk_Mukodnek_rx:	db	0
localVariable_Enemyk_Mukodnek_ry:	db	0
localVariable_Enemyk_Mukodnek_varPrefixed_p:	db	0
localVariable_Enemyk_Mukodnek_mp:	dw	0
Enemyk_Mukodnek_block4776:
Enemyk_Mukodnek:
	ld a, $0
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
Enemyk_Mukodnek_while4777:
Enemyk_Mukodnek_loopstart4781:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	cp $6
	jp nc,Enemyk_Mukodnek_edblock4780
Enemyk_Mukodnek_ctb4778: ;Main true block ;keep :
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemyk_Mukodnek_rx], a
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemyk_Mukodnek_ry], a
	; generic assign 
	ld a,$1
	push af
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	push af
	; Swapping nodes
	; Generic mul
	ld a,$1e
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$1e
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Mukodnek_rx], a
	; generic assign 
	ld a,$1
	push af
	ld a,[localVariable_Enemyk_Mukodnek_ry]
	push af
	; Swapping nodes
	; Generic mul
	ld a,$12
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemyk_Mukodnek_ry]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$12
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Mukodnek_ry], a
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
	ld a,[localVariable_Enemyk_Mukodnek_ry]
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
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Enemyk_Mukodnek_mp],hl
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[VirusMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Mukodnek_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jp c, Enemyk_Mukodnek_edblock5048
Enemyk_Mukodnek_ctb5046: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Mukodnek_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[VirusMap]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Enemyk_Mukodnek_faz], a
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	cp $4
	jp nc,Enemyk_Mukodnek_eblock5177
Enemyk_Mukodnek_ctb5176: ;Main true block ;keep :
	; NÖVEKVŐ: egy lépcső előre (C64: putChar(tmp+1)) 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Mukodnek_faz]
	add  a,$1
	ld [localVariable_Enemyk_Mukodnek_faz], a
	; Storing to array  
	ld b,a
	ld a,[VirusMap]
	add  a, b
	push af
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Mukodnek_mp]
	ld hl,Map
	add hl,de
	pop af
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	ld [localVariable_Enemy_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_ry]
	ld [localVariable_Enemy_Kirak_y], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_faz]
	ld [localVariable_Enemy_Kirak_faz], a
	call Enemy_Kirak
	jp Enemyk_Mukodnek_edblock5178
Enemyk_Mukodnek_eblock5177:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Enemy_Terjedhet]
	cp $1
	jp nz,Enemyk_Mukodnek_edblock5244
Enemyk_Mukodnek_ctb5242: ;Main true block ;keep :
	; KIFEJLETT: nem nő; terjed, ha engedélyezve  3x3 környezet: dx,dy fuggetlenul -1/0/+1
; //										   (C64: x + rnd%3 - 1). +1-gyel eltolva a
; //										   byte-underflow ellen: 0..2 -> nx = rx-1+dx 
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemyk_Mukodnek_dx], a
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,$3
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemyk_Mukodnek_dx]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	ld a,[localVariable_Enemyk_Mukodnek_dx]
	sub  b
	ld [localVariable_Enemyk_Mukodnek_dx], a
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Enemyk_Mukodnek_dy], a
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,$3
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Enemyk_Mukodnek_dy]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	ld a,[localVariable_Enemyk_Mukodnek_dy]
	sub  b
	ld [localVariable_Enemyk_Mukodnek_dy], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	sub  $1
	push af
	ld a,[localVariable_Enemyk_Mukodnek_dx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Mukodnek_nx], a
	; rx-1 .. rx+1 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Enemyk_Mukodnek_ry]
	sub  $1
	push af
	ld a,[localVariable_Enemyk_Mukodnek_dy]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Mukodnek_ny], a
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	cp $1
	jr nc,Enemyk_Mukodnek_edblock5278
Enemyk_Mukodnek_ctb5276: ;Main true block ;keep :
	; clamp a rácsra (C64: 0..39 / 1..24) 
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock5278:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	cp $1e
	jr c, Enemyk_Mukodnek_edblock5284
	jr z, Enemyk_Mukodnek_edblock5284
Enemyk_Mukodnek_ctb5282: ;Main true block ;keep :
	ld a, $1e
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock5284:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $1
	jr nc,Enemyk_Mukodnek_edblock5290
Enemyk_Mukodnek_ctb5288: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock5290:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $12
	jr c, Enemyk_Mukodnek_edblock5296
	jr z, Enemyk_Mukodnek_edblock5296
Enemyk_Mukodnek_ctb5294: ;Main true block ;keep :
	ld a, $12
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock5296:
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
Enemyk_Mukodnek_edblock5244:
Enemyk_Mukodnek_edblock5178:
Enemyk_Mukodnek_edblock5048:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	add  a,$1
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
	jp Enemyk_Mukodnek_while4777
Enemyk_Mukodnek_edblock4780:
Enemyk_Mukodnek_loopend4782:
	ret
end_procedure_Enemyk_Mukodnek:
	; ============================================================
; //   KEZDOKEPERNYO / RND-beallitas
; //   Letorli a kepernyot, kiirja kozepre a felhivast, es VAR a SPACE-re.
; //   A varakozas alatt minden kepkockan porget egyet a Random generatoron
; //   -> a seed a jatekos reakcioidejetol fugg (boot-onkent mas). TVC-n
; //   nincs jobb entropiaforras induláskor.
; //   MEGJ.: a felirat ekezet nelkuli - a CharSetGR4.bin ekezetkeszlete
; //   nem biztos, hogy teljes.
; //   ============================================================ 
	; ***********  Defining procedure : Start_Kepernyo
	;    Procedure type : User-defined procedure
Start_Kepernyo:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ld a, $a
	ld [GE_X], a
	ld a, $74
	ld [GE_Y], a
	; Assigning a string : GE_Text
	ld hl,Start_Kepernyo_stringassignstr5301
	; Loading pointer
	ld [GE_Text],hl
	call GE_WriteText
	ld a, $1
	ld [Start_Wait], a
Start_Kepernyo_while5302:
Start_Kepernyo_loopstart5306:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Start_Kepernyo_edblock5305
Start_Kepernyo_ctb5303: ;Main true block ;keep :
	call GE_GetKeyboard
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$2007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Start_Kepernyo_edblock5319
Start_Kepernyo_ctb5317: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Start_Kepernyo_edblock5319:
	call GE_WaitForSync
	jr Start_Kepernyo_while5302
Start_Kepernyo_edblock5305:
Start_Kepernyo_loopend5307:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ret
end_procedure_Start_Kepernyo:
	; ============================================================
; //   METEOR - NEM BLOKKOLÓ. A főciklusból random időnként elindul egy
; //   zuhanás (Meteor_Indit), és amíg tart, a "3." lépésben a
; //   Meteor_Keret_Frissit() fut a Keret_Frissit HELYETT (lásd ott a fejlécet)
; //   - eközben a pumpák / vírus TOVÁBB futnak.
; //   Pálya: RANDOM belépő X-ről, MINDEN képkockán METEOR_LE_PX px LE; MINDEN
; //   METEOR_OLDAL_UTEM. képkockán 1 px BALRA (lépcsőzve, METEOR_X_CEL-ig).
; //   Y=Meteor_Y_Cel (RANDOM út-hossz) -nél ELTŰNIK. Maszkolt -> Draw + puffer,
; //   ez MARAD a Bery-féle GE úton.  A TELJES fal-réteg újrarajzolása a Map-ból (minden FalMap mező). Egyszer
; //   fut le, amikor a meteor eltűnik - így a meteor útjába lerakott, a meteor
; //   elavult háttérpuffere által "letörölt" falak visszakerülnek. (A pumpát a
; //   strided scan magától újrarajzolja, a fal statikus, ezért kell ez.)
; //   ~540 Map-olvasás egyszeri spike-ban - a meteor pont eltűnt, nem látszik. 
	; ***********  Defining procedure : Fal_Mind_Kirak
	;    Procedure type : User-defined procedure
localVariable_Fal_Mind_Kirak_gx:	db	0
localVariable_Fal_Mind_Kirak_gy:	db	0
localVariable_Fal_Mind_Kirak_mp:	dw	0
Fal_Mind_Kirak_block5322:
Fal_Mind_Kirak:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_Fal_Mind_Kirak_mp],hl
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gy], a
Fal_Mind_Kirak_forloop5323:
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gx], a
Fal_Mind_Kirak_forloop5345:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[FalMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Fal_Mind_Kirak_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,Fal_Mind_Kirak_edblock5359
Fal_Mind_Kirak_ctb5357: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	ld [localVariable_Fal_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	ld [localVariable_Fal_Kirak_y], a
	call Fal_Kirak
Fal_Mind_Kirak_edblock5359:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_Fal_Mind_Kirak_mp]
	add  hl,de
	ld [localVariable_Fal_Mind_Kirak_mp],hl
Fal_Mind_Kirak_loopstart5346:
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gx],a
	cp $1e+1
	jr nz,Fal_Mind_Kirak_forloop5345
Fal_Mind_Kirak_loopend5347:
Fal_Mind_Kirak_loopstart5324:
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gy],a
	cp $12+1
	jr nz,Fal_Mind_Kirak_forloop5323
Fal_Mind_Kirak_loopend5325:
	ret
end_procedure_Fal_Mind_Kirak:
	; METEOR BECSAPÓDÁS - a ciklus végén (a meteor eltűnésekor) fut le.
; //   A meteor UTOLSÓ képernyő-koordinátáiból (Meteor.X byte / Meteor.Y px)
; //   kiszámolja, melyik 3x3 rács-mező fölött állt (a meteor közepe köré
; //   centrálva), és MINDET üres talajjá roncsolja: a Map-ban Talaj1Map, a
; //   képen Talaj1 bélyegző. Ha ott PUMPA volt (bármely fázisban) -> Pumpa_Torol
; //   (poolból ki - illetve most csak számláló csökkentés, Pumpa_db--, PUMP HUD).
; //   Ha FAL vagy VÍRUS volt -> a Map felülírás + a talaj kirajzolása magától
; //   kitörli. **Talaj2Map (a Bomba_Ledob() által létrehozott "kráter") mezőt
; //   a meteor NEM rongálja** (a felhasználó kérésére, 2026-09-14) - ha
; //   `Map[mp]=Talaj2Map`, az egész roncsoló blokk (Pumpa_Torol/Map-írás/
; //   Talaj1_Kirak) ki van hagyva, a kráter érintetlen marad.
; //   gx0 = Meteor.X/2 (a becsapódás közepének rács-oszlopa) - a vízszintes
; //   zóna KÖZÉPRE IGAZÍTVA gx0 köré: [gx0-1, gx0, gx0+1] (2026-09-14: ez
; //   KONFIRMÁLT+JAVÍTOTT hiba volt - korábban [gx0, gx0+1, gx0+2] futott,
; //   azaz egy teljes oszloppal JOBBRA csúszva a tényleges középponttól, ezért
; //   a becsapódás közepétől BALRA eső pumpák/mezők rendszeresen kimaradtak a
; //   roncsolásból - "úgy tűnt eltalálta, mégsem tűnt el a pumpa"). gy0 =
; //   (Meteor.Y-22)/10 = a sprite KÖZEPÉNÉL lévő rács-sor -> a 3x3 innen LEFELÉ
; //   3 sor (ez SZÁNDÉKOSAN aszimmetrikus - a zuhanó meteor törmeléke lefelé
; //   hull, nem a csóva felé - NEM hiba). Clamp 1..30 / 1..18. 
	; ***********  Defining procedure : Meteor_Becsapodas
	;    Procedure type : User-defined procedure
localVariable_Meteor_Becsapodas_gx:	db	0
localVariable_Meteor_Becsapodas_gy:	db	0
localVariable_Meteor_Becsapodas_gx0:	db	0
localVariable_Meteor_Becsapodas_gy0:	db	0
localVariable_Meteor_Becsapodas_tx:	db	0
localVariable_Meteor_Becsapodas_ty:	db	0
localVariable_Meteor_Becsapodas_mx:	db	0
localVariable_Meteor_Becsapodas_my:	db	0
localVariable_Meteor_Becsapodas_mp:	dw	0
Meteor_Becsapodas_block5362:
Meteor_Becsapodas:
	; generic assign 
	ld de,$f
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [localVariable_Meteor_Becsapodas_mx], a
	; sprite-mezők SIMA byte lokálba (a bare "Meteor.X/2" gyanús a TRSE-nek) 
	; generic assign 
	ld de,$10
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [localVariable_Meteor_Becsapodas_my], a
	; generic assign 
	ld a,$2
	ld c,a
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld a,[localVariable_Meteor_Becsapodas_mx]
	ld l,a
	ld h,0
	add hl,de
	call div_16x8
	ld a,l
	ld [localVariable_Meteor_Becsapodas_gx0], a
	; mint a működő 2x2-ben, csak 3x3-ra bővítve 
	; generic assign 
	ld a,$a
	ld c,a
	; Generic 16-bit binop
	ld de,$16
	; Variable is 16-bit
	ld a,[localVariable_Meteor_Becsapodas_my]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	call div_16x8
	ld a,l
	ld [localVariable_Meteor_Becsapodas_gy0], a
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_ty], a
Meteor_Becsapodas_while5363:
Meteor_Becsapodas_loopstart5367:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_ty]
	cp $3
	jp nc,Meteor_Becsapodas_edblock5366
Meteor_Becsapodas_ctb5364: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	ld b,a
	ld a,[localVariable_Meteor_Becsapodas_gy0]
	add  a, b
	ld [localVariable_Meteor_Becsapodas_gy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Meteor_Becsapodas_edblock6240
Meteor_Becsapodas_ctb6238: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Meteor_Becsapodas_edblock6676
Meteor_Becsapodas_ctb6674: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_tx], a
Meteor_Becsapodas_while6891:
Meteor_Becsapodas_loopstart6895:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_tx]
	cp $3
	jp nc,Meteor_Becsapodas_edblock6894
Meteor_Becsapodas_ctb6892: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	sub  $1
	push af
	ld a,[localVariable_Meteor_Becsapodas_tx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Meteor_Becsapodas_gx], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Meteor_Becsapodas_edblock7004
Meteor_Becsapodas_ctb7002: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Meteor_Becsapodas_edblock7058
Meteor_Becsapodas_ctb7056: ;Main true block ;keep :
	; KÖZÉPRE igazítva (gx0-1..gx0+1) - lásd a fenti hiba-megjegyzést 
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
	ld a,[localVariable_Meteor_Becsapodas_gy]
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
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Meteor_Becsapodas_mp],hl
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Talaj2Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Meteor_Becsapodas_edblock7086
Meteor_Becsapodas_ctb7084: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Meteor_Becsapodas_edblock7099
Meteor_Becsapodas_localsuccess7101: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,Meteor_Becsapodas_edblock7099
Meteor_Becsapodas_ctb7097: ;Main true block ;keep :
	; a meteor nem rongálja a bomba-krátert (Talaj2Map) 
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
Meteor_Becsapodas_edblock7099:
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	ld a,[Talaj1Map]
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld [localVariable_Talaj1_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Talaj1_Kirak_y], a
	call Talaj1_Kirak
Meteor_Becsapodas_edblock7086:
Meteor_Becsapodas_edblock7058:
Meteor_Becsapodas_edblock7004:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_tx]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_tx], a
	jp Meteor_Becsapodas_while6891
Meteor_Becsapodas_edblock6894:
Meteor_Becsapodas_loopend6896:
Meteor_Becsapodas_edblock6676:
Meteor_Becsapodas_edblock6240:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_ty], a
	jp Meteor_Becsapodas_while5363
Meteor_Becsapodas_edblock5366:
Meteor_Becsapodas_loopend5368:
	ret
end_procedure_Meteor_Becsapodas:
	; ***********  Defining procedure : Meteor_Indit
	;    Procedure type : User-defined procedure
localVariable_Meteor_Indit_varPrefixed_r:	db	0
Meteor_Indit_block7103:
Meteor_Indit:
	; a meteor közeledtének JELZÉSE: CSAK a 3. index (kék) -> sötétkék.
; //		   A szürkéhez / zöldhöz / border-hez NEM nyúlunk. Vissza a meteor VÉGÉN. 
	ld a, $3
	ld [GE_Nr], a
	ld a, $1
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $0
	ld [Meteor_Faz], a
	; Optimization : zp[0]
	ld hl,Meteor_FazPtr_Tab
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Meteor+$2],a
	ld a,h
	ld [Meteor+$2+1],a
	; 0. fázis (szikla1)  RANDOM belépő X (METEOR_X_MIN .. METEOR_X_MIN+METEOR_X_RND-1) 
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Meteor_Indit_varPrefixed_r], a
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,$34
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Meteor_Indit_varPrefixed_r]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$34
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	ld a,[localVariable_Meteor_Indit_varPrefixed_r]
	sub  b
	ld [localVariable_Meteor_Indit_varPrefixed_r], a
	; Storing to array  
	ld b,a
	ld a,$6
	add  a, b
	ld [Meteor+$f],a
	; Storing to array  
	ld a,$1a
	ld [Meteor+$10],a
	; belépő Y fix, fent  RANDOM út-hossz: ennél az Y-nál áll meg (becsapódási pont) 
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Meteor_Indit_varPrefixed_r], a
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,$82
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Meteor_Indit_varPrefixed_r]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$82
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	ld a,[localVariable_Meteor_Indit_varPrefixed_r]
	sub  b
	ld [localVariable_Meteor_Indit_varPrefixed_r], a
	; generic assign 
	ld b,a
	ld a,$46
	add  a, b
	ld [Meteor_Y_Cel], a
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	ld a, $1
	ld [Meteor_Aktiv], a
	ld a, $0
	ld [Meteor_UtemFrame], a
	ret
end_procedure_Meteor_Indit:
	; Meteor AKTÍV állapotban EZ fut a Keret_Frissit HELYETT a főciklusban -
; //   mert két, EGYMÁST ÁTFEDŐ maszkolt sprite (Keret + Meteor) külön
; //   háttérpufferrel "szemetel", ha nem szigorú z-sorrendben restore-oljuk /
; //   rajzoljuk (a GE::RenderAllSprites elve kézzel, 2 sprite-ra):
; //     1) fordított z-sorrendben LE:  Keret.Restore -> Meteor.Restore
; //     2) az alsó animált réteg:      PumpakKirak (+ vírus, ha mozgott)
; //     3) Meteor lépés + rajz:        SetPosition/SaveBackground(map+pumpák)/Draw
; //     4) Keret LEGFELÜL:             SetPosition/SaveBackground(+meteor)/Draw
; //   Így minden sprite háttérpuffere PONTOSAN a saját maga alatti réteget
; //   tartalmazza -> a következő képkocka restore-jai nem írnak vissza elavult
; //   idegen pixeleket (nincs "szellem-Keret", nincs lyuk a meteorban). 
	; ***********  Defining procedure : Meteor_Keret_Frissit
	;    Procedure type : User-defined procedure
localVariable_Meteor_Keret_Frissit_mozgott:	db	0
Meteor_Keret_Frissit_block7106:
Meteor_Keret_Frissit:
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
	; generic assign 
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_X_Pos]
	ld b,a
	ld a,[Keret_X_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_localfailed7110
	jr Meteor_Keret_Frissit_cfb7109
Meteor_Keret_Frissit_localfailed7110: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_ctb7108
	ld a,$01
	jr Meteor_Keret_Frissit_cfb7109
Meteor_Keret_Frissit_ctb7108: ;Main true block ;keep :
	ld a,$00
Meteor_Keret_Frissit_cfb7109:
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; 1) legfelső réteg le 
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; 1) középső réteg le (régi pozíción) 
	call PumpakKirak
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mozgott]
	or a
	jr z, Meteor_Keret_Frissit_edblock7114
Meteor_Keret_Frissit_ctb7112: ;Main true block ;keep :
	; 2) alsó animált réteg 
	call Enemyk_Ujrarajzol
Meteor_Keret_Frissit_edblock7114:
	; a meteor útjába lerakott, "letörölt" falak visszarajzolása 
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[Meteor_Y_Cel]
	ld b,a
	ld de,$10
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	cp b
	jp nc,Meteor_Keret_Frissit_eblock7119
Meteor_Keret_Frissit_ctb7118: ;Main true block ;keep :
	; 3) meteor lépés: MINDEN képkockán METEOR_LE_PX px LE; MINDEN
; //		   METEOR_OLDAL_UTEM. képkockán 1 PIXEL balra - a szikla 4 fázisával
; //		   (0->1->2->3 = 3 px), a 4. oldal-lépésnél VALÓDI Meteor.X -= 1 byte
; //		   + vissza a 0. fázisra. Csak amíg X > METEOR_X_CEL. Ha Y elérte
; //		   Meteor_Y_Cel-t (RANDOM) -> eltűnik + a fal-réteg egyszeri újrarajza. 
	; Storing to array  
	ld de,$10
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$3
	ld b,a
	pop af
	add  a, b
	ld [Meteor+$10],a
	; LE, képkockánként 
	; 'a:=a + const'  optimization 
	ld a,[Meteor_UtemFrame]
	add  a,$1
	ld [Meteor_UtemFrame], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $3
	jr c, Meteor_Keret_Frissit_edblock7177
Meteor_Keret_Frissit_ctb7175: ;Main true block ;keep :
	ld a, $0
	ld [Meteor_UtemFrame], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld de,$f
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	cp $2
	jr c, Meteor_Keret_Frissit_edblock7205
	jr z, Meteor_Keret_Frissit_edblock7205
Meteor_Keret_Frissit_ctb7203: ;Main true block ;keep :
	; ... és 1 byte (4 px) balra -> net 1 px 
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Meteor_Faz]
	cp $3
	jr nc,Meteor_Keret_Frissit_eblock7218
Meteor_Keret_Frissit_ctb7217: ;Main true block ;keep :
	; 0..3: pixelenként balra a fázissal 
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Faz]
	add  a,$1
	ld [Meteor_Faz], a
	jr Meteor_Keret_Frissit_edblock7219
Meteor_Keret_Frissit_eblock7218:
	ld a, $0
	ld [Meteor_Faz], a
	; 4. lépés: vissza a 0. fázisra ... 
	; Storing to array  
	ld de,$f
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$1
	ld b,a
	pop af
	sub  b
	ld [Meteor+$f],a
Meteor_Keret_Frissit_edblock7219:
	ld a,[Meteor_Faz]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Meteor_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Meteor+$2],a
	ld a,h
	ld [Meteor+$2+1],a
Meteor_Keret_Frissit_edblock7205:
Meteor_Keret_Frissit_edblock7177:
	jp Meteor_Keret_Frissit_edblock7120
Meteor_Keret_Frissit_eblock7119:
	ld a, $0
	ld [Meteor_Aktiv], a
	; megérkezett -> nem rajzoljuk többet (a Restore törölte) 
	ld a, $3
	ld [GE_Nr], a
	ld a, $41
	ld [GE_Color], a
	call GE_SetPalette
	; meteor vége -> vissza világoskék 
	call Meteor_Becsapodas
	; a ~3x3 becsapódási mező roncsolása -> üres talaj (Map + kép); a Pumpa_Torol maga frissíti a PUMP HUD-ot 
	call Fal_Mind_Kirak
Meteor_Keret_Frissit_edblock7120:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock7228
Meteor_Keret_Frissit_ctb7226: ;Main true block ;keep :
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
Meteor_Keret_Frissit_edblock7228:
	; 4) Keret LEGFELÜL, minden képkockán (a meteor rajzolhatott rá) 
	call Keret_XY_Calc
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
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
	call Keret_OSD
	ret
end_procedure_Meteor_Keret_Frissit:
block1:
main_block_begin_:
	; ============================================================
; //   FŐPROGRAM
; //   ============================================================  Egyszeri indítási beállítások. 
	call ProgramInit
	; Kezdőképernyő: "SPACE-RE INDUL A JÁTÉK" - eddig NEM történik semmi
; //	   más, csak a szöveg látszik, és a Random generátor pörög. SPACE-re
; //	   megy tovább. 
	call Start_Kepernyo
	; Térkép feltöltése és kirajzolása, a Keret kezdő kirajzolása. 
	call MapReset
	call MapToScreen
	; Kezdő kirajzolás FELTÉTEL NÉLKÜL (nem a Keret_Frissit-en keresztül, mert az
; //	   mostantól csak mozgás/pumpa esetén frissít - induláskor viszont mindig
; //	   látszódnia kell a Keretnek). RestoreBackground-ot itt szándékosan NEM
; //	   hívunk: a ProgramInit-ben elmentett háttér még a MapToScreen előttről,
; //	   "üres" állapotból származna, annak visszaállítása most elrontaná a már
; //	   kirajzolt térképet. 
	call Keret_XY_Calc
	call Keret_SpriteKirak
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
	call Keret_OSD
MainProgram_while7231:
MainProgram_loopstart7235:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jp MainProgram_ctb7232
MainProgram_ctb7232: ;Main true block ;keep :
	; ENEMY_Szekcio: nincs külön kezdő-késleltetés (a C64 sem csinál ilyet).
; //	   A vírus a fociklus "5." lépésében kezd el kolóniákat vetni ~50
; //	   képkockánként ("másodperc"), az első ~1-2 mp-en belül megjelenik.  1. Bemenetkezelés: billentyűzet/joystick lekérdezése, és ez alapján
; //		   a Keret rács-pozíciójának módosítása vagy pumpa lerakása.
; //		   Ezek a lépések itt még NEM rajzolnak semmit a képernyőre. 
	call GE_GetKeyboard
	call GE_GetJoysticks
	; A véletlenszám-generátort minden képkockán pörgetjük, hogy a
; //		   későbbi vírus-terjedés iránya se legyen determinisztikus. 
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Keret-mozgás LASSÍTÁSA: csak minden Keret_Mozog_Utem. képkockán
; //		   léphet egyet a kurzor (Keret_Mozog_Utem kezdő értéke 2). 
	; 'a:=a + const'  optimization 
	ld a,[Keret_Mozog_Frame]
	add  a,$1
	ld [Keret_Mozog_Frame], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret_Mozog_Utem]
	ld b,a
	ld a,[Keret_Mozog_Frame]
	cp b
	jp c, MainProgram_edblock7416
MainProgram_ctb7414: ;Main true block ;keep :
	ld a, $0
	ld [Keret_Mozog_Frame], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7450
MainProgram_localsuccess7452: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Keret_X_Pos]
	cp $1
	jr c, MainProgram_edblock7450
	jr z, MainProgram_edblock7450
MainProgram_ctb7448: ;Main true block ;keep :
	call Keret_MoveLeft
MainProgram_edblock7450:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7457
MainProgram_localsuccess7459: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Keret_X_Pos]
	cp $1e
	jr nc,MainProgram_edblock7457
MainProgram_ctb7455: ;Main true block ;keep :
	call Keret_MoveRight
MainProgram_edblock7457:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7464
MainProgram_localsuccess7466: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Keret_Y_Pos]
	cp $1
	jr c, MainProgram_edblock7464
	jr z, MainProgram_edblock7464
MainProgram_ctb7462: ;Main true block ;keep :
	call Keret_MoveUp
MainProgram_edblock7464:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7471
MainProgram_localsuccess7473: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Keret_Y_Pos]
	cp $12
	jr nc,MainProgram_edblock7471
MainProgram_ctb7469: ;Main true block ;keep :
	call Keret_MoveDown
MainProgram_edblock7471:
MainProgram_edblock7416:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$2007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7478
MainProgram_ctb7476: ;Main true block ;keep :
	call DrillLerak
MainProgram_edblock7478:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$8004
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7484
MainProgram_ctb7482: ;Main true block ;keep :
	call TeglaLerak
MainProgram_edblock7484:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$106
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7490
MainProgram_ctb7488: ;Main true block ;keep :
	; F = fal-tégla lerakás 
	call Bomba_Ledob
MainProgram_edblock7490:
	; B = bomba (rombusz alakú roncsolás)  1b. Pumpa-animáció SZÁMOLÁSI fázisa - KÖTELEZŐEN a WaitForSync
; //		   ELŐTT (csak fázis-léptetés a Map[]-ben, nem rajzol). A hozzá
; //		   tartozó KIRAKÁSI fázis (PumpakKirak) a "3." rajzolási lépésben,
; //		   a Keret_Frissit()/Meteor_Keret_Frissit() belsejében fut. 
	call PumpakSzamol
	; 2. Várakozás a képfrissítésre (raszter-megszakítás), hogy a
; //		   rajzolás ne okozzon szakadást/villogást a képen. 
	call GE_WaitForSync
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,MainProgram_eblock7495
MainProgram_ctb7494: ;Main true block ;keep :
	; 3. Rajzolási fázis. Ha a meteor ÉPPEN zuhan, a Meteor_Keret_Frissit
; //		   fut a Keret_Frissit HELYETT: szigorú z-sorrendben restore-ol/rajzol,
; //		   hogy a két átfedő maszkolt sprite (Keret + Meteor) ne szemeteljen.
; //		   Egyébként a normál Keret_Frissit (pumpák + Keret). 
	call Meteor_Keret_Frissit
	jr MainProgram_edblock7496
MainProgram_eblock7495:
	call Keret_Frissit
MainProgram_edblock7496:
	; 4. Pumpák termelése: Termel_Utem képkockánként egyszer. 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Termel_Frame]
	add  hl,de
	ld [Termel_Frame],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Termel_Utem]
	push hl
	; Variable is 16-bit
	ld hl,[Termel_Frame]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MainProgram_edblock7504
MainProgram_ctb7502: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Termel_Frame],hl
	call Pumpak_Termelnek
MainProgram_edblock7504:
	; 5. KOLÓNIA-VETÉS - C64: aqualiquex.ras "if raster::newSecond".
; //		   ~50 képkockánként ("másodperc"): 50% eséllyel (a C64 másik 50%-a a
; //		   meteor) egy véletlen mezőre vírust vetünk, amíg
; //		   Enemy_Kolonia_db < ENEMY_MAX_KOLONIA. A 10. vetett kolónia után
; //		   nincs új: Enemy_Terjedhet := 1 (C64: doVirusSpread). 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Enemy_Sec_Frame]
	add  hl,de
	ld [Enemy_Sec_Frame],hl
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	ld hl,$32
	push hl
	; Variable is 16-bit
	ld hl,[Enemy_Sec_Frame]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MainProgram_edblock7510
MainProgram_ctb7508: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Enemy_Sec_Frame],hl
	; 50% (C64: mod(rnd,2)=0). Rnd_Porgeto = ebben a frame-ben
; //				   sorsolt RandomByte (lásd fentebb). 
	; generic assign 
	ld a,[Rnd_Porgeto]
	push af
	; Swapping nodes
	; Generic mul
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[Rnd_Porgeto]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld [Enemy_Coin], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	or a
	jr nz,MainProgram_edblock7540
MainProgram_ctb7538: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Enemy_Kolonia_db]
	cp $a
	jr nc,MainProgram_eblock7553
MainProgram_ctb7552: ;Main true block ;keep :
	call Enemy_Random_Lerak
	; 'a:=a + const'  optimization 
	ld a,[Enemy_Kolonia_db]
	add  a,$1
	ld [Enemy_Kolonia_db], a
	jr MainProgram_edblock7554
MainProgram_eblock7553:
	ld a, $1
	ld [Enemy_Terjedhet], a
MainProgram_edblock7554:
MainProgram_edblock7540:
MainProgram_edblock7510:
	; 6. NÖVEKEDÉS + TERJEDÉS - C64: raster.tru "for i:=0 to 15".
; //		   Enemy_Utem frame-enként (C64-modell: minden frame, =1). 
	; 'a:=a + const'  optimization 
	ld a,[Enemy_Frame]
	add  a,$1
	ld [Enemy_Frame], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Enemy_Utem]
	ld b,a
	ld a,[Enemy_Frame]
	cp b
	jr c, MainProgram_edblock7562
MainProgram_ctb7560: ;Main true block ;keep :
	ld a, $0
	ld [Enemy_Frame], a
	call Enemyk_Mukodnek
MainProgram_edblock7562:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	or a
	jr nz,MainProgram_edblock7568
MainProgram_ctb7566: ;Main true block ;keep :
	; 7. METEOR trigger: ha NEM zuhan épp, visszaszámlálás a következő
; //		   random zuhanásig (100..299 képkocka ~ 2..6 mp). A zuhanás magát
; //		   a "3." lépés Meteor_Keret_Frissit-je végzi. 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Meteor_TriggerFrame]
	xor a ; clear carry
	sbc hl,de
	ld [Meteor_TriggerFrame],hl
	; Binary clause core: LESSEQUAL
	; Binary clause INTEGER: LESSEQUAL
	; Variable is 16-bit
	push hl
	ld hl,$00
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c,MainProgram_edblock7582
MainProgram_ctb7580: ;Main true block ;keep :
	call Meteor_Indit
	; 0..199 (byte-aritmetika), majd integer-ben +100 -> 100..299 
	; generic assign 
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 0
	ld a,$c8
	push af
	ld de,$c8
	; Variable is 16-bit
	ld a,[Rnd_Porgeto]
	ld l,a
	ld h,0
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld a,[Rnd_Porgeto]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	; Loading pointer
	ld [Meteor_TriggerFrame],hl
	; 16 bit BINOP
	; RHS is pure 
	ld de,$64
	; Variable is 16-bit
	ld hl,[Meteor_TriggerFrame]
	add  hl,de
	ld [Meteor_TriggerFrame],hl
MainProgram_edblock7582:
MainProgram_edblock7568:
	jp MainProgram_while7231
MainProgram_edblock7234:
MainProgram_loopend7236:
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
