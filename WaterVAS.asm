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
IKON_Y EQU $1e
INDULO_PALYA EQU $01
METEOR_ANIM_UTEM EQU $03
METEOR_FAZIS_MERET EQU $60
METEOR_FAZ_DB EQU $04
METEOR_FIGY_IDO EQU $64
METEOR_LE_PX EQU $03
METEOR_START_Y EQU $1a
METEOR_X_MIN EQU $02
METEOR_X_RND EQU $3a
METEOR_Y_MIN EQU $46
METEOR_Y_RND EQU $82
MEZO_BX_DB EQU $1f
MEZO_SY_DB EQU $13
PALYA2_DB EQU $06
PALYA_DB EQU $0b
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
GE_GameCardFound:	db	$00
GE_GameCardJoy3Port:	db	0
GE_GameCardJoy4Port:	db	0
GE_Joy3State:	db	$00
GE_Joy4State:	db	$00
GE_NoDigiSoundIsPlaying:	db	$40
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
GE_SoundEffect: dw  0
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
WaterPump_SCREEN_ADDR:	dw	$8000
	WaterPump_ScreenAddrTab equ $eac
WaterPump_BuildIdx:	dw	0
WaterPump_BuildX:	db	0
WaterPump_BuildY:	db	0
WaterPump_Idx:	dw	0
WaterPump_Faz:	db	0
WaterPump_PumpaFazPtr_Tab:	 ds 32
	Pumpa_Data equ $c000
	Talaj1_Data equ $c083
	Talaj2_Data equ $c096
	Talaj3_Data equ $c0a9
	Keret_Data equ $c0bc
	Keret2_Data equ $c11f
	Enemy_Data equ $c182
	Fal_Data equ $c1d5
	Meteor_Data equ $c1e8
	Bomba_Data equ $c36b
	ExplosionSFX equ $c40e
	TickSFX equ $ceff
	BombaIkon_Data equ $cf50
	Pumpa2_Data equ $cf63
Pumpa:
	org Pumpa+39
Talaj1:
	org Talaj1+39
Talaj2:
	org Talaj2+39
Talaj3:
	org Talaj3+39
Keret:
	org Keret+39
Keret2:
	org Keret2+39
Jelol1:
	org Jelol1+39
Jelol2:
	org Jelol2+39
Eszkoz1:	db	$00
Eszkoz2:	db	$00
Tuz1_Volt:	db	$00
Tuz2_Volt:	db	$00
Tuz1_Most:	db	$00
Tuz2_Most:	db	$00
v_Kilep:	db	$00
Exit_Barmi:	db	$00
Pause_Pos:	dw	$00
Pause_W:	db	$00
Pause_H:	db	$00
Pause_Irany:	db	$00
	Pause_Buf equ $e700
Szin_Pos:	dw	$00
Szin_W:	db	$00
Szin_H:	db	$00
Szin_Mod:	db	$00
Betu_Kod:	dw $4004, $106, $206, $204, $202, $8004, $104, $1004
	dw $203, $8005, $205, $405, $8007, $1006, $403, $4003
	dw $4002, $8002, $404, $102, $8003, $8006, $402, $406
	dw $4006, $1002
Kod_Buf:	 ds 5
Kod_X:	 ds 6
Betu_Str:	db $41, $0
Menu_X:	db	$00
Menu_Sor:	db	$00
Menu_Faz:	db	$00
Menu_Ido:	db	$00
VS_X:	db	$00
VS_CelX:	db	$00
VSE_Src:	dw	$00
VSE_Byte:	db	$00
VSE_Bit:	db	$00
Kod_Palya:	db	$ff
Kod_Mod:	db	$00
Kov_Str:	db $4e, $45, $58, $54, $20, $43, $4f, $44
	db $45, $3a, $20, $41, $41, $41, $41, $41
	db $0
P2_Kep:	db	$08
Joy_Bal:	db	$00
Joy_Jobb:	db	$00
Joy_Fel:	db	$00
Joy_Le:	db	$00
Enemy:
	org Enemy+39
Fal:
	org Fal+39
Meteor:
	org Meteor+39
Bomba:
	org Bomba+39
BombaIkon:
	org BombaIkon+39
	Font_Data equ $cfe6
	; Declaring string asmz80
LvlStr:		db	"LVL:"
	db	0
	; Declaring string asmz80
SlashStr:		db	"/"
	db	0
	; Declaring string asmz80
LivesStr:		db	"LIVES:"
	db	0
Gyoztes:	db	$00
	; Declaring string asmz80
ColonStr:		db	":"
	db	0
Keret_X_ScreenPOS:	db	$1d
Keret_Y_ScreenPOS:	db	$80
Keret_X_Pos:	db	$0f
Keret_Y_Pos:	db	$09
Keret_Elozo_X_Pos:	db	$0f
Keret_Elozo_Y_Pos:	db	$09
Keret2_X_Pos:	db	$1e
Keret2_Y_Pos:	db	$09
Keret2_Elozo_X_Pos:	db	$1e
Keret2_Elozo_Y_Pos:	db	$09
Keret_Mozog_Utem:	db	$05
Keret_Mozog_Frame:	db	$00
	Map equ $bf0
Terkepek:	db $fe, $0, $0, $3, $fc, $0, $0, $f
	db $f8, $3, $f8, $3f, $e0, $f, $fc, $ff
	db $80, $7f, $f3, $fe, $1, $ff, $cf, $f8
	db $7, $ff, $1f, $c0, $1f, $fc, $1e, $0
	db $3f, $f0, $0, $0, $1e, $0, $0, $0
	db $0, $0, $0, $0, $0, $0, $0, $0
	db $0, $0, $3c, $0, $0, $1, $fe, $0
	db $0, $f, $fc, $0, $0, $7f, $f8, $0
	db $1, $ff, $e0, $0, $ff, $e0, $7f, $ff
	db $fc, $0, $f, $ff, $f0, $0, $f, $ff
	db $0, $0, $3f, $f8, $0, $0, $ff, $c0
	db $1, $e1, $ff, $0, $6, $7, $fe, $0
	db $0, $1f, $c0, $0, $0, $7d, $1, $c0
	db $0, $10, $3, $0, $0, $0, $0, $0
	db $0, $0, $0, $0, $0, $0, $0, $60
	db $8, $e, $3, $81, $f0, $38, $0, $3
	db $f0, $0, $0, $1f, $e0, $0, $1, $f0
	db $e0, $0, $0, $ff, $80, $0, $3, $fe
	db $0, $0, $1, $f0, $0, $0, $0, $c0
	db $f8, $7c, $3, $3, $e1, $f0, $0, $c
	db $0, $c0, $0, $30, $3, $0, $0, $c0
	db $c, $0, $3, $0, $30, $0, $c, $0
	db $c0, $0, $3e, $1f, $0, $0, $f8, $7c
	db $c, $0, $0, $0, $30, $0, $0, $0
	db $f8, $0, $0, $7, $fc, $0, $0, $1f
	db $f0, $0, $0, $70, $f0, $0, $0, $3f
	db $c0, $0, $0, $ff, $0, $0, $3, $fc
	db $0, $0, $f, $0, $30, $30, $0, $0
	db $e1, $c0, $0, $1, $ce, $0, $0, $3
	db $30, $0, $0, $0, $0, $0, $0, $0
	db $0, $0, $0, $cc, $0, $0, $7, $38
	db $0, $0, $38, $70, $0, $0, $c0, $c0
	db $f, $0, $0, $3, $fc, $0, $0, $f
	db $f0, $0, $0, $3f, $c0, $0, $0, $f0
	db $ff, $ff, $ff, $ff, $e1, $ff, $e1, $ff
	db $3, $ff, $3, $f8, $c7, $f8, $c7, $e7
	db $9f, $e7, $9f, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	db $ff, $9e, $7f, $9e, $7e, $33, $ff, $31
	db $fc, $f, $fc, $f, $f8, $7f, $f8, $7f
	db $ff, $ff, $ff, $f0, $ff, $ff, $7, $ff
	db $c1, $f0, $0, $fc, $3, $80, $1, $f0
	db $1c, $e, $1, $80, $e0, $7c, $4, $7
	db $80, $38, $0, $38, $0, $78, $1, $c0
	db $1, $b0, $c, $0, $85, $70, $38, $f
	db $1b, $80, $70, $78, $78, $1, $ff, $c1
	db $e0, $3, $fc, $f, $2, $0, $0, $78
	db $18, $0, $3, $e0, $70, $0, $1f, $3
	db $e0, $1, $f8, $1f, $f0, $f, $c0, $f0
	db $ff, $ff, $fa, $ab, $c3, $fc, $15, $5e
	db $1, $c0, $2a, $b0, $0, $0, $55, $c0
	db $0, $0, $ab, $10, $0, $1, $5c, $a0
	db $20, $2, $b5, $41, $40, $14, $ea, $a
	db $80, $a3, $50, $54, $5, $e, $82, $a0
	db $28, $34, $15, $1, $40, $a0, $a8, $a
	db $1, $5, $40, $50, $8, $2a, $2, $a0
	db $21, $54, $15, $41, $8a, $bf, $fe, $87
	db $95, $7f, $fd, $70, $c0, $60, $18, $f
	db $0, $40, $80, $30, $0, $84, $0, $1
	db $82, $10, $c0, $1, $0, $4, $0, $2
	db $0, $20, $0, $4, $1, $0, $20, $0
	db $0, $1, $c0, $0, $0, $f, $0, $0
	db $0, $38, $0, $0, $0, $40, $10, $4
	db $0, $0, $80, $8, $0, $4, $0, $10
	db $0, $60, $84, $30, $0, $2, $10, $0
	db $c0, $10, $20, $f, $1, $80, $60, $30
	db $80, $4, $80, $5, $0, $21, $0, $22
	db $1, $2, $1, $4, $8, $4, $8, $0
	db $40, $8, $0, $90, $0, $2, $44, $20
	db $0, $10, $a0, $40, $0, $81, $0, $0
	db $0, $0, $0, $0, $0, $8, $10, $0
	db $20, $10, $80, $0, $41, $24, $0, $0
	db $88, $1, $0, $20, $41, $2, $1, $4
	db $8, $4, $8, $8, $40, $8, $40, $12
	db $0, $12, $0, $20, $ff, $ff, $ff, $ff
	db $80, $0, $0, $7c, $0, $0, $0, $e4
	db $0, $0, $9, $88, $0, $0, $46, $10
	db $0, $2, $18, $20, $0, $10, $60, $0
	db $0, $1, $80, $0, $0, $6, $0, $0
	db $0, $18, $0, $0, $0, $60, $80, $0
	db $41, $84, $0, $0, $86, $20, $0, $1
	db $19, $0, $0, $2, $70, $0, $0, $3
	db $e0, $0, $0, $1f, $ff, $ff, $ff, $f0
	db $ff, $80, $1, $f3, $fe, $80, $9, $2f
	db $f0, $80, $2e, $bf, $c0, $80, $92, $ff
	db $20, $83, $bb, $f8, $0, $87, $cf, $c0
	db $40, $0, $3c, $40, $0, $7c, $80, $0
	db $80, $e0, $1, $0, $0, $4, $40, $0
	db $0, $0, $4, $0, $0, $20, $0, $0
	db $0, $4, $16, $6b, $d1, $0, $16, $55
	db $40, $0, $5d, $d7, $8, $41, $65, $54
	db $0, $6, $75, $50
Palya_Kod:	db $4f, $44, $59, $4b, $45, $54, $49, $4c
	db $49, $42, $53, $44, $55, $48, $4d, $5a
	db $41, $4f, $58, $49, $48, $44, $54, $52
	db $4f, $46, $45, $49, $54, $5a, $4f, $47
	db $4d, $43, $47, $42, $47, $5a, $42, $47
	db $4c, $4f, $56, $50, $59, $4b, $58, $51
	db $44, $42, $57, $4b, $57, $51, $4d
Palya_KodCoop:	db $47, $51, $44, $51, $50, $4c, $49, $56
	db $57, $53, $45, $44, $57, $49, $58, $41
	db $5a, $46, $49, $58, $50, $45, $43, $56
	db $4d, $47, $58, $57, $4d, $42, $54, $59
	db $56, $4b, $5a, $57, $41, $43, $49, $59
	db $45, $56, $4b, $51, $5a, $47, $49, $49
	db $44, $45, $52, $58, $48, $4f, $56
Palya_Cel:	db $32, $64, $96, $64, $32, $64, $6e, $c8
	db $c8, $fa, $c8
Palya_CelCoop:	db $4b, $96, $e1, $96, $4b, $96, $a5, $ff
	db $ff, $ff, $ff
Palya_PumpaAr:	dw $32, $32, $32, $64, $64, $7d, $64, $4b
	dw $96, $af, $4b
Palya_FalAr:	dw $0, $0, $0, $0, $c8, $32, $3c, $0
	dw $64, $64, $32
Palya_BombaAr:	dw $3e8, $0, $a, $0, $a, $3e8, $3e8, $5dc
	dw $9c4, $bb8, $5dc
Palya_Penz:	dw $c8, $c8, $c8, $1f4, $3e8, $1f4, $3e8, $1f4
	dw $7d0, $bb8, $12c
Palya_Termel:	dw $5, $5, $5, $5, $3, $4, $2, $2
	dw $5, $3, $3
Palya_Meteor:	db $0, $0, $0, $1, $1, $1, $1, $1
	db $0, $1, $1
Palya_MeteorTor:	db $0, $0, $0, $0, $1, $0, $0, $0
	db $0, $0, $0
Palya_MeteorVir:	db $0, $0, $0, $0, $0, $1, $1, $0
	db $0, $0, $0
Palya_Virus:	db $0, $0, $1, $1, $1, $1, $1, $1
	db $1, $1, $1
Palya_Fal:	db $0, $0, $0, $0, $1, $0, $1, $0
	db $1, $1, $1
Palya_Bomba:	db $0, $0, $0, $0, $0, $1, $0, $1
	db $1, $1, $1
Terkepek2:	db $f8, $0, $0, $7f, $80, $0, $0, $7f
	db $0, $0, $3, $ee, $0, $0, $1d, $98
	db $0, $0, $64, $0, $0, $0, $0, $0
	db $0, $0, $0, $11, $1c, $0, $0, $44
	db $80, $0, $0, $a1, $80, $0, $2, $81
	db $0, $0, $4, $78, $0, $0, $0, $0
	db $2, $60, $0, $1, $9b, $80, $0, $7
	db $7c, $0, $0, $f, $e0, $0, $0, $1f
	db $e0, $0, $1, $f0, $ff, $ff, $ff, $ff
	db $ff, $ff, $ff, $fe, $3f, $ff, $f1, $f0
	db $7f, $ff, $83, $c1, $ff, $fe, $f, $7
	db $ff, $f8, $3e, $3f, $ff, $f1, $fd, $ff
	db $ff, $ef, $f7, $cc, $cf, $bf, $df, $33
	db $3e, $ff, $7f, $ff, $fb, $f8, $ff, $ff
	db $c7, $c1, $ff, $fe, $f, $7, $ff, $f8
	db $3c, $1f, $ff, $e0, $f8, $ff, $ff, $c7
	db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f0
	db $0, $d, $c0, $0, $0, $1a, $0, $1
	db $c0, $10, $e, $b, $80, $80, $74, $37
	db $d, $c3, $b0, $ea, $48, $95, $c1, $c6
	db $11, $8e, $2, $0, $80, $10, $4, $1
	db $0, $80, $10, $8, $2, $0, $80, $10
	db $4, $7, $18, $86, $38, $3a, $91, $25
	db $70, $dc, $3b, $e, $c2, $e0, $10, $1d
	db $7, $0, $80, $38, $0, $5, $80, $0
	db $0, $3b, $0, $0, $0, $0, $0, $0
	db $80, $0, $0, $46, $80, $0, $5, $82
	db $0, $0, $10, $38, $0, $0, $70, $0
	db $0, $0, $0, $26, $34, $90, $1, $55
	db $1a, $a0, $7, $67, $5b, $80, $15, $51
	db $2a, $0, $55, $34, $a8, $0, $0, $0
	db $0, $0, $0, $0, $0, $e0, $0, $1
	db $c0, $80, $0, $4, $1a, $0, $0, $16
	db $20, $0, $0, $10, $0, $0, $0, $0
	db $ff, $ff, $ff, $ff, $ff, $be, $ff, $fd
	db $ff, $7, $fe, $fb, $fe, $3f, $f7, $f7
	db $fd, $ff, $bf, $ef, $ff, $fd, $ff, $df
	db $8f, $ef, $fb, $bc, $1f, $77, $c6, $60
	db $39, $8f, $19, $80, $e6, $3e, $ef, $7
	db $dd, $ff, $7e, $3f, $bf, $fb, $ff, $ff
	db $7f, $df, $f7, $fe, $fe, $ff, $8f, $fd
	db $f7, $fc, $1f, $fb, $ff, $ef, $bf, $ff
	db $ff, $ff, $ff, $f0, $3f, $ff, $ff, $f1
	db $c1, $0, $20, $ef, $0, $0, $3, $fc
	db $10, $2, $f, $fe, $80, $5, $ff, $c1
	db $12, $20, $ff, $0, $84, $3, $fc, $1c
	db $e, $f, $f0, $40, $8, $3f, $c1, $0
	db $20, $ff, $7, $3, $83, $fc, $2, $10
	db $f, $f0, $44, $88, $3f, $fa, $0, $17
	db $ff, $4, $0, $83, $fc, $0, $0, $f
	db $70, $40, $8, $38, $ff, $ff, $ff, $c0
Palya2_Cel:	db $96, $4b, $96, $96, $4b, $aa
Palya2_PumpaAr:	dw $32, $50, $32, $1e, $4b, $32
Palya2_FalAr:	dw $32, $32, $32, $14, $32, $32
Palya2_BombaAr:	dw $3e8, $320, $3e8, $7d0, $1f4, $3e8
Palya2_Penz:	dw $1f4, $1f4, $1f4, $1f4, $fa, $1f4
Palya2_Termel:	dw $3, $3, $5, $3, $2, $3
Palya2_Meteor:	db $0, $1, $1, $1, $1, $1
Palya2_MeteorTor:	db $0, $1, $0, $0, $0, $0
Palya2_MeteorVir:	db $0, $1, $0, $0, $0, $0
Palya2_Virus:	db $0, $0, $1, $1, $0, $1
Palya2_Fal:	db $1, $1, $1, $1, $0, $1
Palya2_Bomba:	db $1, $1, $1, $1, $1, $1
Palya:	db	$00
Cel_Akt:	db	$fa
Meteor_Engedve:	db	$01
Meteor_Tor_Engedve:	db	$00
Meteor_Vir_Engedve:	db	$00
Virus_Engedve:	db	$01
Fal_Engedve:	db	$01
Bomba_Engedve:	db	$01
MapPos:	dw	0
Drill_Cash:	dw	$3e8
Drill_Cash2:	dw	$00
Pumpa_price:	dw	$64
Tegla_price:	dw	$32
Bomba_price:	dw	$0a
Bomba_SavMagas:	db	$1c
Bomba_SavY:	db	$00
Pumpa_termel:	dw	$02
Pumpa_db:	db	$00
Pumpa_db2:	db	$00
Pumpa_Ossz:	dw	$00
Cel_Int:	dw	$00
Termel_Frame:	dw	$00
Termel_Utem:	dw	$28
PumpaScanPos:	dw	$00
Pumpa_Uj_Faz:	db	$00
Mezo_ByteX_Tab:	 ds 31
Mezo_SorCim_Tab:	 ds 38
Enemy_FazPtr_Tab:	 ds 10
Meteor_FazPtr_Tab:	 ds 8
Rnd_Porgeto:	db	$00
Eletek:	db	$05
Jatek_Fut:	db	$01
R_Volt:	db	$00
Digi_Aktiv:	db	$00
Keret_Sereles:	db	$00
Keret_Pumpa_Valt:	db	$00
Keret2_Pumpa_Valt:	db	$00
Keret2_Sereles:	db	$00
Ket_Jatekos:	db	$00
Coop:	db	$00
Versus:	db	$00
Rnd_X:	db	$00
Rnd_Y:	db	$00
Rnd_DX:	db	$00
Rnd_DY:	db	$00
Rnd_Mp:	dw	$00
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
Meteor_Figy:	db	$00
Meteor_Lat:	db	$00
Meteor_Mp:	db	$00
Meteor_Fr:	db	$00
Meteor_KX:	db	$00
Meteor_KW:	db	$00
Meteor_KN:	db	$00
Meteor_Kij_Kell:	db	$00
Meteor_TX:	db	$00
Meteor_TW:	db	$00
PumpaMap:	db	$01
Pumpa2Map:	db	$1f
Talaj1Map:	db	$0a
FalMap:	db	$0b
Talaj2Map:	db	$0c
Talaj3Map:	db	$0d
VirusMap:	db	$14
Ir_X:	db	$00
Ir_Y:	db	$00
Ir_Szoveg: dw  0
Ir_Cim:	dw	$00
Ir_Szel:	db	$00
Ir_Hossz:	db	$00
JegyStr:	db $30, $0
Jegy_Sz:	db	$02
Cash_X:	db	0
Cash2_X:	db	0
Pump_X:	db	0
Pump2_X:	db	0
Lives_X:	db	0
Ossz_X:	db	0
Cel_X:	db	0
	; ***********  Defining procedure : GE_Sprite_Init
	;    Procedure type : User-defined procedure
 ; Temp vars section
	; Declaring string asmz80
ProgramInit_stringassignstr79:		db	"0"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr580:		db	"P1$:"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr620:		db	"P2$:"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr623:		db	"P2$:"
	db	0
	; Declaring string asmz80
Pause_Kezel_stringassignstr1633:		db	"GAME PAUSED"
	db	0
	; Declaring string asmz80
Pause_Kezel_stringassignstr1636:		db	"GAME PAUSED"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr5461:		db	"EXIT TO MENU ?"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr5463:		db	"ESC/Q = YES"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr5465:		db	"OTHER KEY = NO"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7262:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7264:		db	"PUMP - VIZNYERO PUMPA"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7266:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7268:		db	"TALAJ - ERRE LEHET"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7270:		db	"EPITENI"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7272:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7274:		db	"SZIKLA - NEM EPITHETO,"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7276:		db	"NEM BONTHATO"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7278:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7280:		db	"FAL - EZZEL LEHET"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7282:		db	"BLOKKOLNI A VIRUST"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7284:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7286:		db	"KERET - MEZO KIJELOLO"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7288:		db	"KERET"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7290:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7292:		db	"VIRUS - FERTOZI A"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7294:		db	"TALAJT, NEM EPITHETO,"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7296:		db	"BOMBAZHATO"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7298:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7300:		db	"BOMBA - ROMBUSZ ALAKU"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7302:		db	"TERULETET EPITHETOVE"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7304:		db	"TESZI"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7306:		db	"R"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7308:		db	"....."
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7310:		db	"RESET - UJRAINDITJA"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7312:		db	"A PALYAT, EGY ELETET"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7314:		db	"ELVESZ"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7316:		db	"FEL"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7318:		db	"ESZKOZ VALASZTO MENU"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7320:		db	"TUZ"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7322:		db	"VALASZT / LERAK"
	db	0
	; Declaring string asmz80
Jelmagyarazat_Kepernyo_stringassignstr7324:		db	"PRESS SPACE TO GO BACK"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7347:		db	"TWO PLAYER VERSUS MODE"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7349:		db	"ONE PLAYER GAME"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7351:		db	"TWO PLAYER CO-OP"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7353:		db	"TWO PLAYER VERSUS MODE"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7355:		db	"HOW TO USE"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7357:		db	"HISCORE"
	db	0
	; Declaring string asmz80
Fomenu_Rajz_stringassignstr7359:		db	"LEVEL CODE"
	db	0
	; Declaring string asmz80
Kod_Bevitel_stringassignstr7405:		db	"LEVEL CODE"
	db	0
	; Declaring string asmz80
Kod_Bevitel_stringassignstr11061:		db	"WRONG CODE"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11080:		db	"TWO PLAYER VERSUS"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11082:		db	"SELECT LEVEL"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11084:		db	"<  LVL:00  >"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11086:		db	"<  LVL:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11089:		db	"  >"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11091:		db	"PUMP GOAL:000"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11093:		db	"PUMP GOAL:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr11095:		db	"FIRE = START   ESC = BACK"
	db	0
	; Declaring string asmz80
Meteor_Felirat_stringassignstr14093:		db	"METEOR !"
	db	0
	; Declaring string asmz80
Meteor_Kijelzo_stringassignstr14105:		db	"METEOR:"
	db	0
	; Declaring string asmz80
Meteor_Kijelzo_stringassignstr14107:		db	"METEOR:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14698:		db	"PLAYER 2 WINS !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14701:		db	"PLAYER 1 WINS !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14704:		db	"LEVEL COMPLETED !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14706:		db	"P1:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14708:		db	"P2:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14717:		db	"LEVEL COMPLETED !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr14743:		db	"PRESS SPACE TO CONTINUE"
	db	0
	; Declaring string asmz80
Game_Over_stringassignstr14746:		db	"GAME OVER !"
	db	0
	; Declaring string asmz80
Game_Over_stringassignstr14748:		db	"PRESS SPACE FOR MENU"
	db	0
	; Declaring string asmz80
Palya_Bukas_stringassignstr14785:		db	"LEVEL FAILED !"
	db	0
	; Declaring string asmz80
Palya_Bukas_stringassignstr14787:		db	"PRESS SPACE TO RETRY"
	db	0
	; Declaring string asmz80
MainProgram_stringassignstr17846:		db	"METEOR !"
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
	; ***********  Defining procedure : GE_DigiSoundOn
	;    Procedure type : User-defined procedure
GE_DigiSoundOn_block32:
GE_DigiSoundOn:
      ;//! xor	A
			halt												;// wait for cursor-interrupt for screen refresh syncronization
			;//! ld	(GE_SoundITCounter),A		;// SoundITCounter = 0
      di													;// disable interrupts
			;// overwrite the system interrupt handler entry point to JP SOUND_IT_HANDLER instruction
			ld	HL,$38									;// HL -> start address of System Interrupt Handler
			ld	(HL),195								;// 195: JP
			ld  A,(GE_DigiSoundType)    ;// 0: 4-bit/byte + graph mode; 1: 2x4-bit/byte
			or  A
			jp  nz,SetDigiSoundITHandler2
			ld  DE,SoundITHandler
			jr  SetDigiSoundITHandler
  SetDigiSoundITHandler2:
 			ld  DE,SoundITHandler2
  SetDigiSoundITHandler: 			
			inc	HL
			ld	(HL),E
			inc	HL
			ld	(HL),D 									;// $38: JP SOUND_IT_HANDLER
			;// set frequency and enable sound interrupt			
			LD  A,15+32			;// set frequency on high 4 bits and set bit #5 to enable SOUND-IT			
			ld	C,91										;// port #91: sound generator frequency divider
			in	B,(C)										;// clear sound generator frequency divider port for precise timing
			out	(GE_SOUND_HI_PORT),A		;// send register A value to port
			ld	A,(GE_Frequency)				;// digi frequency lower 8 bits
			out	(GE_SOUND_LO_PORT),A		;// send value to port
      ;// disable the cursor-interrupt
      ld	A,10
			out	(GE_CRTC_REG_PORT),A		;// select CRTC register #10
			ld	A,3+32                  ;// set bit #5 (+ the default value 3) to disable the cursor-interrupt
			out	(GE_CRTC_DATA_PORT),A		;// send value to CRTC data port
			ld	B,A											;// save value to register B
			ld	A,11
			out	(GE_CRTC_REG_PORT),A		;// select CRTC register #11
			ld	A,B                     ;// restore value from register B
			out	(GE_CRTC_DATA_PORT),A		;// send value to CRTC data port
			;// init shadow registers for SOUND-IT
			exx													;// switch to shadow registers (HL', DE', BC')
			;//! ld	DE,GE_SoundITCounter		;// DE' -> SoundITCounter
			ld  A,(GE_PORT_6_MEM_MIRROR)
			and 3                       ;// clear bits 2-7, keep bits 0-1: graphics mode
			ld  D,A                     ;// D = graphics mode in bits 0-1
			ld  E,0                     ;// sound IT counter = 0 (register E' will be the counter)
			ld	HL,GE_NoDigiSoundIsPlaying ;// HL' -> NoDigiSoundIsPlaying - bit #6 is set to indicate that no digi sound FX need to be playing
			ld	C,GE_SOUND_VOLUME_PORT	;//  C' = SOUND_VOLUME_PORT
			exx													;// switch to back to normal registers (HL, DE, BC)
			ei													;// enable interrupts
			ret
			;// ===================================
			;// THE SOUND INTERRUPT HANDLER I
			;// 4-bit sound in 1 byte + graph. mode
			;// ===================================
	SoundITHandler:
			out	(GE_SYS_IT_PORT),A			;// [11] reset IT
			ex	AF,AF'									;// [ 4] switch to AF'
			exx													;// [ 4] switch to shadow registers (HL', DE', BC')
			inc	E												;// [ 4] increment the sound IT counter (register E')
			bit	6,(HL)									;// [12] the bit #6 of the byte addressed by (HL) indicates that this is the last byte of the sound effect
			jp	nz,SoundITHandlerEnd		;// [10] if bit #6 is not zero then jump to SoundITHandlerEnd
			outi												;// [16] send a byte from (HL) address to port C, and INC HL, DEC B
	SoundITHandlerEnd:
			exx													;// [ 4] switch back to normal registers (HL, DE, BC)
			ex	AF,AF'									;// [ 4] switch back to AF
			ei													;// [ 4] enable interrupts
			ret		
			;// ===================================
			;// THE SOUND INTERRUPT HANDLER II
			;// 2x4-bit sound in 1 byte
			;// ===================================
	SoundITHandler2:
			out	(GE_SYS_IT_PORT),A			;// [11] reset IT
			ex	AF,AF'									;// [ 4] switch to AF'
			exx													;// [ 4] switch to shadow registers (HL', DE', BC')
			inc	E												;// [ 4] increment the sound IT counter (register E')
			ld  A,(HL)
			or  A                       ;// [ 7] 0 indicates that this is the last byte of the sound effect
			jp	z,SoundITHandlerEnd		  ;// [10] if bit #6 is not zero then jump to SoundITHandlerEnd
			ld  A,B                     ;// [ 4] A = lo/hi flag (1/255)
			neg                         ;// [ 8] neg A (A = 1 or 255)
			ld  B,A                     ;// [ 4] B = flag
			jp  m,SoundITSend2nd4bit 	  ;// [10] if A = 255 then jump
			;// play the 1st 4-bit
			ld  A,(HL)                  ;// [ 7] A = 2x4 bit digi sound
			sla A                       ;// [ 8] 
      sla A                       ;// [ 8] shift left the lo 4 bit to bits 2-5
      and 32+16+8+4               ;// [ 7] clear bits 0,1 and 6,7
      or  D                       ;// [ 4] set the graphics mode to bits 0-1
      out ($6),A                  ;// [11] send digi sound to port 6
  		exx													;// [ 4] switch back to normal registers (HL, DE, BC)
			ex	AF,AF'									;// [ 4] switch back to AF
			ei													;// [ 4] enable interrupts
			ret
  SoundITSend2nd4bit:    
      ;// play the 2nd 4-bit
      ld  A,(HL)                  ;// [ 7] A = 2x4 bit digi sound
      inc HL                      ;// [ 6] HL -> next digi sound byte (2x4 bits)
      srl A                       ;// [ 8] 
      srl A												;// [ 8] shift right the hi 4 bit to bits 2-5
      and 32+16+8+4               ;// [ 7] clear bits 0,1 and 6,7
      or  D                       ;// [ 4] set graphics mode to bits 0-1
      out ($6),A                  ;// [11] send digi sound to port 6      
			exx													;// [ 4] switch back to normal registers (HL, DE, BC)
			ex	AF,AF'									;// [ 4] switch back to AF
			ei													;// [ 4] enable interrupts
			ret		
	    
	ret
end_procedure_GE_DigiSoundOn:
	; DigiSoundOn *
; //A digitális hangeffekt lejátszás kikapcsolása.<br/>
; //<br/>
; //Akkor érdemes meghívni ezt az eljárást, ha korábban a DigiSoundOn() eljárás meg volt hívva, de az adott programrészben nincs szükség digitális hangeffekt lejátszásra. Ez kis mértékben gyorsítja a programot. Vagy mielőtt visszakapcsolnánk a TV-Computer eredeti megszakítás-kezelőjét a GE::EnableTVCITHandler() eljárással.<br/>
; //<br/>
; //Ez az eljárás letiltja a hangmegszakítást, engedélyezi a raster-megszakítást, és beállítja a megszakítás-kezelőt a Game Engine megszakítás-kezelőjére.<br/>
; //Példa a használatára:
; //GE::DigiSoundOff();<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Finishing of playback of digi sounds.<br/>
; //<br/>
; //Use this procedure if you stop using the GE::PlayDigiSound or before you want to enable TVC's system interrupt handler (GE::EnableTVCITHandler).<br/>
; //<br/>
; //This procedure disables the sound interrupt, enables the cursor interrupt (raster interrupt) and sets the Interrupt Handler to the Game Engine's Interrupt Handler.<br/>
; 

	; ***********  Defining procedure : GE_DigiSoundOff
	;    Procedure type : User-defined procedure
GE_DigiSoundOff:
di													;// disable interrupts	    
      ;// enable the cursor-interrupt
			ld	A,10
			out	(GE_CRTC_REG_PORT),A		;// cursor pos felső byte regiszter kiválasztása 
			ld	A,3                     ;// clear the bit #5 and #6 to disable the cursor-interrupt and set the default value (3)
			out	(GE_CRTC_DATA_PORT),A		;// A regiszterben levő cursor pos felső byte kiírása
			;// overwrite the system interrupt handler entry point to JP CURSOR_IT_HANDLER instruction
			ld	HL,$38									;// HL -> start address of System Interrupt Handler
			ld	(HL),195								;// 195: JP
			ld  DE,GE_IT_HANLDER
			inc	HL
			ld	(HL),E
			inc	HL
			ld	(HL),D 									;// $38: JP GE_IT_HANLDER
			;// disables the sound interrupt
			ld	A,(GE_PORT_5_MEM_MIRROR)
			and	128+64									;// clear lower 6 bits (#0-#3: PITCH high 4 bits; #4:SOUND IT, #5:SOUND SIGN)
			out	(GE_SOUND_HI_PORT),A		;// send register A value to port -> disable SOUND-IT, disable SOUND-SIGN, and clear PITCH high 4 bits
			xor	A												;// A = 0
			out	(GE_SOUND_LO_PORT),A		;// send value to port (clear PITCH lower 8 bits)
			ei													;// enable interrupts
	    
	ret
end_procedure_GE_DigiSoundOff:
	; DigiSoundOff *
; //Digitális hangeffekt lejátszása.<br/>
; //<br/>
; //Paraméter:
; //<ul>
; //<li>SoundEffect: 4 bites/2,4,8 KHz-es hangminta memóriacíme</li>
; //</ul>
; //<br/>
; //Példa a használatára:<br/>
; //var ExplosionSFX : incbin("resources/ExplosionSFX.bin");<br/>
; //<br/>  
; //GE::DigiSoundOn(GE::DIGI_FREQ_4_KHZ, GE::DIGI_TYPE_1x4BIT);<br/>
; //<br/>
; //GE::PlayDigiSound(#ExplosionSFX);<br/>
; //<br/>
; //A hangminták előkészítésére az ingyenes AudaCity hangszerkesztő program javasolt, amivel előjel nélküli, 8 bites, mono Microsoft wave fájlt lehet konvertálni bármilyen wav, mp3, ogg, falc, stb. hangfájlból.<br/>
; //Az így előállított 8 bites, mono wav fájlból a "TVC digi" programmal lehet a TVC számára lejátszható, 4 bites hangmintát előállítani. A TVC digi program innen tölthető le:<br/>
; //https:
; //www.berysoft.hu/trse/TVCdigi.zip<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Starts playing a digi sound effect<br/>
; //Params:
; //<ul>
; //<li>SoundEffect: address of a 4 bit sound sample</li>
; //</ul>
; //<br/>
; //Example:<br/>
; //var ExplosionSFX : incbin("resources/ExplosionSFX.bin");<br/>
; //<br/>
; //GE::DigiSoundOn(GE::DIGI_FREQ_4_KHZ, GE::DIGI_TYPE_1x4BIT);<br/>
; //<br/>
; //GE::PlayDigiSound(#ExplosionSFX);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_PlayDigiSound
	;    Procedure type : User-defined procedure
GE_PlayDigiSound_block34:
GE_PlayDigiSound:
	    ;// halt                      ;// waiting for a sound interrupt	
      di												;// disable interrupts because will use shadow registers
			exx												;// switch to shadow registers (HL', DE', BC')
			ld  B,1                   ;// lo/hi 4-bit flag (1/255) if digi sound stored by 2x4-bit/byte
			ld	HL,[GE_SoundEffect]		;// HL' -> SoundEffect
			exx												;// switch back to normal registers (HL, DE, BC)
			ex	AF,AF'							  ;// switch to AF'
			xor A                     ;// A' = 0
			ex	AF,AF'								;// switch back to AF
			ei												;// enable interrupts
	    
	ret
end_procedure_GE_PlayDigiSound:
	; PlayDigiSound *
; //Várakozás a képernyőfrissítésre.<br/>
; //<br/>
; //Ezt kell használni a GE::WaitForSync() helyett, ha a GE::DigiSoundOn() eljárás korábban meghívásra került.<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Waits until a vertical sync has been performed.<br/>
; //<br/>
; //Use this procedure instead of GE::WaitForSync() if you have previously enabled the sound interrupt with the GE::DigiSoundOn() procedure.<br/>
; 

	; ***********  Defining procedure : GE_WaitForDigiSoundSync
	;    Procedure type : User-defined procedure
GE_WaitForDigiSoundSync:
	    
	WaitDigiSync:
	    halt
	    exx
	    ld  A,E                   	;// register E' is the sound IT counter
	    exx
			cp	GE_SOUND_IT_50HZ
			jp	c,WaitDigiSync  				;// if SoundITCounter < SOUND_IT_50HZ, then wait, else the counter reached the 50 Hz value
			sub	GE_SOUND_IT_50HZ				;// A = A - SOUND_IT_50HZ -> reset the SoundITCounter
			exx
			ld  E,A                    	;// reset the sound IT counter
	    exx
	    ;// disable the sound-interrupt
			ld  A,15
	    out (GE_SOUND_HI_PORT),A  	;// SOUND_IT OFF
			;// enable the cursor-interrupt
			ld	A,10
			out	(GE_CRTC_REG_PORT),A		;// cursor pos felső byte regiszter kiválasztása 
			ld	A,3                     ;// clear the bit #5 and #6 to enable the cursor-interrupt and set the default value (3)
			out	(GE_CRTC_DATA_PORT),A		;// H-ban levő cursor pos felső byte kiírása	    
	    halt                      	;// waiting for a cursor-interrupt
	    ;// enable the sound-interrupt
	    ld  A,47
 			out (GE_SOUND_HI_PORT),A  	;// SOUND_IT ON 			
 			;// disable the cursor-interrupt
 			ld	A,10
			out	(GE_CRTC_REG_PORT),A		;// cursor pos felső byte regiszter kiválasztása 
			ld	A,3+32                  ;// clear the bit #5 and #6 to disable the cursor-interrupt and set the default value (3)
			out	(GE_CRTC_DATA_PORT),A		;// H-ban levő cursor pos felső byte kiírása	    
		  
	ret
end_procedure_GE_WaitForDigiSoundSync:
	; IsDigiSoundPlaying *
; //Visszadja, hogy éppen folyik-e digitális hangeffekt lejátszás, vagy az már véget ért.<br/>
; //Ez csak a DIGI_TYPE_2x4BIT típusú hang lejátszása esetén használható.<br/>
; //A függvény visszatérő értékei:<br/>
; //True: folyamatban van digitális hangeffekt lejátszása<br/>
; //False: NINCS folyamatban digitális hangeffekt lejátszása<br/>
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Returns whether a digital sound effect is playing.<br/>
; //This can only be used when playing DIGI_TYPE_2x4BIT audio.<br/>
; //<br/>
; //If the result is True, then the digi sound is playing.<br/>
; //If the result is False, then the digi sound is not playing.<br/>
; //<br/>
; //Example:<br/>
; //if (not GE::IsDigiSoundPlaying()) then GE::PlayDigiSound(#MissileLaunchSFX);<br/>
; //<br/>   
; 

	; ***********  Defining procedure : GE_Is2x4bitDigiSoundPlaying
	;    Procedure type : User-defined procedure
GE_Is2x4bitDigiSoundPlaying:
			
	    di                    	;// disable interrupts
			exx											;// switch to shadow registers (HL', DE', BC')			
			ld  A,(HL)
			exx
			ei                    	;// enable interrupts
			or  A                 	;// [ 7] 0 indicates that this is the last byte of the sound effect
			jp	nz,PlayingSFXwTrue	;// if digi sound is playing, then jump
			xor	A										;// A = 0 -> the result is False
			ret
  PlayingSFXwTrue:
      ld  A,1									;// A = 1 -> the result is true
      ret
			
	ret
end_procedure_GE_Is2x4bitDigiSoundPlaying:
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
; //	   A BuildScreenAddrTab() tolti fel EGYSZER, indulaskor.  3756..4835: a GE szerint szabad (verem alatti terulet)  Csak a BuildScreenAddrTab() sajat, kezi ASM-es szamitasahoz/
; //	   tarolasahoz kellenek globalisan (a "ScreenAddrTab[idx]:=cim;" sima
; //	   Rascal forma korabban HIBAS kodot generalt: eldobta a tomb
; //	   bazis-cimet, mielott hasznalta volna - ugy tunik, 2-byte-os
; //	   (integer) tombbe torteno IRAS sima Rascal ":="-vel nem mukodik
; //	   megbizhatoan ebben a TRSE build-ben).  0..539, az eppen epitett mezo indexe  az eppen epitett mezo keperny-X-e (byte-ban)  az eppen epitett mezo keperny-Y-a (pixelben)  A PutAt()/PutAtRaw() "global" parametereinek MAR LETEZO valtozokent
; //	   kell szerepelniuk a var blokkban - a "global" kulcsszo NEM hoz letre
; //	   uj valtozot, csak egy MEGLEVO globalishoz kapcsolja a parametert
; //	   (lasd a GE.tru sajat X/Y/ImagePtr stb. deklaraciojat, ugyanigy).  A pumpa-kep ismert merete (ugyanaz, mint korabban a fo .ras-ban
; //	   volt): PUMPA_FAZISOK db fazis, fazisonkent PUMPA_FAZIS_MERET byte.  fazis (0..PUMPA_FAZISOK-1) -> kesz Data-pointer. A
; //	   BuildPumpaFazTab() tolti fel EGYSZER, indulaskor.  0..7: az 1. jatekos pumpaja, 8..15: a 2. jatekose (PumpaFazPtr_Tab[Faz], Faz 0..15)  EGYSZER hivando (indulaskor): vegigmegy mind az 540 MAP-cellan, es
; //	   kozvetlen ASM-mel (nincs kulon osztaly/SetPosition) kiszamolja +
; //	   eltarolja a kesz kepernyocimet mindegyikre. 
	; ***********  Defining procedure : WaterPump_BuildScreenAddrTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx:	db	0
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy:	db	0
WaterPump_BuildScreenAddrTab_block39:
WaterPump_BuildScreenAddrTab:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [WaterPump_BuildIdx],hl
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy], a
WaterPump_BuildScreenAddrTab_forloop40:
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx], a
WaterPump_BuildScreenAddrTab_forloop54:
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
WaterPump_BuildScreenAddrTab_loopstart55:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx],a
	cp $1e+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop54
WaterPump_BuildScreenAddrTab_loopend56:
WaterPump_BuildScreenAddrTab_loopstart41:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy],a
	cp $12+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop40
WaterPump_BuildScreenAddrTab_loopend42:
	ret
end_procedure_WaterPump_BuildScreenAddrTab:
	; EGYSZER hivando (indulaskor): a pumpa-kep alapcimebol (Pumpa.AnimSet
; //	   a fo .ras-ban) kiszamolja es eltarolja mind a PUMPA_FAZISOK db kesz
; //	   Data-pointert. Sima Rascal ciklus (nincs benne raw asm) - az "Alap"
; //	   parameter ezert lehet EGYSZERU (nem "global") parameter, nem kell
; //	   hozza elozetes var-deklaracio.  Kezdo = 0: az 1. jatekos fazisai (0..7), 8: a 2. jatekose (8..15) 
	; ***********  Defining procedure : WaterPump_BuildPumpaFazTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f:	db	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_v:	db	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp:	dw	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap:	dw	0
localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo:	db	0
WaterPump_BuildPumpaFazTab_block63:
WaterPump_BuildPumpaFazTab:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap]
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_temp],hl
	; generic assign 
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo]
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo]
	add  a, $8
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_v], a
WaterPump_BuildPumpaFazTab_while64:
WaterPump_BuildPumpaFazTab_loopstart68:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_v]
	ld b,a
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f]
	cp b
	jr nc,WaterPump_BuildPumpaFazTab_edblock67
WaterPump_BuildPumpaFazTab_ctb65: ;Main true block ;keep :
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
	jr WaterPump_BuildPumpaFazTab_while64
WaterPump_BuildPumpaFazTab_edblock67:
WaterPump_BuildPumpaFazTab_loopend69:
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
WaterPump_PutAt_block72:
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
	; ***********  Defining procedure : Ir
	;    Procedure type : User-defined procedure
Ir_block73:
Ir:
			ld a,[Ir_Y]
			ld l,a
			ld h,0
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,hl
			ld de,[GE_ScreenAddr]
			add hl,de
			ld a,[Ir_X]
			ld e,a
			ld d,0
			add hl,de
			ld [Ir_Cim],hl
Ir_Kov:
			ld hl,[Ir_Szoveg]
			ld a,(hl)
			or a
			jp z,Ir_Vege
			inc hl
			ld [Ir_Szoveg],hl
			cp 32
			jr c,Ir_Kov
			cp 123
			jr nc,Ir_Kov
			sub 32
			ld e,a
			ld d,0
			ld hl,Font_Data+1
			add hl,de
			ld a,(hl)
			or a
			jr nz,Ir_SzelOk
			inc a
Ir_SzelOk:
			ld [Ir_Szel],a
			ld hl,Font_Data+92
			add hl,de
			add hl,de
			ld de,[Ir_Cim]
			ld a,[Font_Data]
			ld b,a
Ir_Sor:
			push bc
			push hl
			push de
			ld a,[Ir_Szel]
			ld c,a
			ld b,0
			ldir
			pop de
			pop hl
			ld bc,182
			add hl,bc
			ex de,hl
			ld bc,64
			add hl,bc
			ex de,hl
			pop bc
			djnz Ir_Sor
			ld a,[Ir_Szel]
			ld e,a
			ld d,0
			ld hl,[Ir_Cim]
			add hl,de
			ld [Ir_Cim],hl
			ld a,[Ir_X]
			add a,e
			ld [Ir_X],a
			jp Ir_Kov
Ir_Vege:
		
	ret
end_procedure_Ir:
	; Egy szöveg szélessége byte-ban (a betűk szélességének összege) -> Ir_Hossz 
	; ***********  Defining procedure : Ir_Hossza
	;    Procedure type : User-defined procedure
Ir_Hossza_block74:
Ir_Hossza:
			ld hl,[Ir_Szoveg]
			ld c,0
Ir_HKov:
			ld a,(hl)
			or a
			jr z,Ir_HVege
			inc hl
			cp 32
			jr c,Ir_HKov
			cp 123
			jr nc,Ir_HKov
			sub 32
			push hl
			ld e,a
			ld d,0
			ld hl,Font_Data+1
			add hl,de
			ld a,(hl)
			or a
			jr nz,Ir_HOk
			inc a
Ir_HOk:
			add a,c
			ld c,a
			pop hl
			jr Ir_HKov
Ir_HVege:
			ld a,c
			ld [Ir_Hossz],a
		
	ret
end_procedure_Ir_Hossza:
	; Szöveg vízszintesen középre az y sorba 
	; ***********  Defining procedure : Ir_Kozep
	;    Procedure type : User-defined procedure
localVariable_Ir_Kozep_x:	db	0
localVariable_Ir_Kozep_y:	db	0
localVariable_Ir_Kozep_varPrefixed_p: dw  0
Ir_Kozep_block75:
Ir_Kozep:
	; generic assign 
	ld a,[Ir_Y]
	ld [localVariable_Ir_Kozep_y], a
	; Loading pointer
	ld hl,[Ir_Szoveg]
	ld [localVariable_Ir_Kozep_varPrefixed_p],hl
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Ir_Kozep_x], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Ir_Kozep_x]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Ir_Kozep_x], a
	; generic assign 
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Ir_Kozep_y]
	ld [Ir_Y], a
	; Loading pointer
	ld hl,[localVariable_Ir_Kozep_varPrefixed_p]
	ld [Ir_Szoveg],hl
	call Ir
	ret
end_procedure_Ir_Kozep:
	; Egy számjegy (0..9) kiírása az Ir_X helyre 
	; ***********  Defining procedure : Ir_Jegy
	;    Procedure type : User-defined procedure
localVariable_Ir_Jegy_varPrefixed_d:	db	0
localVariable_Ir_Jegy_sor:	db	0
Ir_Jegy_block76:
Ir_Jegy:
	; Storing to array  
	ld a,[localVariable_Ir_Jegy_varPrefixed_d]
	ld b,a
	ld a,$30
	add  a, b
	ld [JegyStr+$0],a
	; generic assign 
	ld a,[localVariable_Ir_Jegy_sor]
	ld [Ir_Y], a
	ld hl,JegyStr
	ld [Ir_Szoveg],hl
	call Ir
	ret
end_procedure_Ir_Jegy:
	; Játék indításakor egyszer lefutó beállítások 
	; ***********  Defining procedure : ProgramInit
	;    Procedure type : User-defined procedure
localVariable_ProgramInit_varPrefixed_f:	db	0
localVariable_ProgramInit_xx:	db	0
localVariable_ProgramInit_yy:	db	0
localVariable_ProgramInit_varPrefixed_p:	dw	0
localVariable_ProgramInit_varPrefixed_a:	dw	0
ProgramInit_block77:
ProgramInit:
			di
			ld a,($3)
			push af
			ld a,$B0
			out ($2),a
			ld hl,VAS_Blob
			ld de,$C000
			ld bc,5436
			ldir
			pop af
			out ($2),a
			ei
		
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
	ld a, $0
	ld [GE_UseBackScreen], a
	call GE_Init
	ld a, $90
	ld [GE_Mode], a
	call GE_SetMemory
	; U0,U1,VID,U3: a játék VÉGIG így fut - a sprite- és hangadatok az U3-ban ($C000..) vannak; a GE nem hív ROM-ot 
	; Assigning a string : Ir_Szoveg
	ld hl,ProgramInit_stringassignstr79
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; a számjegyek szélessége (a HUD-számok igazításához) 
	; generic assign 
	ld a,[Ir_Hossz]
	ld [Jegy_Sz], a
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	; Pumpa: EGY megosztott "bélyegző", nincs háttérpuffere (False) 
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
	ld hl,Talaj3
	ld [GE_Sprite_this],hl
	ld hl,Talaj3_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; mint a Talaj2: nem maszkolt, bélyegző 
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
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Enemy_Data
	add hl,de
	ld a,l
	ld [Enemy+$14],a
	ld a,h
	ld [Enemy+$14+1],a
	; 5 növekvő fázis; +3: header átugrása  Meteor: MASZKOLT (áttetsző) -> Draw-val rajzoljuk -> KELL a háttérpuffer (True), különben a Draw a 
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
	; 4 fázis; +3: header átugrása  Bomba: MASZKOLT, 1 fázis (nincs AnimSet-re szükség) 
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
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	ld hl,BombaIkon_Data
	ld [GE_ImagePtr],hl
	ld a, $0
	ld [GE_X], a
	ld [GE_Y], a
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; 8x8 bombaikon, nem maszkolt, bélyegző  POZÍCIÓ-TÁBLÁK Talaj1/Fal/Enemy-hez (a fő .ras oldalán, Bery/GE::Sprite Put úton maradnak)  rács-X (1..30) -> képernyő byte-X = x*2 
	ld a, $1
	ld [localVariable_ProgramInit_xx], a
ProgramInit_while80:
ProgramInit_loopstart84:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_xx]
	ld b,a
	ld a,$1e
	cp b
	jr c,ProgramInit_edblock83
ProgramInit_ctb81: ;Main true block ;keep :
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
	jr ProgramInit_while80
ProgramInit_edblock83:
ProgramInit_loopend85:
	; rács-Y (1..18) -> a képsor kezdő címe 
	ld a, $1
	ld [localVariable_ProgramInit_yy], a
ProgramInit_while90:
ProgramInit_loopstart94:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_yy]
	ld b,a
	ld a,$12
	cp b
	jr c,ProgramInit_edblock93
ProgramInit_ctb91: ;Main true block ;keep :
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
	jr ProgramInit_while90
ProgramInit_edblock93:
ProgramInit_loopend95:
	; A WaterPump unit saját tábláinak felépítése (EGYSZER) --- BuildScreenAddrTab 
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
	ld a, $0
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo], a
	call WaterPump_BuildPumpaFazTab
	; 1. játékos pumpája: fázis 0..7 
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa2_Data
	add hl,de
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap],hl
	ld a, $8
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo], a
	call WaterPump_BuildPumpaFazTab
	; 2. játékos pumpája: fázis 8..15 (ugyanaz a kirakó)  Vírus fázis-pointerek: Enemy.AnimSet + faz*16 
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
ProgramInit_while100:
ProgramInit_loopstart104:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $5
	jr nc,ProgramInit_edblock103
ProgramInit_ctb101: ;Main true block ;keep :
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
	jr ProgramInit_while100
ProgramInit_edblock103:
ProgramInit_loopend105:
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
ProgramInit_while110:
ProgramInit_loopstart114:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $4
	jr nc,ProgramInit_edblock113
ProgramInit_ctb111: ;Main true block ;keep :
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
	ld a,$60
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
	jr ProgramInit_while110
ProgramInit_edblock113:
ProgramInit_loopend115:
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
	; A Keret VAN háttérpufferrel (True), mert maszkolt (átlátszó) sprite 
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
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	ld hl,Keret2_Data
	ld [GE_ImagePtr],hl
	ld a, $3b
	ld [GE_X], a
	ld a, $76
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; maszkolt, háttérpufferrel; a pozíciót a Keret2_Kirak állítja 
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	ld hl,Keret_Data
	ld [GE_ImagePtr],hl
	ld a, $1
	ld [GE_X], a
	ld a, $1c
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	; versus eszköz-jelölők (maszkolt Draw: puffer kell) 
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	ld hl,Keret2_Data
	ld [GE_ImagePtr],hl
	ld a, $3b
	ld [GE_X], a
	ld a, $1c
	ld [GE_Y], a
	ld a, $1
	ld [GE_GetBackgroundBuffer], a
	call GE_Sprite_Init
	ret
end_procedure_ProgramInit:
	; A pumpának/vírusnak nincs poolja (a Map hordozza az állapotot), így itt nincs mit üríteni  A Map tömb feltöltése az aktuális (Palya) pálya térképéből 
	; ***********  Defining procedure : MapReset
	;    Procedure type : User-defined procedure
localVariable_MapReset_varPrefixed_b:	db	0
localVariable_MapReset_t:	db	0
localVariable_MapReset_bit:	db	0
localVariable_MapReset_data:	dw	0
localVariable_MapReset_ti:	dw	0
MapReset_block122:
MapReset:
	; generic assign 
	; Variable is 16-bit
	ld a,[Palya]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_MapReset_ti],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$44
	push af
	; Variable is 16-bit
	ld de,[localVariable_MapReset_ti]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_MapReset_ti],hl
	; a pálya térképének kezdete: pályánként 68 byte (1 bit/mező) 
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapReset_data],hl
MapReset_while124:
MapReset_loopstart128:
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp nc,MapReset_edblock127
MapReset_ctb125: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MapReset_eblock194
MapReset_ctb193: ;Main true block ;keep :
	; két játékos (versus) pálya 
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_MapReset_ti]
	ld hl,Terkepek2
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_MapReset_varPrefixed_b], a
	jr MapReset_edblock195
MapReset_eblock194:
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_MapReset_ti]
	ld hl,Terkepek
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_MapReset_varPrefixed_b], a
MapReset_edblock195:
	ld a, $0
	ld [localVariable_MapReset_bit], a
MapReset_while200:
MapReset_loopstart204:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_MapReset_bit]
	cp $8
	jr nc,MapReset_edblock203
MapReset_ctb201: ;Main true block ;keep :
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MapReset_edblock233
MapReset_ctb231: ;Main true block ;keep :
	; MSB elöl: 1 = Talaj3 (blokkolt), 0 = Talaj1 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_MapReset_varPrefixed_b]
	and  $80
	ld [localVariable_MapReset_t], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	or a
	jr z, MapReset_eblock246
MapReset_ctb245: ;Main true block ;keep :
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_MapReset_data]
	ld hl,Map
	add hl,de
	ld a,[Talaj3Map]
	ld [hl],a 
	jr MapReset_edblock247
MapReset_eblock246:
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_MapReset_data]
	ld hl,Map
	add hl,de
	ld a,[Talaj1Map]
	ld [hl],a 
MapReset_edblock247:
MapReset_edblock233:
	; generic assign 
	; Node is integer : 
	ld a,[localVariable_MapReset_varPrefixed_b]
	rlca
	ld [localVariable_MapReset_varPrefixed_b], a
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	add  hl,de
	ld [localVariable_MapReset_data],hl
	; 'a:=a + const'  optimization 
	ld a,[localVariable_MapReset_bit]
	add  a,$1
	ld [localVariable_MapReset_bit], a
	jr MapReset_while200
MapReset_edblock203:
MapReset_loopend205:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_ti]
	add  hl,de
	ld [localVariable_MapReset_ti],hl
	jp MapReset_while124
MapReset_edblock127:
MapReset_loopend129:
	ret
end_procedure_MapReset:
	; Egy byte kiírása a HUD-ra MINDIG 2 számjeggyel, vezető nullával (pl. 9 -> "09"), az x helytől; utána Ir_X a következő szabad oszlop 
	; ***********  Defining procedure : HUD_Num2
	;    Procedure type : User-defined procedure
localVariable_HUD_Num2_t:	db	0
localVariable_HUD_Num2_ertek:	db	0
localVariable_HUD_Num2_x:	db	0
localVariable_HUD_Num2_sor:	db	0
HUD_Num2_block252:
HUD_Num2:
	; generic assign 
	ld a,[localVariable_HUD_Num2_x]
	ld [Ir_X], a
	; generic assign 
	ld a,$a
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_HUD_Num2_ertek]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_HUD_Num2_t], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num2_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
	; generic assign 
	ld a,[localVariable_HUD_Num2_ertek]
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_HUD_Num2_t]
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
	ld [localVariable_HUD_Num2_t], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num2_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
	ret
end_procedure_HUD_Num2:
	; A pálya sorszámának kijelzése a pálya alatt: versus = a képernyő közepén; egyébként a LIVES (bal) és a cél (jobb, Cel_X) közötti hely közepén 
	; ***********  Defining procedure : Level_OSD
	;    Procedure type : User-defined procedure
localVariable_Level_OSD_x:	db	0
localVariable_Level_OSD_varPrefixed_l:	db	0
localVariable_Level_OSD_varPrefixed_b:	db	0
Level_OSD_block254:
Level_OSD:
	ld hl,LvlStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Jegy_Sz]
	ld b,a
	ld a,[Ir_Hossz]
	add  a, b
	push af
	ld a,[Jegy_Sz]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Level_OSD_x], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jp nz,Level_OSD_eblock257
Level_OSD_ctb256: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Level_OSD_x]
	ld [localVariable_Level_OSD_varPrefixed_l], a
	ld hl,LivesStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Ir_Hossz]
	add  a, $1
	push af
	ld a,$a
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Level_OSD_varPrefixed_b], a
	; LIVES_X (2) + LIVES: + 5 ikon (1 byte-tal balrább kezdve) = a LIVES vége 
	; generic assign 
	ld b,a
	ld a,[Cel_X]
	sub  b
	ld [localVariable_Level_OSD_x], a
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Level_OSD_varPrefixed_l]
	ld b,a
	ld a,[localVariable_Level_OSD_x]
	sub  b
	ld [localVariable_Level_OSD_x], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Level_OSD_x]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Level_OSD_x], a
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Level_OSD_varPrefixed_b]
	ld b,a
	ld a,[localVariable_Level_OSD_x]
	add  a, b
	ld [localVariable_Level_OSD_x], a
	jp Level_OSD_edblock258
Level_OSD_eblock257:
	; generic assign 
	ld a,[localVariable_Level_OSD_x]
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Level_OSD_x], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Level_OSD_x]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Level_OSD_x], a
Level_OSD_edblock258:
	; generic assign 
	ld a,[localVariable_Level_OSD_x]
	ld [Ir_X], a
	ld a, $e0
	ld [Ir_Y], a
	ld hl,LvlStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Palya]
	add  a, $1
	ld [localVariable_HUD_Num2_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num2_x], a
	ld a, $e0
	ld [localVariable_HUD_Num2_sor], a
	call HUD_Num2
	ret
end_procedure_Level_OSD:
	; minden módban 1-től (a versus pályák szerkesztőbeli "50-től" számozása csak a szerkesztőben látszik)  Egy integer kiírása a HUD-ra MINDIG 4 számjeggyel, vezető nullákkal (pl. 5 -> "0005"), az x helytől 
	; ***********  Defining procedure : HUD_Num4
	;    Procedure type : User-defined procedure
localVariable_HUD_Num4_maradek:	dw	0
localVariable_HUD_Num4_varPrefixed_d:	dw	0
localVariable_HUD_Num4_varPrefixed_b:	db	0
localVariable_HUD_Num4_ertek:	dw	0
localVariable_HUD_Num4_x:	db	0
localVariable_HUD_Num4_sor:	db	0
HUD_Num4_block263:
HUD_Num4:
	; generic assign 
	ld a,[localVariable_HUD_Num4_x]
	ld [Ir_X], a
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
	ld a,[localVariable_HUD_Num4_varPrefixed_d]
	ld [localVariable_HUD_Num4_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num4_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
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
	ld a,[localVariable_HUD_Num4_varPrefixed_d]
	ld [localVariable_HUD_Num4_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num4_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
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
	ld a,[localVariable_HUD_Num4_varPrefixed_d]
	ld [localVariable_HUD_Num4_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num4_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
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
	ld a,[localVariable_HUD_Num4_varPrefixed_d]
	ld [localVariable_HUD_Num4_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num4_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
	ret
end_procedure_HUD_Num4:
	; Mint a HUD_Num4, de 3 számjeggyel (000-255) 
	; ***********  Defining procedure : HUD_Num3
	;    Procedure type : User-defined procedure
localVariable_HUD_Num3_maradek:	db	0
localVariable_HUD_Num3_varPrefixed_d:	db	0
localVariable_HUD_Num3_ertek:	db	0
localVariable_HUD_Num3_x:	db	0
localVariable_HUD_Num3_sor:	db	0
HUD_Num3_block267:
HUD_Num3:
	; generic assign 
	ld a,[localVariable_HUD_Num3_x]
	ld [Ir_X], a
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
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num3_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
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
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num3_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
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
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num3_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
	ret
end_procedure_HUD_Num3:
	; Életek: "LIVES:" felirat a Lives_X helyen (a MapToScreen számolja), mellette annyi pumpa ikon (0. fázis), ahány élet van 
	; ***********  Defining procedure : Elet_OSD
	;    Procedure type : User-defined procedure
localVariable_Elet_OSD_varPrefixed_i:	db	0
localVariable_Elet_OSD_varPrefixed_ix:	db	0
Elet_OSD_block270:
Elet_OSD:
	; generic assign 
	ld a,[Lives_X]
	ld [Ir_X], a
	ld a, $e0
	ld [Ir_Y], a
	ld hl,LivesStr
	ld [Ir_Szoveg],hl
	call Ir
	; a pálya alatti sor bal oldala 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Ir_X]
	sub  $1
	ld [localVariable_Elet_OSD_varPrefixed_ix], a
	; az ikonok 1 byte-tal balra és 1 pixelsorral feljebb 
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	ld a,$df
	ld [Pumpa+$10],a
	ld a, $0
	ld [localVariable_Elet_OSD_varPrefixed_i], a
Elet_OSD_while271:
Elet_OSD_loopstart275:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[Eletek]
	ld b,a
	ld a,[localVariable_Elet_OSD_varPrefixed_i]
	cp b
	jr nc,Elet_OSD_edblock274
Elet_OSD_ctb272: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_Elet_OSD_varPrefixed_ix]
	ld [Pumpa+$f],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Elet_OSD_varPrefixed_ix]
	add  a,$2
	ld [localVariable_Elet_OSD_varPrefixed_ix], a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Elet_OSD_varPrefixed_i]
	add  a,$1
	ld [localVariable_Elet_OSD_varPrefixed_i], a
	jr Elet_OSD_while271
Elet_OSD_edblock274:
Elet_OSD_loopend276:
	ret
end_procedure_Elet_OSD:
	; ***********  Defining procedure : Ikon_Oszlop
	;    Procedure type : User-defined procedure
localVariable_Ikon_Oszlop_varPrefixed_r:	db	0
localVariable_Ikon_Oszlop_s:	db	0
localVariable_Ikon_Oszlop_j:	db	0
localVariable_Ikon_Oszlop_varPrefixed_e:	db	0
Ikon_Oszlop_block279:
Ikon_Oszlop:
	ld a, $0
	ld [localVariable_Ikon_Oszlop_s], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $1
	jr nz,Ikon_Oszlop_edblock283
Ikon_Oszlop_ctb281: ;Main true block ;keep :
	; a hely sorszáma (0, 1, 2) 
	ld a, $1
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock283:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $2
	jr nz,Ikon_Oszlop_edblock289
Ikon_Oszlop_ctb287: ;Main true block ;keep :
	; generic assign 
	ld a,[Fal_Engedve]
	ld b,a
	ld a,$1
	add  a, b
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock289:
	; ha nincs fal, a bomba a pumpa mellé kerül 
	; generic assign 
	ld a,[localVariable_Ikon_Oszlop_s]
	ld b,a
	ld a,[localVariable_Ikon_Oszlop_s]
	add  a, b
	push af
	ld a,$1
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_j]
	cp $2
	jr nz,Ikon_Oszlop_edblock295
Ikon_Oszlop_ctb293: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_r]
	ld b,a
	ld a,$1f
	sub  b
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock295:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $1
	jr nz,Ikon_Oszlop_edblock301
Ikon_Oszlop_ctb299: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock313
Ikon_Oszlop_ctb311: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock313:
Ikon_Oszlop_edblock301:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $2
	jr nz,Ikon_Oszlop_edblock319
Ikon_Oszlop_ctb317: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock331
Ikon_Oszlop_ctb329: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock331:
Ikon_Oszlop_edblock319:
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_r]
	ret
	ret
end_procedure_Ikon_Oszlop:
	; ***********  Defining procedure : Ikon_Rajz
	;    Procedure type : User-defined procedure
localVariable_Ikon_Rajz_x:	db	0
localVariable_Ikon_Rajz_j:	db	0
localVariable_Ikon_Rajz_varPrefixed_e:	db	0
Ikon_Rajz_block334:
Ikon_Rajz:
	; generic assign 
	; generic assign 
	ld a,[localVariable_Ikon_Rajz_j]
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Ikon_Rajz_x], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Ikon_Rajz_x], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	or a
	jr nz,Ikon_Rajz_edblock339
Ikon_Rajz_ctb337: ;Main true block ;keep :
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_j]
	cp $2
	jr nz,Ikon_Rajz_edblock352
Ikon_Rajz_localsuccess354: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	or a
	jr nz,Ikon_Rajz_edblock352
Ikon_Rajz_ctb350: ;Main true block ;keep :
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa2_Data
	add hl,de
	ld a,l
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
Ikon_Rajz_edblock352:
	; versus: a 2. játékos saját pumpája; co-op: közös 
	; Storing to array  
	ld a,[localVariable_Ikon_Rajz_x]
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$1e
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
Ikon_Rajz_edblock339:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $1
	jr nz,Ikon_Rajz_edblock359
Ikon_Rajz_ctb357: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_Ikon_Rajz_x]
	ld [Fal+$f],a
	; Storing to array  
	ld a,$1e
	ld [Fal+$10],a
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
Ikon_Rajz_edblock359:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $2
	jr nz,Ikon_Rajz_edblock365
Ikon_Rajz_ctb363: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_Ikon_Rajz_x]
	ld [BombaIkon+$f],a
	; Storing to array  
	ld a,$1e
	ld [BombaIkon+$10],a
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
Ikon_Rajz_edblock365:
	ret
end_procedure_Ikon_Rajz:
	; Versus: a j. játékos jelölője (a Keret-grafikája, álló) a kiválasztott eszköz-ikon köré 
	; ***********  Defining procedure : Jelolo_Rajz
	;    Procedure type : User-defined procedure
localVariable_Jelolo_Rajz_x:	db	0
localVariable_Jelolo_Rajz_j:	db	0
Jelolo_Rajz_block368:
Jelolo_Rajz:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jelolo_Rajz_j]
	cp $1
	jp nz,Jelolo_Rajz_eblock371
Jelolo_Rajz_ctb370: ;Main true block ;keep :
	; generic assign 
	ld a, $1
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Jelolo_Rajz_x], a
	; Storing to array  
	; Swapping nodes
	; Generic mul
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
	ld [Jelol1+$f],a
	; Storing to array  
	ld a,$1c
	ld [Jelol1+$10],a
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	jp Jelolo_Rajz_edblock372
Jelolo_Rajz_eblock371:
	; generic assign 
	ld a, $2
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Jelolo_Rajz_x], a
	; Storing to array  
	; Swapping nodes
	; Generic mul
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
	ld [Jelol2+$f],a
	; Storing to array  
	ld a,$1c
	ld [Jelol2+$10],a
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
Jelolo_Rajz_edblock372:
	ret
end_procedure_Jelolo_Rajz:
	; Árak középen, soronként középre igazítva: pumpa ikon : ár / bevétel (y=4), fal ikon : ár (y=14), bomba ikon : ár (y=24); a 0. sor (a pálya fölött) = eszköz-választó ikonok + jelölő (P1 bal, P2 jobb) - csak pályabetöltéskor 
	; ***********  Defining procedure : Arak_OSD
	;    Procedure type : User-defined procedure
localVariable_Arak_OSD_ax:	db	0
localVariable_Arak_OSD_w:	db	0
localVariable_Arak_OSD_bx:	db	0
Arak_OSD_block381:
Arak_OSD:
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld [localVariable_Arak_OSD_w], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,[localVariable_Arak_OSD_w]
	add  a, b
	push af
	ld a,$3
	ld b,a
	pop af
	add  a, b
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$7
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Arak_OSD_w], a
	; ikon + hézag (3) + ":" + 4 jegy + "/" + 3 jegy 
	; generic assign 
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Arak_OSD_ax], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Arak_OSD_ax]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Arak_OSD_ax], a
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	ld a,[localVariable_Arak_OSD_ax]
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$4
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_ax]
	add  a, $3
	ld [Ir_X], a
	ld a, $4
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; a kettőspont minden sorban ikon + 3 byte (a fal-ikon tömör, 1 byte hézag kell) 
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	ld a, $4
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	ld a, $4
	ld [Ir_Y], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir
	; / a pumpa ára után, mögötte a bevétel (termelés/pumpa) 
	; generic assign 
	ld a,[Pumpa_termel]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $4
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; az eszköz-ikonok a 0. sorban: a fal és a bomba csak ha az adott pályán engedélyezett 
	ld a, $1
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $0
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock386
Arak_OSD_ctb384: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Ikon_Rajz_j], a
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Arak_OSD_edblock386:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock392
Arak_OSD_ctb390: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $2
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Arak_OSD_edblock392:
	ld a, $1
	ld [localVariable_Jelolo_Rajz_j], a
	call Jelolo_Rajz
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Arak_OSD_edblock398
Arak_OSD_ctb396: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $0
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock416
Arak_OSD_ctb414: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $1
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Arak_OSD_edblock416:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock422
Arak_OSD_ctb420: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Ikon_Rajz_j], a
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Arak_OSD_edblock422:
	ld a, $2
	ld [localVariable_Jelolo_Rajz_j], a
	call Jelolo_Rajz
Arak_OSD_edblock398:
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; a fal- és a bomba-sor a saját szélessége szerint középre (soronként középre igazítva) 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Ir_Hossz]
	add  a, $3
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$4
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Arak_OSD_w], a
	; ikon + hézag (3) + ":" + 4 jegy 
	; generic assign 
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Arak_OSD_bx], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Arak_OSD_bx]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Arak_OSD_bx], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock429
Arak_OSD_ctb427: ;Main true block ;keep :
	; a fal ára csak ha a pályán építhető fal 
	; Storing to array  
	ld a,[localVariable_Arak_OSD_bx]
	ld [Fal+$f],a
	; Storing to array  
	ld a,$d
	ld [Fal+$10],a
	; 1 pixelsorral a szöveg fölé igazítva 
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_bx]
	add  a, $3
	ld [Ir_X], a
	ld a, $e
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Tegla_price]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	ld a, $e
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
Arak_OSD_edblock429:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock435
Arak_OSD_ctb433: ;Main true block ;keep :
	; a bomba ára csak ha a pályán használható bomba; ha nincs fal, a pumpa alá (2. sor) 
	ld a, $18
	ld [localVariable_Arak_OSD_w], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Arak_OSD_edblock447
Arak_OSD_ctb445: ;Main true block ;keep :
	ld a, $e
	ld [localVariable_Arak_OSD_w], a
Arak_OSD_edblock447:
	; Storing to array  
	ld a,[localVariable_Arak_OSD_bx]
	ld [BombaIkon+$f],a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_w]
	sub  $1
	ld [localVariable_Arak_OSD_ax], a
	; Storing to array  
	ld [BombaIkon+$10],a
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_bx]
	add  a, $3
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_w]
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Bomba_price]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_w]
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
Arak_OSD_edblock435:
	ret
end_procedure_Arak_OSD:
	; A pénz (Drill_Cash) kiírása a HUD-ra, 4 jegyen (1. sor bal oldalt) 
	; ***********  Defining procedure : Cash_OSD
	;    Procedure type : User-defined procedure
Cash_OSD:
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Cash_X]
	ld [localVariable_HUD_Num4_x], a
	ld a, $4
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	ret
end_procedure_Cash_OSD:
	; A 2. játékos pénze (két játékos: jobb felső sarok) 
	; ***********  Defining procedure : Cash2_OSD
	;    Procedure type : User-defined procedure
Cash2_OSD:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Cash2_OSD_edblock455
Cash2_OSD_ctb453: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Cash2_X]
	ld [localVariable_HUD_Num4_x], a
	ld a, $4
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
Cash2_OSD_edblock455:
	ret
end_procedure_Cash2_OSD:
	; A lerakott pumpák száma a HUD-ra, 3 jegyen (co-op: a két játékos ÖSSZEGE, max 255) 
	; ***********  Defining procedure : Pump_OSD
	;    Procedure type : User-defined procedure
localVariable_Pump_OSD_s:	dw	0
localVariable_Pump_OSD_varPrefixed_b:	db	0
Pump_OSD_block458:
Pump_OSD:
	; generic assign 
	ld a,[Pumpa_db]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Pump_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Pump_OSD_edblock462
Pump_OSD_ctb460: ;Main true block ;keep :
	; generic assign 
	ld a,[Pumpa_db2]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Pump2_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
Pump_OSD_edblock462:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,Pump_OSD_edblock468
Pump_OSD_ctb466: ;Main true block ;keep :
	; két játékos: a 2. játékos pumpái  egy játékos és co-op: a (közös) összeg a pálya alatt, a cél előtt (max 255) 
	; generic assign 
	; Variable is 16-bit
	ld a,[Pumpa_db]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_Pump_OSD_s],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld a,[Pumpa_db2]
	ld e,a
	ld d,0
	; Variable is 16-bit
	ld hl,[localVariable_Pump_OSD_s]
	add  hl,de
	ld [localVariable_Pump_OSD_s],hl
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$ff
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_Pump_OSD_s]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pump_OSD_edblock480
	jr z, Pump_OSD_edblock480
Pump_OSD_ctb478: ;Main true block ;keep :
	; generic assign 
	ld hl,$ff
	; Loading pointer
	ld [localVariable_Pump_OSD_s],hl
Pump_OSD_edblock480:
	; generic assign 
	ld a,[localVariable_Pump_OSD_s]
	ld [localVariable_Pump_OSD_varPrefixed_b], a
	; generic assign 
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ossz_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e0
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
Pump_OSD_edblock468:
	ret
end_procedure_Pump_OSD:
	; A teljes térkép egyszeri kirajzolása induláskor 
	; ***********  Defining procedure : MapToScreen
	;    Procedure type : User-defined procedure
localVariable_MapToScreen_mapx:	db	0
localVariable_MapToScreen_mapy:	db	0
localVariable_MapToScreen_data:	dw	0
MapToScreen_block483:
MapToScreen:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapToScreen_data],hl
	ld a, $1
	ld [localVariable_MapToScreen_mapy], a
MapToScreen_forloop484:
	ld a, $1
	ld [localVariable_MapToScreen_mapx], a
MapToScreen_forloop534:
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
	jr nz,MapToScreen_edblock562
MapToScreen_ctb560: ;Main true block ;keep :
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
MapToScreen_edblock562:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj3Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_MapToScreen_data]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,MapToScreen_edblock572
MapToScreen_ctb570: ;Main true block ;keep :
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
	ld [Talaj3+$f],a
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
	ld [Talaj3+$10],a
	ld hl,Talaj3
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Talaj3
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
MapToScreen_edblock572:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapToScreen_data]
	add  hl,de
	ld [localVariable_MapToScreen_data],hl
MapToScreen_loopstart535:
	ld a,[localVariable_MapToScreen_mapx]
	add a,1
	ld [localVariable_MapToScreen_mapx],a
	cp $1e+1
	jp nz,MapToScreen_forloop534
MapToScreen_loopend536:
MapToScreen_loopstart485:
	ld a,[localVariable_MapToScreen_mapy]
	add a,1
	ld [localVariable_MapToScreen_mapy],a
	cp $12+1
	jp nz,MapToScreen_forloop484
MapToScreen_loopend486:
	; HUD (minden módban ugyanaz, a 2. játékos részei csak két játékosnál): 1. sor "P1$:0990 ... P2$:0450", 2. sor "[pumpa]:023 ... [pumpa]:017", középen az árak; a pálya alatt (nem versus) LIVES, LVL, cél "[pumpa]:össz/cél"; a feliratok helye láncolva (Ir_X) 
	ld a, $2
	ld [Ir_X], a
	ld a, $4
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,MapToScreen_stringassignstr580
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Cash_X], a
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; 2. sor: "[pumpa-ikon]:009" (a PUMPS: felirat helyett ikon) 
	; Storing to array  
	ld a,$2
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$d
	ld [Pumpa+$10],a
	; az ikon 1 pixelsorral a szöveg fölé 
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $5
	ld [Ir_X], a
	ld a, $e
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Pump_X], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MapToScreen_edblock584
MapToScreen_ctb582: ;Main true block ;keep :
	; versus: a pálya célja a pumpaszám mögött ("[pumpa]:009/200"), mindkét játékosnál 
	; generic assign 
	ld a,[Pump_X]
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Ir_X], a
	ld a, $e
	ld [Ir_Y], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Cel_Akt]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock584:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jp nz,MapToScreen_edblock592
MapToScreen_ctb590: ;Main true block ;keep :
	; a 2. játékos: jobbra igazítva, a jobb szél a 62. byte 
	; Assigning a string : Ir_Szoveg
	ld hl,MapToScreen_stringassignstr620
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$3f
	sub  b
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$4
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld [Cash2_X], a
	; generic assign 
	ld [Ir_X], a
	ld a, $4
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,MapToScreen_stringassignstr623
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Cash2_X], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; ikon + hézag (3) + ":" + 3 jegy 
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$3f
	sub  b
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	push af
	ld a,$3
	ld b,a
	pop af
	sub  b
	ld [Pump2_X], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MapToScreen_edblock628
MapToScreen_ctb626: ;Main true block ;keep :
	; versus: + "/" + 3 jegyű cél 
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,[Pump2_X]
	sub  b
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	sub  b
	ld [Pump2_X], a
MapToScreen_edblock628:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	or a
	jr nz,MapToScreen_edblock636
MapToScreen_ctb634: ;Main true block ;keep :
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa2_Data
	add hl,de
	ld a,l
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
MapToScreen_edblock636:
	; versus: a 2. játékos saját pumpája 
	; Storing to array  
	ld a,[Pump2_X]
	ld [Pumpa+$f],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Pump2_X]
	add  a, $3
	ld [Ir_X], a
	ld a, $e
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Pump2_X], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MapToScreen_edblock642
MapToScreen_ctb640: ;Main true block ;keep :
	; generic assign 
	ld a,[Pump2_X]
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Ir_X], a
	ld a, $e
	ld [Ir_Y], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Cel_Akt]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock642:
	call Cash2_OSD
MapToScreen_edblock592:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jp nz,MapToScreen_edblock650
MapToScreen_ctb648: ;Main true block ;keep :
	; alsó sor, jobb oldal: cél "[pumpa]:023/225" (co-op: a két játékos pumpáinak összege) 
	ld a, $2
	ld [Lives_X], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld [Cel_X], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,[Cel_X]
	add  a, b
	push af
	ld a,$3
	ld b,a
	pop af
	add  a, b
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$6
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Cel_X], a
	; generic assign 
	ld b,a
	ld a,$3f
	sub  b
	ld [Cel_X], a
	; a jobb szél a 62. byte 
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	ld a,[Cel_X]
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$df
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Cel_X]
	add  a, $3
	ld [Ir_X], a
	ld a, $e0
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Ossz_X], a
	; generic assign 
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$3
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Ir_X], a
	ld a, $e0
	ld [Ir_Y], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Cel_Akt]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e0
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock650:
	call Level_OSD
	; LVL a pálya alatt 
	call Cash_OSD
	call Pump_OSD
	call Arak_OSD
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,MapToScreen_edblock660
MapToScreen_ctb658: ;Main true block ;keep :
	; árak középen + eszköz-választó ikonok  a pályanév NINCS kiírva (a felhasználó döntése, 2026-10-03; a helyén a meteor-figyelmeztetés villog). A Palya_Nev/Palya2_Nev adat megvan, a Nev_Kiir eljárás a .bak_meteorfigy-ben 
	call Elet_OSD
MapToScreen_edblock660:
	ret
end_procedure_MapToScreen:
	; ***********  Defining procedure : Enemy_Kirak
	;    Procedure type : User-defined procedure
localVariable_Enemy_Kirak_varPrefixed_p:	dw	0
localVariable_Enemy_Kirak_x:	db	0
localVariable_Enemy_Kirak_y:	db	0
localVariable_Enemy_Kirak_faz:	db	0
Enemy_Kirak_block663:
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
Fal_Kirak_block664:
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
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Fal_Kirak:
	; ***********  Defining procedure : Talaj2_Kirak
	;    Procedure type : User-defined procedure
localVariable_Talaj2_Kirak_varPrefixed_p:	dw	0
localVariable_Talaj2_Kirak_x:	db	0
localVariable_Talaj2_Kirak_y:	db	0
Talaj2_Kirak_block665:
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
	; ***********  Defining procedure : Enemyk_Ujrarajzol
	;    Procedure type : User-defined procedure
localVariable_Enemyk_Ujrarajzol_dx:	db	0
localVariable_Enemyk_Ujrarajzol_dy:	db	0
localVariable_Enemyk_Ujrarajzol_cx:	db	0
localVariable_Enemyk_Ujrarajzol_cy:	db	0
localVariable_Enemyk_Ujrarajzol_varPrefixed_f:	db	0
localVariable_Enemyk_Ujrarajzol_mi:	dw	0
localVariable_Enemyk_Ujrarajzol_kx:	db	0
localVariable_Enemyk_Ujrarajzol_ky:	db	0
Enemyk_Ujrarajzol_block666:
Enemyk_Ujrarajzol:
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
Enemyk_Ujrarajzol_while667:
Enemyk_Ujrarajzol_loopstart671:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock670
Enemyk_Ujrarajzol_ctb668: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
Enemyk_Ujrarajzol_while789:
Enemyk_Ujrarajzol_loopstart793:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock792
Enemyk_Ujrarajzol_ctb790: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Enemyk_Ujrarajzol_kx]
	sub  $1
	push af
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Enemyk_Ujrarajzol_cx], a
	; kx-1 .. kx+1 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Enemyk_Ujrarajzol_ky]
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
	jp c, Enemyk_Ujrarajzol_edblock853
Enemyk_Ujrarajzol_localsuccess878: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Enemyk_Ujrarajzol_edblock853
Enemyk_Ujrarajzol_ctb851: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	cp $1
	jp c, Enemyk_Ujrarajzol_edblock883
Enemyk_Ujrarajzol_localsuccess893: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	ld b,a
	ld a,$12
	cp b
	jp c,Enemyk_Ujrarajzol_edblock883
Enemyk_Ujrarajzol_ctb881: ;Main true block ;keep :
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
	jr c, Enemyk_Ujrarajzol_edblock899
Enemyk_Ujrarajzol_localsuccess901: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Ujrarajzol_mi]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld c, a
	; RHS is pure numeric optimisation
	ld a,[VirusMap]
	add  a, $4
	cp c
	jr c,Enemyk_Ujrarajzol_edblock899
Enemyk_Ujrarajzol_ctb897: ;Main true block ;keep :
	; csak vírus (20..24), a 2. játékos pumpái (31..) nem 
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
Enemyk_Ujrarajzol_edblock899:
Enemyk_Ujrarajzol_edblock883:
Enemyk_Ujrarajzol_edblock853:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
	jp Enemyk_Ujrarajzol_while789
Enemyk_Ujrarajzol_edblock792:
Enemyk_Ujrarajzol_loopend794:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
	jp Enemyk_Ujrarajzol_while667
Enemyk_Ujrarajzol_edblock670:
Enemyk_Ujrarajzol_loopend672:
	ret
end_procedure_Enemyk_Ujrarajzol:
	; ***********  Defining procedure : Keret_Erint
	;    Procedure type : User-defined procedure
localVariable_Keret_Erint_cx:	db	0
localVariable_Keret_Erint_cy:	db	0
localVariable_Keret_Erint_varPrefixed_r:	db	0
localVariable_Keret_Erint_x:	db	0
localVariable_Keret_Erint_y:	db	0
Keret_Erint_block903:
Keret_Erint:
	ld a, $0
	ld [localVariable_Keret_Erint_varPrefixed_r], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Keret_Erint_x]
	add  a, $1
	ld [localVariable_Keret_Erint_cx], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Keret_Erint_y]
	add  a, $1
	ld [localVariable_Keret_Erint_cy], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret_X_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cx]
	cp b
	jr c, Keret_Erint_edblock907
Keret_Erint_localsuccess916: ;keep:
	; ; logical AND, second requirement
	; Swapped comparison expressions
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret_X_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock907
Keret_Erint_ctb905: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret_Y_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cy]
	cp b
	jr c, Keret_Erint_edblock921
Keret_Erint_localsuccess923: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cy]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret_Y_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock921
Keret_Erint_ctb919: ;Main true block ;keep :
	ld a, $1
	ld [Keret_Sereles], a
	ld [localVariable_Keret_Erint_varPrefixed_r], a
Keret_Erint_edblock921:
Keret_Erint_edblock907:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Keret_Erint_edblock928
Keret_Erint_ctb926: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret2_X_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cx]
	cp b
	jr c, Keret_Erint_edblock955
Keret_Erint_localsuccess964: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret2_X_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock955
Keret_Erint_ctb953: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret2_Y_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cy]
	cp b
	jr c, Keret_Erint_edblock969
Keret_Erint_localsuccess971: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cy]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret2_Y_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock969
Keret_Erint_ctb967: ;Main true block ;keep :
	ld a, $1
	ld [Keret2_Sereles], a
	ld [localVariable_Keret_Erint_varPrefixed_r], a
Keret_Erint_edblock969:
Keret_Erint_edblock955:
Keret_Erint_edblock928:
	ld a,[localVariable_Keret_Erint_varPrefixed_r]
	ret
	ret
end_procedure_Keret_Erint:
	; A rács-koordinátákból (Keret_X_Pos/Keret_Y_Pos) kiszámolja a Keret sprite képernyő-pozícióját 
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
	; A Keret sprite tényleges kirajzolása az aktuális (Keret.X/Y-ban beállított) pozícióra 
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
	; 2. Keret: pozíció a rácsból + mentés + rajz (mindig a Keret UTÁN = fölötte) 
	; ***********  Defining procedure : Keret2_Kirak
	;    Procedure type : User-defined procedure
Keret2_Kirak:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Keret2_Kirak_edblock981
Keret2_Kirak_ctb979: ;Main true block ;keep :
	; ONE PLAYER GAME: nincs 2. Keret 
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[Keret2_X_Pos]
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
	ld [Keret2+$f],a
	; Storing to array  
	ld a,$1c
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Keret2_Y_Pos]
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
	ld [Keret2+$10],a
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
Keret2_Kirak_edblock981:
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [Keret2_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [Keret2_Elozo_Y_Pos], a
	ret
end_procedure_Keret2_Kirak:
	; 2. Keret levétele (háttér vissza) - csak TWO PLAYER GAME-ben 
	; ***********  Defining procedure : Keret2_Le
	;    Procedure type : User-defined procedure
Keret2_Le:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Keret2_Le_edblock992
Keret2_Le_ctb990: ;Main true block ;keep :
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Keret2_Le_edblock992:
	ret
end_procedure_Keret2_Le:
	; ***********  Defining procedure : Eszkoz_Valt
	;    Procedure type : User-defined procedure
localVariable_Eszkoz_Valt_regi:	db	0
localVariable_Eszkoz_Valt_j:	db	0
localVariable_Eszkoz_Valt_varPrefixed_e:	db	0
Eszkoz_Valt_block995:
Eszkoz_Valt:
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Eszkoz_Valt_regi], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Valt_j]
	cp $2
	jr nz,Eszkoz_Valt_edblock999
Eszkoz_Valt_ctb997: ;Main true block ;keep :
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Eszkoz_Valt_regi], a
Eszkoz_Valt_edblock999:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Eszkoz_Valt_regi]
	ld b,a
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	cp b
	jr z, Eszkoz_Valt_edblock1005
Eszkoz_Valt_ctb1003: ;Main true block ;keep :
	call Keret2_Le
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Valt_j]
	cp $1
	jr nz,Eszkoz_Valt_eblock1018
Eszkoz_Valt_ctb1017: ;Main true block ;keep :
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a régi jelölő le (alatta az ikon) 
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	ld [Eszkoz1], a
	jr Eszkoz_Valt_edblock1019
Eszkoz_Valt_eblock1018:
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	ld [Eszkoz2], a
Eszkoz_Valt_edblock1019:
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_j]
	ld [localVariable_Jelolo_Rajz_j], a
	call Jelolo_Rajz
	call Keret_SpriteKirak
	call Keret2_Kirak
Eszkoz_Valt_edblock1005:
	ret
end_procedure_Eszkoz_Valt:
	; ***********  Defining procedure : Pumpa_Torol
	;    Procedure type : User-defined procedure
localVariable_Pumpa_Torol_mp:	dw	0
localVariable_Pumpa_Torol_x:	db	0
localVariable_Pumpa_Torol_y:	db	0
Pumpa_Torol_block1024:
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
	jr c, Pumpa_Torol_edblock1029
Pumpa_Torol_localsuccess1037: ;keep:
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
	jr nc,Pumpa_Torol_edblock1029
Pumpa_Torol_ctb1027: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr c, Pumpa_Torol_edblock1042
	jr z, Pumpa_Torol_edblock1042
Pumpa_Torol_ctb1040: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_db]
	sub $1
	ld [Pumpa_db], a
Pumpa_Torol_edblock1042:
	call Pump_OSD
Pumpa_Torol_edblock1029:
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Pumpa2Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Pumpa_Torol_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr c, Pumpa_Torol_edblock1048
Pumpa_Torol_localsuccess1056: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Compare two vars optimization
	; RHS is pure numeric optimisation
	ld a,[Pumpa2Map]
	add  a, $8
	ld c, a
	; Variable is 16-bit
	ld de,[localVariable_Pumpa_Torol_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp c
	jr nc,Pumpa_Torol_edblock1048
Pumpa_Torol_ctb1046: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db2]
	or a
	jr c, Pumpa_Torol_edblock1061
	jr z, Pumpa_Torol_edblock1061
Pumpa_Torol_ctb1059: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_db2]
	sub $1
	ld [Pumpa_db2], a
Pumpa_Torol_edblock1061:
	; a 2. játékos pumpája 
	call Pump_OSD
Pumpa_Torol_edblock1048:
	ret
end_procedure_Pumpa_Torol:
	; SZÁMOLÁSI fázis (vsync ELŐTT) 
	; ***********  Defining procedure : PumpakSzamol
	;    Procedure type : User-defined procedure
localVariable_PumpakSzamol_idx:	dw	0
localVariable_PumpakSzamol_ki:	dw	0
localVariable_PumpakSzamol_kv:	dw	0
localVariable_PumpakSzamol_ki2:	dw	0
localVariable_PumpakSzamol_kv2:	dw	0
localVariable_PumpakSzamol_varPrefixed_i:	db	0
localVariable_PumpakSzamol_faz:	db	0
localVariable_PumpakSzamol_varPrefixed_m:	db	0
localVariable_PumpakSzamol_varPrefixed_b:	db	0
PumpakSzamol_block1064:
PumpakSzamol:
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
	ld [localVariable_PumpakSzamol_ki],hl
	; a Keret mezője: ha itt vagy a két vízszintes szomszédján vált fázist pumpa, a Keretet újra kell rajzolni 
	; generic assign 
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_ki]
	add hl,de
	; Loading pointer
	ld [localVariable_PumpakSzamol_kv],hl
	; generic assign 
	; Generic 16-bit binop
	; Swapping nodes
	; Generic mul
	; Node is pure : 0
	ld a,$1e
	push af
	; Generic 16-bit binop
	; Variable is 16-bit
	ld a,[Keret2_Y_Pos]
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
	ld a,[Keret2_X_Pos]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_PumpakSzamol_ki2],hl
	; ugyanez a 2. Keretre 
	; generic assign 
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_ki2]
	add hl,de
	; Loading pointer
	ld [localVariable_PumpakSzamol_kv2],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[PumpaScanPos]
	; Loading pointer
	ld [localVariable_PumpakSzamol_idx],hl
	ld a, $0
	ld [localVariable_PumpakSzamol_varPrefixed_i], a
PumpakSzamol_while1067:
PumpakSzamol_loopstart1071:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	cp $f
	jp nc,PumpakSzamol_edblock1070
PumpakSzamol_ctb1068: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_PumpakSzamol_varPrefixed_m], a
	ld a, $0
	ld [localVariable_PumpakSzamol_varPrefixed_b], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	cp b
	jr c, PumpakSzamol_edblock1144
PumpakSzamol_localsuccess1146: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	cp b
	jr c, PumpakSzamol_edblock1144
	jr z, PumpakSzamol_edblock1144
PumpakSzamol_ctb1142: ;Main true block ;keep :
	; a pumpa-tartomány alapja: 1. (PumpaMap) vagy 2. játékos (Pumpa2Map) 
	; generic assign 
	ld a,[PumpaMap]
	ld [localVariable_PumpakSzamol_varPrefixed_b], a
PumpakSzamol_edblock1144:
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Pumpa2Map]
	ld b,a
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	cp b
	jr c, PumpakSzamol_edblock1151
PumpakSzamol_localsuccess1153: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Pumpa2Map]
	add  a, $8
	cp b
	jr c, PumpakSzamol_edblock1151
	jr z, PumpakSzamol_edblock1151
PumpakSzamol_ctb1149: ;Main true block ;keep :
	; generic assign 
	ld a,[Pumpa2Map]
	ld [localVariable_PumpakSzamol_varPrefixed_b], a
PumpakSzamol_edblock1151:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_b]
	or a
	jp z, PumpakSzamol_edblock1158
PumpakSzamol_ctb1156: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_PumpakSzamol_varPrefixed_b]
	ld b,a
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	sub  b
	ld [localVariable_PumpakSzamol_faz], a
	; 'a:=a + const'  optimization 
	add  a,$1
	ld [localVariable_PumpakSzamol_faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, PumpakSzamol_edblock1184
PumpakSzamol_ctb1182: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_PumpakSzamol_faz], a
PumpakSzamol_edblock1184:
	; Storing to array  
	ld a,[localVariable_PumpakSzamol_faz]
	ld b,a
	ld a,[localVariable_PumpakSzamol_varPrefixed_b]
	add  a, b
	push af
	; Variable is 16-bit
	ld de,[localVariable_PumpakSzamol_idx]
	ld hl,Map
	add hl,de
	pop af
	ld [hl],a 
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_ki]
	push hl
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	add hl,de
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, PumpakSzamol_edblock1190
PumpakSzamol_localsuccess1192: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Binary clause INTEGER: LESSEQUAL
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_kv]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c,PumpakSzamol_edblock1190
PumpakSzamol_ctb1188: ;Main true block ;keep :
	ld a, $1
	ld [Keret_Pumpa_Valt], a
PumpakSzamol_edblock1190:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_ki2]
	push hl
	; Generic 16-bit binop
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	add hl,de
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, PumpakSzamol_edblock1197
PumpakSzamol_localsuccess1199: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Binary clause INTEGER: LESSEQUAL
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_kv2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c,PumpakSzamol_edblock1197
PumpakSzamol_ctb1195: ;Main true block ;keep :
	ld a, $1
	ld [Keret2_Pumpa_Valt], a
PumpakSzamol_edblock1197:
PumpakSzamol_edblock1158:
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
	jr c, PumpakSzamol_edblock1204
PumpakSzamol_ctb1202: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakSzamol_idx],hl
PumpakSzamol_edblock1204:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakSzamol_varPrefixed_i], a
	jp PumpakSzamol_while1067
PumpakSzamol_edblock1070:
PumpakSzamol_loopend1072:
	ret
end_procedure_PumpakSzamol:
	; KIRAKÁSI fázis (vsync UTÁN, a rajzolási fázisban hívandó) 
	; ***********  Defining procedure : PumpakKirak
	;    Procedure type : User-defined procedure
localVariable_PumpakKirak_idx:	dw	0
localVariable_PumpakKirak_varPrefixed_i:	db	0
localVariable_PumpakKirak_faz:	db	0
localVariable_PumpakKirak_varPrefixed_m:	db	0
PumpakKirak_block1207:
PumpakKirak:
	; generic assign 
	; Variable is 16-bit
	ld hl,[PumpaScanPos]
	; Loading pointer
	ld [localVariable_PumpakKirak_idx],hl
	ld a, $0
	ld [localVariable_PumpakKirak_varPrefixed_i], a
PumpakKirak_while1208:
PumpakKirak_loopstart1212:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	cp $f
	jp nc,PumpakKirak_edblock1211
PumpakKirak_ctb1209: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_PumpakKirak_idx]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_PumpakKirak_varPrefixed_m], a
	ld a, $ff
	ld [localVariable_PumpakKirak_faz], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[PumpaMap]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	cp b
	jr c, PumpakKirak_edblock1245
PumpakKirak_localsuccess1247: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	cp b
	jr c, PumpakKirak_edblock1245
	jr z, PumpakKirak_edblock1245
PumpakKirak_ctb1243: ;Main true block ;keep :
	; képindex a WaterPump fázistáblájában: 0..7 = 1. játékos, 8..15 = 2. játékos 
	; generic assign 
	ld a,[PumpaMap]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	sub  b
	ld [localVariable_PumpakKirak_faz], a
PumpakKirak_edblock1245:
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Pumpa2Map]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	cp b
	jr c, PumpakKirak_edblock1252
PumpakKirak_localsuccess1254: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Pumpa2Map]
	add  a, $8
	cp b
	jr c, PumpakKirak_edblock1252
	jr z, PumpakKirak_edblock1252
PumpakKirak_ctb1250: ;Main true block ;keep :
	; generic assign 
	ld a,[Pumpa2Map]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	sub  b
	push af
	ld a,[P2_Kep]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_PumpakKirak_faz], a
PumpakKirak_edblock1252:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakKirak_faz]
	cp $ff
	jr z, PumpakKirak_edblock1259
PumpakKirak_ctb1257: ;Main true block ;keep :
	; co-op: P2_Kep = 0 (az 1. játékos képe), versus: 8 
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[localVariable_PumpakKirak_faz]
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
PumpakKirak_edblock1259:
	; EGY kirakó mindkét játékos pumpájára 
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
	jr c, PumpakKirak_edblock1265
PumpakKirak_ctb1263: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakKirak_idx],hl
PumpakKirak_edblock1265:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakKirak_varPrefixed_i], a
	jp PumpakKirak_while1208
PumpakKirak_edblock1211:
PumpakKirak_loopend1213:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	; Loading pointer
	ld [PumpaScanPos],hl
	ret
end_procedure_PumpakKirak:
	; Mindent egy eljárásban végez el a Keret körül, a helyes sorrendben (a vírus-bélyegző okozta sérülést is javítja, ha a Keret 3x3-ában változott vírus) 
	; ***********  Defining procedure : Keret_Frissit
	;    Procedure type : User-defined procedure
localVariable_Keret_Frissit_mozgott:	db	0
localVariable_Keret_Frissit_pumpavan:	db	0
localVariable_Keret_Frissit_kell:	db	0
localVariable_Keret_Frissit_vir:	db	0
localVariable_Keret_Frissit_vv:	db	0
localVariable_Keret_Frissit_kell2:	db	0
localVariable_Keret_Frissit_vv2:	db	0
Keret_Frissit_block1268:
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
	ld a, $0
	ld [localVariable_Keret_Frissit_mozgott], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_X_Pos]
	ld b,a
	ld a,[Keret_X_Pos]
	cp b
	jr z, Keret_Frissit_edblock1273
Keret_Frissit_ctb1271: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_mozgott], a
Keret_Frissit_edblock1273:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Keret_Frissit_edblock1279
Keret_Frissit_ctb1277: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_mozgott], a
Keret_Frissit_edblock1279:
	ld a, $0
	ld [localVariable_Keret_Frissit_pumpavan], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret_Pumpa_Valt]
	cp $1
	jr nz,Keret_Frissit_edblock1285
Keret_Frissit_ctb1283: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_pumpavan], a
Keret_Frissit_edblock1285:
	; csak ha a Keret alatti/melletti pumpa ebben a képkockában új fázist kap 
	ld a, $0
	ld [Keret_Pumpa_Valt], a
	; generic assign 
	ld a,[Keret_Sereles]
	ld [localVariable_Keret_Frissit_vir], a
	; volt-e vírus-rajz a Keret 3x3-ában az utolsó Keret-frissítés óta 
	ld a, $0
	ld [Keret_Sereles], a
	ld [localVariable_Keret_Frissit_kell], a
	ld [localVariable_Keret_Frissit_vv], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_edblock1291
Keret_Frissit_ctb1289: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1291:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_edblock1297
Keret_Frissit_ctb1295: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv], a
Keret_Frissit_edblock1297:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_pumpavan]
	or a
	jr z, Keret_Frissit_edblock1303
Keret_Frissit_ctb1301: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1303:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vir]
	cp $1
	jr nz,Keret_Frissit_edblock1309
Keret_Frissit_ctb1307: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1309:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vir]
	cp $1
	jr nz,Keret_Frissit_edblock1315
Keret_Frissit_ctb1313: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv], a
Keret_Frissit_edblock1315:
	; 2. Keret: ugyanezek a feltételek; ha az (alatta lévő) Keret újrarajzolódik, a 2. Keret is (z-sorrend) 
	; generic assign 
	ld a,[localVariable_Keret_Frissit_kell]
	ld [localVariable_Keret_Frissit_kell2], a
	ld a, $0
	ld [localVariable_Keret_Frissit_vv2], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_X_Pos]
	ld b,a
	ld a,[Keret2_X_Pos]
	cp b
	jr z, Keret_Frissit_edblock1321
Keret_Frissit_ctb1319: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1321:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret2_Y_Pos]
	cp b
	jr z, Keret_Frissit_edblock1327
Keret_Frissit_ctb1325: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1327:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Sereles]
	cp $1
	jr nz,Keret_Frissit_edblock1333
Keret_Frissit_ctb1331: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1333:
	ld a, $0
	ld [Keret2_Sereles], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv2]
	cp $1
	jr nz,Keret_Frissit_edblock1339
Keret_Frissit_ctb1337: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell2], a
Keret_Frissit_edblock1339:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Pumpa_Valt]
	cp $1
	jr nz,Keret_Frissit_edblock1345
Keret_Frissit_ctb1343: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell2], a
Keret_Frissit_edblock1345:
	ld a, $0
	ld [Keret2_Pumpa_Valt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell2]
	cp $1
	jr nz,Keret_Frissit_edblock1351
Keret_Frissit_ctb1349: ;Main true block ;keep :
	call Keret2_Le
Keret_Frissit_edblock1351:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1357
Keret_Frissit_ctb1355: ;Main true block ;keep :
	; felső réteg le 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Keret_Frissit_edblock1357:
	call PumpakKirak
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1363
Keret_Frissit_ctb1361: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv]
	cp $1
	jr nz,Keret_Frissit_edblock1375
Keret_Frissit_ctb1373: ;Main true block ;keep :
	; A RestoreBackground által elkent vírus-mezők helyreállítása a valós fázisukra 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Keret_Frissit_edblock1375:
Keret_Frissit_edblock1363:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv2]
	cp $1
	jr nz,Keret_Frissit_edblock1381
Keret_Frissit_ctb1379: ;Main true block ;keep :
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Keret_Frissit_edblock1381:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1387
Keret_Frissit_ctb1385: ;Main true block ;keep :
	call Keret_XY_Calc
	call Keret_SpriteKirak
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
Keret_Frissit_edblock1387:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell2]
	cp $1
	jr nz,Keret_Frissit_edblock1393
Keret_Frissit_ctb1391: ;Main true block ;keep :
	call Keret2_Kirak
Keret_Frissit_edblock1393:
	ret
end_procedure_Keret_Frissit:
	; Rövid "tick" digi hang a pumpa lerakásakor (ha épp nem szól a bomba hangja); a hang végét a Frame_Sync állítja le 
	; ***********  Defining procedure : Tick_Hang
	;    Procedure type : User-defined procedure
Tick_Hang:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Digi_Aktiv]
	or a
	jr nz,Tick_Hang_edblock1400
Tick_Hang_ctb1398: ;Main true block ;keep :
	ld a, $ce
	ld [GE_Frequency], a
	ld a, $1
	ld [GE_DigiSoundType], a
	call GE_DigiSoundOn
	ld hl,TickSFX
	ld [GE_SoundEffect],hl
	call GE_PlayDigiSound
	ld a, $1
	ld [Digi_Aktiv], a
Tick_Hang_edblock1400:
	ret
end_procedure_Tick_Hang:
	; pumpa lerakása a (px,py) mezőre; j = 1: az 1. játékos pénzéből/pumpája, j = 2: a 2. játékosé (versus) 
	; ***********  Defining procedure : DrillLerak
	;    Procedure type : User-defined procedure
localVariable_DrillLerak_penz:	dw	0
localVariable_DrillLerak_px:	db	0
localVariable_DrillLerak_py:	db	0
localVariable_DrillLerak_j:	db	0
DrillLerak_block1403:
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
	ld a,[localVariable_DrillLerak_py]
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
	ld a,[localVariable_DrillLerak_px]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [MapPos],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_DrillLerak_penz],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_DrillLerak_j]
	cp $2
	jr nz,DrillLerak_edblock1408
DrillLerak_ctb1406: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_DrillLerak_penz],hl
DrillLerak_edblock1408:
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
	jp nz,DrillLerak_localfailed1466
	jp DrillLerak_ctb1412
DrillLerak_localfailed1466: ;keep:
	; ; logical OR, second chance
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj2Map]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jp nz,DrillLerak_edblock1414
DrillLerak_ctb1412: ;Main true block ;keep :
	; hang: a rajz után (a DigiSoundOn szinkronra vár) 
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_DrillLerak_penz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp c, DrillLerak_edblock1471
DrillLerak_ctb1469: ;Main true block ;keep :
	call Keret2_Le
	; a 2. Keret (felül) is le 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; pumpaszám-kijelző frissítése 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_DrillLerak_j]
	cp $2
	jr nz,DrillLerak_eblock1498
DrillLerak_ctb1497: ;Main true block ;keep :
	; Storing to array  
	ld a,[Pumpa_Uj_Faz]
	ld b,a
	ld a,[Pumpa2Map]
	add  a, b
	push af
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	pop af
	ld [hl],a 
	; a 2. játékos pumpája 
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Pumpa_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	; (még nincs kiírva) 
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_db2]
	add  a,$1
	ld [Pumpa_db2], a
	call Cash2_OSD
	; co-op: a 2. játékos pénze 
	call Pump_OSD
	jr DrillLerak_edblock1499
DrillLerak_eblock1498:
	; co-op: a közös pumpaszám 
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
DrillLerak_edblock1499:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_DrillLerak_j]
	cp $2
	jr nz,DrillLerak_eblock1506
DrillLerak_ctb1505: ;Main true block ;keep :
	; a 2. játékos képe (versus: 8..15, co-op: az 1. játékosé) 
	; generic assign 
	; Variable is 16-bit
	ld hl,[MapPos]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[P2_Kep]
	ld b,a
	ld a,[Pumpa_Uj_Faz]
	add  a, b
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
	jr DrillLerak_edblock1507
DrillLerak_eblock1506:
	; generic assign 
	; Variable is 16-bit
	ld hl,[MapPos]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[Pumpa_Uj_Faz]
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
DrillLerak_edblock1507:
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_Uj_Faz]
	add  a,$1
	ld [Pumpa_Uj_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, DrillLerak_edblock1515
DrillLerak_ctb1513: ;Main true block ;keep :
	ld a, $0
	ld [Pumpa_Uj_Faz], a
DrillLerak_edblock1515:
	call Keret_SpriteKirak
	call Keret2_Kirak
	; a 2. Keret fölé 
	call Tick_Hang
DrillLerak_edblock1471:
DrillLerak_edblock1414:
	ret
end_procedure_DrillLerak:
	; fal a (px,py) mezőre; j = 1/2: kinek a pénzéből 
	; ***********  Defining procedure : TeglaLerak
	;    Procedure type : User-defined procedure
localVariable_TeglaLerak_penz:	dw	0
localVariable_TeglaLerak_px:	db	0
localVariable_TeglaLerak_py:	db	0
localVariable_TeglaLerak_j:	db	0
TeglaLerak_block1518:
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
	ld a,[localVariable_TeglaLerak_py]
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
	ld a,[localVariable_TeglaLerak_px]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [MapPos],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_TeglaLerak_penz],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_j]
	cp $2
	jr nz,TeglaLerak_edblock1523
TeglaLerak_ctb1521: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_TeglaLerak_penz],hl
TeglaLerak_edblock1523:
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
	jr nz,TeglaLerak_localfailed1553
	jr TeglaLerak_ctb1527
TeglaLerak_localfailed1553: ;keep:
	; ; logical OR, second chance
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj2Map]
	ld b,a
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr nz,TeglaLerak_edblock1529
TeglaLerak_ctb1527: ;Main true block ;keep :
	; a 2. Keret fölé 
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Tegla_price]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_TeglaLerak_penz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, TeglaLerak_edblock1558
TeglaLerak_ctb1556: ;Main true block ;keep :
	call Keret2_Le
	; a 2. Keret (felül) is le 
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
	ld a,[localVariable_TeglaLerak_px]
	ld [localVariable_Fal_Kirak_x], a
	; generic assign 
	ld a,[localVariable_TeglaLerak_py]
	ld [localVariable_Fal_Kirak_y], a
	call Fal_Kirak
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_j]
	cp $2
	jr nz,TeglaLerak_eblock1571
TeglaLerak_ctb1570: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Tegla_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	call Cash2_OSD
	jr TeglaLerak_edblock1572
TeglaLerak_eblock1571:
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
TeglaLerak_edblock1572:
	call Keret_SpriteKirak
	call Keret2_Kirak
TeglaLerak_edblock1558:
TeglaLerak_edblock1529:
	ret
end_procedure_TeglaLerak:
	; BOMBA (B gomb, ha van rá Bomba_price fedezet)  Fehér border-sáv a képkockában (közvetlenül GE::WaitForSync() UTÁN hívandó!) 
	; ***********  Defining procedure : Bomba_Sav
	;    Procedure type : User-defined procedure
Bomba_Sav:
			di
			ld a,[Bomba_SavY]
			call Bomba_SavVar
			ld a,170
			out ($0),a
			ld a,85
			out ($60),a
			ld a,[Bomba_SavMagas]
			call Bomba_SavVar
			ld a,21
			out ($60),a
			ld a,42
			out ($0),a
			ei
			jp Bomba_SavVege
Bomba_SavVar:
			or a
			ret z
			ld c,a
Bomba_SavSor:
			ld b,14
Bomba_SavIn:
			djnz Bomba_SavIn
			dec c
			jr nz,Bomba_SavSor
			ret
Bomba_SavVege:
		
	ret
end_procedure_Bomba_Sav:
	; A háttérben szóló digi hang leállítása (ha szól): a szokásos megszakítás-kezelő + raszter-IT vissza 
	; ***********  Defining procedure : Digi_Le
	;    Procedure type : User-defined procedure
Digi_Le:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Digi_Aktiv]
	cp $1
	jr nz,Digi_Le_edblock1582
Digi_Le_ctb1580: ;Main true block ;keep :
	call GE_DigiSoundOff
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ld a, $0
	ld [Digi_Aktiv], a
Digi_Le_edblock1582:
	ret
end_procedure_Digi_Le:
	; Képkocka-szinkron a főciklusban: digi hang alatt WaitForDigiSoundSync (+ a hang végén leállítás), egyébként WaitForSync 
	; ***********  Defining procedure : Frame_Sync
	;    Procedure type : User-defined procedure
localVariable_Frame_Sync_v:	db	0
Frame_Sync_block1585:
Frame_Sync:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Digi_Aktiv]
	cp $1
	jr nz,Frame_Sync_eblock1588
Frame_Sync_ctb1587: ;Main true block ;keep :
	call GE_WaitForDigiSoundSync
	ld a, $0
	ld [localVariable_Frame_Sync_v], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	call GE_Is2x4bitDigiSoundPlaying
	or a
	jr z, Frame_Sync_edblock1608
Frame_Sync_ctb1606: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Frame_Sync_v], a
Frame_Sync_edblock1608:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Frame_Sync_v]
	or a
	jr nz,Frame_Sync_edblock1614
Frame_Sync_ctb1612: ;Main true block ;keep :
	call Digi_Le
Frame_Sync_edblock1614:
	jr Frame_Sync_edblock1589
Frame_Sync_eblock1588:
	call GE_WaitForSync
Frame_Sync_edblock1589:
	ret
end_procedure_Frame_Sync:
	; PAUSE: a "GAME PAUSED" felirat alatti képterület mentése (Pause_Irany=0) / visszaírása (1): Pause_H sor, soronként Pause_W byte, Pause_Pos képernyőcímtől 
	; ***********  Defining procedure : Pause_Csere
	;    Procedure type : User-defined procedure
Pause_Csere:
			ld hl,[Pause_Pos]
			ld de,Pause_Buf
			ld a,[Pause_H]
Pause_Csere_sor:
			push af
			push hl
			ld a,[Pause_W]
			ld c,a
			ld b,0
			ld a,[Pause_Irany]
			or a
			jr nz,Pause_Csere_vissza
			ldir
			jr Pause_Csere_tovabb
Pause_Csere_vissza:
			ex de,hl
			ldir
			ex de,hl
Pause_Csere_tovabb:
			pop hl
			ld bc,64
			add hl,bc
			pop af
			dec a
			jr nz,Pause_Csere_sor
		
	ret
end_procedure_Pause_Csere:
	; Szöveg-átszínezés egy téglalapban (Szin_Pos képernyőcímtől Szin_W byte x Szin_H sor): az 1-es színű pixelek 3-asra (GR4: a felső nibble bitjei az alsóba is) - a sötét (pause) színrendben ez a szürke betű 
	; ***********  Defining procedure : Szinez_Asm
	;    Procedure type : User-defined procedure
Szinez_Asm:
			ld hl,[Szin_Pos]
			ld a,[Szin_H]
			ld d,a
Szinez_Asm_sor:
			push hl
			ld a,[Szin_W]
			ld e,a
Szinez_Asm_byte:
			ld a,(hl)
			ld b,a
			rrca
			rrca
			rrca
			rrca
			and $0F
			ld c,a
			ld a,[Szin_Mod]
			or a
			jr z,Szinez_Asm_m0
			cp 1
			jr z,Szinez_Asm_m1
			cp 3
			jr nz,Szinez_Asm_m2
			ld a,c					; 3. mód (zöld betű): 1 -> 2 (a felső nibble az alsóba, a felső törölve), 0 marad
			jr Szinez_Asm_ir
Szinez_Asm_m2:
			ld a,b					; 2. mód (szürke betű fekete alapon): 0 -> 1, 1 -> 0
			xor $F0
			jr Szinez_Asm_ir
Szinez_Asm_m0:
			ld a,c
			or b					; 0. mód: 0 marad, 1 -> 3
			jr Szinez_Asm_ir
Szinez_Asm_m1:
			ld a,c
			or $F0					; 1. mód (fekete háttér): 0 -> 1 (fekete), 1 -> 3
Szinez_Asm_ir:
			ld (hl),a
			inc hl
			dec e
			jr nz,Szinez_Asm_byte
			pop hl
			ld bc,64
			add hl,bc
			dec d
			jr nz,Szinez_Asm_sor
		
	ret
end_procedure_Szinez_Asm:
	; ***********  Defining procedure : Doboz
	;    Procedure type : User-defined procedure
localVariable_Doboz_x2:	db	0
localVariable_Doboz_y2:	db	0
localVariable_Doboz_x:	db	0
localVariable_Doboz_y:	db	0
localVariable_Doboz_w:	db	0
localVariable_Doboz_varPrefixed_h:	db	0
Doboz_block1620:
Doboz:
	; generic assign 
	ld a,[localVariable_Doboz_x]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Doboz_y]
	ld [GE_Y], a
	; generic assign 
	ld a,[localVariable_Doboz_w]
	ld [GE_Width], a
	; generic assign 
	ld a,[localVariable_Doboz_varPrefixed_h]
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; generic assign 
	ld a,[localVariable_Doboz_x]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Doboz_y]
	ld [GE_Y], a
	; generic assign 
	ld a,[localVariable_Doboz_w]
	ld [GE_Width], a
	ld a, $1
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
	; felső él 
	; generic assign 
	ld a,[localVariable_Doboz_varPrefixed_h]
	ld b,a
	ld a,[localVariable_Doboz_y]
	add  a, b
	push af
	ld a,$1
	ld b,a
	pop af
	sub  b
	ld [localVariable_Doboz_y2], a
	; generic assign 
	ld a,[localVariable_Doboz_x]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Doboz_y2]
	ld [GE_Y], a
	; generic assign 
	ld a,[localVariable_Doboz_w]
	ld [GE_Width], a
	ld a, $1
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
	; alsó él 
	; generic assign 
	ld a,[localVariable_Doboz_x]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Doboz_y]
	ld [GE_Y], a
	ld a, $1
	ld [GE_Width], a
	; generic assign 
	ld a,[localVariable_Doboz_varPrefixed_h]
	ld [GE_Height], a
	ld a, $80
	ld [GE_Pattern], a
	call GE_FillRect
	; bal él: a byte bal szélső pixele fekete 
	; generic assign 
	ld a,[localVariable_Doboz_w]
	ld b,a
	ld a,[localVariable_Doboz_x]
	add  a, b
	push af
	ld a,$1
	ld b,a
	pop af
	sub  b
	ld [localVariable_Doboz_x2], a
	; generic assign 
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Doboz_y]
	ld [GE_Y], a
	ld a, $1
	ld [GE_Width], a
	; generic assign 
	ld a,[localVariable_Doboz_varPrefixed_h]
	ld [GE_Height], a
	ld a, $10
	ld [GE_Pattern], a
	call GE_FillRect
	ret
end_procedure_Doboz:
	; ***********  Defining procedure : Szinez
	;    Procedure type : User-defined procedure
localVariable_Szinez_x:	db	0
localVariable_Szinez_y:	db	0
localVariable_Szinez_w:	db	0
localVariable_Szinez_varPrefixed_h:	db	0
Szinez_block1621:
Szinez:
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_Szinez_y]
	ld l,a
	ld h,0
	; Loading pointer
	ld [Szin_Pos],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$40
	push af
	; Variable is 16-bit
	ld de,[Szin_Pos]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [Szin_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld a,[localVariable_Szinez_x]
	ld e,a
	ld d,0
	; Variable is 16-bit
	ld hl,[Szin_Pos]
	add  hl,de
	ld [Szin_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	; RHS is pure constant of $100
	ld b,$80
	ld a,[ Szin_Pos+1]
	add a,b
	ld [ Szin_Pos+1],a
	; képernyő: $8000, 64 byte/sor 
	; generic assign 
	ld a,[localVariable_Szinez_w]
	ld [Szin_W], a
	; generic assign 
	ld a,[localVariable_Szinez_varPrefixed_h]
	ld [Szin_H], a
	call Szinez_Asm
	ret
end_procedure_Szinez:
	; Sötét színrend a feliratokhoz (pause, pályavég): szürke->fekete, fekete->sötétkék, zöld->sötétzöld, kék->szürke (ezzel a színnel látszik az átszínezett szöveg), keret fekete 
	; ***********  Defining procedure : Sotet_Szinek
	;    Procedure type : User-defined procedure
Sotet_Szinek:
	ld a, $0
	ld [GE_Nr], a
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $1
	ld [GE_Nr], a
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $2
	ld [GE_Nr], a
	ld a, $10
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $3
	ld [GE_Nr], a
	ld a, $15
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $0
	ld [GE_Color], a
	call GE_SetBorder
	ret
end_procedure_Sotet_Szinek:
	; A játék normál színei vissza (zuhanó meteornál a 3. szín sötétkék marad) 
	; ***********  Defining procedure : Normal_Szinek
	;    Procedure type : User-defined procedure
Normal_Szinek:
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
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,Normal_Szinek_edblock1628
Normal_Szinek_ctb1626: ;Main true block ;keep :
	ld a, $3
	ld [GE_Nr], a
	ld a, $1
	ld [GE_Color], a
	call GE_SetPalette
Normal_Szinek_edblock1628:
	ld a, $2a
	ld [GE_Color], a
	call GE_SetBorder
	ret
end_procedure_Normal_Szinek:
	; P = PAUSE (pisi szünet): minden megáll, sötét színek (szürke->fekete, fekete->sötétkék, zöld->sötétzöld, kék->fekete, keret fekete), középen "GAME PAUSED"; a következő P-re minden megy tovább 
	; ***********  Defining procedure : Pause_Kezel
	;    Procedure type : User-defined procedure
localVariable_Pause_Kezel_x:	db	0
Pause_Kezel_block1631:
Pause_Kezel:
	call Digi_Le
	; a szóló hang le (a várakozás sima WaitForSync) 
	; Assigning a string : Ir_Szoveg
	ld hl,Pause_Kezel_stringassignstr1633
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld [Pause_W], a
	; generic assign 
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Pause_Kezel_x], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Pause_Kezel_x]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Pause_Kezel_x], a
	ld a, $9
	ld [Pause_H], a
	; generic assign 
	ld hl,$73
	; Loading pointer
	ld [Pause_Pos],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$40
	push af
	; Variable is 16-bit
	ld de,[Pause_Pos]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [Pause_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld a,[localVariable_Pause_Kezel_x]
	ld e,a
	ld d,0
	; Variable is 16-bit
	ld hl,[Pause_Pos]
	add  hl,de
	ld [Pause_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	; RHS is pure constant of $100
	ld b,$80
	ld a,[ Pause_Pos+1]
	add a,b
	ld [ Pause_Pos+1],a
	; képernyő: $8000, 64 byte/sor 
	ld a, $0
	ld [Pause_Irany], a
	call Pause_Csere
	; a felirat alatti terület mentése 
	call Sotet_Szinek
	; generic assign 
	ld a,[localVariable_Pause_Kezel_x]
	ld [Ir_X], a
	ld a, $74
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Pause_Kezel_stringassignstr1636
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Pause_Kezel_x]
	ld [localVariable_Szinez_x], a
	ld a, $74
	ld [localVariable_Szinez_y], a
	; generic assign 
	ld a,[Pause_W]
	ld [localVariable_Szinez_w], a
	ld a, $7
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	; a felirat betűi 1-es színről 3-asra (szürke) 
	ld a, $1
	ld [Start_Wait], a
Pause_Kezel_while1637:
Pause_Kezel_loopstart1641:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	or a
	jr z, Pause_Kezel_edblock1640
Pause_Kezel_ctb1638: ;Main true block ;keep :
	; 1: a P felengedésére vár, 2: új P-re, 3: annak felengedésére 
	call GE_WaitForSync
	call GE_GetKeyboard
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Pause_Kezel_edblock1702
Pause_Kezel_ctb1700: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr nz,Pause_Kezel_edblock1714
Pause_Kezel_ctb1712: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Pause_Kezel_edblock1714:
Pause_Kezel_edblock1702:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Pause_Kezel_edblock1720
Pause_Kezel_ctb1718: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Pause_Kezel_edblock1732
Pause_Kezel_ctb1730: ;Main true block ;keep :
	ld a, $3
	ld [Start_Wait], a
Pause_Kezel_edblock1732:
Pause_Kezel_edblock1720:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $3
	jr nz,Pause_Kezel_edblock1738
Pause_Kezel_ctb1736: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr nz,Pause_Kezel_edblock1750
Pause_Kezel_ctb1748: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Pause_Kezel_edblock1750:
Pause_Kezel_edblock1738:
	jr Pause_Kezel_while1637
Pause_Kezel_edblock1640:
Pause_Kezel_loopend1642:
	ld a, $1
	ld [Pause_Irany], a
	call Pause_Csere
	; a felirat helyén az eredeti kép vissza 
	call Normal_Szinek
	ret
end_procedure_Pause_Kezel:
	; bomba a (px,py) mezőre; j = 1/2: kinek a pénzéből (mindent rombol, bárkié) 
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
localVariable_Bomba_Ledob_vil:	db	0
localVariable_Bomba_Ledob_mp:	dw	0
localVariable_Bomba_Ledob_penz:	dw	0
localVariable_Bomba_Ledob_px:	db	0
localVariable_Bomba_Ledob_py:	db	0
localVariable_Bomba_Ledob_j:	db	0
Bomba_Ledob_block1753:
Bomba_Ledob:
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_Bomba_Ledob_penz],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_j]
	cp $2
	jr nz,Bomba_Ledob_edblock1757
Bomba_Ledob_ctb1755: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_Bomba_Ledob_penz],hl
Bomba_Ledob_edblock1757:
	; a 2. Keret fölé 
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Bomba_price]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_Bomba_Ledob_penz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp c, Bomba_Ledob_edblock1763
Bomba_Ledob_ctb1761: ;Main true block ;keep :
	call Digi_Le
	; egy korábbi, még szóló hang leállítása  1) Zuhanás-animáció 
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Bomba_Ledob_px]
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
	; generic assign 
	ld a,$1c
	push af
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Bomba_Ledob_py]
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
	; a bomba orra = a sprite alja 
	ld a, $0
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
Bomba_Ledob_while3614:
Bomba_Ledob_loopstart3618:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_celY]
	ld b,a
	ld a,[localVariable_Bomba_Ledob_noseY]
	cp b
	jr nc,Bomba_Ledob_edblock3617
Bomba_Ledob_ctb3615: ;Main true block ;keep :
	call Frame_Sync
	; generic assign 
	ld de,$10
	ld hl,Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [Bomba_SavY], a
	call Bomba_Sav
	; fehér border-/paletta-sáv a bomba magasságában 
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_MoveDownBy4
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	; (a border-sáv már a sync után azonnal lefutott, lásd fent) 
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
	jr Bomba_Ledob_while3614
Bomba_Ledob_edblock3617:
Bomba_Ledob_loopend3619:
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ld hl,Bomba
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a bomba eltűnik, mielőtt a talaj törlődik  becsapódás-villanás: 3x fehér/fekete (háttér-paletta + border), utána vissza az eredeti színekre 
	call Frame_Sync
	ld a, $0
	ld [localVariable_Bomba_Ledob_vil], a
Bomba_Ledob_while3622:
Bomba_Ledob_loopstart3626:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_vil]
	cp $3
	jr nc,Bomba_Ledob_edblock3625
Bomba_Ledob_ctb3623: ;Main true block ;keep :
	call Frame_Sync
	ld a, $0
	ld [GE_Nr], a
	ld a, $55
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $aa
	ld [GE_Color], a
	call GE_SetBorder
	call Frame_Sync
	ld a, $0
	ld [GE_Nr], a
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $0
	ld [GE_Color], a
	call GE_SetBorder
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Bomba_Ledob_vil]
	add  a,$1
	ld [localVariable_Bomba_Ledob_vil], a
	jr Bomba_Ledob_while3622
Bomba_Ledob_edblock3625:
Bomba_Ledob_loopend3627:
	; a robbanás előtt az eredeti színek vissza (a felhő már a normál palettával látszik) 
	ld a, $0
	ld [GE_Nr], a
	ld a, $15
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $2
	ld [GE_Nr], a
	ld a, $50
	ld [GE_Color], a
	call GE_SetPalette
	ld a, $2a
	ld [GE_Color], a
	call GE_SetBorder
	; robbanás hang: a zuhanás és a villanás UTÁN (nincs többé border-sáv), még a talaj cseréje ELŐTT; NEM blokkoló 
	ld a, $ce
	ld [GE_Frequency], a
	ld a, $1
	ld [GE_DigiSoundType], a
	call GE_DigiSoundOn
	; a sáv és a digi mód nem fér össze, ezért csak itt 
	ld hl,ExplosionSFX
	ld [GE_SoundEffect],hl
	call GE_PlayDigiSound
	ld a, $1
	ld [Digi_Aktiv], a
	; 2) Rombusz alakú roncsolás (változatlan) 
	call Keret2_Le
	; a 2. Keret (felül) is le 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	ld a, $0
	ld [localVariable_Bomba_Ledob_dy], a
Bomba_Ledob_while3630:
Bomba_Ledob_loopstart3634:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dy]
	cp $7
	jp nc,Bomba_Ledob_edblock3633
Bomba_Ledob_ctb3631: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dy]
	cp $3
	jr nc,Bomba_Ledob_eblock4546
Bomba_Ledob_ctb4545: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_dy]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Bomba_Ledob_tavy], a
	jr Bomba_Ledob_edblock4547
Bomba_Ledob_eblock4546:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_dy]
	sub  $3
	ld [localVariable_Bomba_Ledob_tavy], a
Bomba_Ledob_edblock4547:
	; |dy-3| = távolság a Kerettől függőlegesen 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_py]
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
	jp c, Bomba_Ledob_edblock4555
Bomba_Ledob_ctb4553: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Bomba_Ledob_edblock5007
Bomba_Ledob_ctb5005: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Bomba_Ledob_dx], a
Bomba_Ledob_while5230:
Bomba_Ledob_loopstart5234:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dx]
	cp $7
	jp nc,Bomba_Ledob_edblock5233
Bomba_Ledob_ctb5231: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_dx]
	cp $3
	jr nc,Bomba_Ledob_eblock5346
Bomba_Ledob_ctb5345: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_dx]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Bomba_Ledob_tavx], a
	jr Bomba_Ledob_edblock5347
Bomba_Ledob_eblock5346:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_dx]
	sub  $3
	ld [localVariable_Bomba_Ledob_tavx], a
Bomba_Ledob_edblock5347:
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
	jp c,Bomba_Ledob_edblock5355
Bomba_Ledob_ctb5353: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Bomba_Ledob_px]
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
	jp c, Bomba_Ledob_edblock5407
Bomba_Ledob_ctb5405: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Bomba_Ledob_edblock5433
Bomba_Ledob_ctb5431: ;Main true block ;keep :
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
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gx]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gy]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Talaj3Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Bomba_Ledob_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Bomba_Ledob_edblock5447
Bomba_Ledob_ctb5445: ;Main true block ;keep :
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Bomba_Ledob_mp]
	ld hl,Map
	add hl,de
	ld a,[Talaj2Map]
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gx]
	ld [localVariable_Talaj2_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_gy]
	ld [localVariable_Talaj2_Kirak_y], a
	call Talaj2_Kirak
Bomba_Ledob_edblock5447:
Bomba_Ledob_edblock5433:
Bomba_Ledob_edblock5407:
Bomba_Ledob_edblock5355:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Bomba_Ledob_dx]
	add  a,$1
	ld [localVariable_Bomba_Ledob_dx], a
	jp Bomba_Ledob_while5230
Bomba_Ledob_edblock5233:
Bomba_Ledob_loopend5235:
Bomba_Ledob_edblock5007:
Bomba_Ledob_edblock4555:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Bomba_Ledob_dy]
	add  a,$1
	ld [localVariable_Bomba_Ledob_dy], a
	jp Bomba_Ledob_while3630
Bomba_Ledob_edblock3633:
Bomba_Ledob_loopend3635:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_j]
	cp $2
	jr nz,Bomba_Ledob_eblock5452
Bomba_Ledob_ctb5451: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Bomba_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	jr Bomba_Ledob_edblock5453
Bomba_Ledob_eblock5452:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Bomba_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
Bomba_Ledob_edblock5453:
	call Cash_OSD
	call Cash2_OSD
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret2_Kirak
Bomba_Ledob_edblock1763:
	ret
end_procedure_Bomba_Ledob:
	; KILÉPÉS (ESC vagy Q, minden módban): "EXIT TO MENU ?" a képernyő közepén, a pause színrendjével; ESC/Q = igen (Jatek_Fut:=0 -> főmenü), BÁRMI MÁS (billentyű vagy joystick) = nem (a doboz alatti kép vissza, megy tovább a játék). A végén megvárja, hogy minden gomb felengedődjön (ne tüzeljen tovább a játékban) 
	; ***********  Defining procedure : Exit_Kerdes
	;    Procedure type : User-defined procedure
localVariable_Exit_Kerdes_v:	db	0
Exit_Kerdes_block5458:
Exit_Kerdes:
	call Digi_Le
	ld a, $32
	ld [Pause_W], a
	ld a, $28
	ld [Pause_H], a
	; generic assign 
	ld hl,$6a
	; Loading pointer
	ld [Pause_Pos],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$40
	push af
	; Variable is 16-bit
	ld de,[Pause_Pos]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [Pause_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	ld de,$07
	; Variable is 16-bit
	ld hl,[Pause_Pos]
	add  hl,de
	ld [Pause_Pos],hl
	; 16 bit BINOP
	; RHS is pure 
	; RHS is pure constant of $100
	ld b,$80
	ld a,[ Pause_Pos+1]
	add a,b
	ld [ Pause_Pos+1],a
	; a doboz: (7,106), 50 byte x 40 sor 
	ld a, $0
	ld [Pause_Irany], a
	call Pause_Csere
	; a doboz alatti kép mentése 
	ld a, $7
	ld [GE_X], a
	ld a, $6a
	ld [GE_Y], a
	ld a, $32
	ld [GE_Width], a
	ld a, $28
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $6e
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Exit_Kerdes_stringassignstr5461
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $7a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Exit_Kerdes_stringassignstr5463
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $86
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Exit_Kerdes_stringassignstr5465
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $7
	ld [localVariable_Szinez_x], a
	ld a, $6a
	ld [localVariable_Szinez_y], a
	ld a, $32
	ld [localVariable_Szinez_w], a
	ld a, $28
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	call Sotet_Szinek
	ld a, $1
	ld [Start_Wait], a
Exit_Kerdes_while5466:
Exit_Kerdes_loopstart5470:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	or a
	jp z, Exit_Kerdes_edblock5469
Exit_Kerdes_ctb5467: ;Main true block ;keep :
	; 1: minden gomb felengedésére vár, 2: a döntésre, 3: a döntés gombjának felengedésére 
	call GE_WaitForSync
	call GE_GetKeyboard
				ld hl,2897					; a GE billentyűzetmátrixa (10 sor, a 8-9. a két joystick): van-e bármi lenyomva
				ld b,10
				xor a
Exit_Kerdes_barmi:
				or (hl)
				inc hl
				djnz Exit_Kerdes_barmi
				ld [Exit_Barmi],a
			
	ld a, $0
	ld [localVariable_Exit_Kerdes_v], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Exit_Barmi]
	or a
	jr z, Exit_Kerdes_edblock5603
Exit_Kerdes_ctb5601: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock5603:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Exit_Kerdes_edblock5609
Exit_Kerdes_ctb5607: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock5609:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Exit_Kerdes_edblock5615
Exit_Kerdes_ctb5613: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock5615:
	; 3: minden felengedve 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Exit_Kerdes_eblock5620
Exit_Kerdes_ctb5619: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	or a
	jr nz,Exit_Kerdes_edblock5678
Exit_Kerdes_ctb5676: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Exit_Kerdes_edblock5678:
	jr Exit_Kerdes_edblock5621
Exit_Kerdes_eblock5620:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Exit_Kerdes_eblock5684
Exit_Kerdes_ctb5683: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	cp $1
	jr nz,Exit_Kerdes_edblock5710
Exit_Kerdes_ctb5708: ;Main true block ;keep :
	ld a, $0
	ld [Jatek_Fut], a
	; igen: vissza a főmenübe (a főprogram kezeli) 
	ld a, $3
	ld [Start_Wait], a
Exit_Kerdes_edblock5710:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	cp $2
	jr nz,Exit_Kerdes_edblock5716
Exit_Kerdes_ctb5714: ;Main true block ;keep :
	ld a, $1
	ld [Pause_Irany], a
	call Pause_Csere
	; nem: a doboz alatti kép vissza 
	ld a, $3
	ld [Start_Wait], a
Exit_Kerdes_edblock5716:
	jr Exit_Kerdes_edblock5685
Exit_Kerdes_eblock5684:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	or a
	jr nz,Exit_Kerdes_edblock5723
Exit_Kerdes_ctb5721: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Exit_Kerdes_edblock5723:
Exit_Kerdes_edblock5685:
Exit_Kerdes_edblock5621:
	jp Exit_Kerdes_while5466
Exit_Kerdes_edblock5469:
Exit_Kerdes_loopend5471:
	call Normal_Szinek
	ret
end_procedure_Exit_Kerdes:
	; ***********  Defining procedure : Ikon_Ervenyes
	;    Procedure type : User-defined procedure
localVariable_Ikon_Ervenyes_varPrefixed_e:	db	0
localVariable_Ikon_Ervenyes_varPrefixed_r:	db	0
localVariable_Ikon_Ervenyes_varPrefixed_db:	db	0
localVariable_Ikon_Ervenyes_j:	db	0
localVariable_Ikon_Ervenyes_x:	db	0
Ikon_Ervenyes_block5726:
Ikon_Ervenyes:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Ervenyes_j]
	cp $1
	jr nz,Ikon_Ervenyes_eblock5729
Ikon_Ervenyes_ctb5728: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Ikon_Ervenyes_x]
	sub  $1
	ld [localVariable_Ikon_Ervenyes_varPrefixed_e], a
	jr Ikon_Ervenyes_edblock5730
Ikon_Ervenyes_eblock5729:
	; generic assign 
	ld a,[localVariable_Ikon_Ervenyes_x]
	ld b,a
	ld a,$1e
	sub  b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_e], a
Ikon_Ervenyes_edblock5730:
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_e]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Ikon_Ervenyes_varPrefixed_e], a
	; a hely sorszáma - P1: 1,3,5 -> 0,1,2; P2: 30,28,26 -> 0,1,2 
	; generic assign 
	ld a,[Fal_Engedve]
	ld b,a
	ld a,$1
	add  a, b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_db], a
	; 'a:=a + expression'  optimization 
	ld a,[Bomba_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_db]
	add  a, b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_db], a
	; ennyi ikon van (hézag nélkül, sorban) 
	ld a, $0
	ld [localVariable_Ikon_Ervenyes_varPrefixed_r], a
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_db]
	ld b,a
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_e]
	cp b
	jr nc,Ikon_Ervenyes_edblock5738
Ikon_Ervenyes_ctb5736: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Ikon_Ervenyes_varPrefixed_r], a
Ikon_Ervenyes_edblock5738:
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_r]
	ret
	ret
end_procedure_Ikon_Ervenyes:
	; A j. játékos Keretének léptetése (Joy_Bal/Jobb/Fel/Le). Versusban az 1. sorból felfelé az ikon-menübe lép (a kiválasztott ikonra); ott bal/jobb csak a saját 3 ikonja közt lépked, le = vissza a pálya 1. sorába, az ikon alá (pumpa: 1., fal: 3., bomba: 5. oszlop; P2: 30., 28., 26.) 
	; ***********  Defining procedure : Jatekos_Mozog
	;    Procedure type : User-defined procedure
localVariable_Jatekos_Mozog_x:	db	0
localVariable_Jatekos_Mozog_y:	db	0
localVariable_Jatekos_Mozog_xmin:	db	0
localVariable_Jatekos_Mozog_xmax:	db	0
localVariable_Jatekos_Mozog_varPrefixed_e:	db	0
localVariable_Jatekos_Mozog_t:	db	0
localVariable_Jatekos_Mozog_k:	db	0
localVariable_Jatekos_Mozog_v:	db	0
localVariable_Jatekos_Mozog_j:	db	0
Jatekos_Mozog_block5741:
Jatekos_Mozog:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $1
	jr nz,Jatekos_Mozog_eblock5744
Jatekos_Mozog_ctb5743: ;Main true block ;keep :
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Jatekos_Mozog_x], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Jatekos_Mozog_y], a
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Jatekos_Mozog_varPrefixed_e], a
	ld a, $1
	ld [localVariable_Jatekos_Mozog_xmin], a
	ld a, $5
	ld [localVariable_Jatekos_Mozog_xmax], a
	jr Jatekos_Mozog_edblock5745
Jatekos_Mozog_eblock5744:
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Jatekos_Mozog_x], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Jatekos_Mozog_y], a
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Jatekos_Mozog_varPrefixed_e], a
	ld a, $1a
	ld [localVariable_Jatekos_Mozog_xmin], a
	ld a, $1e
	ld [localVariable_Jatekos_Mozog_xmax], a
Jatekos_Mozog_edblock5745:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	or a
	jp nz,Jatekos_Mozog_eblock5752
Jatekos_Mozog_ctb5751: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Bal]
	cp $1
	jr nz,Jatekos_Mozog_edblock6030
Jatekos_Mozog_ctb6028: ;Main true block ;keep :
	; ikon-menü  balra a következő ENGEDÉLYEZETT ikonra (a tiltott fal/bomba helyét átugorja) 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [localVariable_Jatekos_Mozog_t], a
	ld a, $0
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_while6077:
Jatekos_Mozog_loopstart6081:
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Jatekos_Mozog_xmin]
	ld b,a
	ld a,[localVariable_Jatekos_Mozog_t]
	cp b
	jr c, Jatekos_Mozog_edblock6080
	jr z, Jatekos_Mozog_edblock6080
Jatekos_Mozog_ctb6078: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_t]
	sub $2
	ld [localVariable_Jatekos_Mozog_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_k]
	or a
	jr nz,Jatekos_Mozog_edblock6106
Jatekos_Mozog_ctb6104: ;Main true block ;keep :
	; generic assign 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_j]
	ld [localVariable_Ikon_Ervenyes_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Ikon_Ervenyes_x], a
	call Ikon_Ervenyes
	ld [localVariable_Jatekos_Mozog_v], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jr nz,Jatekos_Mozog_edblock6118
Jatekos_Mozog_ctb6116: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Jatekos_Mozog_x], a
	ld a, $1
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_edblock6118:
Jatekos_Mozog_edblock6106:
	jr Jatekos_Mozog_while6077
Jatekos_Mozog_edblock6080:
Jatekos_Mozog_loopend6082:
Jatekos_Mozog_edblock6030:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Jobb]
	cp $1
	jr nz,Jatekos_Mozog_edblock6124
Jatekos_Mozog_ctb6122: ;Main true block ;keep :
	; jobbra ugyanígy 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [localVariable_Jatekos_Mozog_t], a
	ld a, $0
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_while6171:
Jatekos_Mozog_loopstart6175:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Jatekos_Mozog_xmax]
	ld b,a
	ld a,[localVariable_Jatekos_Mozog_t]
	cp b
	jr nc,Jatekos_Mozog_edblock6174
Jatekos_Mozog_ctb6172: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_t]
	add  a,$2
	ld [localVariable_Jatekos_Mozog_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_k]
	or a
	jr nz,Jatekos_Mozog_edblock6200
Jatekos_Mozog_ctb6198: ;Main true block ;keep :
	; generic assign 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_j]
	ld [localVariable_Ikon_Ervenyes_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Ikon_Ervenyes_x], a
	call Ikon_Ervenyes
	ld [localVariable_Jatekos_Mozog_v], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jr nz,Jatekos_Mozog_edblock6212
Jatekos_Mozog_ctb6210: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Jatekos_Mozog_x], a
	ld a, $1
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_edblock6212:
Jatekos_Mozog_edblock6200:
	jr Jatekos_Mozog_while6171
Jatekos_Mozog_edblock6174:
Jatekos_Mozog_loopend6176:
Jatekos_Mozog_edblock6124:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Le]
	cp $1
	jr nz,Jatekos_Mozog_edblock6218
Jatekos_Mozog_ctb6216: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Jatekos_Mozog_y], a
Jatekos_Mozog_edblock6218:
	jp Jatekos_Mozog_edblock5753
Jatekos_Mozog_eblock5752:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Bal]
	cp $1
	jr nz,Jatekos_Mozog_edblock6225
Jatekos_Mozog_ctb6223: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_x]
	cp $1
	jr c, Jatekos_Mozog_edblock6237
	jr z, Jatekos_Mozog_edblock6237
Jatekos_Mozog_ctb6235: ;Main true block ;keep :
	; pálya 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_x]
	sub $1
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock6237:
Jatekos_Mozog_edblock6225:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Jobb]
	cp $1
	jr nz,Jatekos_Mozog_edblock6243
Jatekos_Mozog_ctb6241: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_x]
	cp $1e
	jr nc,Jatekos_Mozog_edblock6255
Jatekos_Mozog_ctb6253: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_x]
	add  a,$1
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock6255:
Jatekos_Mozog_edblock6243:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Le]
	cp $1
	jr nz,Jatekos_Mozog_edblock6261
Jatekos_Mozog_ctb6259: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	cp $12
	jr nc,Jatekos_Mozog_edblock6273
Jatekos_Mozog_ctb6271: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_y]
	add  a,$1
	ld [localVariable_Jatekos_Mozog_y], a
Jatekos_Mozog_edblock6273:
Jatekos_Mozog_edblock6261:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Fel]
	cp $1
	jr nz,Jatekos_Mozog_edblock6279
Jatekos_Mozog_ctb6277: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	cp $1
	jr c, Jatekos_Mozog_eblock6292
	jr z, Jatekos_Mozog_eblock6292
Jatekos_Mozog_ctb6291: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_y]
	sub $1
	ld [localVariable_Jatekos_Mozog_y], a
	jr Jatekos_Mozog_edblock6293
Jatekos_Mozog_eblock6292:
	ld a, $0
	ld [localVariable_Jatekos_Mozog_y], a
	; generic assign 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_j]
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_varPrefixed_e]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock6293:
Jatekos_Mozog_edblock6279:
Jatekos_Mozog_edblock5753:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $1
	jr nz,Jatekos_Mozog_eblock6300
Jatekos_Mozog_ctb6299: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Keret_X_Pos], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_y]
	ld [Keret_Y_Pos], a
	jr Jatekos_Mozog_edblock6301
Jatekos_Mozog_eblock6300:
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Keret2_X_Pos], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_y]
	ld [Keret2_Y_Pos], a
Jatekos_Mozog_edblock6301:
	ret
end_procedure_Jatekos_Mozog:
	; ***********  Defining procedure : Jatekos_Tuz
	;    Procedure type : User-defined procedure
localVariable_Jatekos_Tuz_varPrefixed_e:	db	0
localVariable_Jatekos_Tuz_varPrefixed_i:	db	0
localVariable_Jatekos_Tuz_k:	db	0
localVariable_Jatekos_Tuz_j:	db	0
localVariable_Jatekos_Tuz_px:	db	0
localVariable_Jatekos_Tuz_py:	db	0
localVariable_Jatekos_Tuz_volt:	db	0
Jatekos_Tuz_block6306:
Jatekos_Tuz:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_py]
	or a
	jp nz,Jatekos_Tuz_eblock6309
Jatekos_Tuz_ctb6308: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jp nz,Jatekos_Tuz_edblock6483
Jatekos_Tuz_ctb6481: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
	ld a, $0
	ld [localVariable_Jatekos_Tuz_varPrefixed_i], a
Jatekos_Tuz_while6548:
Jatekos_Tuz_loopstart6552:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	cp $3
	jr nc,Jatekos_Tuz_edblock6551
Jatekos_Tuz_ctb6549: ;Main true block ;keep :
	; generic assign 
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Jatekos_Tuz_k], a
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[localVariable_Jatekos_Tuz_px]
	ld b,a
	ld a,[localVariable_Jatekos_Tuz_k]
	cp b
	jr nz,Jatekos_Tuz_edblock6565
Jatekos_Tuz_ctb6563: ;Main true block ;keep :
	; előbb változóba: a "fv(...)=px" feltételnél a fordító a B-ben tartott px-et a hívás alatt elrontja 
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock6565:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	add  a,$1
	ld [localVariable_Jatekos_Tuz_varPrefixed_i], a
	jr Jatekos_Tuz_while6548
Jatekos_Tuz_edblock6551:
Jatekos_Tuz_loopend6553:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $1
	jr nz,Jatekos_Tuz_edblock6571
Jatekos_Tuz_ctb6569: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Jatekos_Tuz_edblock6583
Jatekos_Tuz_ctb6581: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock6583:
Jatekos_Tuz_edblock6571:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $2
	jr nz,Jatekos_Tuz_edblock6589
Jatekos_Tuz_ctb6587: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	or a
	jr nz,Jatekos_Tuz_edblock6601
Jatekos_Tuz_ctb6599: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock6601:
Jatekos_Tuz_edblock6589:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $ff
	jr z, Jatekos_Tuz_edblock6607
Jatekos_Tuz_ctb6605: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_Eszkoz_Valt_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	ld [localVariable_Eszkoz_Valt_varPrefixed_e], a
	call Eszkoz_Valt
Jatekos_Tuz_edblock6607:
Jatekos_Tuz_edblock6483:
	jp Jatekos_Tuz_edblock6310
Jatekos_Tuz_eblock6309:
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_j]
	cp $2
	jr nz,Jatekos_Tuz_edblock6614
Jatekos_Tuz_ctb6612: ;Main true block ;keep :
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock6614:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	or a
	jr nz,Jatekos_Tuz_edblock6620
Jatekos_Tuz_ctb6618: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_DrillLerak_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_DrillLerak_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_DrillLerak_j], a
	call DrillLerak
Jatekos_Tuz_edblock6620:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $1
	jr nz,Jatekos_Tuz_edblock6626
Jatekos_Tuz_ctb6624: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_TeglaLerak_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_TeglaLerak_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_TeglaLerak_j], a
	call TeglaLerak
Jatekos_Tuz_edblock6626:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $2
	jr nz,Jatekos_Tuz_edblock6632
Jatekos_Tuz_ctb6630: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jr nz,Jatekos_Tuz_edblock6644
Jatekos_Tuz_ctb6642: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_Bomba_Ledob_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_Bomba_Ledob_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_Bomba_Ledob_j], a
	call Bomba_Ledob
Jatekos_Tuz_edblock6644:
Jatekos_Tuz_edblock6632:
Jatekos_Tuz_edblock6310:
	ret
end_procedure_Jatekos_Tuz:
	; A lerakott pumpák termelése 
	; ***********  Defining procedure : Pumpak_Termelnek
	;    Procedure type : User-defined procedure
localVariable_Pumpak_Termelnek_termeny:	dw	0
Pumpak_Termelnek_block6647:
Pumpak_Termelnek:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr c, Pumpak_Termelnek_edblock6651
	jr z, Pumpak_Termelnek_edblock6651
Pumpak_Termelnek_ctb6649: ;Main true block ;keep :
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
	jr c, Pumpak_Termelnek_edblock6665
	jr z, Pumpak_Termelnek_edblock6665
Pumpak_Termelnek_ctb6663: ;Main true block ;keep :
	; generic assign 
	ld hl,$270f
	; Loading pointer
	ld [Drill_Cash],hl
Pumpak_Termelnek_edblock6665:
	call Cash_OSD
Pumpak_Termelnek_edblock6651:
	; co-op: kiírva 
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Pumpa_db2]
	or a
	jr c, Pumpak_Termelnek_edblock6671
	jr z, Pumpak_Termelnek_edblock6671
Pumpak_Termelnek_ctb6669: ;Main true block ;keep :
	; a 2. játékos (versus) saját termelése, saját pénzbe (még nincs kiírva) 
	; generic assign 
	; Variable is 16-bit
	ld a,[Pumpa_db2]
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
	ld hl,[Drill_Cash2]
	add  hl,de
	ld [Drill_Cash2],hl
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$270f
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpak_Termelnek_edblock6685
	jr z, Pumpak_Termelnek_edblock6685
Pumpak_Termelnek_ctb6683: ;Main true block ;keep :
	; generic assign 
	ld hl,$270f
	; Loading pointer
	ld [Drill_Cash2],hl
Pumpak_Termelnek_edblock6685:
	call Cash2_OSD
Pumpak_Termelnek_edblock6671:
	ret
end_procedure_Pumpak_Termelnek:
	; ***********  Defining procedure : Enemy_Terjed_Ide
	;    Procedure type : User-defined procedure
localVariable_Enemy_Terjed_Ide_mp:	dw	0
localVariable_Enemy_Terjed_Ide_x:	db	0
localVariable_Enemy_Terjed_Ide_y:	db	0
Enemy_Terjed_Ide_block6688:
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
	jr z, Enemy_Terjed_Ide_edblock6693
Enemy_Terjed_Ide_localsuccess6701: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Talaj3Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Enemy_Terjed_Ide_edblock6693
Enemy_Terjed_Ide_ctb6691: ;Main true block ;keep :
	; FAL blokkol 
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_x]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_y]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
	; pumpát megeszi, bármely fázisban 
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Enemy_Terjed_Ide_mp]
	ld hl,Map
	add hl,de
	ld a,[VirusMap]
	ld [hl],a 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_x]
	ld [localVariable_Keret_Erint_x], a
	; generic assign 
	ld a,[localVariable_Enemy_Terjed_Ide_y]
	ld [localVariable_Keret_Erint_y], a
	call Keret_Erint
	or a
	jr nz,Enemy_Terjed_Ide_edblock6706
Enemy_Terjed_Ide_ctb6704: ;Main true block ;keep :
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
Enemy_Terjed_Ide_edblock6706:
Enemy_Terjed_Ide_edblock6693:
	ret
end_procedure_Enemy_Terjed_Ide:
	; Véletlen rács-mező OSZTÁS NÉLKÜL (a mod 30/18 + *30 szoftveres osztás/szorzás helyett): Rnd_X 1..30, Rnd_Y 1..18, Rnd_Mp = Map-index; (rnd*N)>>8, shiftekkel 
	; ***********  Defining procedure : Rnd_Mezo
	;    Procedure type : User-defined procedure
Rnd_Mezo:
			call Random_Random1
			push hl
			ld l,h
			ld h,0
			add hl,hl
			ld b,h
			ld c,l
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,hl
			or a
			sbc hl,bc
			ld a,h
			ld [Rnd_X],a
			pop hl
			ld h,0
			add hl,hl
			ld b,h
			ld c,l
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,bc
			ld a,h
			ld [Rnd_Y],a
			ld l,a
			ld h,0
			add hl,hl
			ld b,h
			ld c,l
			add hl,hl
			add hl,hl
			add hl,hl
			add hl,hl
			or a
			sbc hl,bc
			ld a,[Rnd_X]
			ld e,a
			ld d,0
			add hl,de
			ld [Rnd_Mp],hl
			ld a,[Rnd_X]
			inc a
			ld [Rnd_X],a
			ld a,[Rnd_Y]
			inc a
			ld [Rnd_Y],a
		
	ret
end_procedure_Rnd_Mezo:
	; Két véletlen 0..2 érték (a 3x3 terjedéshez) osztás nélkül: Rnd_DX, Rnd_DY = (rnd*3)>>8 
	; ***********  Defining procedure : Rnd_Harom
	;    Procedure type : User-defined procedure
Rnd_Harom:
			call Random_Random1
			push hl
			ld l,h
			ld h,0
			ld b,h
			ld c,l
			add hl,hl
			add hl,bc
			ld a,h
			ld [Rnd_DX],a
			pop hl
			ld h,0
			ld b,h
			ld c,l
			add hl,hl
			add hl,bc
			ld a,h
			ld [Rnd_DY],a
		
	ret
end_procedure_Rnd_Harom:
	; Kolónia-vetés: egy véletlen rács-mezőre vírus 
	; ***********  Defining procedure : Enemy_Random_Lerak
	;    Procedure type : User-defined procedure
Enemy_Random_Lerak:
	call Rnd_Mezo
	; generic assign 
	ld a,[Rnd_X]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[Rnd_Y]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
	ret
end_procedure_Enemy_Random_Lerak:
	; A vírus NÖVEKEDÉSE + TERJEDÉSE 
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
Enemyk_Mukodnek_block6712:
Enemyk_Mukodnek:
	ld a, $0
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
Enemyk_Mukodnek_while6713:
Enemyk_Mukodnek_loopstart6717:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	cp $6
	jp nc,Enemyk_Mukodnek_edblock6716
Enemyk_Mukodnek_ctb6714: ;Main true block ;keep :
	call Rnd_Mezo
	; generic assign 
	ld a,[Rnd_X]
	ld [localVariable_Enemyk_Mukodnek_rx], a
	; generic assign 
	ld a,[Rnd_Y]
	ld [localVariable_Enemyk_Mukodnek_ry], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Rnd_Mp]
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
	jp c, Enemyk_Mukodnek_edblock6987
Enemyk_Mukodnek_localsuccess7117: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	; Variable is 16-bit
	ld de,[localVariable_Enemyk_Mukodnek_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld c, a
	; RHS is pure numeric optimisation
	ld a,[VirusMap]
	add  a, $4
	cp c
	jp c,Enemyk_Mukodnek_edblock6987
Enemyk_Mukodnek_ctb6985: ;Main true block ;keep :
	; csak vírus (20..24), a 2. játékos pumpái (31..) nem 
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
	jp nc,Enemyk_Mukodnek_eblock7121
Enemyk_Mukodnek_ctb7120: ;Main true block ;keep :
	; NÖVEKVŐ: egy lépcső előre 
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
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_rx]
	ld [localVariable_Keret_Erint_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_ry]
	ld [localVariable_Keret_Erint_y], a
	call Keret_Erint
	or a
	jr nz,Enemyk_Mukodnek_edblock7189
Enemyk_Mukodnek_ctb7187: ;Main true block ;keep :
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
Enemyk_Mukodnek_edblock7189:
	jp Enemyk_Mukodnek_edblock7122
Enemyk_Mukodnek_eblock7121:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Enemy_Terjedhet]
	cp $1
	jp nz,Enemyk_Mukodnek_edblock7196
Enemyk_Mukodnek_ctb7194: ;Main true block ;keep :
	; KIFEJLETT: nem nő; terjed, ha engedélyezve  3x3 környezet: dx,dy fuggetlenul -1/0/+1 
	call Rnd_Harom
	; generic assign 
	ld a,[Rnd_DX]
	ld [localVariable_Enemyk_Mukodnek_dx], a
	; generic assign 
	ld a,[Rnd_DY]
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
	jr nc,Enemyk_Mukodnek_edblock7226
Enemyk_Mukodnek_ctb7224: ;Main true block ;keep :
	; clamp a rácsra (C64: 0..39 / 1..24) 
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock7226:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	cp $1e
	jr c, Enemyk_Mukodnek_edblock7232
	jr z, Enemyk_Mukodnek_edblock7232
Enemyk_Mukodnek_ctb7230: ;Main true block ;keep :
	ld a, $1e
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock7232:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $1
	jr nc,Enemyk_Mukodnek_edblock7238
Enemyk_Mukodnek_ctb7236: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock7238:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $12
	jr c, Enemyk_Mukodnek_edblock7244
	jr z, Enemyk_Mukodnek_edblock7244
Enemyk_Mukodnek_ctb7242: ;Main true block ;keep :
	ld a, $12
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock7244:
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
Enemyk_Mukodnek_edblock7196:
Enemyk_Mukodnek_edblock7122:
Enemyk_Mukodnek_edblock6987:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	add  a,$1
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
	jp Enemyk_Mukodnek_while6713
Enemyk_Mukodnek_edblock6716:
Enemyk_Mukodnek_loopend6718:
	ret
end_procedure_Enemyk_Mukodnek:
	; Tűzgomb: 1, ha SPACE VAGY a joystick tűzgombja le van nyomva (előtte GetKeyboard + GetJoysticks kell) 
	; ***********  Defining procedure : Tuz
	;    Procedure type : User-defined procedure
localVariable_Tuz_varPrefixed_r:	db	0
Tuz_block7247:
Tuz:
	ld a, $0
	ld [localVariable_Tuz_varPrefixed_r], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$2007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Tuz_edblock7251
Tuz_ctb7249: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Tuz_varPrefixed_r], a
Tuz_edblock7251:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $8
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, Tuz_edblock7257
Tuz_ctb7255: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Tuz_varPrefixed_r], a
Tuz_edblock7257:
	ld a,[localVariable_Tuz_varPrefixed_r]
	ret
	ret
end_procedure_Tuz:
	; JELMAGYARÁZAT-képernyő (a főmenüben a 2-es billentyű): a játékelemek leírása, SPACE-re vissza a főmenübe 
	; ***********  Defining procedure : Jelmagyarazat_Kepernyo
	;    Procedure type : User-defined procedure
Jelmagyarazat_Kepernyo:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	; jelmagyarázat: sprite + 5 pont + leírás; a hosszú szövegek a 32 karakteres sor miatt tördelve, a folytatás a szöveg alá igazítva 
	ld de,$14
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Casting from integer to byte
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	ld a,$2
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,$a
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7262
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7264
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Storing to array  
	ld a,$2
	ld [Talaj1+$f],a
	; Storing to array  
	ld a,$15
	ld [Talaj1+$10],a
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Talaj1
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $15
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7266
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $15
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7268
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $1f
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7270
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Storing to array  
	ld a,$2
	ld [Talaj3+$f],a
	; Storing to array  
	ld a,$2a
	ld [Talaj3+$10],a
	ld hl,Talaj3
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Talaj3
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $2a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7272
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $2a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7274
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $34
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7276
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Storing to array  
	ld a,$2
	ld [Fal+$f],a
	; Storing to array  
	ld a,$3f
	ld [Fal+$10],a
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Fal
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $3f
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7278
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $3f
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7280
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $49
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7282
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Storing to array  
	ld a,$1
	ld [Keret+$f],a
	; Storing to array  
	ld a,$54
	ld [Keret+$10],a
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld a, $6
	ld [Ir_X], a
	ld a, $54
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7284
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $54
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7286
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $5e
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7288
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld de,$4
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
	; Storing to array  
	ld a,$2
	ld [Enemy+$f],a
	; Storing to array  
	ld a,$69
	ld [Enemy+$10],a
	ld hl,Enemy
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Enemy
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $69
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7290
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $69
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7292
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $73
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7294
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $7d
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7296
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Storing to array  
	ld a,$2
	ld [BombaIkon+$f],a
	; Storing to array  
	ld a,$88
	ld [BombaIkon+$10],a
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,BombaIkon
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ld a, $6
	ld [Ir_X], a
	ld a, $88
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7298
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $88
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7300
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $92
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7302
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $9c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7304
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Ir_X], a
	ld a, $a7
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7306
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $6
	ld [Ir_X], a
	ld a, $a7
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7308
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $a7
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7310
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $b1
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7312
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $bb
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7314
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Ir_X], a
	ld a, $c6
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7316
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $c6
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7318
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Ir_X], a
	ld a, $d1
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7320
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $10
	ld [Ir_X], a
	ld a, $d1
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7322
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $a
	ld [Ir_X], a
	ld a, $e0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Jelmagyarazat_Kepernyo_stringassignstr7324
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $1
	ld [Start_Wait], a
Jelmagyarazat_Kepernyo_while7325:
Jelmagyarazat_Kepernyo_loopstart7329:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Jelmagyarazat_Kepernyo_edblock7328
Jelmagyarazat_Kepernyo_ctb7326: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	cp $1
	jr nz,Jelmagyarazat_Kepernyo_edblock7342
Jelmagyarazat_Kepernyo_ctb7340: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Jelmagyarazat_Kepernyo_edblock7342:
	call GE_WaitForSync
	jr Jelmagyarazat_Kepernyo_while7325
Jelmagyarazat_Kepernyo_edblock7328:
Jelmagyarazat_Kepernyo_loopend7330:
	ret
end_procedure_Jelmagyarazat_Kepernyo:
	; A főmenü kirajzolása: a menü-blokk (a pumpa-mutató + a sorok) a képernyő közepén, a sorok balra igazítva; függőlegesen 76..163, 16 soronként (MENU_Y0 + sor*16) 
	; ***********  Defining procedure : Fomenu_Rajz
	;    Procedure type : User-defined procedure
localVariable_Fomenu_Rajz_mx:	db	0
Fomenu_Rajz_block7345:
Fomenu_Rajz:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7347
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Fomenu_Rajz_mx], a
	; 'a:=a + const'  optimization 
	sub $4
	ld [localVariable_Fomenu_Rajz_mx], a
	; a pumpa-mutató (2 byte) + 2 byte hézag a sorok előtt 
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Fomenu_Rajz_mx], a
	; 'a:=a + const'  optimization 
	add  a,$4
	ld [localVariable_Fomenu_Rajz_mx], a
	; generic assign 
	ld [Menu_X], a
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $4c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7349
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $5c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7351
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $6c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7353
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $7c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7355
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $8c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7357
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[localVariable_Fomenu_Rajz_mx]
	ld [Ir_X], a
	ld a, $9c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Fomenu_Rajz_stringassignstr7359
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ret
end_procedure_Fomenu_Rajz:
	; ***********  Defining procedure : Menu_Pumpa
	;    Procedure type : User-defined procedure
localVariable_Menu_Pumpa_varPrefixed_p:	dw	0
localVariable_Menu_Pumpa_sor:	db	0
localVariable_Menu_Pumpa_faz:	db	0
Menu_Pumpa_block7360:
Menu_Pumpa:
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
	ld [localVariable_Menu_Pumpa_varPrefixed_p],hl
	; 16 bit BINOP
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$10
	push af
	; Variable is 16-bit
	ld a,[localVariable_Menu_Pumpa_faz]
	ld l,a
	ld h,0
	ex de,hl
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_Menu_Pumpa_varPrefixed_p]
	add  hl,de
	ld [localVariable_Menu_Pumpa_varPrefixed_p],hl
	; fázisonként 16 byte 
	; Variable is 16-bit
	; Casting from integer to byte
	ld a,l
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	; RHS is pure numeric optimisation
	ld a,[Menu_X]
	sub  $4
	ld [Pumpa+$f],a
	; Storing to array  
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Menu_Pumpa_sor]
	ld e,a
	ld d,0
	ld a,$10
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [Pumpa+$10],a
	; Storing to array  
	ld de,$10
	ld hl,Pumpa
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$4b
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
	ret
end_procedure_Menu_Pumpa:
	; A főmenü pumpa-mutatójának animációja (képkockánként hívandó): 4 képkockánként a következő fázis - a menüben és a LEVEL CODE beírása közben is 
	; ***********  Defining procedure : Menu_Anim
	;    Procedure type : User-defined procedure
Menu_Anim:
	; 'a:=a + const'  optimization 
	ld a,[Menu_Ido]
	add  a,$1
	ld [Menu_Ido], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $4
	jr c, Menu_Anim_edblock7367
Menu_Anim_ctb7365: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Ido], a
	; 'a:=a + const'  optimization 
	ld a,[Menu_Faz]
	add  a,$1
	ld [Menu_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, Menu_Anim_edblock7379
Menu_Anim_ctb7377: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Faz], a
Menu_Anim_edblock7379:
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
Menu_Anim_edblock7367:
	ret
end_procedure_Menu_Anim:
	; LEVEL CODE: melyik betű van lenyomva (0..25 = A..Z, 255 = egyik sem) 
	; ***********  Defining procedure : Betu_Lenyomva
	;    Procedure type : User-defined procedure
localVariable_Betu_Lenyomva_varPrefixed_i:	db	0
localVariable_Betu_Lenyomva_varPrefixed_r:	db	0
localVariable_Betu_Lenyomva_k:	dw	0
Betu_Lenyomva_block7382:
Betu_Lenyomva:
	ld a, $ff
	ld [localVariable_Betu_Lenyomva_varPrefixed_r], a
	ld a, $0
	ld [localVariable_Betu_Lenyomva_varPrefixed_i], a
Betu_Lenyomva_while7383:
Betu_Lenyomva_loopstart7387:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	cp $1a
	jr nc,Betu_Lenyomva_edblock7386
Betu_Lenyomva_ctb7384: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Betu_Kod
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Betu_Lenyomva_k],hl
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Betu_Lenyomva_edblock7400
Betu_Lenyomva_ctb7398: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	ld [localVariable_Betu_Lenyomva_varPrefixed_r], a
Betu_Lenyomva_edblock7400:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	add  a,$1
	ld [localVariable_Betu_Lenyomva_varPrefixed_i], a
	jr Betu_Lenyomva_while7383
Betu_Lenyomva_edblock7386:
Betu_Lenyomva_loopend7388:
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_r]
	ret
	ret
end_procedure_Betu_Lenyomva:
	; LEVEL CODE (főmenü): a kód beírása a "LEVEL CODE" sor után (villogó kurzor; betű = hozzáír, DEL = töröl, ESC = mégse; az 5. betű után azonnal érvényesít, nincs ENTER). Érvényes kódnál Kod_Palya = a pálya indexe, Versus = 1 a versus pályáknak nincs kódja; rossz kódnál "WRONG CODE" 
	; ***********  Defining procedure : Kod_Bevitel
	;    Procedure type : User-defined procedure
localVariable_Kod_Bevitel_n:	db	0
localVariable_Kod_Bevitel_varPrefixed_b:	db	0
localVariable_Kod_Bevitel_elozo:	db	0
localVariable_Kod_Bevitel_villog:	db	0
localVariable_Kod_Bevitel_cx:	db	0
localVariable_Kod_Bevitel_y:	db	0
localVariable_Kod_Bevitel_varPrefixed_i:	db	0
localVariable_Kod_Bevitel_j:	db	0
localVariable_Kod_Bevitel_egy:	db	0
localVariable_Kod_Bevitel_varPrefixed_a1:	db	0
localVariable_Kod_Bevitel_varPrefixed_a2:	db	0
localVariable_Kod_Bevitel_varPrefixed_a3:	db	0
localVariable_Kod_Bevitel_gomb:	db	0
localVariable_Kod_Bevitel_kesz:	db	0
Kod_Bevitel_block7403:
Kod_Bevitel:
	ld a, $9c
	ld [localVariable_Kod_Bevitel_y], a
	; generic assign 
	ld a,[Menu_X]
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Kod_Bevitel_stringassignstr7405
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Ir_X]
	add  a, $2
	ld [localVariable_Kod_Bevitel_cx], a
	ld a, $0
	ld [localVariable_Kod_Bevitel_n], a
	ld a, $ff
	ld [localVariable_Kod_Bevitel_elozo], a
	ld a, $1
	ld [localVariable_Kod_Bevitel_gomb], a
	; előbb minden vezérlőgomb felengedése 
	ld a, $0
	ld [localVariable_Kod_Bevitel_villog], a
	ld [localVariable_Kod_Bevitel_kesz], a
	ld a, $1
	ld [Start_Wait], a
Kod_Bevitel_while7406:
Kod_Bevitel_loopstart7410:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,Kod_Bevitel_edblock7409
Kod_Bevitel_ctb7407: ;Main true block ;keep :
	call GE_WaitForSync
	call GE_GetKeyboard
	call Menu_Anim
	; a menü pumpa-mutatója közben is animál  villogó kurzor (a következő betű helyén): 16 képkockánként be/ki 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_villog]
	add  a,$1
	ld [localVariable_Kod_Bevitel_villog], a
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jr nc,Kod_Bevitel_edblock9247
Kod_Bevitel_ctb9245: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_villog]
	cp $10
	jr nz,Kod_Bevitel_edblock9265
Kod_Bevitel_ctb9263: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $7
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
Kod_Bevitel_edblock9265:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_villog]
	cp $20
	jr c, Kod_Bevitel_edblock9271
Kod_Bevitel_ctb9269: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $7
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $0
	ld [localVariable_Kod_Bevitel_villog], a
Kod_Bevitel_edblock9271:
Kod_Bevitel_edblock9247:
	; betű: új lenyomásra hozzáírva 
	; generic assign 
	call Betu_Lenyomva
	ld [localVariable_Kod_Bevitel_varPrefixed_b], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	cp $ff
	jp z, Kod_Bevitel_edblock9277
Kod_Bevitel_ctb9275: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Kod_Bevitel_elozo]
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_b]
	cp b
	jp z, Kod_Bevitel_edblock9325
Kod_Bevitel_ctb9323: ;Main true block ;keep :
	; az 5. betű után azonnal ellenőriz (nincs ENTER) 
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jp nc,Kod_Bevitel_edblock9349
Kod_Bevitel_ctb9347: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $7
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; kurzor le 
	; Storing to array  
	ld a,[localVariable_Kod_Bevitel_n]
	ld e,a
	ld d,0
	ld hl,Kod_X
	add hl,de
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [hl],a 
	; Storing to array  
	; RHS is pure numeric optimisation
	ld a,[localVariable_Kod_Bevitel_varPrefixed_b]
	add  a, $41
	ld [Betu_Str+$0],a
	; Storing to array  
	; RHS is pure numeric optimisation
	ld a,[localVariable_Kod_Bevitel_varPrefixed_b]
	add  a, $41
	push af
	ld a,[localVariable_Kod_Bevitel_n]
	ld e,a
	ld hl,Kod_Buf
	add hl,de
	pop af
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [Ir_Y], a
	ld hl,Betu_Str
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_Kod_Bevitel_cx], a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_n]
	add  a,$1
	ld [localVariable_Kod_Bevitel_n], a
	ld a, $f
	ld [localVariable_Kod_Bevitel_villog], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jr nz,Kod_Bevitel_edblock9361
Kod_Bevitel_ctb9359: ;Main true block ;keep :
	; a kurzor azonnal megjelenik 
	ld a, $1
	ld [localVariable_Kod_Bevitel_kesz], a
Kod_Bevitel_edblock9361:
Kod_Bevitel_edblock9349:
Kod_Bevitel_edblock9325:
Kod_Bevitel_edblock9277:
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_b]
	ld [localVariable_Kod_Bevitel_elozo], a
	; DEL / ESC: csak új lenyomásra; az 5. betű után azonnali ellenőrzés (egy = 3) 
	ld a, $0
	ld [localVariable_Kod_Bevitel_egy], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$105
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Kod_Bevitel_edblock9367
Kod_Bevitel_ctb9365: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_egy], a
Kod_Bevitel_edblock9367:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Kod_Bevitel_edblock9373
Kod_Bevitel_ctb9371: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Kod_Bevitel_egy], a
Kod_Bevitel_edblock9373:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	or a
	jr nz,Kod_Bevitel_edblock9379
Kod_Bevitel_ctb9377: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock9379:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_kesz]
	cp $1
	jr nz,Kod_Bevitel_edblock9385
Kod_Bevitel_ctb9383: ;Main true block ;keep :
	ld a, $3
	ld [localVariable_Kod_Bevitel_egy], a
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock9385:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_gomb]
	or a
	jp nz,Kod_Bevitel_edblock9391
Kod_Bevitel_ctb9389: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $1
	jp nz,Kod_Bevitel_edblock10237
Kod_Bevitel_ctb10235: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	or a
	jp c, Kod_Bevitel_edblock10249
	jp z, Kod_Bevitel_edblock10249
Kod_Bevitel_ctb10247: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $7
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_n]
	sub $1
	ld [localVariable_Kod_Bevitel_n], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_cx]
	push af
	ld a,[localVariable_Kod_Bevitel_n]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kod_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld b,a
	pop af
	sub  b
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_n]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kod_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_y]
	ld [GE_Y], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld [GE_Width], a
	ld a, $7
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_n]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kod_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Kod_Bevitel_cx], a
	ld a, $f
	ld [localVariable_Kod_Bevitel_villog], a
Kod_Bevitel_edblock10249:
Kod_Bevitel_edblock10237:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $2
	jr nz,Kod_Bevitel_edblock10255
Kod_Bevitel_ctb10253: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Kod_Bevitel_edblock10255:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $3
	jp nz,Kod_Bevitel_edblock10261
Kod_Bevitel_ctb10259: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jp nz,Kod_Bevitel_edblock10669
Kod_Bevitel_ctb10667: ;Main true block ;keep :
	; keresés: az egyjátékos, aztán a co-op pályák kódjai (Kod_Mod: 0 / 1) - versus pályának nincs kódja 
	ld a, $ff
	ld [Kod_Palya], a
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while10870:
Kod_Bevitel_loopstart10874:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $b
	jp nc,Kod_Bevitel_edblock10873
Kod_Bevitel_ctb10871: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
	ld [localVariable_Kod_Bevitel_j], a
Kod_Bevitel_while10918:
Kod_Bevitel_loopstart10922:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_j]
	cp $5
	jr nc,Kod_Bevitel_edblock10921
Kod_Bevitel_ctb10919: ;Main true block ;keep :
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$5
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a2]
	add  a, b
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; generic assign 
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Kod
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_j]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kod_Buf
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Kod_Bevitel_varPrefixed_a3], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a2]
	cp b
	jr z, Kod_Bevitel_edblock10937
Kod_Bevitel_ctb10935: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
Kod_Bevitel_edblock10937:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	add  a,$1
	ld [localVariable_Kod_Bevitel_j], a
	jr Kod_Bevitel_while10918
Kod_Bevitel_edblock10921:
Kod_Bevitel_loopend10923:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a1]
	or a
	jr nz,Kod_Bevitel_edblock10943
Kod_Bevitel_ctb10941: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock10955
Kod_Bevitel_ctb10953: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld [Kod_Palya], a
	ld a, $0
	ld [Kod_Mod], a
Kod_Bevitel_edblock10955:
Kod_Bevitel_edblock10943:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jp Kod_Bevitel_while10870
Kod_Bevitel_edblock10873:
Kod_Bevitel_loopend10875:
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while10958:
Kod_Bevitel_loopstart10962:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $b
	jp nc,Kod_Bevitel_edblock10961
Kod_Bevitel_ctb10959: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
	ld [localVariable_Kod_Bevitel_j], a
Kod_Bevitel_while11006:
Kod_Bevitel_loopstart11010:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_j]
	cp $5
	jr nc,Kod_Bevitel_edblock11009
Kod_Bevitel_ctb11007: ;Main true block ;keep :
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$5
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a2]
	add  a, b
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; generic assign 
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_KodCoop
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Kod_Bevitel_varPrefixed_a2], a
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_j]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kod_Buf
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Kod_Bevitel_varPrefixed_a3], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a2]
	cp b
	jr z, Kod_Bevitel_edblock11025
Kod_Bevitel_ctb11023: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
Kod_Bevitel_edblock11025:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	add  a,$1
	ld [localVariable_Kod_Bevitel_j], a
	jr Kod_Bevitel_while11006
Kod_Bevitel_edblock11009:
Kod_Bevitel_loopend11011:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a1]
	or a
	jr nz,Kod_Bevitel_edblock11031
Kod_Bevitel_ctb11029: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock11043
Kod_Bevitel_ctb11041: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld [Kod_Palya], a
	ld a, $1
	ld [Kod_Mod], a
Kod_Bevitel_edblock11043:
Kod_Bevitel_edblock11031:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jp Kod_Bevitel_while10958
Kod_Bevitel_edblock10961:
Kod_Bevitel_loopend10963:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock11049
Kod_Bevitel_ctb11047: ;Main true block ;keep :
	ld a, $b0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Kod_Bevitel_stringassignstr11061
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	; rossz kód: ~1 mp, aztán vissza a menübe 
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while11062:
Kod_Bevitel_loopstart11066:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $32
	jr nc,Kod_Bevitel_edblock11065
Kod_Bevitel_ctb11063: ;Main true block ;keep :
	call GE_WaitForSync
	call Menu_Anim
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jr Kod_Bevitel_while11062
Kod_Bevitel_edblock11065:
Kod_Bevitel_loopend11067:
Kod_Bevitel_edblock11049:
	ld a, $0
	ld [Start_Wait], a
Kod_Bevitel_edblock10669:
Kod_Bevitel_edblock10261:
	ld a, $1
	ld [localVariable_Kod_Bevitel_gomb], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	or a
	jr nz,Kod_Bevitel_edblock11073
Kod_Bevitel_ctb11071: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock11073:
Kod_Bevitel_edblock9391:
	jp Kod_Bevitel_while7406
Kod_Bevitel_edblock7409:
Kod_Bevitel_loopend7411:
	ret
end_procedure_Kod_Bevitel:
	; VERSUS szintválasztó: a p. versus pálya kisképe (30x18 mező, mezőnként 1 byte = 4 px széles x 4 sor: szikla fekete, talaj szürke, fekete kerettel) + "LVL nn" és a cél 
	; ***********  Defining procedure : VS_Elonezet
	;    Procedure type : User-defined procedure
localVariable_VS_Elonezet_ti:	dw	0
localVariable_VS_Elonezet_varPrefixed_p:	db	0
VS_Elonezet_block11076:
VS_Elonezet:
	ld a, $10
	ld [GE_X], a
	ld a, $47
	ld [GE_Y], a
	ld a, $20
	ld [GE_Width], a
	ld a, $4a
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
	; fekete keret (1 byte oldalt, 1 sor fent/lent) 
	ld a, $11
	ld [GE_X], a
	ld a, $48
	ld [GE_Y], a
	ld a, $1e
	ld [GE_Width], a
	ld a, $48
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; szürke belső 
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_VS_Elonezet_ti],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$44
	push af
	; Variable is 16-bit
	ld de,[localVariable_VS_Elonezet_ti]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_VS_Elonezet_ti],hl
	; pályánként 68 byte, 1 bit/mező (MSB elöl), mint a MapReset 
	; generic assign 
	; Variable is 16-bit
	ld hl,Terkepek2
	; Loading pointer
	ld [VSE_Src],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_VS_Elonezet_ti]
	; Variable is 16-bit
	ld hl,[VSE_Src]
	add  hl,de
	ld [VSE_Src],hl
			ld a,(hl)
			inc hl
			ld [VSE_Byte],a
			ld a,8
			ld [VSE_Bit],a
			ld ix,$9211					; a kiskép 1. cellájának 0. sora: $8000 + 72*64 + 17 (a 2. sor = +128)
			ld d,18
VS_Elonezet_sor:
			push ix
			ld e,30
VS_Elonezet_mezo:
			ld a,[VSE_Byte]
			sla a
			ld [VSE_Byte],a
			jr nc,VS_Elonezet_ures
			ld (IX+0),240
			push de
			push ix
			pop de
			ld a,e
			add a,128
			ld e,a
			ld a,d
			adc a,0
			ld d,a
			ld a,240
			ld (de),a					; ugyanez 2 sorral lejjebb
			pop de
VS_Elonezet_ures:
			ld a,[VSE_Bit]
			dec a
			jr nz,VS_Elonezet_bitvan
			ld a,(hl)
			inc hl
			ld [VSE_Byte],a
			ld a,8
VS_Elonezet_bitvan:
			ld [VSE_Bit],a
			inc ix
			dec e
			jr nz,VS_Elonezet_mezo
			pop ix
			ld bc,256
			add ix,bc
			dec d
			jr nz,VS_Elonezet_sor
		
	; gyors rajz (asm): mezőnként 1 byte (4 px) széles, a 4 sorából csak minden második (0. és 2.) - szikla = $F0 (fekete) 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	add  a, $1
	ld [localVariable_HUD_Num2_ertek], a
	; generic assign 
	ld a,[VS_X]
	ld [localVariable_HUD_Num2_x], a
	ld a, $9c
	ld [localVariable_HUD_Num2_sor], a
	call HUD_Num2
	; LVL nn (a felirat egyszer, a VS_Valaszto-ban) 
	; generic assign 
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Cel
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[VS_CelX]
	ld [localVariable_HUD_Num3_x], a
	ld a, $aa
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	ret
end_procedure_VS_Elonezet:
	; PUMP GOAL: nnn  VERSUS szintválasztó képernyő: joystick balra/jobbra = előző/következő pálya (körbe), tűz/SPACE = indítás (Kod_Palya = a pálya), ESC = vissza a menübe (Kod_Palya = 255) 
	; ***********  Defining procedure : VS_Valaszto
	;    Procedure type : User-defined procedure
localVariable_VS_Valaszto_varPrefixed_p:	db	0
localVariable_VS_Valaszto_irany:	db	0
localVariable_VS_Valaszto_elozo:	db	0
localVariable_VS_Valaszto_t:	db	0
localVariable_VS_Valaszto_tv:	db	0
VS_Valaszto_block11078:
VS_Valaszto:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ld a, $28
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11080
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $38
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11082
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11084
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$40
	sub  b
	ld [VS_X], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[VS_X]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [VS_X], a
	; generic assign 
	ld [Ir_X], a
	ld a, $9c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11086
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [VS_X], a
	; generic assign 
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Jegy_Sz]
	ld e,a
	ld d,0
	ld a,$2
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [Ir_X], a
	ld a, $9c
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11089
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11091
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$40
	sub  b
	ld [VS_CelX], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[VS_CelX]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [VS_CelX], a
	; generic assign 
	ld [Ir_X], a
	ld a, $aa
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11093
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [VS_CelX], a
	ld a, $c8
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr11095
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $0
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
	; generic assign 
	ld [localVariable_VS_Elonezet_varPrefixed_p], a
	call VS_Elonezet
	ld a, $ff
	ld [Kod_Palya], a
	ld a, $0
	ld [localVariable_VS_Valaszto_elozo], a
	ld a, $1
	ld [localVariable_VS_Valaszto_tv], a
	; a menüt aktiváló tűz előbb engedődjön fel 
	ld [Start_Wait], a
	; vissza a menübe (Kod_Palya = 255) 
VS_Valaszto_while11096:
VS_Valaszto_loopstart11100:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,VS_Valaszto_edblock11099
VS_Valaszto_ctb11097: ;Main true block ;keep :
	call GE_WaitForSync
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	ld a, $0
	ld [localVariable_VS_Valaszto_irany], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Valaszto_edblock11305
VS_Valaszto_ctb11303: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Valaszto_irany], a
VS_Valaszto_edblock11305:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Valaszto_edblock11311
VS_Valaszto_ctb11309: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_VS_Valaszto_irany], a
VS_Valaszto_edblock11311:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_irany]
	or a
	jr z, VS_Valaszto_edblock11317
VS_Valaszto_ctb11315: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_VS_Valaszto_elozo]
	ld b,a
	ld a,[localVariable_VS_Valaszto_irany]
	cp b
	jr z, VS_Valaszto_edblock11401
VS_Valaszto_ctb11399: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_irany]
	cp $1
	jr nz,VS_Valaszto_eblock11442
VS_Valaszto_ctb11441: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	or a
	jr nz,VS_Valaszto_eblock11463
VS_Valaszto_ctb11462: ;Main true block ;keep :
	; új lenyomásra lapoz 
	ld a, $5
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
	jr VS_Valaszto_edblock11464
VS_Valaszto_eblock11463:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	sub $1
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
VS_Valaszto_edblock11464:
	jr VS_Valaszto_edblock11443
VS_Valaszto_eblock11442:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	add  a,$1
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $6
	jr c, VS_Valaszto_edblock11473
VS_Valaszto_ctb11471: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
VS_Valaszto_edblock11473:
VS_Valaszto_edblock11443:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	ld [localVariable_VS_Elonezet_varPrefixed_p], a
	call VS_Elonezet
VS_Valaszto_edblock11401:
VS_Valaszto_edblock11317:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_irany]
	ld [localVariable_VS_Valaszto_elozo], a
	; generic assign 
	call Tuz
	ld [localVariable_VS_Valaszto_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jr nz,VS_Valaszto_edblock11479
VS_Valaszto_ctb11477: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_tv]
	or a
	jr nz,VS_Valaszto_edblock11491
VS_Valaszto_ctb11489: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	ld [Kod_Palya], a
	; indítás: a főprogram ezzel a pályával kezd 
	ld a, $0
	ld [Start_Wait], a
VS_Valaszto_edblock11491:
VS_Valaszto_edblock11479:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_t]
	ld [localVariable_VS_Valaszto_tv], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, VS_Valaszto_edblock11497
VS_Valaszto_ctb11495: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
VS_Valaszto_edblock11497:
	jp VS_Valaszto_while11096
VS_Valaszto_edblock11099:
VS_Valaszto_loopend11101:
	ret
end_procedure_VS_Valaszto:
	; FŐMENÜ / RND-beállítás: animált pumpa-mutató a sorok előtt; joystick (vagy kurzor) fel/le = sor választás (nyomva tartva ismétel), tűz/SPACE = a menüpont aktiválása. Sorok: 0 egy játékos, 1 co-op, 2 versus, 3 jelmagyarázat, 4 hiscore (még nincs), 5 LEVEL CODE (érvényes kódra azonnal indul a pálya). Közben pörög a véletlenszám-generátor (entrópia) 
	; ***********  Defining procedure : Start_Kepernyo
	;    Procedure type : User-defined procedure
localVariable_Start_Kepernyo_irany:	db	0
localVariable_Start_Kepernyo_elozo:	db	0
localVariable_Start_Kepernyo_ism:	db	0
localVariable_Start_Kepernyo_t:	db	0
Start_Kepernyo_block11500:
Start_Kepernyo:
	call Digi_Le
	; ha még szólna egy digi hang (pl. tick), a digi mód le: különben a WaitForSync a 4 kHz-es hang-IT-re ébredne ("turbó" menü) 
	call Fomenu_Rajz
	ld a, $0
	ld [Menu_Faz], a
	ld [Menu_Ido], a
	ld [localVariable_Start_Kepernyo_elozo], a
	ld [localVariable_Start_Kepernyo_ism], a
	ld a, $1
	ld [Tuz1_Volt], a
	; a tűz/SPACE előbb engedődjön fel (az előző képernyőről még nyomva lehet) 
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
	ld a, $1
	ld [Start_Wait], a
Start_Kepernyo_while11501:
Start_Kepernyo_loopstart11505:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,Start_Kepernyo_edblock11504
Start_Kepernyo_ctb11502: ;Main true block ;keep :
	call GE_WaitForSync
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	call Menu_Anim
	; a pumpa-mutató animációja  fel/le: új lenyomásra azonnal, nyomva tartva kb. 1/4 mp után ismételve 
	ld a, $0
	ld [localVariable_Start_Kepernyo_irany], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, Start_Kepernyo_edblock12116
Start_Kepernyo_ctb12114: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_irany], a
Start_Kepernyo_edblock12116:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, Start_Kepernyo_edblock12122
Start_Kepernyo_ctb12120: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Start_Kepernyo_irany], a
Start_Kepernyo_edblock12122:
	ld a, $0
	ld [localVariable_Start_Kepernyo_t], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_irany]
	or a
	jr z, Start_Kepernyo_edblock12128
Start_Kepernyo_ctb12126: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Start_Kepernyo_elozo]
	ld b,a
	ld a,[localVariable_Start_Kepernyo_irany]
	cp b
	jr z, Start_Kepernyo_eblock12153
Start_Kepernyo_ctb12152: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
	ld a, $0
	ld [localVariable_Start_Kepernyo_ism], a
	jr Start_Kepernyo_edblock12154
Start_Kepernyo_eblock12153:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Start_Kepernyo_ism]
	add  a,$1
	ld [localVariable_Start_Kepernyo_ism], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $e
	jr c, Start_Kepernyo_edblock12168
Start_Kepernyo_ctb12166: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
	ld a, $8
	ld [localVariable_Start_Kepernyo_ism], a
Start_Kepernyo_edblock12168:
Start_Kepernyo_edblock12154:
Start_Kepernyo_edblock12128:
	; generic assign 
	ld a,[localVariable_Start_Kepernyo_irany]
	ld [localVariable_Start_Kepernyo_elozo], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_t]
	cp $1
	jp nz,Start_Kepernyo_edblock12174
Start_Kepernyo_ctb12172: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Menu_X]
	sub  $4
	ld [GE_X], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[Menu_Sor]
	ld e,a
	ld d,0
	ld a,$10
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,$4b
	ld b,a
	pop af
	add  a, b
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $8
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_irany]
	cp $1
	jr nz,Start_Kepernyo_eblock12221
Start_Kepernyo_ctb12220: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	or a
	jr nz,Start_Kepernyo_eblock12244
Start_Kepernyo_ctb12243: ;Main true block ;keep :
	; a pumpa le a régi sorból 
	ld a, $5
	ld [Menu_Sor], a
	jr Start_Kepernyo_edblock12245
Start_Kepernyo_eblock12244:
	; 'a:=a + const'  optimization 
	ld a,[Menu_Sor]
	sub $1
	ld [Menu_Sor], a
Start_Kepernyo_edblock12245:
	jr Start_Kepernyo_edblock12222
Start_Kepernyo_eblock12221:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $5
	jr nz,Start_Kepernyo_eblock12253
Start_Kepernyo_ctb12252: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Sor], a
	jr Start_Kepernyo_edblock12254
Start_Kepernyo_eblock12253:
	; 'a:=a + const'  optimization 
	ld a,[Menu_Sor]
	add  a,$1
	ld [Menu_Sor], a
Start_Kepernyo_edblock12254:
Start_Kepernyo_edblock12222:
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
Start_Kepernyo_edblock12174:
	; tűz/SPACE: új lenyomásra a menüpont aktiválása 
	; generic assign 
	call Tuz
	ld [localVariable_Start_Kepernyo_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jp nz,Start_Kepernyo_edblock12262
Start_Kepernyo_ctb12260: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz1_Volt]
	or a
	jp nz,Start_Kepernyo_edblock12494
Start_Kepernyo_ctb12492: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	or a
	jr nz,Start_Kepernyo_edblock12610
Start_Kepernyo_ctb12608: ;Main true block ;keep :
	ld a, $0
	ld [Ket_Jatekos], a
	ld [Coop], a
	ld [Versus], a
	ld [Start_Wait], a
Start_Kepernyo_edblock12610:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $1
	jr nz,Start_Kepernyo_edblock12616
Start_Kepernyo_ctb12614: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Coop], a
	ld a, $0
	ld [Versus], a
	ld [Start_Wait], a
Start_Kepernyo_edblock12616:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $2
	jr nz,Start_Kepernyo_edblock12622
Start_Kepernyo_ctb12620: ;Main true block ;keep :
	; versus: előbb a szintválasztó (kisképpel); ESC-re vissza a menübe 
	call VS_Valaszto
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, Start_Kepernyo_eblock12635
Start_Kepernyo_ctb12634: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld a, $0
	ld [Coop], a
	ld a, $1
	ld [Versus], a
	ld a, $0
	ld [Start_Wait], a
	jr Start_Kepernyo_edblock12636
Start_Kepernyo_eblock12635:
	call Fomenu_Rajz
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
	ld a, $1
	ld [Start_Wait], a
Start_Kepernyo_edblock12636:
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
Start_Kepernyo_edblock12622:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $3
	jr nz,Start_Kepernyo_edblock12644
Start_Kepernyo_ctb12642: ;Main true block ;keep :
	call Jelmagyarazat_Kepernyo
	call Fomenu_Rajz
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
	; a visszalépő tűz se aktiváljon azonnal 
	ld [Start_Wait], a
Start_Kepernyo_edblock12644:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $5
	jr nz,Start_Kepernyo_edblock12650
Start_Kepernyo_ctb12648: ;Main true block ;keep :
	; LEVEL CODE: érvényes kódra azonnal indul a kódos pálya (egy játékos, ill. versus) 
	call Kod_Bevitel
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, Start_Kepernyo_eblock12687
Start_Kepernyo_ctb12686: ;Main true block ;keep :
	ld a, $0
	ld [Ket_Jatekos], a
	; a Kod_Bevitel állította: Kod_Mod 0 = egy játékos, 1 = co-op, 2 = versus pálya 
	ld [Coop], a
	ld [Versus], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Mod]
	cp $1
	jr nz,Start_Kepernyo_edblock12707
Start_Kepernyo_ctb12705: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Coop], a
Start_Kepernyo_edblock12707:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Mod]
	cp $2
	jr nz,Start_Kepernyo_edblock12713
Start_Kepernyo_ctb12711: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Versus], a
Start_Kepernyo_edblock12713:
	ld a, $0
	ld [Start_Wait], a
	jr Start_Kepernyo_edblock12688
Start_Kepernyo_eblock12687:
	call Fomenu_Rajz
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
	ld a, $1
	ld [Start_Wait], a
Start_Kepernyo_edblock12688:
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
Start_Kepernyo_edblock12650:
Start_Kepernyo_edblock12494:
Start_Kepernyo_edblock12262:
	; generic assign 
	ld a,[localVariable_Start_Kepernyo_t]
	ld [Tuz1_Volt], a
	jp Start_Kepernyo_while11501
Start_Kepernyo_edblock11504:
Start_Kepernyo_loopend11506:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ret
end_procedure_Start_Kepernyo:
	; METEOR - NEM BLOKKOLÓ. A főciklusból random időnként elindul egy zuhanás (Meteor_Indit), és amíg tart, a  A TELJES fal-réteg újrarajzolása a Map-ból (minden FalMap mező) 
	; ***********  Defining procedure : Fal_Mind_Kirak
	;    Procedure type : User-defined procedure
localVariable_Fal_Mind_Kirak_gx:	db	0
localVariable_Fal_Mind_Kirak_gy:	db	0
localVariable_Fal_Mind_Kirak_mp:	dw	0
Fal_Mind_Kirak_block12717:
Fal_Mind_Kirak:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_Fal_Mind_Kirak_mp],hl
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gy], a
Fal_Mind_Kirak_forloop12718:
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gx], a
Fal_Mind_Kirak_forloop12740:
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
	jr nz,Fal_Mind_Kirak_edblock12754
Fal_Mind_Kirak_ctb12752: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	ld [localVariable_Fal_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	ld [localVariable_Fal_Kirak_y], a
	call Fal_Kirak
Fal_Mind_Kirak_edblock12754:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_Fal_Mind_Kirak_mp]
	add  hl,de
	ld [localVariable_Fal_Mind_Kirak_mp],hl
Fal_Mind_Kirak_loopstart12741:
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gx],a
	cp $1e+1
	jr nz,Fal_Mind_Kirak_forloop12740
Fal_Mind_Kirak_loopend12742:
Fal_Mind_Kirak_loopstart12719:
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gy],a
	cp $12+1
	jr nz,Fal_Mind_Kirak_forloop12718
Fal_Mind_Kirak_loopend12720:
	ret
end_procedure_Fal_Mind_Kirak:
	; METEOR BECSAPÓDÁS - a ciklus végén (a meteor eltűnésekor) fut le 
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
localVariable_Meteor_Becsapodas_rom:	db	0
localVariable_Meteor_Becsapodas_mp:	dw	0
Meteor_Becsapodas_block12757:
Meteor_Becsapodas:
	; generic assign 
	ld de,$f
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [localVariable_Meteor_Becsapodas_mx], a
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
Meteor_Becsapodas_while12758:
Meteor_Becsapodas_loopstart12762:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_ty]
	cp $3
	jp nc,Meteor_Becsapodas_edblock12761
Meteor_Becsapodas_ctb12759: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	ld b,a
	ld a,[localVariable_Meteor_Becsapodas_gy0]
	add  a, b
	ld [localVariable_Meteor_Becsapodas_gy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Meteor_Becsapodas_edblock13379
Meteor_Becsapodas_ctb13377: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Meteor_Becsapodas_edblock13687
Meteor_Becsapodas_ctb13685: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_tx], a
Meteor_Becsapodas_while13838:
Meteor_Becsapodas_loopstart13842:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_tx]
	cp $3
	jp nc,Meteor_Becsapodas_edblock13841
Meteor_Becsapodas_ctb13839: ;Main true block ;keep :
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
	jp c, Meteor_Becsapodas_edblock13919
Meteor_Becsapodas_ctb13917: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Meteor_Becsapodas_edblock13957
Meteor_Becsapodas_ctb13955: ;Main true block ;keep :
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
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
	; generic assign 
	ld a,[Meteor_Tor_Engedve]
	ld [localVariable_Meteor_Becsapodas_rom], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Talaj3Map]
	ld b,a
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp b
	jr z, Meteor_Becsapodas_edblock13977
Meteor_Becsapodas_ctb13975: ;Main true block ;keep :
	; 1: ezen a pályán a meteor a sziklát (blokkolt mezőt) is rombolja 
	ld a, $1
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock13977:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock13983
Meteor_Becsapodas_ctb13981: ;Main true block ;keep :
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Meteor_Becsapodas_mp]
	ld hl,Map
	add hl,de
	ld a,[Talaj2Map]
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld [localVariable_Talaj2_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Talaj2_Kirak_y], a
	call Talaj2_Kirak
Meteor_Becsapodas_edblock13983:
Meteor_Becsapodas_edblock13957:
Meteor_Becsapodas_edblock13919:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_tx]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_tx], a
	jp Meteor_Becsapodas_while13838
Meteor_Becsapodas_edblock13841:
Meteor_Becsapodas_loopend13843:
Meteor_Becsapodas_edblock13687:
Meteor_Becsapodas_edblock13379:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_ty], a
	jp Meteor_Becsapodas_while12758
Meteor_Becsapodas_edblock12761:
Meteor_Becsapodas_loopend12763:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Vir_Engedve]
	cp $1
	jr nz,Meteor_Becsapodas_edblock13989
Meteor_Becsapodas_ctb13987: ;Main true block ;keep :
	; ezen a pályán a meteor vírust hoz: új telep a becsapódás közepén 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Becsapodas_gy0]
	add  a, $1
	ld [localVariable_Meteor_Becsapodas_gy], a
	ld a, $1
	ld [localVariable_Meteor_Becsapodas_rom], a
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	cp $1
	jr nc,Meteor_Becsapodas_edblock14031
Meteor_Becsapodas_ctb14029: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock14031:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	cp $1e
	jr c, Meteor_Becsapodas_edblock14037
	jr z, Meteor_Becsapodas_edblock14037
Meteor_Becsapodas_ctb14035: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock14037:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	cp $1
	jr nc,Meteor_Becsapodas_edblock14043
Meteor_Becsapodas_ctb14041: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock14043:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	cp $12
	jr c, Meteor_Becsapodas_edblock14049
	jr z, Meteor_Becsapodas_edblock14049
Meteor_Becsapodas_ctb14047: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock14049:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock14055
Meteor_Becsapodas_ctb14053: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
Meteor_Becsapodas_edblock14055:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock14061
Meteor_Becsapodas_ctb14059: ;Main true block ;keep :
	ld a, $1
	ld [Enemy_Terjedhet], a
Meteor_Becsapodas_edblock14061:
Meteor_Becsapodas_edblock13989:
	ret
end_procedure_Meteor_Becsapodas:
	; METEOR figyelmeztetés (NEM blokkoló, a főciklusból képkockánként): a "METEOR !" felirat az ikon-sor közepén 8 képkockánként fel/le (a Meteor_Figy 3. bitje szerint), fekete dobozban szürke betűvel 
	; ***********  Defining procedure : Meteor_Felirat
	;    Procedure type : User-defined procedure
localVariable_Meteor_Felirat_varPrefixed_b:	db	0
Meteor_Felirat_block14064:
Meteor_Felirat:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_Figy]
	and  $8
	ld [localVariable_Meteor_Felirat_varPrefixed_b], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	or a
	jr z, Meteor_Felirat_edblock14068
Meteor_Felirat_ctb14066: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Felirat_varPrefixed_b], a
Meteor_Felirat_edblock14068:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Meteor_Lat]
	ld b,a
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	cp b
	jp z, Meteor_Felirat_edblock14074
Meteor_Felirat_ctb14072: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	cp $1
	jr nz,Meteor_Felirat_eblock14087
Meteor_Felirat_ctb14086: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TX]
	sub  $1
	ld [GE_X], a
	ld a, $1f
	ld [GE_Y], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TW]
	add  a, $2
	ld [GE_Width], a
	ld a, $9
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
	; fekete doboz (1 byte/1 sor margóval) 
	; generic assign 
	ld a,[Meteor_TX]
	ld [Ir_X], a
	ld a, $20
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Meteor_Felirat_stringassignstr14093
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Szin_Mod], a
	; generic assign 
	ld a,[Meteor_TX]
	ld [localVariable_Szinez_x], a
	ld a, $20
	ld [localVariable_Szinez_y], a
	; generic assign 
	ld a,[Meteor_TW]
	ld [localVariable_Szinez_w], a
	ld a, $7
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	; szürke betű, fekete háttér 
	ld a, $0
	ld [Szin_Mod], a
	jr Meteor_Felirat_edblock14088
Meteor_Felirat_eblock14087:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TX]
	sub  $1
	ld [GE_X], a
	ld a, $1f
	ld [GE_Y], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TW]
	add  a, $2
	ld [GE_Width], a
	ld a, $9
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
Meteor_Felirat_edblock14088:
	; generic assign 
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	ld [Meteor_Lat], a
Meteor_Felirat_edblock14074:
	ret
end_procedure_Meteor_Felirat:
	; A következő meteor véletlen ideje: 10..30 mp (Meteor_Mp másodperc, Meteor_Fr = a másodpercen belüli képkocka 0..49) 
	; ***********  Defining procedure : Meteor_Uj_Ido
	;    Procedure type : User-defined procedure
localVariable_Meteor_Uj_Ido_varPrefixed_b:	db	0
localVariable_Meteor_Uj_Ido_varPrefixed_m:	db	0
Meteor_Uj_Ido_block14095:
Meteor_Uj_Ido:
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Meteor_Uj_Ido_varPrefixed_b], a
	; generic assign 
	ld a,$15
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Meteor_Uj_Ido_varPrefixed_b]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Meteor_Uj_Ido_varPrefixed_m], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld e,a
	ld d,0
	ld a,$15
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Meteor_Uj_Ido_varPrefixed_m], a
	; 'a:=a + expression'  optimization 
	ld b,a
	ld a,[localVariable_Meteor_Uj_Ido_varPrefixed_b]
	sub  b
	ld [localVariable_Meteor_Uj_Ido_varPrefixed_b], a
	; 0..20 
	; generic assign 
	; RHS is pure numeric optimisation
	add  a, $a
	ld [Meteor_Mp], a
	; 10..30 mp 
	ld a, $0
	ld [Meteor_Fr], a
	ret
end_procedure_Meteor_Uj_Ido:
	; A "METEOR:nn" kijelző az ikon-sor közepén (y=32; csak meteoros pályán): teljes = 1 -> a felirat is, 0 -> csak a 2 jegyű szám 
	; ***********  Defining procedure : Meteor_Kijelzo
	;    Procedure type : User-defined procedure
localVariable_Meteor_Kijelzo_teljes:	db	0
Meteor_Kijelzo_block14097:
Meteor_Kijelzo:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Kijelzo_teljes]
	cp $1
	jr nz,Meteor_Kijelzo_edblock14101
Meteor_Kijelzo_ctb14099: ;Main true block ;keep :
	; Assigning a string : Ir_Szoveg
	ld hl,Meteor_Kijelzo_stringassignstr14105
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Jegy_Sz]
	ld b,a
	ld a,[Ir_Hossz]
	add  a, b
	push af
	ld a,[Jegy_Sz]
	ld b,a
	pop af
	add  a, b
	ld [Meteor_KW], a
	; generic assign 
	ld b,a
	ld a,$40
	sub  b
	ld [Meteor_KX], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[Meteor_KX]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [Meteor_KX], a
	; generic assign 
	ld [Ir_X], a
	ld a, $20
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Meteor_Kijelzo_stringassignstr14107
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Meteor_KN], a
Meteor_Kijelzo_edblock14101:
	; generic assign 
	ld a,[Meteor_Mp]
	ld [localVariable_HUD_Num2_ertek], a
	; generic assign 
	ld a,[Meteor_KN]
	ld [localVariable_HUD_Num2_x], a
	ld a, $20
	ld [localVariable_HUD_Num2_sor], a
	call HUD_Num2
	ret
end_procedure_Meteor_Kijelzo:
	; ***********  Defining procedure : Meteor_Indit
	;    Procedure type : User-defined procedure
localVariable_Meteor_Indit_varPrefixed_r:	db	0
Meteor_Indit_block14108:
Meteor_Indit:
	; a meteor közeledtének JELZÉSE 
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
	; 0. fázis (szikla1)  RANDOM belépő X 
	; generic assign 
	call Random_RandomByte
	ld [localVariable_Meteor_Indit_varPrefixed_r], a
	; 'a:=a + expression'  optimization 
	; Swapping nodes
	; Generic mul
	ld a,$3a
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
	ld a,$3a
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
	ld a,$2
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
	; z-sorrend induláskor is: Keret le -> meteor mentés+rajz -> Keret fel (különben a meteor háttere a Keret darabját menti el, pl. ha a Keret az 1. sorban áll) 
	call Keret2_Le
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
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
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_UpdateLastPos
	call Keret2_Kirak
	ld a, $1
	ld [Meteor_Aktiv], a
	ld a, $0
	ld [Meteor_UtemFrame], a
	ret
end_procedure_Meteor_Indit:
	; Meteor AKTÍV állapotban EZ fut a Keret_Frissit HELYETT. A villogás ellen: (1) a Keretet CSAK akkor töröljük/rajzoljuk újra, ha mozgott / pumpa van alatta / vírus-esemény volt a 3x3-ában / a meteor átfedi; (2) a raszter-megszakítást a meteor (és ha kell, a Keret) ALJA alá tesszük, hogy a törlés+rajz a sugár mögött történjen 
	; ***********  Defining procedure : Meteor_Keret_Frissit
	;    Procedure type : User-defined procedure
localVariable_Meteor_Keret_Frissit_mozgott:	db	0
localVariable_Meteor_Keret_Frissit_pumpavan:	db	0
localVariable_Meteor_Keret_Frissit_kx:	db	0
localVariable_Meteor_Keret_Frissit_ky:	db	0
localVariable_Meteor_Keret_Frissit_mx:	db	0
localVariable_Meteor_Keret_Frissit_my:	db	0
localVariable_Meteor_Keret_Frissit_ov:	db	0
localVariable_Meteor_Keret_Frissit_vir:	db	0
localVariable_Meteor_Keret_Frissit_vv:	db	0
localVariable_Meteor_Keret_Frissit_ly:	db	0
localVariable_Meteor_Keret_Frissit_kb:	db	0
localVariable_Meteor_Keret_Frissit_ov2:	db	0
localVariable_Meteor_Keret_Frissit_vv2:	db	0
localVariable_Meteor_Keret_Frissit_k2x:	db	0
localVariable_Meteor_Keret_Frissit_k2y:	db	0
Meteor_Keret_Frissit_block14111:
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
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_X_Pos]
	ld b,a
	ld a,[Keret_X_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock14116
Meteor_Keret_Frissit_ctb14114: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
Meteor_Keret_Frissit_edblock14116:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock14122
Meteor_Keret_Frissit_ctb14120: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
Meteor_Keret_Frissit_edblock14122:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_pumpavan], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret_Pumpa_Valt]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14128
Meteor_Keret_Frissit_ctb14126: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_pumpavan], a
Meteor_Keret_Frissit_edblock14128:
	; csak ha a Keret alatti/melletti pumpa ebben a képkockában új fázist kap 
	ld a, $0
	ld [Keret_Pumpa_Valt], a
	; generic assign 
	ld a,[Keret_Sereles]
	ld [localVariable_Meteor_Keret_Frissit_vir], a
	; vírus-rajz volt a Keret 3x3-ában (a Keret_Erint jelzi) 
	ld a, $0
	ld [Keret_Sereles], a
	; kell-e a Keretet újra rajzolni? 
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
	ld [localVariable_Meteor_Keret_Frissit_kx], a
	; a Keret bal széle (byte) 
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
	ld [localVariable_Meteor_Keret_Frissit_ky], a
	; a Keret teteje (sor) 
	; generic assign 
	ld de,$f
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [localVariable_Meteor_Keret_Frissit_mx], a
	; generic assign 
	ld de,$10
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	ld [localVariable_Meteor_Keret_Frissit_my], a
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_ov], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_kx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_mx]
	add  a, $2
	cp b
	jr c, Meteor_Keret_Frissit_edblock14136
Meteor_Keret_Frissit_localsuccess14145: ;keep:
	; ; logical AND, second requirement
	; Swapped comparison expressions
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_kx]
	add  a, $3
	cp b
	jr c, Meteor_Keret_Frissit_edblock14136
Meteor_Keret_Frissit_ctb14134: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ky]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	add  a, $16
	cp b
	jr c, Meteor_Keret_Frissit_edblock14150
Meteor_Keret_Frissit_localsuccess14152: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_ky]
	add  a, $11
	cp b
	jr c, Meteor_Keret_Frissit_edblock14150
Meteor_Keret_Frissit_ctb14148: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock14150:
Meteor_Keret_Frissit_edblock14136:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mozgott]
	or a
	jr z, Meteor_Keret_Frissit_edblock14157
Meteor_Keret_Frissit_ctb14155: ;Main true block ;keep :
	; a meteor (a mozgásával együtt) átfedi a Keretet 
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock14157:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_pumpavan]
	or a
	jr z, Meteor_Keret_Frissit_edblock14163
Meteor_Keret_Frissit_ctb14161: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock14163:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vir]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14169
Meteor_Keret_Frissit_ctb14167: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock14169:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_vv], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mozgott]
	or a
	jr z, Meteor_Keret_Frissit_edblock14175
Meteor_Keret_Frissit_ctb14173: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv], a
Meteor_Keret_Frissit_edblock14175:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vir]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14181
Meteor_Keret_Frissit_ctb14179: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv], a
Meteor_Keret_Frissit_edblock14181:
	; 2. Keret (a Keret fölött): újrarajzolandó, ha a Keret is, ha a meteor átfedi, ha mozgott / pumpa / vírus 
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[Keret2_X_Pos]
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
	ld [localVariable_Meteor_Keret_Frissit_k2x], a
	; generic assign 
	ld a,$1c
	push af
	; Swapping nodes
	; Generic mul
	ld a,[Keret2_Y_Pos]
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
	ld [localVariable_Meteor_Keret_Frissit_k2y], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_k2x]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_mx]
	add  a, $2
	cp b
	jr c, Meteor_Keret_Frissit_edblock14189
Meteor_Keret_Frissit_localsuccess14198: ;keep:
	; ; logical AND, second requirement
	; Swapped comparison expressions
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_k2x]
	add  a, $3
	cp b
	jr c, Meteor_Keret_Frissit_edblock14189
Meteor_Keret_Frissit_ctb14187: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_k2y]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	add  a, $16
	cp b
	jr c, Meteor_Keret_Frissit_edblock14203
Meteor_Keret_Frissit_localsuccess14205: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_k2y]
	add  a, $11
	cp b
	jr c, Meteor_Keret_Frissit_edblock14203
Meteor_Keret_Frissit_ctb14201: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock14203:
Meteor_Keret_Frissit_edblock14189:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_X_Pos]
	ld b,a
	ld a,[Keret2_X_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock14210
Meteor_Keret_Frissit_ctb14208: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock14210:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret2_Y_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock14216
Meteor_Keret_Frissit_ctb14214: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock14216:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Sereles]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14222
Meteor_Keret_Frissit_ctb14220: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock14222:
	ld a, $0
	ld [Keret2_Sereles], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14228
Meteor_Keret_Frissit_ctb14226: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock14228:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Pumpa_Valt]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14234
Meteor_Keret_Frissit_ctb14232: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock14234:
	ld a, $0
	ld [Keret2_Pumpa_Valt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14240
Meteor_Keret_Frissit_ctb14238: ;Main true block ;keep :
	call Keret2_Le
Meteor_Keret_Frissit_edblock14240:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14246
Meteor_Keret_Frissit_ctb14244: ;Main true block ;keep :
	; 1) legfelső réteg le (csak ha kell) 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Meteor_Keret_Frissit_edblock14246:
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; 1) középső réteg le (régi pozíción) 
	call PumpakKirak
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14252
Meteor_Keret_Frissit_ctb14250: ;Main true block ;keep :
	; 2) alsó animált réteg 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Meteor_Keret_Frissit_edblock14252:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14258
Meteor_Keret_Frissit_ctb14256: ;Main true block ;keep :
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Meteor_Keret_Frissit_edblock14258:
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
	jp nc,Meteor_Keret_Frissit_eblock14263
Meteor_Keret_Frissit_ctb14262: ;Main true block ;keep :
	; 3) meteor lépés: EGYENES zuhanás, MINDEN képkockán METEOR_LE_PX px LE; METEOR_ANIM_UTEM képkockánként a következő fázis (0..3 körbe) 
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
	jr c, Meteor_Keret_Frissit_edblock14289
Meteor_Keret_Frissit_ctb14287: ;Main true block ;keep :
	ld a, $0
	ld [Meteor_UtemFrame], a
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Faz]
	add  a,$1
	ld [Meteor_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $4
	jr c, Meteor_Keret_Frissit_edblock14301
Meteor_Keret_Frissit_ctb14299: ;Main true block ;keep :
	ld a, $0
	ld [Meteor_Faz], a
Meteor_Keret_Frissit_edblock14301:
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
Meteor_Keret_Frissit_edblock14289:
	jp Meteor_Keret_Frissit_edblock14264
Meteor_Keret_Frissit_eblock14263:
	ld a, $0
	ld [Meteor_Aktiv], a
	ld a, $3
	ld [GE_Nr], a
	ld a, $41
	ld [GE_Color], a
	call GE_SetPalette
	; meteor vége -> vissza világoskék 
	call Meteor_Becsapodas
	call Fal_Mind_Kirak
Meteor_Keret_Frissit_edblock14264:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14308
Meteor_Keret_Frissit_ctb14306: ;Main true block ;keep :
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
Meteor_Keret_Frissit_edblock14308:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14314
Meteor_Keret_Frissit_ctb14312: ;Main true block ;keep :
	; 4) Keret LEGFELÜL (csak ha kellett törölni; a meteor rárajzolhatott) 
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
Meteor_Keret_Frissit_edblock14314:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14320
Meteor_Keret_Frissit_ctb14318: ;Main true block ;keep :
	call Keret2_Kirak
Meteor_Keret_Frissit_edblock14320:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jp nz,Meteor_Keret_Frissit_eblock14325
Meteor_Keret_Frissit_ctb14324: ;Main true block ;keep :
	; 2. Keret a legfelső  raszter-megszakítás a következő képkockára: a meteor (és a Keret, ha újrarajzoljuk) ALJA alá -> a törlés+rajz a sugár mögött történik, nincs villogás 
	; generic assign 
	ld de,$10
	ld hl,Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : BYTE
	ld a,[hl]
	push af
	ld a,$16
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Meteor_Keret_Frissit_ly], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14375
Meteor_Keret_Frissit_ctb14373: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_ky]
	add  a, $e
	ld [localVariable_Meteor_Keret_Frissit_kb], a
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	ld b,a
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	cp b
	jr c, Meteor_Keret_Frissit_edblock14387
	jr z, Meteor_Keret_Frissit_edblock14387
Meteor_Keret_Frissit_ctb14385: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock14387:
Meteor_Keret_Frissit_edblock14375:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock14393
Meteor_Keret_Frissit_ctb14391: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_k2y]
	add  a, $e
	ld [localVariable_Meteor_Keret_Frissit_kb], a
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	ld b,a
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	cp b
	jr c, Meteor_Keret_Frissit_edblock14405
	jr z, Meteor_Keret_Frissit_edblock14405
Meteor_Keret_Frissit_ctb14403: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock14405:
Meteor_Keret_Frissit_edblock14393:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	cp $ef
	jr c, Meteor_Keret_Frissit_edblock14411
	jr z, Meteor_Keret_Frissit_edblock14411
Meteor_Keret_Frissit_ctb14409: ;Main true block ;keep :
	ld a, $ef
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock14411:
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	jp Meteor_Keret_Frissit_edblock14326
Meteor_Keret_Frissit_eblock14325:
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
Meteor_Keret_Frissit_edblock14326:
	ret
end_procedure_Meteor_Keret_Frissit:
	; A Palya sorszámú pálya betöltése: árak, kezdőpénz, cél, tiltások, térkép; a játékállapot nullázása (nem rajzol) 
	; ***********  Defining procedure : Palya_Betolt
	;    Procedure type : User-defined procedure
Palya_Betolt:
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_PumpaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Pumpa_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_FalAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Tegla_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_BombaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Bomba_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Penz
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Drill_Cash],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Termel
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Pumpa_termel],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Cel
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Cel_Akt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,Palya_Betolt_edblock14419
Palya_Betolt_ctb14417: ;Main true block ;keep :
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_CelCoop
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Cel_Akt], a
Palya_Betolt_edblock14419:
	; co-op: a közös cél (a két játékos pumpáinak összege) 
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_MeteorTor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Tor_Engedve], a
	; a meteor a sziklát is rombolja 
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_MeteorVir
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Vir_Engedve], a
	; a meteor vírust hoz 
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Virus
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Virus_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Fal
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Fal_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Bomba_Engedve], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jp nz,Palya_Betolt_edblock14425
Palya_Betolt_ctb14423: ;Main true block ;keep :
	; két játékos pálya: a saját táblájából 
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_PumpaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Pumpa_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_FalAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Tegla_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_BombaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Bomba_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Penz
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Drill_Cash],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Termel
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Pumpa_termel],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Cel
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Cel_Akt], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_MeteorTor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Tor_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_MeteorVir
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Meteor_Vir_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Virus
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Virus_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Fal
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Fal_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Bomba_Engedve], a
Palya_Betolt_edblock14425:
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	; a meteor a raszter-IT-t áthelyezhette 
	call MapReset
	ld a, $0
	ld [Pumpa_db], a
	ld [Pumpa_db2], a
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Drill_Cash2],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Palya_Betolt_edblock14431
Palya_Betolt_ctb14429: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [Drill_Cash2],hl
Palya_Betolt_edblock14431:
	; két játékos (versus és co-op): a 2. játékos is a pálya kezdőpénzével indul, saját pénzzel 
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Termel_Frame],hl
	; generic assign 
	; Loading pointer
	ld [PumpaScanPos],hl
	ld a, $0
	ld [Pumpa_Uj_Faz], a
	; generic assign 
	; Loading pointer
	ld [Enemy_Sec_Frame],hl
	ld [Enemy_Kolonia_db], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Virus_Engedve]
	or a
	jr nz,Palya_Betolt_edblock14437
Palya_Betolt_ctb14435: ;Main true block ;keep :
	ld a, $a
	ld [Enemy_Kolonia_db], a
Palya_Betolt_edblock14437:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Vir_Engedve]
	cp $1
	jr nz,Palya_Betolt_edblock14443
Palya_Betolt_ctb14441: ;Main true block ;keep :
	ld a, $1
	ld [Virus_Engedve], a
Palya_Betolt_edblock14443:
	ld a, $0
	ld [Enemy_Terjedhet], a
	ld [Enemy_Frame], a
	ld [Meteor_Aktiv], a
	call Meteor_Uj_Ido
	; az első meteor: véletlenül 10..30 mp múlva 
	ld a, $0
	ld [Meteor_Figy], a
	; nincs folyamatban lévő meteor-figyelmeztetés 
	ld [Meteor_Lat], a
	ld a, $1
	ld [Meteor_Kij_Kell], a
	; meteoros pályán az első képkockán megjelenik a "METEOR:nn" 
	ld a, $3
	ld [GE_Nr], a
	ld a, $41
	ld [GE_Color], a
	call GE_SetPalette
	; ha éppen zuhant meteor: a sötétkék jelzés vissza 
	ld a, $1
	ld [Keret_X_Pos], a
	; 1. Keret: a középső sor ELSŐ mezője 
	ld a, $9
	ld [Keret_Y_Pos], a
	ld a, $1e
	ld [Keret2_X_Pos], a
	; 2. Keret: a középső sor UTOLSÓ mezője 
	ld a, $9
	ld [Keret2_Y_Pos], a
	ld a, $8
	ld [P2_Kep], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,Palya_Betolt_edblock14449
Palya_Betolt_ctb14447: ;Main true block ;keep :
	; a 2. játékos pumpa-képe: versus saját, co-op az 1. játékosé 
	ld a, $0
	ld [P2_Kep], a
Palya_Betolt_edblock14449:
	ld a, $0
	ld [Eszkoz1], a
	; versus: mindkét játékos pumpával indul 
	ld [Eszkoz2], a
	ret
end_procedure_Palya_Betolt:
	; Az aktuális pálya újrakezdése (R gomb): betöltés + teljes újrarajzolás 
	; ***********  Defining procedure : Palya_Ujra
	;    Procedure type : User-defined procedure
Palya_Ujra:
	call Palya_Betolt
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	call MapToScreen
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret2_Kirak
	; a 2. Keret fölé 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
	ret
end_procedure_Palya_Ujra:
	; Várakozás egy SPACE lenyomásra (előbb a nyomva tartott SPACE felengedésére)  n képkockányi várakozás (közben pörög a véletlenszám-generátor) 
	; ***********  Defining procedure : Varakozas
	;    Procedure type : User-defined procedure
localVariable_Varakozas_n:	db	0
Varakozas_block14453:
Varakozas:
Varakozas_while14454:
Varakozas_loopstart14458:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Varakozas_n]
	or a
	jr c, Varakozas_edblock14457
	jr z, Varakozas_edblock14457
Varakozas_ctb14455: ;Main true block ;keep :
	call GE_WaitForSync
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Varakozas_n]
	sub $1
	ld [localVariable_Varakozas_n], a
	jr Varakozas_while14454
Varakozas_edblock14457:
Varakozas_loopend14459:
	ret
end_procedure_Varakozas:
	; ***********  Defining procedure : Space_Var
	;    Procedure type : User-defined procedure
Space_Var:
	ld a, $1
	ld [Start_Wait], a
Space_Var_while14463:
Space_Var_loopstart14467:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Space_Var_edblock14466
Space_Var_ctb14464: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	or a
	jr nz,Space_Var_edblock14480
Space_Var_ctb14478: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Space_Var_edblock14480:
	call GE_WaitForSync
	jr Space_Var_while14463
Space_Var_edblock14466:
Space_Var_loopend14468:
Space_Var_while14483:
Space_Var_loopstart14487:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Space_Var_edblock14486
Space_Var_ctb14484: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	cp $1
	jr nz,Space_Var_edblock14500
Space_Var_ctb14498: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Space_Var_edblock14500:
	call GE_WaitForSync
	jr Space_Var_while14483
Space_Var_edblock14486:
Space_Var_loopend14488:
	ret
end_procedure_Space_Var:
	; Pálya teljesítve: felirat a képernyő közepére, majd várakozás egy SPACE lenyomásra (előbb a nyomva tartott SPACE felengedésére) 
	; ***********  Defining procedure : Palya_Teljesitve
	;    Procedure type : User-defined procedure
localVariable_Palya_Teljesitve_van:	db	0
localVariable_Palya_Teljesitve_varPrefixed_i:	db	0
localVariable_Palya_Teljesitve_k:	db	0
localVariable_Palya_Teljesitve_y:	db	0
Palya_Teljesitve_block14503:
Palya_Teljesitve:
	call Digi_Le
	; van-e következő pálya: ha igen, a kódja a "NEXT CODE: " után (Kov_Str 11..15) 
	ld a, $0
	ld [localVariable_Palya_Teljesitve_van], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Palya]
	add  a, $1
	ld [localVariable_Palya_Teljesitve_k], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jp nz,Palya_Teljesitve_edblock14507
Palya_Teljesitve_ctb14505: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_k]
	cp $b
	jp nc,Palya_Teljesitve_edblock14577
Palya_Teljesitve_ctb14575: ;Main true block ;keep :
	; versusban nincs pályakód (csak egy játékos és co-op) 
	ld a, $1
	ld [localVariable_Palya_Teljesitve_van], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Palya_Teljesitve_k]
	ld e,a
	ld d,0
	ld a,$5
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Palya_Teljesitve_k], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,Palya_Teljesitve_eblock14612
Palya_Teljesitve_ctb14611: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
Palya_Teljesitve_forloop14627:
	; Storing to array  
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	ld b,a
	ld a,[localVariable_Palya_Teljesitve_k]
	add  a, b
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_KodCoop
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	; RHS is pure numeric optimisation
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add  a, $b
	ld e,a
	ld d,0
	ld hl,Kov_Str
	add hl,de
	pop af
	ld [hl],a 
Palya_Teljesitve_loopstart14628:
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add a,1
	ld [localVariable_Palya_Teljesitve_varPrefixed_i],a
	cp $5
	jr nz,Palya_Teljesitve_forloop14627
Palya_Teljesitve_loopend14629:
	jr Palya_Teljesitve_edblock14613
Palya_Teljesitve_eblock14612:
	ld a, $0
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
Palya_Teljesitve_forloop14633:
	; co-op: a co-op kód 
	; Storing to array  
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	ld b,a
	ld a,[localVariable_Palya_Teljesitve_k]
	add  a, b
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Kod
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	; RHS is pure numeric optimisation
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add  a, $b
	ld e,a
	ld d,0
	ld hl,Kov_Str
	add hl,de
	pop af
	ld [hl],a 
Palya_Teljesitve_loopstart14634:
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add a,1
	ld [localVariable_Palya_Teljesitve_varPrefixed_i],a
	cp $5
	jr nz,Palya_Teljesitve_forloop14633
Palya_Teljesitve_loopend14635:
Palya_Teljesitve_edblock14613:
Palya_Teljesitve_edblock14577:
Palya_Teljesitve_edblock14507:
	ld a, $7
	ld [localVariable_Doboz_x], a
	ld a, $69
	ld [localVariable_Doboz_y], a
	ld a, $32
	ld [localVariable_Doboz_w], a
	ld a, $2a
	ld [localVariable_Doboz_varPrefixed_h], a
	call Doboz
	; 2 sorral magasabb (105..146), fekete kerettel 
	ld a, $6d
	ld [localVariable_Palya_Teljesitve_y], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jp nz,Palya_Teljesitve_eblock14640
Palya_Teljesitve_ctb14639: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,Palya_Teljesitve_eblock14677
Palya_Teljesitve_ctb14676: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Gyoztes]
	cp $2
	jr nz,Palya_Teljesitve_eblock14692
Palya_Teljesitve_ctb14691: ;Main true block ;keep :
	; két játékos: ki hány pumpát rakott 
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14698
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	jr Palya_Teljesitve_edblock14693
Palya_Teljesitve_eblock14692:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14701
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock14693:
	jr Palya_Teljesitve_edblock14678
Palya_Teljesitve_eblock14677:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14704
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock14678:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Palya_Teljesitve_y]
	add  a,$a
	ld [localVariable_Palya_Teljesitve_y], a
	ld a, $12
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14706
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Pumpa_db]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; 'a:=a + const'  optimization 
	ld a,[Ir_X]
	add  a,$4
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14708
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Pumpa_db2]
	ld [localVariable_HUD_Num3_ertek], a
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	jp Palya_Teljesitve_edblock14641
Palya_Teljesitve_eblock14640:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	or a
	jr nz,Palya_Teljesitve_edblock14713
Palya_Teljesitve_ctb14711: ;Main true block ;keep :
	ld a, $72
	ld [localVariable_Palya_Teljesitve_y], a
Palya_Teljesitve_edblock14713:
	; két sor: függőlegesen középen 
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14717
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock14641:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Palya_Teljesitve_y]
	add  a,$a
	ld [localVariable_Palya_Teljesitve_y], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	cp $1
	jr nz,Palya_Teljesitve_edblock14721
Palya_Teljesitve_ctb14719: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	ld hl,Kov_Str
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	; a következő pálya kódja: ezzel később innen folytatható (LEVEL CODE) 
	ld hl,Kov_Str
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld b,a
	ld a,$40
	sub  b
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
	ld a, $3
	ld [Szin_Mod], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	ld [localVariable_Szinez_x], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [localVariable_Szinez_y], a
	; generic assign 
	ld a,[Ir_Hossz]
	ld [localVariable_Szinez_w], a
	ld a, $7
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	; a NEXT CODE sor zöld 
	ld a, $0
	ld [Szin_Mod], a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Palya_Teljesitve_y]
	add  a,$a
	ld [localVariable_Palya_Teljesitve_y], a
Palya_Teljesitve_edblock14721:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	or a
	jr nz,Palya_Teljesitve_edblock14727
Palya_Teljesitve_ctb14725: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	or a
	jr nz,Palya_Teljesitve_edblock14739
Palya_Teljesitve_ctb14737: ;Main true block ;keep :
	ld a, $82
	ld [localVariable_Palya_Teljesitve_y], a
Palya_Teljesitve_edblock14739:
Palya_Teljesitve_edblock14727:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr14743
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $4b
	ld [localVariable_Varakozas_n], a
	call Varakozas
	; kb. 1,5 mp: a pumpa-lerakáshoz nyomva tartott tűz/SPACE ne ugorja át véletlenül (nincs színváltás) 
	call Space_Var
	ret
end_procedure_Palya_Teljesitve:
	; GAME OVER: felirat a képernyő közepére, SPACE/tűz után vissza a főmenübe (Jatek_Fut:=0, a főprogram kezeli) 
	; ***********  Defining procedure : Game_Over
	;    Procedure type : User-defined procedure
Game_Over:
	call Digi_Le
	ld a, $7
	ld [GE_X], a
	ld a, $6a
	ld [GE_Y], a
	ld a, $32
	ld [GE_Width], a
	ld a, $28
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $72
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Game_Over_stringassignstr14746
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $82
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Game_Over_stringassignstr14748
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $7
	ld [localVariable_Szinez_x], a
	ld a, $6a
	ld [localVariable_Szinez_y], a
	ld a, $32
	ld [localVariable_Szinez_w], a
	ld a, $28
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	; a feliratok szürkére, sötét színrend (mint a pause) 
	call Sotet_Szinek
	call Space_Var
	call Normal_Szinek
	ld a, $0
	ld [Jatek_Fut], a
	ret
end_procedure_Game_Over:
	; Pálya elbukva (nincs pumpa és nincs pénz egy újra, vagy R): egy élet levonva (versusban nem), a pálya újrakezdődik; 0 életnél GAME OVER 
	; ***********  Defining procedure : Palya_Bukas
	;    Procedure type : User-defined procedure
Palya_Bukas:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,Palya_Bukas_edblock14753
Palya_Bukas_ctb14751: ;Main true block ;keep :
	; GAME OVER után ugyanabban a körben ne vonjon le újra 
	call Digi_Le
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,Palya_Bukas_edblock14773
Palya_Bukas_ctb14771: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Eletek]
	sub $1
	ld [Eletek], a
Palya_Bukas_edblock14773:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Eletek]
	or a
	jr nz,Palya_Bukas_eblock14778
Palya_Bukas_ctb14777: ;Main true block ;keep :
	; versusban nincs élet: csak újrakezdés 
	call Game_Over
	jr Palya_Bukas_edblock14779
Palya_Bukas_eblock14778:
	ld a, $7
	ld [GE_X], a
	ld a, $6a
	ld [GE_Y], a
	ld a, $32
	ld [GE_Width], a
	ld a, $28
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $72
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Bukas_stringassignstr14785
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $82
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Bukas_stringassignstr14787
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $7
	ld [localVariable_Szinez_x], a
	ld a, $6a
	ld [localVariable_Szinez_y], a
	ld a, $32
	ld [localVariable_Szinez_w], a
	ld a, $28
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	; a feliratok szürkére, sötét színrend (mint a pause) 
	call Sotet_Szinek
	call Space_Var
	call Normal_Szinek
	call Palya_Ujra
Palya_Bukas_edblock14779:
Palya_Bukas_edblock14753:
	ret
end_procedure_Palya_Bukas:
	; Következő pálya (az utolsó után egyelőre az elsőre ugrik; a győzelem-felirat később): betöltés + teljes újrarajzolás 
	; ***********  Defining procedure : Palya_Kovetkezo
	;    Procedure type : User-defined procedure
Palya_Kovetkezo:
	call Palya_Teljesitve
	; 'a:=a + const'  optimization 
	ld a,[Palya]
	add  a,$1
	ld [Palya], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,Palya_Kovetkezo_eblock14791
Palya_Kovetkezo_ctb14790: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[Palya]
	cp $6
	jr c, Palya_Kovetkezo_edblock14811
Palya_Kovetkezo_ctb14809: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
Palya_Kovetkezo_edblock14811:
	jr Palya_Kovetkezo_edblock14792
Palya_Kovetkezo_eblock14791:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[Palya]
	cp $b
	jr c, Palya_Kovetkezo_edblock14818
Palya_Kovetkezo_ctb14816: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
Palya_Kovetkezo_edblock14818:
Palya_Kovetkezo_edblock14792:
	call Palya_Ujra
	ret
end_procedure_Palya_Kovetkezo:
block1:
main_block_begin_:
	; FŐPROGRAM  Egyszeri indítási beállítások 
	call ProgramInit
MainProgram_while14821:
MainProgram_loopstart14825:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jp MainProgram_ctb14822
MainProgram_ctb14822: ;Main true block ;keep :
	; külső ciklus: főmenü -> játék -> (GAME OVER) -> főmenü  Főmenü 
	call Start_Kepernyo
	; Új játék: életek, idő, pálya alaphelyzetbe 
	ld a, $1
	ld [Jatek_Fut], a
	ld a, $5
	ld [Eletek], a
	ld a, $0
	ld [R_Volt], a
	; Térkép feltöltése és kirajzolása, a Keret kezdő kirajzolása 
	ld [Palya], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MainProgram_edblock16464
MainProgram_ctb16462: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
MainProgram_edblock16464:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, MainProgram_edblock16470
MainProgram_ctb16468: ;Main true block ;keep :
	; két játékos: az első 2P pálya (a játékban LVL 01) 
	; generic assign 
	ld a,[Kod_Palya]
	ld [Palya], a
MainProgram_edblock16470:
	; LEVEL CODE: a kódos pálya 
	ld a, $ff
	ld [Kod_Palya], a
	call Palya_Betolt
	call MapToScreen
	; Kezdő kirajzolás FELTÉTEL NÉLKÜL 
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret2_Kirak
	; a 2. Keret fölé 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
MainProgram_while16473:
MainProgram_loopstart16477:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jp nz,MainProgram_edblock16476
MainProgram_ctb16474: ;Main true block ;keep :
	; ENEMY_Szekcio: nincs külön kezdő-késleltetés (a C64 sem csinál ilyet)  1. Bemenetkezelés: billentyűzet/joystick lekérdezése, és ez alapján a Keret rács-pozíciójának módosítása 
	call GE_GetKeyboard
	call GE_GetJoysticks
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17290
MainProgram_ctb17288: ;Main true block ;keep :
	; P = PAUSE (minden pályán): minden megáll a következő P-ig 
	call Pause_Kezel
	call GE_GetKeyboard
	call GE_GetJoysticks
MainProgram_edblock17290:
	ld a, $0
	ld [v_Kilep], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17296
MainProgram_ctb17294: ;Main true block ;keep :
	ld a, $1
	ld [v_Kilep], a
MainProgram_edblock17296:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17302
MainProgram_ctb17300: ;Main true block ;keep :
	ld a, $1
	ld [v_Kilep], a
MainProgram_edblock17302:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[v_Kilep]
	cp $1
	jr nz,MainProgram_edblock17308
MainProgram_ctb17306: ;Main true block ;keep :
	; ESC vagy Q = kilépés a főmenübe (megerősítéssel), minden módban 
	call Exit_Kerdes
	call GE_GetKeyboard
	call GE_GetJoysticks
MainProgram_edblock17308:
	; A véletlenszám-generátort minden képkockán pörgetjük, hogy a későbbi vírus-terjedés iránya se legyen 
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Keret-mozgás LASSÍTÁSA: csak minden Keret_Mozog_Utem 
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
	jp c, MainProgram_edblock17314
MainProgram_ctb17312: ;Main true block ;keep :
	ld a, $0
	ld [Keret_Mozog_Frame], a
	; 1. Keret: 1. joystick (vagy kurzorbillentyűk) 
	ld [Joy_Bal], a
	ld [Joy_Jobb], a
	ld [Joy_Fel], a
	ld [Joy_Le], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock17406
MainProgram_ctb17404: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Bal], a
MainProgram_edblock17406:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock17412
MainProgram_ctb17410: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Jobb], a
MainProgram_edblock17412:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock17418
MainProgram_ctb17416: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Fel], a
MainProgram_edblock17418:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock17424
MainProgram_ctb17422: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Le], a
MainProgram_edblock17424:
	ld a, $1
	ld [localVariable_Jatekos_Mozog_j], a
	call Jatekos_Mozog
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jp nz,MainProgram_edblock17430
MainProgram_ctb17428: ;Main true block ;keep :
	; 2. Keret: 2. joystick (vagy WASD) 
	ld a, $0
	ld [Joy_Bal], a
	ld [Joy_Jobb], a
	ld [Joy_Fel], a
	ld [Joy_Le], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed17466
	jr MainProgram_ctb17462
MainProgram_localfailed17466: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4004
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17464
MainProgram_ctb17462: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Bal], a
MainProgram_edblock17464:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed17473
	jr MainProgram_ctb17469
MainProgram_localfailed17473: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$204
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17471
MainProgram_ctb17469: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Jobb], a
MainProgram_edblock17471:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed17480
	jr MainProgram_ctb17476
MainProgram_localfailed17480: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$402
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17478
MainProgram_ctb17476: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Fel], a
MainProgram_edblock17478:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed17487
	jr MainProgram_ctb17483
MainProgram_localfailed17487: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$404
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17485
MainProgram_ctb17483: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Le], a
MainProgram_edblock17485:
	ld a, $2
	ld [localVariable_Jatekos_Mozog_j], a
	call Jatekos_Mozog
MainProgram_edblock17430:
MainProgram_edblock17314:
	; TŰZ: 1. játékos = SPACE / 1. joystick, 2. játékos = E (billentyűzetes teszt) / 2. joystick 
	; generic assign 
	call Tuz
	ld [Tuz1_Most], a
	ld a, $0
	ld [Tuz2_Most], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,MainProgram_edblock17492
MainProgram_ctb17490: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $8
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock17510
MainProgram_ctb17508: ;Main true block ;keep :
	ld a, $1
	ld [Tuz2_Most], a
MainProgram_edblock17510:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$202
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock17516
MainProgram_ctb17514: ;Main true block ;keep :
	ld a, $1
	ld [Tuz2_Most], a
MainProgram_edblock17516:
MainProgram_edblock17492:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz1_Most]
	cp $1
	jr nz,MainProgram_edblock17522
MainProgram_ctb17520: ;Main true block ;keep :
	; minden módban: a 0. sorban (ikon-menü) a tűz eszközt választ, a pályán a kiválasztott eszközt rakja le 
	ld a, $1
	ld [localVariable_Jatekos_Tuz_j], a
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Jatekos_Tuz_px], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Jatekos_Tuz_py], a
	; generic assign 
	ld a,[Tuz1_Volt]
	ld [localVariable_Jatekos_Tuz_volt], a
	call Jatekos_Tuz
MainProgram_edblock17522:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz2_Most]
	cp $1
	jr nz,MainProgram_edblock17528
MainProgram_ctb17526: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Jatekos_Tuz_j], a
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Jatekos_Tuz_px], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Jatekos_Tuz_py], a
	; generic assign 
	ld a,[Tuz2_Volt]
	ld [localVariable_Jatekos_Tuz_volt], a
	call Jatekos_Tuz
MainProgram_edblock17528:
	; generic assign 
	ld a,[Tuz1_Most]
	ld [Tuz1_Volt], a
	; generic assign 
	ld a,[Tuz2_Most]
	ld [Tuz2_Volt], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$8002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_eblock17533
MainProgram_ctb17532: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[R_Volt]
	or a
	jr nz,MainProgram_edblock17547
MainProgram_ctb17545: ;Main true block ;keep :
	; R = újrakezdés, egy életbe kerül (egy lenyomás = egy élet) 
	call Palya_Bukas
MainProgram_edblock17547:
	ld a, $1
	ld [R_Volt], a
	jr MainProgram_edblock17534
MainProgram_eblock17533:
	ld a, $0
	ld [R_Volt], a
MainProgram_edblock17534:
	; 1b. Pumpa-animáció SZÁMOLÁSI fázisa 
	call PumpakSzamol
	; 2. Várakozás a képfrissítésre (raszter-megszakítás), hogy a rajzolás ne okozzon szakadást/villogást a 
	call Frame_Sync
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,MainProgram_eblock17553
MainProgram_ctb17552: ;Main true block ;keep :
	; 3. Rajzolási fázis. Ha a meteor ÉPPEN zuhan, a Meteor_Keret_Frissit fut a Keret_Frissit HELYETT 
	call Meteor_Keret_Frissit
	jr MainProgram_edblock17554
MainProgram_eblock17553:
	call Keret_Frissit
MainProgram_edblock17554:
	; 4. Pumpák termelése: Termel_Utem képkockánként egyszer 
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
	jr c, MainProgram_edblock17562
MainProgram_ctb17560: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Termel_Frame],hl
	call Pumpak_Termelnek
MainProgram_edblock17562:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Virus_Engedve]
	cp $1
	jp nz,MainProgram_edblock17568
MainProgram_ctb17566: ;Main true block ;keep :
	; 5-6. VÍRUS: csak ha az aktuális pályán engedélyezett  5. KOLÓNIA-VETÉS - C64: aqualiquex.ras "if raster::newSecond" 
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
	jr c, MainProgram_edblock17632
MainProgram_ctb17630: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Enemy_Sec_Frame],hl
	; 50% (C64: mod(rnd,2)=0). Rnd_Porgeto = ebben a frame-ben sorsolt RandomByte (lásd fentebb) 
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
	jr nz,MainProgram_edblock17662
MainProgram_ctb17660: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Enemy_Kolonia_db]
	cp $a
	jr nc,MainProgram_eblock17675
MainProgram_ctb17674: ;Main true block ;keep :
	call Enemy_Random_Lerak
	; 'a:=a + const'  optimization 
	ld a,[Enemy_Kolonia_db]
	add  a,$1
	ld [Enemy_Kolonia_db], a
	jr MainProgram_edblock17676
MainProgram_eblock17675:
	ld a, $1
	ld [Enemy_Terjedhet], a
MainProgram_edblock17676:
MainProgram_edblock17662:
MainProgram_edblock17632:
	; 6. NÖVEKEDÉS + TERJEDÉS - C64 
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
	jr c, MainProgram_edblock17684
MainProgram_ctb17682: ;Main true block ;keep :
	ld a, $0
	ld [Enemy_Frame], a
	call Enemyk_Mukodnek
MainProgram_edblock17684:
MainProgram_edblock17568:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	or a
	jp nz,MainProgram_edblock17690
MainProgram_localsuccess17768: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Engedve]
	cp $1
	jp nz,MainProgram_edblock17690
MainProgram_ctb17688: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Meteor_Figy]
	or a
	jp c, MainProgram_eblock17772
	jp z, MainProgram_eblock17772
MainProgram_ctb17771: ;Main true block ;keep :
	; 7. METEOR trigger: ha NEM zuhan épp, visszaszámlálás a következő random zuhanásig  figyelmeztetés: a "METEOR !" villog (~2 mp), a végén indul a meteor 
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Figy]
	sub $1
	ld [Meteor_Figy], a
	call Meteor_Felirat
	; a becsapódás után (Meteor_Aktiv = 0) újra a "METEOR:nn" 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Figy]
	or a
	jr nz,MainProgram_edblock17814
MainProgram_ctb17812: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TX]
	sub  $1
	ld [GE_X], a
	ld a, $1f
	ld [GE_Y], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_TW]
	add  a, $2
	ld [GE_Width], a
	ld a, $9
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; a felirat (a fekete dobozzal) le 
	ld a, $0
	ld [Meteor_Lat], a
	call Meteor_Indit
	call Meteor_Uj_Ido
	; a következő: véletlenül 10..30 mp múlva 
	ld a, $1
	ld [Meteor_Kij_Kell], a
MainProgram_edblock17814:
	jp MainProgram_edblock17773
MainProgram_eblock17772:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Kij_Kell]
	cp $1
	jr nz,MainProgram_edblock17821
MainProgram_ctb17819: ;Main true block ;keep :
	; a meteor lezuhant: a kijelző vissza 
	ld a, $1
	ld [localVariable_Meteor_Kijelzo_teljes], a
	call Meteor_Kijelzo
	ld a, $0
	ld [Meteor_Kij_Kell], a
MainProgram_edblock17821:
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Fr]
	add  a,$1
	ld [Meteor_Fr], a
	; csak a szám 
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $32
	jr c, MainProgram_edblock17827
MainProgram_ctb17825: ;Main true block ;keep :
	; másodperc-számláló (50 képkocka) 
	ld a, $0
	ld [Meteor_Fr], a
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Mp]
	sub $1
	ld [Meteor_Mp], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	or a
	jr nz,MainProgram_eblock17840
MainProgram_ctb17839: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_KX]
	sub  $1
	ld [GE_X], a
	ld a, $1f
	ld [GE_Y], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_KW]
	add  a, $2
	ld [GE_Width], a
	ld a, $9
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; a "METEOR:00" le 
	ld a, $64
	ld [Meteor_Figy], a
	; jön a figyelmeztetés 
	; Assigning a string : Ir_Szoveg
	ld hl,MainProgram_stringassignstr17846
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Hossza
	; generic assign 
	ld a,[Ir_Hossz]
	ld [Meteor_TW], a
	; generic assign 
	ld b,a
	ld a,$40
	sub  b
	ld [Meteor_TX], a
	; generic assign 
	ld a,$2
	ld c,a
	; Variable is 16-bit
	ld a,[Meteor_TX]
	ld l,a
	ld h,0
	; Casting from integer to byte
	ld a,l
	call div_16x8
	ld a,l
	ld [Meteor_TX], a
	ld a, $0
	ld [Meteor_Lat], a
	jr MainProgram_edblock17841
MainProgram_eblock17840:
	ld a, $0
	ld [localVariable_Meteor_Kijelzo_teljes], a
	call Meteor_Kijelzo
MainProgram_edblock17841:
MainProgram_edblock17827:
MainProgram_edblock17773:
MainProgram_edblock17690:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,MainProgram_eblock17850
MainProgram_ctb17849: ;Main true block ;keep :
	; 8. CÉL: ha elértük az aktuális pálya célját (a pumpák száma), jön a következő pálya  co-op: a két játékos pumpáinak ÖSSZEGE számít 
	; generic assign 
	; Variable is 16-bit
	ld a,[Pumpa_db]
	ld l,a
	ld h,0
	; Loading pointer
	ld [Pumpa_Ossz],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld a,[Pumpa_db2]
	ld e,a
	ld d,0
	; Variable is 16-bit
	ld hl,[Pumpa_Ossz]
	add  hl,de
	ld [Pumpa_Ossz],hl
	; generic assign 
	; Variable is 16-bit
	ld a,[Cel_Akt]
	ld l,a
	ld h,0
	; Loading pointer
	ld [Cel_Int],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock17912
MainProgram_ctb17910: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Cel_Int]
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_Ossz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MainProgram_edblock17924
MainProgram_ctb17922: ;Main true block ;keep :
	call Palya_Kovetkezo
MainProgram_edblock17924:
MainProgram_edblock17912:
	jr MainProgram_edblock17851
MainProgram_eblock17850:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock17931
MainProgram_ctb17929: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Cel_Akt]
	ld b,a
	ld a,[Pumpa_db]
	cp b
	jr c, MainProgram_edblock17943
MainProgram_ctb17941: ;Main true block ;keep :
	ld a, $1
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock17943:
MainProgram_edblock17931:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock17949
MainProgram_ctb17947: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Cel_Akt]
	ld b,a
	ld a,[Pumpa_db2]
	cp b
	jr c, MainProgram_edblock17961
MainProgram_ctb17959: ;Main true block ;keep :
	; versus: aki előbb eléri a célt (255), nyer 
	ld a, $2
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock17961:
MainProgram_edblock17949:
MainProgram_edblock17851:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr nz,MainProgram_edblock17967
MainProgram_localsuccess17976: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MainProgram_edblock17967
MainProgram_ctb17965: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Pumpa_db2]
	or a
	jr nz,MainProgram_edblock17981
MainProgram_localsuccess17983: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MainProgram_edblock17981
MainProgram_ctb17979: ;Main true block ;keep :
	; nincs pumpa és nincs pénz egyre sem: vége a pályának - versus: ha MINDKÉT játékos így jár 
	call Palya_Bukas
MainProgram_edblock17981:
MainProgram_edblock17967:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MainProgram_edblock17988
MainProgram_ctb17986: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock18046
MainProgram_ctb18044: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Pumpa_db]
	or a
	jr nz,MainProgram_eblock18074
MainProgram_localsuccess18085: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MainProgram_eblock18074
MainProgram_ctb18073: ;Main true block ;keep :
	; versus: aki "elfogyott" (nincs pumpája és pénze sem egyre), veszít - a másik nyer 
	ld a, $2
	ld [Gyoztes], a
	call Palya_Kovetkezo
	jr MainProgram_edblock18075
MainProgram_eblock18074:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Pumpa_db2]
	or a
	jr nz,MainProgram_edblock18091
MainProgram_localsuccess18093: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	; Variable is 16-bit
	ld hl,[Pumpa_price]
	push hl
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MainProgram_edblock18091
MainProgram_ctb18089: ;Main true block ;keep :
	ld a, $1
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock18091:
MainProgram_edblock18075:
MainProgram_edblock18046:
MainProgram_edblock17988:
	jp MainProgram_while16473
MainProgram_edblock16476:
MainProgram_loopend16478:
	jp MainProgram_while14821
MainProgram_edblock14824:
MainProgram_loopend14826:
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
	org $7a00
StartBlock7a00:
	org $7a00
VAS_Blob:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/vas_u3.bin"
end_incbin_VAS_Blob:
EndBlock7a00:
	end
