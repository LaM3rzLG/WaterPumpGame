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
GE_KEY_8 EQU $201
TVC_PORT_3_MEM_MIRROR EQU $b11
TVC_SOUND_VOLUME_PORT EQU $06
GE_KEY_K EQU $205
GE_KEYBOARD_7 EQU $b58
GE_BORDER_DARKYELLOW EQU $28
PUMPA_FAZISOK EQU $08
TVC_PALETTE_DARK_MAGENTA EQU $05
GE_BORDER_GREEN EQU $a0
TVC_GR16_CYAN EQU $0d
GE_KEY_L EQU $405
GE_KEY_$ EQU $802
GE_GR16_COLOR_GRAY EQU $3f
GE_KEY_4 EQU $8000
TVC_BORDER_DARKGREEN EQU $20
TVC_SOUND_HI_PORT EQU $05
TVC_BORDER_WHITE EQU $aa
GE_KEY_H EQU $1004
TVC_MEM_FULL_64K EQU $02
GE_KEYBOARD_0 EQU $b51
TVC_PALETTE_RED EQU $44
GE_DIGI_TYPE_1X4BIT EQU $00
GE_BORDER_WHITE EQU $aa
GE_GR16_COLOR_DARKGREEN EQU $30
GE_SLOT_2_JOY4_PORT EQU $33
GE_SCREEN_HEIGHT EQU $f0
GE_KEY_0 EQU $800
GE_MEM_FULL_64K EQU $b0
TVC_BORDER_RED EQU $88
GE_SLOT_0_JOY3_PORT EQU $12
GE_KEY_BRACKET1 EQU $1003
GE_JOY2_STATE EQU $b5a
GE_BORDER_BLACK EQU $00
GE_JOY2_LEFT EQU $4009
GE_LOOP_FORWARD EQU $00
TRUE EQU $01
GE_GR16_COLOR_GREEN EQU $f0
GE_BACK_SCREEN_ADDR EQU $c000
TVC_TEXT_STYLE_DEFAULT EQU $00
TVC_GRAPHICS16 EQU $02
GE_SLOT_3_BASE_ADDR EQU $d0
GE_KEY_AT EQU $2002
GE_SLOT_RAM_AREA_SIZE EQU $30
TVC_BORDER_BLUE EQU $82
TVC_GR16_YELLOW EQU $0e
GE_PALETTE_RED EQU $44
GE_KEY_R EQU $8002
GE_USE_BACK_SCREEN EQU $01
GE_KEY_J EQU $8005
GE_KEY_ALT EQU $107
TVC_BORDER_YELLOW EQU $a8
GE_KEY_UE EQU $801
GE_BORDER_DARKMAGENTA EQU $0a
TVC_GR16_DARKGREEN EQU $04
GE_GR16_COLOR_DARKMAGENTA EQU $0f
GE_KEYBOARD_4 EQU $b55
GE_SLOT_2_JOY3_PORT EQU $32
GE_KEY_U EQU $8003
GE_SLOT_1_JOY3_PORT EQU $22
GE_GR16_COLOR_WHITE EQU $ff
GE_SLOT_3_JOY3_PORT EQU $42
TVC_JOY_RIGHT EQU $20
METEOR_FIGY_IDO EQU $64
GE_JOY2_UP EQU $209
GE_KEY_EQUAL EQU $4007
GE_KEY_UU EQU $2003
ENEMY_FAZ_DB EQU $05
GE_GR16_COLOR_YELLOW EQU $fc
GE_SLOT_1_JOY4_PORT EQU $23
GE_PORT_5_MEM_MIRROR EQU $b12
TVC_SYS_INK_COLOR EQU $b4d
GE_JOY_UP EQU $02
GE_SOUND_IT_50HZ EQU $4d
GE_KEY_Z EQU $1002
GE_KEYBOARD_5 EQU $b56
TVC_PALETTE_CYAN EQU $51
GE_KEYBOARD_2 EQU $b53
TERKEP_MERET EQU $21c
WATERPUMP_PUMPA_FAZIS_MERET EQU $10
TVC_BORDER_DARKMAGENTA EQU $0a
TVC_BORDER_CYAN EQU $a2
GE_KEYBOARD_3 EQU $b54
GE_GR4_COLOR0 EQU $00
GE_MEM_DEFAULT EQU $70
GE_KEY_N EQU $1006
TVC_GR16_GRAY EQU $07
GE_KEY_Q EQU $4002
GE_SCREEN_ADDR EQU $8000
GE_KEY_7 EQU $8001
GE_DIGI_FREQ_4_KHZ EQU $ce
TVC_PORT_6_MEM_MIRROR EQU $b13
GE_SLOT_2_BASE_ADDR EQU $a0
GE_KEY_OOE EQU $803
GE_MEM_48K_VID EQU $90
GE_GR4_COLOR3 EQU $ff
GE_KEY_O EQU $403
TVC_GR16_MAGENTA EQU $0b
METEOR_Y_MIN EQU $46
GE_KEY_STAR EQU $1001
GE_DIRECT_TO_SCREEN EQU $00
GE_GAMECARD_JOY_FIRE EQU $10
TVC_SYS_GRAPH_MODE EQU $b13
GE_KEY_5 EQU $100
TVC_JOY_FIRE EQU $08
GE_MAX_VOLUME EQU $0f
GE_JOY_FIRE EQU $08
GE_SYS_IT_PORT EQU $07
GE_KEY_OE EQU $4001
GE_JOY2_ACC EQU $1009
GE_KEY_COMMA EQU $207
GE_GR16_COLOR_DARKCYAN EQU $33
TVC_BORDER_BLACK EQU $00
METEOR_Y_RND EQU $82
GE_SCROLL_UP_LEFT EQU $08
GE_SYS_BORDER_COLOR EQU $b4f
TVC_PALETTE_GREEN EQU $50
GE_GR16_COLOR_RED EQU $cc
GE_PALETTE_CYAN EQU $51
GE_JOY1_RIGHT EQU $2008
GE_PALETTE_MAGENTA EQU $45
TVC_PALETTE_DARK_YELLOW EQU $14
TVC_SYS_LINE_MODE EQU $b4b
GE_PALETTE_BLUE EQU $41
GE_SCROLL_DOWN_LEFT EQU $06
GE_PORT_6_MEM_MIRROR EQU $b13
GE_SCROLL_RIGHT EQU $03
GE_SCROLL_DOWN_RIGHT EQU $04
GE_JOY2_DOWN EQU $409
GE_CRTC_VSYNC_POS EQU $07
GE_KEY_READ_PORT EQU $58
TVC_LINE_MODE_OR EQU $01
GE_KEY_6 EQU $1000
GE_PALETTE_YELLOW EQU $54
TVC_GR16_GREEN EQU $0c
FALSE EQU $00
GE_BORDER_CYAN EQU $a2
GE_GR16_COLOR_BLACK2 EQU $c0
TVC_GRAPH_MODE_PORT EQU $06
TVC_GRAPHICS2 EQU $00
TVC_PALETTE_WHITE EQU $55
TVC_BORDER_DARKCYAN EQU $22
GE_PALETTE_DARKYELLOW EQU $14
GE_BORDER_BLACK2 EQU $80
GE_GAMECARD_JOY_RIGHT EQU $08
GE_JOY1_FIRE EQU $808
GE_CRTC_REG_PORT EQU $70
IKON_Y EQU $1e
GE_SLOT_0_JOY4_PORT EQU $13
PUMPAK_CHUNK EQU $0f
GE_PALETTE_DARKBLUE EQU $01
TVC_PALETTE_DARK_BLUE EQU $01
GE_SOUND_VOLUME_PORT EQU $06
GE_PORT_3_MEM_MIRROR EQU $b11
GE_KEY_P EQU $4003
GE_KEY_OO EQU $2001
GE_KEYBOARD_1 EQU $b52
GE_KEY_E EQU $202
GE_KEYBOARD_6 EQU $b57
TVC_FILE_BUFFER_TYPE EQU $b6b
TVC_PALETTE_GRAY EQU $15
GE_KEY_EE EQU $4005
GE_BORDER_MAGENTA EQU $8a
GE_KEY_CARET EQU $101
GE_KEY_S EQU $404
GE_GRAPH_MODE_PORT EQU $06
TVC_MEM_DEFAULT EQU $00
TVC_GR16_DARKBLUE EQU $01
GE_LOOP_BACKWARD EQU $02
GE_SLOT_3_JOY4_PORT EQU $43
GE_GAMECARD_JOY_DOWN EQU $02
TVC_JOY_DOWN EQU $04
GE_KEY_2 EQU $400
PUMPA_FAZIS_MERET EQU $10
GE_JOY_RIGHT EQU $20
GE_PALETTE_GREEN EQU $50
TVC_GR16_DARKRED EQU $02
GE_PALETTE_BLACK EQU $00
GE_PALETTE_BLACK2 EQU $40
GE_KEY_T EQU $102
GE_SOUND_HI_PORT EQU $05
GE_DIGI_FREQ_8_KHZ EQU $e8
GE_KEY_II EQU $2000
TVC_PALETTE_DARK_CYAN EQU $11
TVC_BORDER_DARKYELLOW EQU $28
GE_IMAGE_CLASS_SIZE EQU $0b
GE_JOY1_UP EQU $208
ENEMY_PROBA_DB EQU $06
TVC_GR16_BLACK EQU $00
TVC_SILENT_SOUND EQU $fff
PUMPA_STEP EQU $07
TVC_BORDER_GRAY EQU $2a
GE_BORDER_DARKCYAN EQU $22
GE_MIRROR_TABLE_HI EQU $17
GE_KEY_M EQU $8007
GE_SCROLL_DOWN EQU $05
GE_KEY_V EQU $8006
GE_KEY_UUE EQU $2005
GE_KEY_AA EQU $805
TVC_LINE_MODE_DEFAULT EQU $00
GE_KEY_LESS EQU $2004
TVC_GR16_DARKYELLOW EQU $06
GE_GR16_COLOR_BLUE EQU $c3
GE_KEY_X EQU $406
TVC_LINE_MODE_AND EQU $02
GE_PALETTE_GRAY EQU $15
GE_GRAPHICS4 EQU $01
GE_KEY_W EQU $402
GE_JOY1_DOWN EQU $408
TVC_SOUND_LO_PORT EQU $04
GE_KEY_G EQU $104
GE_SLOT_0_BASE_ADDR EQU $40
TVC_GR16_RED EQU $0a
GE_KEY_RET EQU $1005
TVC_BORDER_MAGENTA EQU $8a
TVC_JOY_UP EQU $02
GE_KEY_3 EQU $200
GE_KEY_A EQU $4004
GE_JOY2_RIGHT EQU $2009
GE_SILENT_SOUND EQU $fff
GE_BORDER_GRAY EQU $2a
GE_JOY1_ACC EQU $1008
MEZO_BX_DB EQU $1f
GE_GR16_COLOR_BLACK EQU $00
GE_JOY_DOWN EQU $04
ENEMY_MAX_KOLONIA EQU $0a
GE_KEY_BACKSLASH EQU $804
GE_GR16_COLOR_CYAN EQU $f3
TVC_SYS_PAPER_COLOR EQU $b4e
TVC_GR16_WHITE EQU $0f
GE_BORDER_DARKRED EQU $08
GE_CRTC_DATA_PORT EQU $71
TVC_PALETTE_DARK_GREEN EQU $10
TVC_GR16_DARKCYAN EQU $05
TVC_SYS_TEXT_STYLE_FLAG EQU $b50
GE_JOY2_FIRE EQU $809
GE_KEY_I EQU $203
GE_KEY_BRACKET2 EQU $103
GE_JOY_LEFT EQU $40
TVC_GR16_BLUE EQU $09
TVC_PALETTE_DARK_RED EQU $04
GE_SCROLL_UP EQU $01
GE_SCROLL_LEFT EQU $07
MEZO_SY_DB EQU $13
TVC_PALETTE_BLACK EQU $00
GE_KEY_DOT EQU $407
GE_KEY_F EQU $8004
GE_GAMECARD_JOY_LEFT EQU $04
METEOR_LE_PX EQU $03
TVC_SYS_LINE_STYLE EQU $b4c
TVC_PALETTE_MAGENTA EQU $45
GE_LOOP_PINGPONG EQU $01
METEOR_X_RND EQU $3a
GE_GR4_COLOR1 EQU $f0
GE_EXT_SLOT_COUNT EQU $04
TVC_SYS_BORDER_COLOR EQU $b4f
GE_KEY_SPACE EQU $2007
TVC_PORT_5_MEM_MIRROR EQU $b12
GE_BORDER_DARKGREEN EQU $20
PALYA_DB EQU $0b
TVC_BORDER_GREEN EQU $a0
WATERPUMP_PUMPA_FAZISOK EQU $08
GE_GRAPHICS2 EQU $00
GE_KEY_DEL EQU $105
GE_KEY_CTRL EQU $1007
METEOR_START_Y EQU $1a
TVC_JOY_LEFT EQU $40
GE_PALETTE_DARKMAGENTA EQU $05
PALYA2_DB EQU $06
TVC_GRAPHICS4 EQU $01
GE_KEY_SHIFT EQU $806
GE_GR16_COLOR_MAGENTA EQU $cf
GE_SLOT_1_BASE_ADDR EQU $70
GE_BORDER_YELLOW EQU $a8
GE_DIGI_FREQ_2_KHZ EQU $9e
GE_KEY_LOCK EQU $2006
TVC_PALETTE_BLACK2 EQU $40
GE_SCREEN_SIZE EQU $3c00
GE_BORDER_RED EQU $88
TVC_BORDER_DARKRED EQU $08
GE_SYS_GRAPH_MODE EQU $b13
TVC_PALETTE_YELLOW EQU $54
GE_KEY_Y EQU $4006
GE_SCREEN_WIDTH EQU $40
TVC_TEXT_STYLE_INVISIBLE EQU $03
METEOR_ANIM_UTEM EQU $03
GE_KEYBOARD_ROW_SEL_PORT EQU $03
TVC_BORDER_DARKBLUE EQU $02
TVC_GR16_BLACK2 EQU $08
GE_KEY_ESC EQU $807
TVC_MAX_VOLUME EQU $0f
GE_MIRROR_TABLE EQU $1700
GE_GR16_COLOR_DARKRED EQU $0c
GE_KEY_C EQU $206
TVC_BORDER_BLACK2 EQU $80
TVC_SYS_BORDER_PORT EQU $00
GE_SPRITE_CLASS_SIZE EQU $27
GE_GR4_COLOR2 EQU $0f
GE_KEY_1 EQU $4000
GE_JOY1_LEFT EQU $4008
GE_GR16_COLOR_DARKYELLOW EQU $3c
ENEMY_MAX_FAZIS EQU $04
GE_KEY_B EQU $106
GE_JOY1_STATE EQU $b59
TVC_TEXT_STYLE_NO_INK EQU $01
GE_SCROLL_UP_RIGHT EQU $02
GE_DIGI_TYPE_2X4BIT EQU $01
TVC_GR16_DARKMAGENTA EQU $03
TVC_PALETTE_BLUE EQU $41
GE_PALETTE_DARKCYAN EQU $11
GE_SOUND_LO_PORT EQU $04
GE_GRAPHICS16 EQU $02
METEOR_FAZIS_MERET EQU $60
GE_GAMECARD_JOY_UP EQU $01
GE_BORDER_BLUE EQU $82
GE_PALETTE_DARKGREEN EQU $10
AKNA_MAX EQU $08
TVC_MEM_48K_VID EQU $03
GE_MEM_VID_ON EQU $50
GE_BORDER_DARKBLUE EQU $02
GE_KEY_D EQU $204
INDULO_PALYA EQU $01
METEOR_FAZ_DB EQU $04
TVC_MEM_VID_ON EQU $01
METEOR_X_MIN EQU $02
GE_GR16_COLOR_DARKBLUE EQU $03
GE_KEY_9 EQU $401
GE_KEY_INS EQU $108
TVC_TEXT_STYLE_TRANSPARENT EQU $02
TVC_SYS_TIMER EQU $b1d
AKNA_FAZISOK EQU $10
GE_PALETTE_DARKRED EQU $04
GE_SYS_BORDER_PORT EQU $00
TVC_LINE_MODE_XOR EQU $03
GE_PALETTE_WHITE EQU $55
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
TVC_FileName: dw  0
TVC_BlockData: dw  0
TVC_BlockLength:	dw	0
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
	WaterPump_PumpaFazPtr_Tab equ $12e4
	Pumpa_Data equ $f6f0
	Talaj1_Data equ $f773
	Talaj2_Data equ $f786
	Talaj3_Data equ $f799
	Keret_Data equ $f7ac
	Keret2_Data equ $f80f
	Enemy_Data equ $f872
	Fal_Data equ $f8c5
	Meteor_Data equ $f8d8
	Bomba_Data equ $fa5b
	ExplosionSFX equ $e761
	TickSFX equ $f69f
	BombaIkon_Data equ $fafe
	Akna_Data equ $fb11
	AknaSFX equ $f252
	Pumpa2_Data equ $fc14
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
Vissza1_X:	db	$01
Vissza2_X:	db	$01
Rot1_Volt:	db	$00
Rot2_Volt:	db	$00
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
	Pause_Buf equ $d800
Szin_Pos:	dw	$00
Szin_W:	db	$00
Szin_H:	db	$00
Szin_Mod:	db	$00
Betu_Kod:	dw $4004, $106, $206, $204, $202, $8004, $104, $1004
	dw $203, $8005, $205, $405, $8007, $1006, $403, $4003
	dw $4002, $8002, $404, $102, $8003, $8006, $402, $406
	dw $4006, $1002
	Kod_Buf equ $138b
	Kod_X equ $1390
Betu_Str:	db $41, $0
Menu_X:	db	$00
Menu_Sor:	db	$00
Menu_Faz:	db	$00
Menu_Ido:	db	$00
Ikon_D:	dw	$00
Ed_T:	 ds 8
Ed_X:	 ds 8
Ed_Y:	 ds 8
Ed_W:	 ds 8
Ed_Db:	db	$00
Ed_Ujt:	db	$00
Ed_Lep:	dw	$00
Ed_Max:	dw	$00
Ed_Cim:	dw	$00
Ed_Irany:	db	$00
Ed_P:	db	$00
Ed_Tip:	db	$00
VS_Y:	db	$00
VS_IY:	db	$00
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
	Font_Data equ $fc97
Spr_Nev:	db $b, $73, $70, $72, $69, $74, $65, $73
	db $2e, $62, $69, $6e, $0
Spr_Hossz:	dw	$189f
Spr_Cim:	dw	$e761
U3_Nev:	db $9, $75, $33, $6b, $6f, $64, $2e, $62
	db $69, $6e, $0
U3_Hossz:	dw	$00
Spr_Buf: dw  0
Pal_Nev:	db $a, $70, $61, $6c, $79, $61, $6b, $2e
	db $62, $69, $6e, $0
Fajl_Nev: dw  0
Szov_P: dw  0
Men_Nev:	db $a, $6d, $65, $6e, $75, $31, $36, $2e
	db $62, $69, $6e, $0
Szab_Nev:	db $b, $73, $7a, $61, $62, $61, $6c, $79
	db $2e, $62, $69, $6e, $0
Szab_Src:	dw	$00
Kep_Src:	dw	$00
Kep_Dst:	dw	$00
Kep_W:	db	$00
Kep_H:	db	$00
Menu16:	db	$00
Fajl_Hossz:	dw	0
Fajl_Cel:	dw	0
Fajl_Hiba:	db	$00
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
Pal_Hossz:	dw	$67f
	Terkepek equ $e0e2
	Palya_Kod equ $e3ce
	Palya_KodCoop equ $e405
	Palya_Cel equ $e43c
	Palya_CelCoop equ $e452
	Palya_PumpaAr equ $e468
	Palya_FalAr equ $e47e
	Palya_BombaAr equ $e494
	Palya_Penz equ $e4aa
	Palya_Termel equ $e4c0
	Palya_Meteor equ $e4d6
	Palya_MeteorTor equ $e4e1
	Palya_MeteorVir equ $e4ec
	Palya_Virus equ $e4f7
	Palya_Fal equ $e502
	Palya_AknaAr equ $e50d
	Palya_Akna equ $e523
	Palya_Bomba equ $e52e
	Terkepek2 equ $e539
	Palya2_Cel equ $e6d1
	Palya2_PumpaAr equ $e6dd
	Palya2_FalAr equ $e6e9
	Palya2_BombaAr equ $e6f5
	Palya2_Penz equ $e701
	Palya2_Termel equ $e70d
	Palya2_Meteor equ $e719
	Palya2_MeteorTor equ $e71f
	Palya2_MeteorVir equ $e725
	Palya2_Virus equ $e72b
	Palya2_Fal equ $e731
	Palya2_AknaAr equ $e737
	Palya2_Akna equ $e743
	Palya2_VirusAr equ $e749
	Palya2_VirusLe equ $e755
	Palya2_Bomba equ $e75b
Palya:	db	$00
Cel_Akt:	dw	$fa
Meteor_Engedve:	db	$01
Meteor_Tor_Engedve:	db	$00
Meteor_Vir_Engedve:	db	$00
Virus_Engedve:	db	$01
Fal_Engedve:	db	$01
Bomba_Engedve:	db	$01
Akna_Engedve:	db	$00
VirusLe_Engedve:	db	$00
Virus_price:	dw	$bb8
Akna_price:	dw	$12c
Akna_Robban:	db	$00
Akna_Idx:	dw	$00
Akna_Utem:	db	$08
Akna_Frame:	db	$00
Akna_Db:	db	$00
Akna_Rajz:	db	$00
	Akna_Mp equ $137b
Kor_Fel:	db $3, $3, $2, $1
MapPos:	dw	0
Drill_Cash:	dw	$3e8
Drill_Cash2:	dw	$00
Pumpa_price:	dw	$64
Tegla_price:	dw	$32
Bomba_price:	dw	$0a
Bomba_SavMagas:	db	$1c
Bomba_SavY:	db	$00
Szab_SavSzin:	db $0, $0, $1, $1, $5, $5, $4, $4
	db $5, $5, $44, $44, $44, $44, $5, $5
	db $4, $4, $5, $5, $1, $1, $0, $0
Szab_SavP: dw  0
Szab_SavAkt: dw  0
Szab_SavY:	db	$00
Szab_SavOff:	db	$17
Szab_SavDb:	db	$01
Szab_SavLep:	db	$01
Szab_SavPort:	db	$61
Szab_SavVeg:	db	$00
Szab_SavFr:	db	$00
Szab_SavCel:	db	$50
Menu_SavSzin:	db $0, $0, $20, $a0, $a8, $aa, $aa, $a8
	db $a0, $20, $0, $0
Pumpa_termel:	dw	$02
Pumpa_db:	dw	$00
Pumpa_db2:	dw	$00
Pumpa_Ossz:	dw	$00
Cel_Int:	dw	$00
Termel_Frame:	dw	$00
Termel_Utem:	dw	$28
PumpaScanPos:	dw	$00
Pumpa_Uj_Faz:	db	$00
	Mezo_ByteX_Tab equ $1324
	Mezo_SorCim_Tab equ $1343
	Enemy_FazPtr_Tab equ $1369
	Meteor_FazPtr_Tab equ $1373
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
AknaMap:	db	$29
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
Ir_Px:	db	$00
Ir_Bdb:	db	$00
Ir_H:	db	$00
Ir_Sor0:	dw	$00
Ir_Dst:	dw	$00
JegyStr:	db $30, $0
Jegy_Sz:	db	$02
Cash_X:	db	0
Cash2_X:	db	0
Pump_X:	db	0
Pump2_X:	db	0
Lives_X:	db	0
Ossz_X:	db	0
Cel_X:	db	0
	
; //	if (X > 63) then
; //	  X := 63;
; //	if (Y > 239) then
; //	  Y := 239;
; //	if (Width = 0) then
; //		Width := 1;
; //	if (Height = 0) then
; //		Height := 1;
; //	if (X + Width > 64) then
; //		Width := 64 - X;
; //	if (Y + Height > 240) then
; //		Height := 240 - Y;
; //	
; // Draw filled rectangle 	================================================
; //	            K E Y B O A R D
; //=================================================*
; //Waiting for any key pressing.<br/>
; //Return to pressed key code.<br/>
; //<br/>
; //Example: if (TVC::ReadKey() = 13) then Start();<br/>
; //<br/>
; //Uses the System ROM (firmware) function.<br/>
; 

	; ***********  Defining procedure : TVC_ReadKey
	;    Procedure type : User-defined procedure
 ; Temp vars section
	; Declaring string asmz80
ProgramInit_stringassignstr102:		db	"0"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr577:		db	"P1$:"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr617:		db	"P2$:"
	db	0
	; Declaring string asmz80
MapToScreen_stringassignstr620:		db	"P2$:"
	db	0
	; Declaring string asmz80
Pause_Kezel_stringassignstr1521:		db	"GAME PAUSED"
	db	0
	; Declaring string asmz80
Pause_Kezel_stringassignstr1524:		db	"GAME PAUSED"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr2006:		db	"EXIT TO MENU ?"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr2008:		db	"ESC/Q = YES"
	db	0
	; Declaring string asmz80
Exit_Kerdes_stringassignstr2010:		db	"OTHER KEY = NO"
	db	0
	; Declaring string asmz80
Kod_Bevitel_stringassignstr3326:		db	"PALYAKOD"
	db	0
	; Declaring string asmz80
Kod_Bevitel_stringassignstr4049:		db	"HIBAS KOD"
	db	0
	; Declaring string asmz80
VS_Szerk_stringassignstr4136:		db	"RETURN = OK ES MENTES   "
	db	0
	; Declaring string asmz80
VS_Szerk_stringassignstr4397:		db	"      MENTES...         "
	db	0
	; Declaring string asmz80
VS_Szerk_stringassignstr4399:		db	"E = ERTEKEK SZERKESZTESE"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4402:		db	"KET JATEKOS EGYMAS ELLEN"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4404:		db	"VALASSZ PALYAT"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4406:		db	"PALYA KEZDO PENZ:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4408:		db	"AR / BEVETEL"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4410:		db	"VESZELYEK:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4412:		db	"PALYA:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4414:		db	"CEL:"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4416:		db	"E = ERTEKEK SZERKESZTESE"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4418:		db	"FEL / LE = PALYA VALASZTAS"
	db	0
	; Declaring string asmz80
VS_Valaszto_stringassignstr4420:		db	"TUZ = INDITAS   ESC = VISSZA"
	db	0
	; Declaring string asmz80
Meteor_Felirat_stringassignstr5397:		db	"METEOR !"
	db	0
	; Declaring string asmz80
Meteor_Kijelzo_stringassignstr5409:		db	"METEOR:"
	db	0
	; Declaring string asmz80
Meteor_Kijelzo_stringassignstr5411:		db	"METEOR:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5902:		db	"PLAYER 2 WINS !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5905:		db	"PLAYER 1 WINS !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5908:		db	"LEVEL COMPLETED !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5910:		db	"P1:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5912:		db	"P2:"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5920:		db	"LEVEL COMPLETED !"
	db	0
	; Declaring string asmz80
Palya_Teljesitve_stringassignstr5945:		db	"PRESS SPACE TO CONTINUE"
	db	0
	; Declaring string asmz80
Game_Over_stringassignstr5948:		db	"GAME OVER !"
	db	0
	; Declaring string asmz80
Game_Over_stringassignstr5950:		db	"PRESS SPACE FOR MENU"
	db	0
	; Declaring string asmz80
Palya_Bukas_stringassignstr5984:		db	"LEVEL FAILED !"
	db	0
	; Declaring string asmz80
Palya_Bukas_stringassignstr5986:		db	"PRESS SPACE TO RETRY"
	db	0
	; Declaring string asmz80
MainProgram_stringassignstr7217:		db	"METEOR !"
	db	0
 ; Temp vars section ends
TVC_ReadKey:
			rst $30 				; system call
			db $91 					; KBD_CHIN function code
			ld A,C					; code of pressed key
			
	ret
end_procedure_TVC_ReadKey:
	;================================================
; //		File I/O sytem ROM functions
; //=================================================*
; //Create file or open file for writing<br/>
; //Params:
; //<ul>
; //<li>FileName: name of the file (max length: 16 chars)</li>
; //</ul>
; //<br/>
; //Example: CreateFile("NewFile.txt");<br/>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : TVC_CreateFile
	;    Procedure type : User-defined procedure
TVC_CreateFile_block3:
TVC_CreateFile:
			xor	A													; A := 0
			ld	(TVC_FILE_BUFFER_TYPE),A  ; BUFFER_TYPE := 0 (non buffered)
			ld  DE,[TVC_FileName]
			rst $30 											; system function call
			db  $53 											; CAS_CRTE function code
			
	ret
end_procedure_TVC_CreateFile:
	;*
; //Close file<br/>
; //<br/>
; //Example: CloseFile();<br/>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : TVC_CloseFile
	;    Procedure type : User-defined procedure
TVC_CloseFile:
			rst $30 									; system function call
			db  $54 									; CAS_CLOSE function code
			
	ret
end_procedure_TVC_CloseFile:
	;*
; //Write a data block to created file<br/>
; //Params:
; //<ul>
; //<li>BlockData: 	 data address</li>
; //<li>BlockLength: number of bytes to write</li>
; //</ul>
; //Result:
; //<ul>
; //<li>0: success</li>
; //<li>otherwise: the number of bytes not written to the file, in case of any error</li>
; //</ul>
; //<br/>
; //Example: BlockWrite(#Data, 16384);<br/>
; //<br/>
; //ATTENTION! It can only be called once to write the data to a file; it is impossible to save the data in several parts with several calls.<br/>
; //<br/>
; //Uses the System ROM (firmware) function.
; 

	; ***********  Defining procedure : TVC_BlockWrite
	;    Procedure type : User-defined procedure
TVC_BlockWrite_block5:
TVC_BlockWrite:
			ld  DE,[TVC_BlockData]
			ld  BC,[TVC_BlockLength]
			rst $30		; system function call
			db  $52 	; CAS_BKOUT function code
			ld  H,B
			ld  L,C		; HL = result = the number of bytes not written to the file, in case of error
			
	ret
end_procedure_TVC_BlockWrite:
	; ***********  Defining procedure : GE_Sprite_Init
	;    Procedure type : User-defined procedure
GE_Sprite_Init_block6:
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
GE_SetMemory_block14:
GE_SetMemory:
	    ld  A,[GE_Mode]
			ld  ($3),A
			out ($2),A
	    
	ret
end_procedure_GE_SetMemory:
	; GetMemoryMapping ===============================================
; //   Enable / Disable the TVC Interrupt Handler
; //===============================================*
; //A TV-Computer rendszer megszakítás-kezelő engedélyezése<br/>
; //Más szavakkal: visszaállítja a TVC eredeti megszakítás-kezelőjét a Game Engine megszakítás-kezelőjéről.<br/>
; //<br/>
; //A GE::Init eljárás átírányítja a megszakítás-kezelőt egy saját megoldásra, ami nem vesz el extra időt a program futásától, ezzel gyakorlatilag letiltva a rendszer megszakítás-kezelőt. Ezért például a billentyűzet mátrix sem lesz automatikusan feltöltve.<br/>
; //<br/>
; //Ha a program futásához szükség van az eredeti megszakítás-kezelő működésére, akkor érdemes meghívni ezt az eljárást.<br/>
; //Ha már nincs szükség rá, akkor a GE::DisableTVCITHandler() eljárással visszaállítható a Game Engine saját megszakítás-kezelőjének működése, ami gyorsabb működést eredményez.<br/>
; //<br/>
; //Példa a használatra:<br/>
; //GE::EnableTVCITHandler();
; //<br/>
; //<br/>
; //ENGLISH:<br/>
; //-------------<br/>
; //Enable the TV-Computer's Interrupt Handler<br/>
; //(Recovery of the original Interrupt Handler)<br/>
; //<br/>
; //The Game Engine Init procedure disables the TV-Computer's Interrupt Handler.<br/>
; //<br/>
; //You must call this procedure if you want to perform some file operation after Game Engin's Init or need any of the functions performed by the original Interrupt Handler.
; 

	; ***********  Defining procedure : GE_EnableTVCITHandler
	;    Procedure type : User-defined procedure
GE_EnableTVCITHandler:
			di							;// disable interruptsű
			;// Recovery of the first 3 bytes of the original Interrupt Handler
			ld	HL,$38			;// HL -> start address of System Interrupt Handler
			ld	(HL),$F5		;// $F5: PUSH AF
			inc	HL
			ld	(HL),$3E
			inc	HL
			ld	(HL),$70		;// $3E $70: LD A,$70
			ei							;// enable interrupts
			
	ret
end_procedure_GE_EnableTVCITHandler:
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
GE_Init_block17:
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
GE_SetGraphics_block18:
GE_SetGraphics:
			ld  A,[GE_Mode]
			ld 	C,A 							;// C = graphics mode code
			rst $30 							;// system function call
			db $4 								;// VMODE function code			
			
	ret
end_procedure_GE_SetGraphics:
	;*
; //Grafikus mód beállítása port írással.<br/>
; //<br/>
; //A grafikus mód beállítása mellett NEM TÖRLI LE a képernyőt.<br/>
; //Például arra használható, hogy ha a képernyő felső felén más grafikus módot szeretnénk használni, mint az alsó felén. Ekkor a raster-megszakítás pozíciójának adott sorra történő beállításával, a megszakítás bekövetkeztekor, ezzel az utasítással beállítható az adott képernyőfél grafikus módja.<br/>
; //Paraméterek:
; //<ul>
; //<li>GE::GRAPHICS2:  2 színű mód</li>
; //<li>GE::GRAPHICS4:  4 színű mód</li>
; //<li>GE::GRAPHICS16: 16 színű mód</li>
; //</ul>
; //<br/>
; //Példa a használatára:<br/>
; //GE::SetGraphMode(GE::GRAPHICS_16);<br/>
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
; //Example: GE::SetGraphMode(GE::GRAPHICS_16);<br/>
; //<br/>
; 

	; ***********  Defining procedure : GE_SetGraphMode
	;    Procedure type : User-defined procedure
GE_SetGraphMode_block19:
GE_SetGraphMode:
			ld  A,[GE_Mode]   						;// A = the Mode param
			ld  C,A           						;// C = the Mode param
			LD  A,(GE_PORT_6_MEM_MIRROR)	;// A = mirror of port 6 in memory
      AND 255-2-1       						;// clear 0 and 1 bits (graphics mode)
      OR  C             						;// set the graphics specified in the Mode parameter.
      LD  ($0B13),A     						;// save the value to the mirror of port 6
      OUT (GE_GRAPH_MODE_PORT),A    ;// send the value to port 6
			
	ret
end_procedure_GE_SetGraphMode:
	; ***********  Defining procedure : GE_SetPalette
	;    Procedure type : User-defined procedure
GE_SetPalette_block20:
GE_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	or a
	jr c, GE_SetPalette_edblock24
GE_SetPalette_localsuccess26: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,GE_SetPalette_edblock24
GE_SetPalette_localsuccess27: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,GE_SetPalette_edblock24
GE_SetPalette_ctb22: ;Main true block ;keep :
				ld A,[GE_Nr]
				ld C,$60
				add A,C
				ld C,A					;// C = $60 + Nr
				ld A,[GE_Color]	;// A = Color code
				out (C),A				;// send Color code to desired palette port
				
GE_SetPalette_edblock24:
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
GE_SetBorder_block29:
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
GE_SetRasterInterruptPos_block31:
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
GE_ClearScreen_block32:
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
GE_FillRect_block33:
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
GE_Pressed_block35:
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
GE_Joystick_block37:
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
GE_DigiSoundOn_block38:
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
GE_PlayDigiSound_block40:
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
; //	   BuildPumpaFazTab() tolti fel EGYSZER, indulaskor.  0..7: az 1. jatekos pumpaja, 8..15: a 2. jatekose, 16..31: akna, 16 kep (PumpaFazPtr_Tab[Faz], Faz 0..31)  EGYSZER hivando (indulaskor): vegigmegy mind az 540 MAP-cellan, es
; //	   kozvetlen ASM-mel (nincs kulon osztaly/SetPosition) kiszamolja +
; //	   eltarolja a kesz kepernyocimet mindegyikre. 
	; ***********  Defining procedure : WaterPump_BuildScreenAddrTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx:	db	0
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy:	db	0
WaterPump_BuildScreenAddrTab_block45:
WaterPump_BuildScreenAddrTab:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [WaterPump_BuildIdx],hl
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy], a
WaterPump_BuildScreenAddrTab_forloop46:
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx], a
WaterPump_BuildScreenAddrTab_forloop60:
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
WaterPump_BuildScreenAddrTab_loopstart61:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx],a
	cp $1e+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop60
WaterPump_BuildScreenAddrTab_loopend62:
WaterPump_BuildScreenAddrTab_loopstart47:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy],a
	cp $12+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop46
WaterPump_BuildScreenAddrTab_loopend48:
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
WaterPump_BuildPumpaFazTab_block66:
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
WaterPump_BuildPumpaFazTab_while67:
WaterPump_BuildPumpaFazTab_loopstart71:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_v]
	ld b,a
	ld a,[localVariable_WaterPump_BuildPumpaFazTab_WaterPump_f]
	cp b
	jr nc,WaterPump_BuildPumpaFazTab_edblock70
WaterPump_BuildPumpaFazTab_ctb68: ;Main true block ;keep :
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
	jr WaterPump_BuildPumpaFazTab_while67
WaterPump_BuildPumpaFazTab_edblock70:
WaterPump_BuildPumpaFazTab_loopend72:
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
WaterPump_PutAt_block75:
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
Ir_block76:
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
			ld [Ir_Dst],hl
			ld hl,[Ir_Szoveg]
			call Ir_PxSzel
			ld [Ir_Bdb],a
			ld a,[Font_Data]
			and 15
			ld [Ir_H],a
			ld hl,Font_Data+110
			ld [Ir_Sor0],hl
			ld a,[Ir_H]
			ld b,a
IrSorCiklus:
			push bc
			ld hl,$1460
			ld b,34
			xor a
Ir_Torol:
			ld (hl),a
			inc hl
			djnz Ir_Torol
			ld [Ir_Px],a
			ld hl,[Ir_Szoveg]
Ir_Kar:
			ld a,(hl)
			or a
			jr z,Ir_Kiir
			inc hl
			cp 32
			jr c,Ir_Kar
			cp 141
			jr nc,Ir_Kar
			sub 32
			push hl
			ld e,a
			ld d,0
			ld hl,Font_Data+1
			add hl,de
			ld a,(hl)
			or a
			jr z,Ir_KarVege
			ld [Ir_Szel],a
			ld hl,[Ir_Sor0]
			add hl,de
			ld d,(hl)
			ld e,0
			ld a,[Ir_Px]
			ld c,a
			and 7
			jr z,Ir_NemTol
			ld b,a
Ir_Tol:
			srl d
			rr e
			djnz Ir_Tol
Ir_NemTol:
			ld a,c
			rrca
			rrca
			rrca
			and 31
			ld c,a
			ld b,0
			ld hl,$1460
			add hl,bc
			ld a,(hl)
			or d
			ld (hl),a
			inc hl
			ld a,(hl)
			or e
			ld (hl),a
			ld a,[Ir_Szel]
			ld c,a
			ld a,[Ir_Px]
			add a,c
			ld [Ir_Px],a
Ir_KarVege:
			pop hl
			jr Ir_Kar
Ir_Kiir:
			call IrKiirRut
			pop bc
			djnz IrSorCiklus
			ld a,[Ir_Bdb]
			ld e,a
			ld d,0
			ld hl,[Ir_Cim]
			add hl,de
			ld [Ir_Cim],hl
			ld a,[Ir_X]
			add a,e
			ld [Ir_X],a
			jp Ir_Vege
IrKiirRut:
			ld a,[Ir_Bdb]
			or a
			jr z,IrSorVege
			ld b,a
			ld hl,$1460
			ld de,[Ir_Dst]
Ir_Byte:
			ld a,(hl)
			and $F0
			ld (de),a
			inc de
			dec b
			jr z,IrSorVege
			ld a,(hl)
			rlca
			rlca
			rlca
			rlca
			and $F0
			ld (de),a
			inc de
			inc hl
			djnz Ir_Byte
IrSorVege:
			ld hl,[Ir_Dst]
			ld de,64
			add hl,de
			ld [Ir_Dst],hl
			ld hl,[Ir_Sor0]
			ld de,109
			add hl,de
			ld [Ir_Sor0],hl
			ret
Ir_PxSzel:
			ld c,0
Ir_PKov:
			ld a,(hl)
			or a
			jr z,Ir_PVege
			inc hl
			cp 32
			jr c,Ir_PKov
			cp 141
			jr nc,Ir_PKov
			sub 32
			push hl
			ld e,a
			ld d,0
			ld hl,Font_Data+1
			add hl,de
			ld a,(hl)
			add a,c
			ld c,a
			pop hl
			jr Ir_PKov
Ir_PVege:
			ld l,c
			ld h,0
			inc hl
			inc hl
			inc hl
			srl h
			rr l
			srl h
			rr l
			ld a,l
			ret
Ir_Vege:
		
	ret
end_procedure_Ir:
	; Egy szöveg szélessége byte-ban (a betűk szélességének összege) -> Ir_Hossz 
	; ***********  Defining procedure : Ir_Hossza
	;    Procedure type : User-defined procedure
Ir_Hossza_block77:
Ir_Hossza:
			ld hl,[Ir_Szoveg]
			call Ir_PxSzel
			ld [Ir_Hossz],a
		
	ret
end_procedure_Ir_Hossza:
	; Szöveg vízszintesen középre az y sorba 
	; ***********  Defining procedure : Ir_Kozep
	;    Procedure type : User-defined procedure
localVariable_Ir_Kozep_x:	db	0
localVariable_Ir_Kozep_y:	db	0
localVariable_Ir_Kozep_varPrefixed_p: dw  0
Ir_Kozep_block78:
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
Ir_Jegy_block79:
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
	; Fajl_Nev olvasasa a Spr_Buf-ba, a Lemmings betoltojenek ROM-hivasaival; hiba: keret piros = nem nyilik, lila = olvasasi hiba 
	; ***********  Defining procedure : Fajl_Olvas
	;    Procedure type : User-defined procedure
Fajl_Olvas:
			xor a
			ld [Fajl_Hiba],a
			ld ($0B0A),a
			ld de,[Fajl_Nev]
			rst $30
			db $D3
			jr z,Fajl_Olvas_nyitva
			ld a,1
			ld [Fajl_Hiba],a
			jr Fajl_Olvas_vege
Fajl_Olvas_nyitva:
			ld de,[Spr_Buf]
			ld bc,[Fajl_Hossz]
			rst $30
			db $D2
			or a
			jr z,Fajl_Olvas_zar
			ld a,2
			ld [Fajl_Hiba],a
Fajl_Olvas_zar:
			xor a
			rst $30
			db $D4
Fajl_Olvas_vege:
		
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Fajl_Hiba]
	or a
	jr z, Fajl_Olvas_edblock84
Fajl_Olvas_ctb82: ;Main true block ;keep :
	ld a, $8a
	ld [GE_Color], a
	call GE_SetBorder
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fajl_Hiba]
	cp $1
	jr nz,Fajl_Olvas_edblock96
Fajl_Olvas_ctb94: ;Main true block ;keep :
	ld a, $88
	ld [GE_Color], a
	call GE_SetBorder
Fajl_Olvas_edblock96:
	call TVC_ReadKey
	ld a, $a8
	ld [GE_Color], a
	call GE_SetBorder
Fajl_Olvas_edblock84:
	ret
end_procedure_Fajl_Olvas:
	; Egy fajl betoltese lemezrol a $8000-es pufferbe, majd masolas az U3-ba (Fajl_Nev, Fajl_Hossz, Fajl_Cel); a GE::Init ELOTT, alap lapozassal 
	; ***********  Defining procedure : Fajl_Betolt
	;    Procedure type : User-defined procedure
Fajl_Betolt:
	ld hl,$8000
	ld [Spr_Buf],hl
	call Fajl_Olvas
			di
			ld a,($3)
			push af
			ld a,$B0
			out ($2),a
			ld hl,$8000
			ld de,[Fajl_Cel]
			ld bc,[Fajl_Hossz]
			ldir
			pop af
			out ($2),a
			ei
		
	ret
end_procedure_Fajl_Betolt:
	; A jatek adatfajljainak betoltese: SPRITES.BIN (Spr_Cim) es PALYAK.BIN (Terkepek) 
	; ***********  Defining procedure : Spr_Betolt
	;    Procedure type : User-defined procedure
Spr_Betolt:
	ld a, $a8
	ld [GE_Color], a
	call GE_SetBorder
	ld hl,U3_Nev
	ld [Fajl_Nev],hl
	; a kód U3-as része (u3_boot_patch.ps1 vágja ki; a hosszát is ő írja be) 
	; generic assign 
	; Variable is 16-bit
	ld hl,[U3_Hossz]
	; Loading pointer
	ld [Fajl_Hossz],hl
	; generic assign 
	ld hl,$c000
	; Loading pointer
	ld [Fajl_Cel],hl
	call Fajl_Betolt
	ld hl,Spr_Nev
	ld [Fajl_Nev],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Spr_Hossz]
	; Loading pointer
	ld [Fajl_Hossz],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Spr_Cim]
	; Loading pointer
	ld [Fajl_Cel],hl
	call Fajl_Betolt
	ld hl,Pal_Nev
	ld [Fajl_Nev],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pal_Hossz]
	; Loading pointer
	ld [Fajl_Hossz],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,Terkepek
	; Loading pointer
	ld [Fajl_Cel],hl
	call Fajl_Betolt
	ld hl,$9000
	ld [Spr_Buf],hl
	; a jatekszabaly az U2-ben marad (a $8000-at a palyamentes hasznalja) 
	ld hl,Szab_Nev
	ld [Fajl_Nev],hl
	; generic assign 
	ld hl,$1000
	; Loading pointer
	ld [Fajl_Hossz],hl
	call Fajl_Olvas
	ld hl,$a000
	ld [Spr_Buf],hl
	ld hl,Men_Nev
	ld [Fajl_Nev],hl
	; generic assign 
	ld hl,$1834
	; Loading pointer
	ld [Fajl_Hossz],hl
	call Fajl_Olvas
	ret
end_procedure_Spr_Betolt:
	; Játék indításakor egyszer lefutó beállítások 
	; ***********  Defining procedure : ProgramInit
	;    Procedure type : User-defined procedure
localVariable_ProgramInit_varPrefixed_f:	db	0
localVariable_ProgramInit_xx:	db	0
localVariable_ProgramInit_yy:	db	0
localVariable_ProgramInit_varPrefixed_p:	dw	0
localVariable_ProgramInit_varPrefixed_a:	dw	0
ProgramInit_block100:
ProgramInit:
	call Spr_Betolt
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
	ld hl,ProgramInit_stringassignstr102
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
ProgramInit_while103:
ProgramInit_loopstart107:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_xx]
	ld b,a
	ld a,$1e
	cp b
	jr c,ProgramInit_edblock106
ProgramInit_ctb104: ;Main true block ;keep :
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
	jr ProgramInit_while103
ProgramInit_edblock106:
ProgramInit_loopend108:
	; rács-Y (1..18) -> a képsor kezdő címe 
	ld a, $1
	ld [localVariable_ProgramInit_yy], a
ProgramInit_while113:
ProgramInit_loopstart117:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_ProgramInit_yy]
	ld b,a
	ld a,$12
	cp b
	jr c,ProgramInit_edblock116
ProgramInit_ctb114: ;Main true block ;keep :
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
	jr ProgramInit_while113
ProgramInit_edblock116:
ProgramInit_loopend118:
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
	; 2. játékos pumpája: fázis 8..15 (ugyanaz a kirakó) 
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Akna_Data
	add hl,de
	; Loading pointer
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap],hl
	ld a, $10
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo], a
	call WaterPump_BuildPumpaFazTab
	; akna: fázis 16..23 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$80
	; Variable is 16-bit
	ld hl,[localVariable_ProgramInit_varPrefixed_a]
	add  hl,de
	ld [localVariable_ProgramInit_varPrefixed_a],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Alap],hl
	ld a, $18
	ld [localVariable_WaterPump_BuildPumpaFazTab_WaterPump_Kezdo], a
	call WaterPump_BuildPumpaFazTab
	; akna: fázis 24..31 (a 16 képes animáció második fele)  Vírus fázis-pointerek: Enemy.AnimSet + faz*16 
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
ProgramInit_while123:
ProgramInit_loopstart127:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $5
	jr nc,ProgramInit_edblock126
ProgramInit_ctb124: ;Main true block ;keep :
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
	jr ProgramInit_while123
ProgramInit_edblock126:
ProgramInit_loopend128:
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
ProgramInit_while133:
ProgramInit_loopstart137:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_ProgramInit_varPrefixed_f]
	cp $4
	jr nc,ProgramInit_edblock136
ProgramInit_ctb134: ;Main true block ;keep :
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
	jr ProgramInit_while133
ProgramInit_edblock136:
ProgramInit_loopend138:
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
MapReset_block145:
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
MapReset_while147:
MapReset_loopstart151:
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp nc,MapReset_edblock150
MapReset_ctb148: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MapReset_eblock204
MapReset_ctb203: ;Main true block ;keep :
	; két játékos (versus) pálya 
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_MapReset_ti]
	ld hl,Terkepek2
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_MapReset_varPrefixed_b], a
	jr MapReset_edblock205
MapReset_eblock204:
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_MapReset_ti]
	ld hl,Terkepek
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_MapReset_varPrefixed_b], a
MapReset_edblock205:
	ld a, $0
	ld [localVariable_MapReset_bit], a
MapReset_while208:
MapReset_loopstart212:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_MapReset_bit]
	cp $8
	jr nc,MapReset_edblock211
MapReset_ctb209: ;Main true block ;keep :
	; Binary clause core: LESS
	; Binary clause INTEGER: LESS
	ld hl,$21c
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_data]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nc,MapReset_edblock218
MapReset_ctb216: ;Main true block ;keep :
	; MSB elöl: 1 = Talaj3 (blokkolt), 0 = Talaj1 
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_MapReset_varPrefixed_b]
	and  $80
	ld [localVariable_MapReset_t], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	or a
	jr z, MapReset_eblock222
MapReset_ctb221: ;Main true block ;keep :
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_MapReset_data]
	ld hl,Map
	add hl,de
	ld a,[Talaj3Map]
	ld [hl],a 
	jr MapReset_edblock223
MapReset_eblock222:
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_MapReset_data]
	ld hl,Map
	add hl,de
	ld a,[Talaj1Map]
	ld [hl],a 
MapReset_edblock223:
MapReset_edblock218:
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
	jr MapReset_while208
MapReset_edblock211:
MapReset_loopend213:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_MapReset_ti]
	add  hl,de
	ld [localVariable_MapReset_ti],hl
	jp MapReset_while147
MapReset_edblock150:
MapReset_loopend152:
	ret
end_procedure_MapReset:
	; Egy byte kiírása a HUD-ra MINDIG 2 számjeggyel, vezető nullával (pl. 9 -> "09"), az x helytől; utána Ir_X a következő szabad oszlop 
	; ***********  Defining procedure : HUD_Num2
	;    Procedure type : User-defined procedure
localVariable_HUD_Num2_t:	db	0
localVariable_HUD_Num2_ertek:	db	0
localVariable_HUD_Num2_x:	db	0
localVariable_HUD_Num2_sor:	db	0
HUD_Num2_block226:
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
Level_OSD_block228:
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
	jp nz,Level_OSD_eblock231
Level_OSD_ctb230: ;Main true block ;keep :
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
	jp Level_OSD_edblock232
Level_OSD_eblock231:
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
Level_OSD_edblock232:
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
HUD_Num4_block237:
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
localVariable_HUD_Num3_maradek:	dw	0
localVariable_HUD_Num3_varPrefixed_d:	dw	0
localVariable_HUD_Num3_varPrefixed_b:	db	0
localVariable_HUD_Num3_ertek:	dw	0
localVariable_HUD_Num3_x:	db	0
localVariable_HUD_Num3_sor:	db	0
HUD_Num3_block241:
HUD_Num3:
	; generic assign 
	ld a,[localVariable_HUD_Num3_x]
	ld [Ir_X], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num3_ertek]
	; Loading pointer
	ld [localVariable_HUD_Num3_maradek],hl
	; generic assign 
	ld de,$64
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num3_maradek]
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	; Loading pointer
	ld [localVariable_HUD_Num3_varPrefixed_d],hl
	; generic assign 
	ld a,[localVariable_HUD_Num3_varPrefixed_d]
	ld [localVariable_HUD_Num3_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num3_sor]
	ld [localVariable_Ir_Jegy_sor], a
	call Ir_Jegy
	; 16 bit BINOP
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$64
	push af
	; Variable is 16-bit
	ld de,[localVariable_HUD_Num3_varPrefixed_d]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num3_maradek]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_HUD_Num3_maradek],hl
	; generic assign 
	ld de,$0a
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num3_maradek]
	ld a,h
	ld c,l
	call div_16x16
	ld h,a
	ld l,c
	; Loading pointer
	ld [localVariable_HUD_Num3_varPrefixed_d],hl
	; generic assign 
	ld a,[localVariable_HUD_Num3_varPrefixed_d]
	ld [localVariable_HUD_Num3_varPrefixed_b], a
	; generic assign 
	ld [localVariable_Ir_Jegy_varPrefixed_d], a
	; generic assign 
	ld a,[localVariable_HUD_Num3_sor]
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
	ld de,[localVariable_HUD_Num3_varPrefixed_d]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	ex de,hl
	; Variable is 16-bit
	ld hl,[localVariable_HUD_Num3_maradek]
	xor a ; clear carry
	sbc hl,de
	; Loading pointer
	ld [localVariable_HUD_Num3_varPrefixed_d],hl
	; generic assign 
	ld a,[localVariable_HUD_Num3_varPrefixed_d]
	ld [localVariable_HUD_Num3_varPrefixed_b], a
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
Elet_OSD_block244:
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
Elet_OSD_while245:
Elet_OSD_loopstart249:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[Eletek]
	ld b,a
	ld a,[localVariable_Elet_OSD_varPrefixed_i]
	cp b
	jr nc,Elet_OSD_edblock248
Elet_OSD_ctb246: ;Main true block ;keep :
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
	jr Elet_OSD_while245
Elet_OSD_edblock248:
Elet_OSD_loopend250:
	ret
end_procedure_Elet_OSD:
	; ***********  Defining procedure : Ikon_Oszlop
	;    Procedure type : User-defined procedure
localVariable_Ikon_Oszlop_varPrefixed_r:	db	0
localVariable_Ikon_Oszlop_s:	db	0
localVariable_Ikon_Oszlop_j:	db	0
localVariable_Ikon_Oszlop_varPrefixed_e:	db	0
Ikon_Oszlop_block253:
Ikon_Oszlop:
	ld a, $0
	ld [localVariable_Ikon_Oszlop_s], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	or a
	jr c, Ikon_Oszlop_edblock257
	jr z, Ikon_Oszlop_edblock257
Ikon_Oszlop_ctb255: ;Main true block ;keep :
	; a hely sorszama: a tiltott eszkozok helye kimarad 
	ld a, $1
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock257:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $1
	jr c, Ikon_Oszlop_edblock263
	jr z, Ikon_Oszlop_edblock263
Ikon_Oszlop_ctb261: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[Fal_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Oszlop_s]
	add  a, b
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock263:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $2
	jr c, Ikon_Oszlop_edblock269
	jr z, Ikon_Oszlop_edblock269
Ikon_Oszlop_ctb267: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[Bomba_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Oszlop_s]
	add  a, b
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock269:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $3
	jr c, Ikon_Oszlop_edblock275
	jr z, Ikon_Oszlop_edblock275
Ikon_Oszlop_ctb273: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[Akna_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Oszlop_s]
	add  a, b
	ld [localVariable_Ikon_Oszlop_s], a
Ikon_Oszlop_edblock275:
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
	jr nz,Ikon_Oszlop_edblock281
Ikon_Oszlop_ctb279: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_r]
	ld b,a
	ld a,$1f
	sub  b
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock281:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $1
	jr nz,Ikon_Oszlop_edblock287
Ikon_Oszlop_ctb285: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock299
Ikon_Oszlop_ctb297: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock299:
Ikon_Oszlop_edblock287:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $2
	jr nz,Ikon_Oszlop_edblock304
Ikon_Oszlop_ctb302: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock316
Ikon_Oszlop_ctb314: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock316:
Ikon_Oszlop_edblock304:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $3
	jr nz,Ikon_Oszlop_edblock321
Ikon_Oszlop_ctb319: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Akna_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock333
Ikon_Oszlop_ctb331: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock333:
Ikon_Oszlop_edblock321:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_e]
	cp $4
	jr nz,Ikon_Oszlop_edblock338
Ikon_Oszlop_ctb336: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[VirusLe_Engedve]
	or a
	jr nz,Ikon_Oszlop_edblock350
Ikon_Oszlop_ctb348: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Ikon_Oszlop_varPrefixed_r], a
Ikon_Oszlop_edblock350:
Ikon_Oszlop_edblock338:
	ld a,[localVariable_Ikon_Oszlop_varPrefixed_r]
	ret
	ret
end_procedure_Ikon_Oszlop:
	; ***********  Defining procedure : Ikon_Kep
	;    Procedure type : User-defined procedure
localVariable_Ikon_Kep_x:	db	0
localVariable_Ikon_Kep_y:	db	0
localVariable_Ikon_Kep_varPrefixed_d:	dw	0
Ikon_Kep_block352:
Ikon_Kep:
	; Variable is 16-bit
	ld hl,[localVariable_Ikon_Kep_varPrefixed_d]
	; Casting from integer to byte
	ld a,l
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
	; Storing to array  
	ld a,[localVariable_Ikon_Kep_x]
	ld [Pumpa+$f],a
	; Storing to array  
	ld a,[localVariable_Ikon_Kep_y]
	ld [Pumpa+$10],a
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Pumpa
	ld [GE_Sprite_this],hl
	call GE_Sprite_Put
	ret
end_procedure_Ikon_Kep:
	; ***********  Defining procedure : Ikon_Rajz
	;    Procedure type : User-defined procedure
localVariable_Ikon_Rajz_x:	db	0
localVariable_Ikon_Rajz_varPrefixed_d:	dw	0
localVariable_Ikon_Rajz_j:	db	0
localVariable_Ikon_Rajz_varPrefixed_e:	db	0
Ikon_Rajz_block353:
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
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_j]
	cp $2
	jr nz,Ikon_Rajz_edblock358
Ikon_Rajz_localsuccess360: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	or a
	jr nz,Ikon_Rajz_edblock358
Ikon_Rajz_ctb356: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa2_Data
	add hl,de
	; Loading pointer
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
Ikon_Rajz_edblock358:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $1
	jr nz,Ikon_Rajz_edblock365
Ikon_Rajz_ctb363: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Fal_Data
	add hl,de
	; Loading pointer
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
Ikon_Rajz_edblock365:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $2
	jr nz,Ikon_Rajz_edblock371
Ikon_Rajz_ctb369: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,BombaIkon_Data
	add hl,de
	; Loading pointer
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
Ikon_Rajz_edblock371:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $3
	jr nz,Ikon_Rajz_edblock377
Ikon_Rajz_ctb375: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$c3
	; Variable is 16-bit
	ld hl,Akna_Data
	add hl,de
	; Loading pointer
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
Ikon_Rajz_edblock377:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Rajz_varPrefixed_e]
	cp $4
	jr nz,Ikon_Rajz_edblock383
Ikon_Rajz_ctb381: ;Main true block ;keep :
	; generic assign 
	ld de,$3
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_Ikon_Rajz_varPrefixed_d],hl
Ikon_Rajz_edblock383:
	; generic assign 
	ld a,[localVariable_Ikon_Rajz_x]
	ld [localVariable_Ikon_Kep_x], a
	ld a, $1e
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_Ikon_Rajz_varPrefixed_d]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	ret
end_procedure_Ikon_Rajz:
	; Versus: a j. játékos jelölője (a Keret-grafikája, álló) a kiválasztott eszköz-ikon köré 
	; ***********  Defining procedure : Jelolo_Rajz
	;    Procedure type : User-defined procedure
localVariable_Jelolo_Rajz_x:	db	0
localVariable_Jelolo_Rajz_j:	db	0
Jelolo_Rajz_block386:
Jelolo_Rajz:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jelolo_Rajz_j]
	cp $1
	jp nz,Jelolo_Rajz_eblock389
Jelolo_Rajz_ctb388: ;Main true block ;keep :
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
	jp Jelolo_Rajz_edblock390
Jelolo_Rajz_eblock389:
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
Jelolo_Rajz_edblock390:
	ret
end_procedure_Jelolo_Rajz:
	; A j. jatekos eszkoz-ikonjai a 0. sorban (csak az engedelyezettek, hezag nelkul) + a jelolo 
	; ***********  Defining procedure : Ikon_Sor
	;    Procedure type : User-defined procedure
localVariable_Ikon_Sor_j:	db	0
Ikon_Sor_block399:
Ikon_Sor:
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $0
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	cp $1
	jr nz,Ikon_Sor_edblock403
Ikon_Sor_ctb401: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $1
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Ikon_Sor_edblock403:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Ikon_Sor_edblock409
Ikon_Sor_ctb407: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $2
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Ikon_Sor_edblock409:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Akna_Engedve]
	cp $1
	jr nz,Ikon_Sor_edblock415
Ikon_Sor_ctb413: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $3
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Ikon_Sor_edblock415:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[VirusLe_Engedve]
	cp $1
	jr nz,Ikon_Sor_edblock421
Ikon_Sor_ctb419: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Ikon_Rajz_j], a
	ld a, $4
	ld [localVariable_Ikon_Rajz_varPrefixed_e], a
	call Ikon_Rajz
Ikon_Sor_edblock421:
	; generic assign 
	ld a,[localVariable_Ikon_Sor_j]
	ld [localVariable_Jelolo_Rajz_j], a
	call Jelolo_Rajz
	ret
end_procedure_Ikon_Sor:
	; Árak középen, soronként középre igazítva: pumpa ikon : ár / bevétel (y=4), fal ikon : ár (y=14), bomba ikon : ár (y=24); a 0. sor (a pálya fölött) = eszköz-választó ikonok + jelölő (P1 bal, P2 jobb) - csak pályabetöltéskor 
	; ***********  Defining procedure : Arak_OSD
	;    Procedure type : User-defined procedure
localVariable_Arak_OSD_ax:	db	0
localVariable_Arak_OSD_w:	db	0
localVariable_Arak_OSD_bx:	db	0
localVariable_Arak_OSD_sor:	db	0
Arak_OSD_block424:
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
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	; generic assign 
	ld a,[localVariable_Arak_OSD_ax]
	ld [localVariable_Ikon_Kep_x], a
	ld a, $4
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
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
	; Variable is 16-bit
	ld hl,[Pumpa_termel]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $4
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; az eszköz-ikonok a 0. sorban: a fal és a bomba csak ha az adott pályán engedélyezett 
	ld a, $1
	ld [localVariable_Ikon_Sor_j], a
	call Ikon_Sor
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Arak_OSD_edblock429
Arak_OSD_ctb427: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Ikon_Sor_j], a
	call Ikon_Sor
Arak_OSD_edblock429:
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
	jr nz,Arak_OSD_edblock436
Arak_OSD_ctb434: ;Main true block ;keep :
	; a fal ára csak ha a pályán építhető fal 
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Fal_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	; generic assign 
	ld a,[localVariable_Arak_OSD_bx]
	ld [localVariable_Ikon_Kep_x], a
	ld a, $d
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
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
Arak_OSD_edblock436:
	; a bomba, az akna es a virus ara egy sorban (y=24), egymas mellett, egyutt kozepre; ha nincs fal es csak egy elem van, a pumpa ala (y=14) 
	; generic assign 
	ld a,[Akna_Engedve]
	ld b,a
	ld a,[Bomba_Engedve]
	add  a, b
	ld [localVariable_Arak_OSD_ax], a
	; 'a:=a + expression'  optimization 
	ld a,[VirusLe_Engedve]
	ld b,a
	ld a,[localVariable_Arak_OSD_ax]
	add  a, b
	ld [localVariable_Arak_OSD_ax], a
	ld a, $18
	ld [localVariable_Arak_OSD_sor], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Arak_OSD_edblock442
Arak_OSD_ctb440: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Arak_OSD_ax]
	cp $1
	jr nz,Arak_OSD_edblock454
Arak_OSD_ctb452: ;Main true block ;keep :
	ld a, $e
	ld [localVariable_Arak_OSD_sor], a
Arak_OSD_edblock454:
Arak_OSD_edblock442:
	ld a, $42
	ld [localVariable_Arak_OSD_bx], a
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_w]
	add  a, $2
	ld [localVariable_Arak_OSD_ax], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock459
Arak_OSD_ctb457: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Arak_OSD_ax]
	ld b,a
	ld a,[localVariable_Arak_OSD_bx]
	sub  b
	ld [localVariable_Arak_OSD_bx], a
Arak_OSD_edblock459:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Akna_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock465
Arak_OSD_ctb463: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Arak_OSD_ax]
	ld b,a
	ld a,[localVariable_Arak_OSD_bx]
	sub  b
	ld [localVariable_Arak_OSD_bx], a
Arak_OSD_edblock465:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[VirusLe_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock471
Arak_OSD_ctb469: ;Main true block ;keep :
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Arak_OSD_ax]
	ld b,a
	ld a,[localVariable_Arak_OSD_bx]
	sub  b
	ld [localVariable_Arak_OSD_bx], a
Arak_OSD_edblock471:
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
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_sor]
	sub  $1
	ld [localVariable_Arak_OSD_ax], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Bomba_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock477
Arak_OSD_ctb475: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,BombaIkon_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	; generic assign 
	ld a,[localVariable_Arak_OSD_bx]
	ld [localVariable_Ikon_Kep_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_ax]
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_bx]
	add  a, $3
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_sor]
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
	ld a,[localVariable_Arak_OSD_sor]
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Arak_OSD_w]
	ld b,a
	ld a,[localVariable_Arak_OSD_bx]
	add  a, b
	ld [localVariable_Arak_OSD_bx], a
	; 'a:=a + const'  optimization 
	add  a,$2
	ld [localVariable_Arak_OSD_bx], a
Arak_OSD_edblock477:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Akna_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock483
Arak_OSD_ctb481: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$c3
	; Variable is 16-bit
	ld hl,Akna_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	; generic assign 
	ld a,[localVariable_Arak_OSD_bx]
	ld [localVariable_Ikon_Kep_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_ax]
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_bx]
	add  a, $3
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_sor]
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Akna_price]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_sor]
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	; 'a:=a + expression'  optimization 
	ld a,[localVariable_Arak_OSD_w]
	ld b,a
	ld a,[localVariable_Arak_OSD_bx]
	add  a, b
	ld [localVariable_Arak_OSD_bx], a
	; 'a:=a + const'  optimization 
	add  a,$2
	ld [localVariable_Arak_OSD_bx], a
Arak_OSD_edblock483:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[VirusLe_Engedve]
	cp $1
	jr nz,Arak_OSD_edblock489
Arak_OSD_ctb487: ;Main true block ;keep :
	; generic assign 
	ld de,$3
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Ikon_D],hl
	; generic assign 
	ld a,[localVariable_Arak_OSD_bx]
	ld [localVariable_Ikon_Kep_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_ax]
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Arak_OSD_bx]
	add  a, $3
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_sor]
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Virus_price]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	; generic assign 
	ld a,[localVariable_Arak_OSD_sor]
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
Arak_OSD_edblock489:
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
	jr nz,Cash2_OSD_edblock497
Cash2_OSD_ctb495: ;Main true block ;keep :
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
Cash2_OSD_edblock497:
	ret
end_procedure_Cash2_OSD:
	; A lerakott pumpák száma a HUD-ra, 3 jegyen (co-op: a két játékos ÖSSZEGE, max 255) 
	; ***********  Defining procedure : Pump_OSD
	;    Procedure type : User-defined procedure
localVariable_Pump_OSD_s:	dw	0
Pump_OSD_block500:
Pump_OSD:
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
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
	jr nz,Pump_OSD_edblock504
Pump_OSD_ctb502: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Pump2_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
Pump_OSD_edblock504:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,Pump_OSD_edblock510
Pump_OSD_ctb508: ;Main true block ;keep :
	; két játékos: a 2. játékos pumpái  egy játékos és co-op: a (közös) összeg a pálya alatt, a cél előtt 
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	; Loading pointer
	ld [localVariable_Pump_OSD_s],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Pumpa_db2]
	; Variable is 16-bit
	ld hl,[localVariable_Pump_OSD_s]
	add  hl,de
	ld [localVariable_Pump_OSD_s],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ossz_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e0
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
Pump_OSD_edblock510:
	ret
end_procedure_Pump_OSD:
	; A teljes térkép egyszeri kirajzolása induláskor 
	; ***********  Defining procedure : MapToScreen
	;    Procedure type : User-defined procedure
localVariable_MapToScreen_mapx:	db	0
localVariable_MapToScreen_mapy:	db	0
localVariable_MapToScreen_data:	dw	0
MapToScreen_block513:
MapToScreen:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_MapToScreen_data],hl
	ld a, $1
	ld [localVariable_MapToScreen_mapy], a
MapToScreen_forloop514:
	ld a, $1
	ld [localVariable_MapToScreen_mapx], a
MapToScreen_forloop558:
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
	jr nz,MapToScreen_edblock565
MapToScreen_ctb563: ;Main true block ;keep :
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
MapToScreen_edblock565:
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
MapToScreen_loopstart559:
	ld a,[localVariable_MapToScreen_mapx]
	add a,1
	ld [localVariable_MapToScreen_mapx],a
	cp $1e+1
	jp nz,MapToScreen_forloop558
MapToScreen_loopend560:
MapToScreen_loopstart515:
	ld a,[localVariable_MapToScreen_mapy]
	add a,1
	ld [localVariable_MapToScreen_mapy],a
	cp $12+1
	jp nz,MapToScreen_forloop514
MapToScreen_loopend516:
	; HUD (minden módban ugyanaz, a 2. játékos részei csak két játékosnál): 1. sor "P1$:0990 ... P2$:0450", 2. sor "[pumpa]:023 ... [pumpa]:017", középen az árak; a pálya alatt (nem versus) LIVES, LVL, cél "[pumpa]:össz/cél"; a feliratok helye láncolva (Ir_X) 
	ld a, $2
	ld [Ir_X], a
	ld a, $4
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,MapToScreen_stringassignstr577
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
	jr nz,MapToScreen_edblock581
MapToScreen_ctb579: ;Main true block ;keep :
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
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock581:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jp nz,MapToScreen_edblock589
MapToScreen_ctb587: ;Main true block ;keep :
	; a 2. játékos: jobbra igazítva, a jobb szél a 62. byte 
	; Assigning a string : Ir_Szoveg
	ld hl,MapToScreen_stringassignstr617
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
	ld hl,MapToScreen_stringassignstr620
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
	jr nz,MapToScreen_edblock625
MapToScreen_ctb623: ;Main true block ;keep :
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
MapToScreen_edblock625:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	or a
	jr nz,MapToScreen_edblock631
MapToScreen_ctb629: ;Main true block ;keep :
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa2_Data
	add hl,de
	ld a,l
	ld [Pumpa+$2],a
	ld a,h
	ld [Pumpa+$2+1],a
MapToScreen_edblock631:
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
	jr nz,MapToScreen_edblock636
MapToScreen_ctb634: ;Main true block ;keep :
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
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock636:
	call Cash2_OSD
MapToScreen_edblock589:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jp nz,MapToScreen_edblock642
MapToScreen_ctb640: ;Main true block ;keep :
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
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	ld a, $e0
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
MapToScreen_edblock642:
	call Level_OSD
	; LVL a pálya alatt 
	call Cash_OSD
	call Pump_OSD
	call Arak_OSD
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,MapToScreen_edblock652
MapToScreen_ctb650: ;Main true block ;keep :
	; árak középen + eszköz-választó ikonok  a pályanév NINCS kiírva (a felhasználó döntése, 2026-10-03; a helyén a meteor-figyelmeztetés villog). A Palya_Nev/Palya2_Nev adat megvan, a Nev_Kiir eljárás a .bak_meteorfigy-ben 
	call Elet_OSD
MapToScreen_edblock652:
	ret
end_procedure_MapToScreen:
	; ***********  Defining procedure : Enemy_Kirak
	;    Procedure type : User-defined procedure
localVariable_Enemy_Kirak_varPrefixed_p:	dw	0
localVariable_Enemy_Kirak_x:	db	0
localVariable_Enemy_Kirak_y:	db	0
localVariable_Enemy_Kirak_faz:	db	0
Enemy_Kirak_block655:
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
Fal_Kirak_block656:
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
Talaj2_Kirak_block657:
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
Enemyk_Ujrarajzol_block658:
Enemyk_Ujrarajzol:
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
Enemyk_Ujrarajzol_while659:
Enemyk_Ujrarajzol_loopstart663:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock662
Enemyk_Ujrarajzol_ctb660: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
Enemyk_Ujrarajzol_while736:
Enemyk_Ujrarajzol_loopstart740:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	cp $3
	jp nc,Enemyk_Ujrarajzol_edblock739
Enemyk_Ujrarajzol_ctb737: ;Main true block ;keep :
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
	jp c, Enemyk_Ujrarajzol_edblock746
Enemyk_Ujrarajzol_localsuccess747: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Enemyk_Ujrarajzol_edblock746
Enemyk_Ujrarajzol_ctb744: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	cp $1
	jp c, Enemyk_Ujrarajzol_edblock752
Enemyk_Ujrarajzol_localsuccess753: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Enemyk_Ujrarajzol_cy]
	ld b,a
	ld a,$12
	cp b
	jp c,Enemyk_Ujrarajzol_edblock752
Enemyk_Ujrarajzol_ctb750: ;Main true block ;keep :
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
	jr c, Enemyk_Ujrarajzol_edblock759
Enemyk_Ujrarajzol_localsuccess760: ;keep:
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
	jr c,Enemyk_Ujrarajzol_edblock759
Enemyk_Ujrarajzol_ctb757: ;Main true block ;keep :
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
Enemyk_Ujrarajzol_edblock759:
Enemyk_Ujrarajzol_edblock752:
Enemyk_Ujrarajzol_edblock746:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dx]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dx], a
	jp Enemyk_Ujrarajzol_while736
Enemyk_Ujrarajzol_edblock739:
Enemyk_Ujrarajzol_loopend741:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Ujrarajzol_dy]
	add  a,$1
	ld [localVariable_Enemyk_Ujrarajzol_dy], a
	jp Enemyk_Ujrarajzol_while659
Enemyk_Ujrarajzol_edblock662:
Enemyk_Ujrarajzol_loopend664:
	ret
end_procedure_Enemyk_Ujrarajzol:
	; ***********  Defining procedure : Keret_Erint
	;    Procedure type : User-defined procedure
localVariable_Keret_Erint_cx:	db	0
localVariable_Keret_Erint_cy:	db	0
localVariable_Keret_Erint_varPrefixed_r:	db	0
localVariable_Keret_Erint_x:	db	0
localVariable_Keret_Erint_y:	db	0
Keret_Erint_block762:
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
	jr c, Keret_Erint_edblock766
Keret_Erint_localsuccess775: ;keep:
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
	jr c, Keret_Erint_edblock766
Keret_Erint_ctb764: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret_Y_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cy]
	cp b
	jr c, Keret_Erint_edblock780
Keret_Erint_localsuccess781: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cy]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret_Y_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock780
Keret_Erint_ctb778: ;Main true block ;keep :
	ld a, $1
	ld [Keret_Sereles], a
	ld [localVariable_Keret_Erint_varPrefixed_r], a
Keret_Erint_edblock780:
Keret_Erint_edblock766:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Keret_Erint_edblock786
Keret_Erint_ctb784: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret2_X_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cx]
	cp b
	jr c, Keret_Erint_edblock812
Keret_Erint_localsuccess813: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cx]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret2_X_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock812
Keret_Erint_ctb810: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Keret2_Y_Pos]
	ld b,a
	ld a,[localVariable_Keret_Erint_cy]
	cp b
	jr c, Keret_Erint_edblock818
Keret_Erint_localsuccess819: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Keret_Erint_cy]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Keret2_Y_Pos]
	add  a, $2
	cp b
	jr c, Keret_Erint_edblock818
Keret_Erint_ctb816: ;Main true block ;keep :
	ld a, $1
	ld [Keret2_Sereles], a
	ld [localVariable_Keret_Erint_varPrefixed_r], a
Keret_Erint_edblock818:
Keret_Erint_edblock812:
Keret_Erint_edblock786:
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
	jr nz,Keret2_Kirak_edblock829
Keret2_Kirak_ctb827: ;Main true block ;keep :
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
Keret2_Kirak_edblock829:
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
	jr nz,Keret2_Le_edblock840
Keret2_Le_ctb838: ;Main true block ;keep :
	ld hl,Keret2
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Keret2_Le_edblock840:
	ret
end_procedure_Keret2_Le:
	; ***********  Defining procedure : Eszkoz_Valt
	;    Procedure type : User-defined procedure
localVariable_Eszkoz_Valt_regi:	db	0
localVariable_Eszkoz_Valt_j:	db	0
localVariable_Eszkoz_Valt_varPrefixed_e:	db	0
Eszkoz_Valt_block843:
Eszkoz_Valt:
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Eszkoz_Valt_regi], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Valt_j]
	cp $2
	jr nz,Eszkoz_Valt_edblock847
Eszkoz_Valt_ctb845: ;Main true block ;keep :
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Eszkoz_Valt_regi], a
Eszkoz_Valt_edblock847:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Eszkoz_Valt_regi]
	ld b,a
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	cp b
	jr z, Eszkoz_Valt_edblock853
Eszkoz_Valt_ctb851: ;Main true block ;keep :
	call Keret2_Le
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Valt_j]
	cp $1
	jr nz,Eszkoz_Valt_eblock866
Eszkoz_Valt_ctb865: ;Main true block ;keep :
	ld hl,Jelol1
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; a régi jelölő le (alatta az ikon) 
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	ld [Eszkoz1], a
	jr Eszkoz_Valt_edblock867
Eszkoz_Valt_eblock866:
	ld hl,Jelol2
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_varPrefixed_e]
	ld [Eszkoz2], a
Eszkoz_Valt_edblock867:
	; generic assign 
	ld a,[localVariable_Eszkoz_Valt_j]
	ld [localVariable_Jelolo_Rajz_j], a
	call Jelolo_Rajz
	call Keret_SpriteKirak
	call Keret2_Kirak
Eszkoz_Valt_edblock853:
	ret
end_procedure_Eszkoz_Valt:
	; A j. játékos a következő ENGEDÉLYEZETT eszközre vált, körbe: pumpa, [fal], [bomba] (M = 1. játékos, Y = 2. játékos) 
	; ***********  Defining procedure : Eszkoz_Kovetkezo
	;    Procedure type : User-defined procedure
localVariable_Eszkoz_Kovetkezo_uj:	db	0
localVariable_Eszkoz_Kovetkezo_k:	db	0
localVariable_Eszkoz_Kovetkezo_j:	db	0
Eszkoz_Kovetkezo_block870:
Eszkoz_Kovetkezo:
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Eszkoz_Kovetkezo_uj], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_j]
	cp $2
	jr nz,Eszkoz_Kovetkezo_edblock874
Eszkoz_Kovetkezo_ctb872: ;Main true block ;keep :
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Eszkoz_Kovetkezo_uj], a
Eszkoz_Kovetkezo_edblock874:
	ld a, $0
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_while877:
Eszkoz_Kovetkezo_loopstart881:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_k]
	or a
	jr nz,Eszkoz_Kovetkezo_edblock880
Eszkoz_Kovetkezo_ctb878: ;Main true block ;keep :
	; a következő engedélyezett eszköz (a pumpa mindig az, így véget ér) 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	add  a,$1
	ld [localVariable_Eszkoz_Kovetkezo_uj], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $4
	jr c, Eszkoz_Kovetkezo_edblock924
	jr z, Eszkoz_Kovetkezo_edblock924
Eszkoz_Kovetkezo_ctb922: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Eszkoz_Kovetkezo_uj], a
Eszkoz_Kovetkezo_edblock924:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	or a
	jr nz,Eszkoz_Kovetkezo_edblock929
Eszkoz_Kovetkezo_ctb927: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_edblock929:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	cp $1
	jr nz,Eszkoz_Kovetkezo_edblock934
Eszkoz_Kovetkezo_ctb932: ;Main true block ;keep :
	; generic assign 
	ld a,[Fal_Engedve]
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_edblock934:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	cp $2
	jr nz,Eszkoz_Kovetkezo_edblock939
Eszkoz_Kovetkezo_ctb937: ;Main true block ;keep :
	; generic assign 
	ld a,[Bomba_Engedve]
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_edblock939:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	cp $3
	jr nz,Eszkoz_Kovetkezo_edblock944
Eszkoz_Kovetkezo_ctb942: ;Main true block ;keep :
	; generic assign 
	ld a,[Akna_Engedve]
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_edblock944:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	cp $4
	jr nz,Eszkoz_Kovetkezo_edblock949
Eszkoz_Kovetkezo_ctb947: ;Main true block ;keep :
	; generic assign 
	ld a,[VirusLe_Engedve]
	ld [localVariable_Eszkoz_Kovetkezo_k], a
Eszkoz_Kovetkezo_edblock949:
	jr Eszkoz_Kovetkezo_while877
Eszkoz_Kovetkezo_edblock880:
Eszkoz_Kovetkezo_loopend882:
	; generic assign 
	ld a,[localVariable_Eszkoz_Kovetkezo_j]
	ld [localVariable_Eszkoz_Valt_j], a
	; generic assign 
	ld a,[localVariable_Eszkoz_Kovetkezo_uj]
	ld [localVariable_Eszkoz_Valt_varPrefixed_e], a
	call Eszkoz_Valt
	ret
end_procedure_Eszkoz_Kovetkezo:
	; ***********  Defining procedure : Pumpa_Torol
	;    Procedure type : User-defined procedure
localVariable_Pumpa_Torol_mp:	dw	0
localVariable_Pumpa_Torol_x:	db	0
localVariable_Pumpa_Torol_y:	db	0
Pumpa_Torol_block951:
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
	jr c, Pumpa_Torol_edblock956
Pumpa_Torol_localsuccess964: ;keep:
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
	jr nc,Pumpa_Torol_edblock956
Pumpa_Torol_ctb954: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpa_Torol_edblock969
	jr z, Pumpa_Torol_edblock969
Pumpa_Torol_ctb967: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	xor a ; clear carry
	sbc hl,de
	ld [Pumpa_db],hl
Pumpa_Torol_edblock969:
	call Pump_OSD
Pumpa_Torol_edblock956:
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
	jr c, Pumpa_Torol_edblock974
Pumpa_Torol_localsuccess982: ;keep:
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
	jr nc,Pumpa_Torol_edblock974
Pumpa_Torol_ctb972: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpa_Torol_edblock987
	jr z, Pumpa_Torol_edblock987
Pumpa_Torol_ctb985: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	xor a ; clear carry
	sbc hl,de
	ld [Pumpa_db2],hl
Pumpa_Torol_edblock987:
	; a 2. játékos pumpája 
	call Pump_OSD
Pumpa_Torol_edblock974:
	ret
end_procedure_Pumpa_Torol:
	; AKNA lepes (vsync ELOTT, asm): Akna_Utem kepkockankent minden akna egy lepest lep, a 16. utan robban; a mar nem letezo aknat kiveszi a listabol 
	; ***********  Defining procedure : Akna_Lep
	;    Procedure type : User-defined procedure
Akna_Lep:
			ld a,[Akna_Frame]
			inc a
			ld hl,Akna_Utem
			cp (hl)
			jr nc,AknaL_lep
			ld [Akna_Frame],a
			jp AknaL_vege
AknaL_lep:
			xor a
			ld [Akna_Frame],a
			ld c,a
AknaL_ciklus:
			ld a,[Akna_Db]
			cp c
			jr z,AknaL_kesz
			jr c,AknaL_kesz
			ld l,c
			ld h,0
			add hl,hl
			ld de,Akna_Mp
			add hl,de
			ld e,(hl)
			inc hl
			ld d,(hl)
			ld hl,Map
			add hl,de
			ld a,(hl)
			sub 41
			cp 16
			jr nc,AknaL_torol
			inc a
			cp 16
			jr c,AknaL_ok
			ld a,[Akna_Robban]
			or a
			jr nz,AknaL_mar
			inc a
			ld [Akna_Robban],a
			ld [Akna_Idx],de
AknaL_mar:
			ld a,15
AknaL_ok:
			add a,41
			ld (hl),a
			ld a,1
			ld [Akna_Rajz],a
			inc c
			jr AknaL_ciklus
AknaL_torol:
			ld a,[Akna_Db]
			dec a
			ld [Akna_Db],a
			ld l,a
			ld h,0
			add hl,hl
			ld de,Akna_Mp
			add hl,de
			ld e,(hl)
			inc hl
			ld d,(hl)
			ld l,c
			ld h,0
			add hl,hl
			push de
			ld de,Akna_Mp
			add hl,de
			pop de
			ld (hl),e
			inc hl
			ld (hl),d
			jr AknaL_ciklus
AknaL_kesz:
			ld a,[Akna_Rajz]
			or a
			jr z,AknaL_vege
			ld [Keret_Pumpa_Valt],a
			ld [Keret2_Pumpa_Valt],a
AknaL_vege:
		
	ret
end_procedure_Akna_Lep:
	; AKNA kirakas (vsync UTAN, a PumpakKirak vegen, asm): ha leptek, minden aknat ujrarajzol 
	; ***********  Defining procedure : Akna_Kirak
	;    Procedure type : User-defined procedure
Akna_Kirak:
			ld a,[Akna_Rajz]
			or a
			jr z,AknaK_vege
			xor a
			ld [Akna_Rajz],a
			ld c,a
AknaK_ciklus:
			ld a,[Akna_Db]
			cp c
			jr z,AknaK_vege
			jr c,AknaK_vege
			ld l,c
			ld h,0
			add hl,hl
			ld de,Akna_Mp
			add hl,de
			ld e,(hl)
			inc hl
			ld d,(hl)
			ld hl,Map
			add hl,de
			ld a,(hl)
			sub 41
			cp 16
			jr nc,AknaK_kov
			add a,16
			ld [WaterPump_Faz],a
			ld [WaterPump_Idx],de
			push bc
			call WaterPump_PutAt
			pop bc
AknaK_kov:
			inc c
			jr AknaK_ciklus
AknaK_vege:
		
	ret
end_procedure_Akna_Kirak:
	; uj akna a listaba (MapPos), asm 
	; ***********  Defining procedure : Akna_Hozzaad
	;    Procedure type : User-defined procedure
Akna_Hozzaad:
			ld a,[Akna_Db]
			add a,a
			ld e,a
			ld d,0
			ld hl,Akna_Mp
			add hl,de
			ld de,[MapPos]
			ld (hl),e
			inc hl
			ld (hl),d
		
	; 'a:=a + const'  optimization 
	ld a,[Akna_Db]
	add  a,$1
	ld [Akna_Db], a
	ret
end_procedure_Akna_Hozzaad:
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
PumpakSzamol_block992:
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
PumpakSzamol_while995:
PumpakSzamol_loopstart999:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	cp $f
	jp nc,PumpakSzamol_edblock998
PumpakSzamol_ctb996: ;Main true block ;keep :
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
	jr c, PumpakSzamol_edblock1069
PumpakSzamol_localsuccess1070: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	cp b
	jr c, PumpakSzamol_edblock1069
	jr z, PumpakSzamol_edblock1069
PumpakSzamol_ctb1067: ;Main true block ;keep :
	; a pumpa-tartomány alapja: 1. (PumpaMap) vagy 2. játékos (Pumpa2Map) 
	; generic assign 
	ld a,[PumpaMap]
	ld [localVariable_PumpakSzamol_varPrefixed_b], a
PumpakSzamol_edblock1069:
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Pumpa2Map]
	ld b,a
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	cp b
	jr c, PumpakSzamol_edblock1075
PumpakSzamol_localsuccess1076: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Pumpa2Map]
	add  a, $8
	cp b
	jr c, PumpakSzamol_edblock1075
	jr z, PumpakSzamol_edblock1075
PumpakSzamol_ctb1073: ;Main true block ;keep :
	; generic assign 
	ld a,[Pumpa2Map]
	ld [localVariable_PumpakSzamol_varPrefixed_b], a
PumpakSzamol_edblock1075:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakSzamol_varPrefixed_b]
	or a
	jp z, PumpakSzamol_edblock1081
PumpakSzamol_ctb1079: ;Main true block ;keep :
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
	jr c, PumpakSzamol_edblock1086
PumpakSzamol_ctb1084: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_PumpakSzamol_faz], a
PumpakSzamol_edblock1086:
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
	jr c, PumpakSzamol_edblock1091
PumpakSzamol_localsuccess1092: ;keep:
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
	jr c,PumpakSzamol_edblock1091
PumpakSzamol_ctb1089: ;Main true block ;keep :
	ld a, $1
	ld [Keret_Pumpa_Valt], a
PumpakSzamol_edblock1091:
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
	jr c, PumpakSzamol_edblock1097
PumpakSzamol_localsuccess1098: ;keep:
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
	jr c,PumpakSzamol_edblock1097
PumpakSzamol_ctb1095: ;Main true block ;keep :
	ld a, $1
	ld [Keret2_Pumpa_Valt], a
PumpakSzamol_edblock1097:
PumpakSzamol_edblock1081:
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
	jr c, PumpakSzamol_edblock1103
PumpakSzamol_ctb1101: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakSzamol_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakSzamol_idx],hl
PumpakSzamol_edblock1103:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakSzamol_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakSzamol_varPrefixed_i], a
	jp PumpakSzamol_while995
PumpakSzamol_edblock998:
PumpakSzamol_loopend1000:
	ret
end_procedure_PumpakSzamol:
	; KIRAKÁSI fázis (vsync UTÁN, a rajzolási fázisban hívandó) 
	; ***********  Defining procedure : PumpakKirak
	;    Procedure type : User-defined procedure
localVariable_PumpakKirak_idx:	dw	0
localVariable_PumpakKirak_varPrefixed_i:	db	0
localVariable_PumpakKirak_faz:	db	0
localVariable_PumpakKirak_varPrefixed_m:	db	0
PumpakKirak_block1105:
PumpakKirak:
	; generic assign 
	; Variable is 16-bit
	ld hl,[PumpaScanPos]
	; Loading pointer
	ld [localVariable_PumpakKirak_idx],hl
	ld a, $0
	ld [localVariable_PumpakKirak_varPrefixed_i], a
PumpakKirak_while1106:
PumpakKirak_loopstart1110:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	cp $f
	jp nc,PumpakKirak_edblock1109
PumpakKirak_ctb1107: ;Main true block ;keep :
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
	jr c, PumpakKirak_edblock1143
PumpakKirak_localsuccess1144: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[PumpaMap]
	add  a, $8
	cp b
	jr c, PumpakKirak_edblock1143
	jr z, PumpakKirak_edblock1143
PumpakKirak_ctb1141: ;Main true block ;keep :
	; képindex a WaterPump fázistáblájában: 0..7 = 1. játékos, 8..15 = 2. játékos 
	; generic assign 
	ld a,[PumpaMap]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	sub  b
	ld [localVariable_PumpakKirak_faz], a
PumpakKirak_edblock1143:
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Pumpa2Map]
	ld b,a
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	cp b
	jr c, PumpakKirak_edblock1149
PumpakKirak_localsuccess1150: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_PumpakKirak_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[Pumpa2Map]
	add  a, $8
	cp b
	jr c, PumpakKirak_edblock1149
	jr z, PumpakKirak_edblock1149
PumpakKirak_ctb1147: ;Main true block ;keep :
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
PumpakKirak_edblock1149:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_PumpakKirak_faz]
	cp $ff
	jr z, PumpakKirak_edblock1155
PumpakKirak_ctb1153: ;Main true block ;keep :
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
PumpakKirak_edblock1155:
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
	jr c, PumpakKirak_edblock1160
PumpakKirak_ctb1158: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$21c
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_PumpakKirak_idx],hl
PumpakKirak_edblock1160:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_PumpakKirak_varPrefixed_i]
	add  a,$1
	ld [localVariable_PumpakKirak_varPrefixed_i], a
	jp PumpakKirak_while1106
PumpakKirak_edblock1109:
PumpakKirak_loopend1111:
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_PumpakKirak_idx]
	; Loading pointer
	ld [PumpaScanPos],hl
	call Akna_Kirak
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
Keret_Frissit_block1162:
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
	jr z, Keret_Frissit_edblock1167
Keret_Frissit_ctb1165: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_mozgott], a
Keret_Frissit_edblock1167:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Keret_Frissit_edblock1173
Keret_Frissit_ctb1171: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_mozgott], a
Keret_Frissit_edblock1173:
	ld a, $0
	ld [localVariable_Keret_Frissit_pumpavan], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret_Pumpa_Valt]
	cp $1
	jr nz,Keret_Frissit_edblock1179
Keret_Frissit_ctb1177: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_pumpavan], a
Keret_Frissit_edblock1179:
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
	jr z, Keret_Frissit_edblock1185
Keret_Frissit_ctb1183: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1185:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_mozgott]
	or a
	jr z, Keret_Frissit_edblock1191
Keret_Frissit_ctb1189: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv], a
Keret_Frissit_edblock1191:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_pumpavan]
	or a
	jr z, Keret_Frissit_edblock1197
Keret_Frissit_ctb1195: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1197:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vir]
	cp $1
	jr nz,Keret_Frissit_edblock1203
Keret_Frissit_ctb1201: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell], a
Keret_Frissit_edblock1203:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vir]
	cp $1
	jr nz,Keret_Frissit_edblock1209
Keret_Frissit_ctb1207: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv], a
Keret_Frissit_edblock1209:
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
	jr z, Keret_Frissit_edblock1215
Keret_Frissit_ctb1213: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1215:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret2_Y_Pos]
	cp b
	jr z, Keret_Frissit_edblock1221
Keret_Frissit_ctb1219: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1221:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Sereles]
	cp $1
	jr nz,Keret_Frissit_edblock1227
Keret_Frissit_ctb1225: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_vv2], a
Keret_Frissit_edblock1227:
	ld a, $0
	ld [Keret2_Sereles], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv2]
	cp $1
	jr nz,Keret_Frissit_edblock1233
Keret_Frissit_ctb1231: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell2], a
Keret_Frissit_edblock1233:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Pumpa_Valt]
	cp $1
	jr nz,Keret_Frissit_edblock1239
Keret_Frissit_ctb1237: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Keret_Frissit_kell2], a
Keret_Frissit_edblock1239:
	ld a, $0
	ld [Keret2_Pumpa_Valt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell2]
	cp $1
	jr nz,Keret_Frissit_edblock1245
Keret_Frissit_ctb1243: ;Main true block ;keep :
	call Keret2_Le
Keret_Frissit_edblock1245:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1251
Keret_Frissit_ctb1249: ;Main true block ;keep :
	; felső réteg le 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Keret_Frissit_edblock1251:
	call PumpakKirak
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1257
Keret_Frissit_ctb1255: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv]
	cp $1
	jr nz,Keret_Frissit_edblock1269
Keret_Frissit_ctb1267: ;Main true block ;keep :
	; A RestoreBackground által elkent vírus-mezők helyreállítása a valós fázisukra 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Keret_Frissit_edblock1269:
Keret_Frissit_edblock1257:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_vv2]
	cp $1
	jr nz,Keret_Frissit_edblock1274
Keret_Frissit_ctb1272: ;Main true block ;keep :
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Keret_Frissit_edblock1274:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell]
	cp $1
	jr nz,Keret_Frissit_edblock1280
Keret_Frissit_ctb1278: ;Main true block ;keep :
	call Keret_XY_Calc
	call Keret_SpriteKirak
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [Keret_Elozo_X_Pos], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [Keret_Elozo_Y_Pos], a
Keret_Frissit_edblock1280:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Keret_Frissit_kell2]
	cp $1
	jr nz,Keret_Frissit_edblock1286
Keret_Frissit_ctb1284: ;Main true block ;keep :
	call Keret2_Kirak
Keret_Frissit_edblock1286:
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
	jr nz,Tick_Hang_edblock1293
Tick_Hang_ctb1291: ;Main true block ;keep :
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
Tick_Hang_edblock1293:
	ret
end_procedure_Tick_Hang:
	; pumpa lerakása a (px,py) mezőre; j = 1: az 1. játékos pénzéből/pumpája, j = 2: a 2. játékosé (versus) 
	; ***********  Defining procedure : DrillLerak
	;    Procedure type : User-defined procedure
localVariable_DrillLerak_penz:	dw	0
localVariable_DrillLerak_px:	db	0
localVariable_DrillLerak_py:	db	0
localVariable_DrillLerak_j:	db	0
DrillLerak_block1296:
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
	jr nz,DrillLerak_edblock1301
DrillLerak_ctb1299: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_DrillLerak_penz],hl
DrillLerak_edblock1301:
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
	jp nz,DrillLerak_localfailed1354
	jp DrillLerak_ctb1305
DrillLerak_localfailed1354: ;keep:
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
	jp nz,DrillLerak_edblock1307
DrillLerak_ctb1305: ;Main true block ;keep :
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
	jp c, DrillLerak_edblock1359
DrillLerak_ctb1357: ;Main true block ;keep :
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
	jr nz,DrillLerak_eblock1363
DrillLerak_ctb1362: ;Main true block ;keep :
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
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	add  hl,de
	ld [Pumpa_db2],hl
	call Cash2_OSD
	; co-op: a 2. játékos pénze 
	call Pump_OSD
	jr DrillLerak_edblock1364
DrillLerak_eblock1363:
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
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	add  hl,de
	ld [Pumpa_db],hl
	; termeléshez: hány pumpa van összesen 
	call Cash_OSD
	; pénz-kijelző frissítése 
	call Pump_OSD
DrillLerak_edblock1364:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_DrillLerak_j]
	cp $2
	jr nz,DrillLerak_eblock1369
DrillLerak_ctb1368: ;Main true block ;keep :
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
	jr DrillLerak_edblock1370
DrillLerak_eblock1369:
	; generic assign 
	; Variable is 16-bit
	ld hl,[MapPos]
	; Loading pointer
	ld [WaterPump_Idx],hl
	; generic assign 
	ld a,[Pumpa_Uj_Faz]
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
DrillLerak_edblock1370:
	; 'a:=a + const'  optimization 
	ld a,[Pumpa_Uj_Faz]
	add  a,$1
	ld [Pumpa_Uj_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, DrillLerak_edblock1376
DrillLerak_ctb1374: ;Main true block ;keep :
	ld a, $0
	ld [Pumpa_Uj_Faz], a
DrillLerak_edblock1376:
	call Keret_SpriteKirak
	call Keret2_Kirak
	; a 2. Keret fölé 
	call Tick_Hang
DrillLerak_edblock1359:
DrillLerak_edblock1307:
	ret
end_procedure_DrillLerak:
	; fal (akna = 0) vagy akna (akna = 1) a (px,py) mezőre; j = 1/2: kinek a pénzéből 
	; ***********  Defining procedure : TeglaLerak
	;    Procedure type : User-defined procedure
localVariable_TeglaLerak_penz:	dw	0
localVariable_TeglaLerak_ar:	dw	0
localVariable_TeglaLerak_px:	db	0
localVariable_TeglaLerak_py:	db	0
localVariable_TeglaLerak_j:	db	0
localVariable_TeglaLerak_akna:	db	0
TeglaLerak_block1378:
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
	jr nz,TeglaLerak_edblock1383
TeglaLerak_ctb1381: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_TeglaLerak_penz],hl
TeglaLerak_edblock1383:
	; generic assign 
	; Variable is 16-bit
	ld hl,[Tegla_price]
	; Loading pointer
	ld [localVariable_TeglaLerak_ar],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_akna]
	cp $1
	jr nz,TeglaLerak_edblock1389
TeglaLerak_ctb1387: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Akna_price]
	; Loading pointer
	ld [localVariable_TeglaLerak_ar],hl
TeglaLerak_edblock1389:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_akna]
	cp $1
	jr nz,TeglaLerak_edblock1395
TeglaLerak_ctb1393: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[Akna_Db]
	cp $8
	jr c, TeglaLerak_edblock1407
TeglaLerak_ctb1405: ;Main true block ;keep :
	; generic assign 
	ld hl,$7530
	; Loading pointer
	ld [localVariable_TeglaLerak_ar],hl
TeglaLerak_edblock1407:
TeglaLerak_edblock1395:
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
	jp nz,TeglaLerak_localfailed1448
	jp TeglaLerak_ctb1410
TeglaLerak_localfailed1448: ;keep:
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
	jp nz,TeglaLerak_edblock1412
TeglaLerak_ctb1410: ;Main true block ;keep :
	; a 2. Keret fölé 
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[localVariable_TeglaLerak_ar]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_TeglaLerak_penz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jp c, TeglaLerak_edblock1453
TeglaLerak_ctb1451: ;Main true block ;keep :
	call Keret2_Le
	; a 2. Keret (felül) is le 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_akna]
	cp $1
	jr nz,TeglaLerak_eblock1457
TeglaLerak_ctb1456: ;Main true block ;keep :
	; Storing to array  
	; Variable is 16-bit
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	ld a,[AknaMap]
	ld [hl],a 
	; generic assign 
	; Variable is 16-bit
	ld hl,[MapPos]
	; Loading pointer
	ld [WaterPump_Idx],hl
	ld a, $10
	ld [WaterPump_Faz], a
	call WaterPump_PutAt
	call Akna_Hozzaad
	jr TeglaLerak_edblock1458
TeglaLerak_eblock1457:
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
TeglaLerak_edblock1458:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_TeglaLerak_j]
	cp $2
	jr nz,TeglaLerak_eblock1463
TeglaLerak_ctb1462: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_TeglaLerak_ar]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	call Cash2_OSD
	jr TeglaLerak_edblock1464
TeglaLerak_eblock1463:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[localVariable_TeglaLerak_ar]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
	call Cash_OSD
TeglaLerak_edblock1464:
	call Keret_SpriteKirak
	call Keret2_Kirak
TeglaLerak_edblock1453:
TeglaLerak_edblock1412:
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
	jr nz,Digi_Le_edblock1472
Digi_Le_ctb1470: ;Main true block ;keep :
	call GE_DigiSoundOff
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ld a, $0
	ld [Digi_Aktiv], a
Digi_Le_edblock1472:
	ret
end_procedure_Digi_Le:
	; Képkocka-szinkron a főciklusban: digi hang alatt WaitForDigiSoundSync (+ a hang végén leállítás), egyébként WaitForSync 
	; ***********  Defining procedure : Frame_Sync
	;    Procedure type : User-defined procedure
localVariable_Frame_Sync_v:	db	0
Frame_Sync_block1475:
Frame_Sync:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Digi_Aktiv]
	cp $1
	jr nz,Frame_Sync_eblock1478
Frame_Sync_ctb1477: ;Main true block ;keep :
	call GE_WaitForDigiSoundSync
	ld a, $0
	ld [localVariable_Frame_Sync_v], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	call GE_Is2x4bitDigiSoundPlaying
	or a
	jr z, Frame_Sync_edblock1498
Frame_Sync_ctb1496: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Frame_Sync_v], a
Frame_Sync_edblock1498:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Frame_Sync_v]
	or a
	jr nz,Frame_Sync_edblock1503
Frame_Sync_ctb1501: ;Main true block ;keep :
	call Digi_Le
Frame_Sync_edblock1503:
	jr Frame_Sync_edblock1479
Frame_Sync_eblock1478:
	call GE_WaitForSync
Frame_Sync_edblock1479:
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
Doboz_block1508:
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
Szinez_block1509:
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
	jr nz,Normal_Szinek_edblock1516
Normal_Szinek_ctb1514: ;Main true block ;keep :
	ld a, $3
	ld [GE_Nr], a
	ld a, $1
	ld [GE_Color], a
	call GE_SetPalette
Normal_Szinek_edblock1516:
	ld a, $2a
	ld [GE_Color], a
	call GE_SetBorder
	ret
end_procedure_Normal_Szinek:
	; P = PAUSE (pisi szünet): minden megáll, sötét színek (szürke->fekete, fekete->sötétkék, zöld->sötétzöld, kék->fekete, keret fekete), középen "GAME PAUSED"; a következő P-re minden megy tovább 
	; ***********  Defining procedure : Pause_Kezel
	;    Procedure type : User-defined procedure
localVariable_Pause_Kezel_x:	db	0
Pause_Kezel_block1519:
Pause_Kezel:
	call Digi_Le
	; a szóló hang le (a várakozás sima WaitForSync) 
	; Assigning a string : Ir_Szoveg
	ld hl,Pause_Kezel_stringassignstr1521
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
	ld hl,Pause_Kezel_stringassignstr1524
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
Pause_Kezel_while1525:
Pause_Kezel_loopstart1529:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	or a
	jr z, Pause_Kezel_edblock1528
Pause_Kezel_ctb1526: ;Main true block ;keep :
	; 1: a P felengedésére vár, 2: új P-re, 3: annak felengedésére 
	call GE_WaitForSync
	call GE_GetKeyboard
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Pause_Kezel_edblock1587
Pause_Kezel_ctb1585: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr nz,Pause_Kezel_edblock1592
Pause_Kezel_ctb1590: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Pause_Kezel_edblock1592:
Pause_Kezel_edblock1587:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Pause_Kezel_edblock1597
Pause_Kezel_ctb1595: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Pause_Kezel_edblock1602
Pause_Kezel_ctb1600: ;Main true block ;keep :
	ld a, $3
	ld [Start_Wait], a
Pause_Kezel_edblock1602:
Pause_Kezel_edblock1597:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $3
	jr nz,Pause_Kezel_edblock1607
Pause_Kezel_ctb1605: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4003
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr nz,Pause_Kezel_edblock1612
Pause_Kezel_ctb1610: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Pause_Kezel_edblock1612:
Pause_Kezel_edblock1607:
	jr Pause_Kezel_while1525
Pause_Kezel_edblock1528:
Pause_Kezel_loopend1530:
	ld a, $1
	ld [Pause_Irany], a
	call Pause_Csere
	; a felirat helyén az eredeti kép vissza 
	call Normal_Szinek
	ret
end_procedure_Pause_Kezel:
	; ***********  Defining procedure : Terulet_Rombol
	;    Procedure type : User-defined procedure
localVariable_Terulet_Rombol_dx:	db	0
localVariable_Terulet_Rombol_dy:	db	0
localVariable_Terulet_Rombol_gx:	db	0
localVariable_Terulet_Rombol_gy:	db	0
localVariable_Terulet_Rombol_tavx:	db	0
localVariable_Terulet_Rombol_tavy:	db	0
localVariable_Terulet_Rombol_fel:	db	0
localVariable_Terulet_Rombol_varPrefixed_m:	db	0
localVariable_Terulet_Rombol_mp:	dw	0
localVariable_Terulet_Rombol_px:	db	0
localVariable_Terulet_Rombol_py:	db	0
localVariable_Terulet_Rombol_kor:	db	0
Terulet_Rombol_block1614:
Terulet_Rombol:
	ld a, $0
	ld [localVariable_Terulet_Rombol_dy], a
Terulet_Rombol_while1615:
Terulet_Rombol_loopstart1619:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_dy]
	cp $7
	jp nc,Terulet_Rombol_edblock1618
Terulet_Rombol_ctb1616: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_dy]
	cp $3
	jr nc,Terulet_Rombol_eblock1861
Terulet_Rombol_ctb1860: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_dy]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Terulet_Rombol_tavy], a
	jr Terulet_Rombol_edblock1862
Terulet_Rombol_eblock1861:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Terulet_Rombol_dy]
	sub  $3
	ld [localVariable_Terulet_Rombol_tavy], a
Terulet_Rombol_edblock1862:
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_tavy]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Terulet_Rombol_fel], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_kor]
	cp $1
	jr nz,Terulet_Rombol_edblock1868
Terulet_Rombol_ctb1866: ;Main true block ;keep :
	; rombusz: soronként 1-gyel keskenyebb 
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_tavy]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Kor_Fel
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Terulet_Rombol_fel], a
Terulet_Rombol_edblock1868:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Terulet_Rombol_py]
	sub  $3
	push af
	ld a,[localVariable_Terulet_Rombol_dy]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Terulet_Rombol_gy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Terulet_Rombol_edblock1873
Terulet_Rombol_ctb1871: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Terulet_Rombol_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Terulet_Rombol_edblock1878
Terulet_Rombol_ctb1876: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Terulet_Rombol_dx], a
Terulet_Rombol_while1880:
Terulet_Rombol_loopstart1884:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_dx]
	cp $7
	jp nc,Terulet_Rombol_edblock1883
Terulet_Rombol_ctb1881: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_dx]
	cp $3
	jr nc,Terulet_Rombol_eblock1889
Terulet_Rombol_ctb1888: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_dx]
	ld b,a
	ld a,$3
	sub  b
	ld [localVariable_Terulet_Rombol_tavx], a
	jr Terulet_Rombol_edblock1890
Terulet_Rombol_eblock1889:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Terulet_Rombol_dx]
	sub  $3
	ld [localVariable_Terulet_Rombol_tavx], a
Terulet_Rombol_edblock1890:
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Terulet_Rombol_tavx]
	ld b,a
	ld a,[localVariable_Terulet_Rombol_fel]
	cp b
	jp c,Terulet_Rombol_edblock1896
Terulet_Rombol_ctb1894: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Terulet_Rombol_px]
	sub  $3
	push af
	ld a,[localVariable_Terulet_Rombol_dx]
	ld b,a
	pop af
	add  a, b
	ld [localVariable_Terulet_Rombol_gx], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Terulet_Rombol_edblock1901
Terulet_Rombol_ctb1899: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Terulet_Rombol_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Terulet_Rombol_edblock1906
Terulet_Rombol_ctb1904: ;Main true block ;keep :
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
	ld a,[localVariable_Terulet_Rombol_gy]
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
	ld a,[localVariable_Terulet_Rombol_gx]
	ld l,a
	ld h,0
	xor a ; clear carry
	sbc hl,de
	pop de
	add hl,de
	; Loading pointer
	ld [localVariable_Terulet_Rombol_mp],hl
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_gx]
	ld [localVariable_Pumpa_Torol_x], a
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_gy]
	ld [localVariable_Pumpa_Torol_y], a
	call Pumpa_Torol
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_Terulet_Rombol_mp]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Terulet_Rombol_varPrefixed_m], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Terulet_Rombol_kor]
	cp $1
	jr nz,Terulet_Rombol_edblock1912
Terulet_Rombol_ctb1910: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Terulet_Rombol_varPrefixed_m], a
Terulet_Rombol_edblock1912:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Talaj3Map]
	ld b,a
	ld a,[localVariable_Terulet_Rombol_varPrefixed_m]
	cp b
	jr z, Terulet_Rombol_edblock1917
Terulet_Rombol_ctb1915: ;Main true block ;keep :
	; az akna a sziklát is rombolja 
	; Storing to array  
	; Variable is 16-bit
	ld de,[localVariable_Terulet_Rombol_mp]
	ld hl,Map
	add hl,de
	ld a,[Talaj2Map]
	ld [hl],a 
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_gx]
	ld [localVariable_Talaj2_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Terulet_Rombol_gy]
	ld [localVariable_Talaj2_Kirak_y], a
	call Talaj2_Kirak
Terulet_Rombol_edblock1917:
Terulet_Rombol_edblock1906:
Terulet_Rombol_edblock1901:
Terulet_Rombol_edblock1896:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Terulet_Rombol_dx]
	add  a,$1
	ld [localVariable_Terulet_Rombol_dx], a
	jp Terulet_Rombol_while1880
Terulet_Rombol_edblock1883:
Terulet_Rombol_loopend1885:
Terulet_Rombol_edblock1878:
Terulet_Rombol_edblock1873:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Terulet_Rombol_dy]
	add  a,$1
	ld [localVariable_Terulet_Rombol_dy], a
	jp Terulet_Rombol_while1615
Terulet_Rombol_edblock1618:
Terulet_Rombol_loopend1620:
	ret
end_procedure_Terulet_Rombol:
	; Az akna (Akna_Idx) felrobban: kör alakú rombolás + rövid hang; nincs villanás, a játék nem áll meg 
	; ***********  Defining procedure : Akna_Robbant
	;    Procedure type : User-defined procedure
localVariable_Akna_Robbant_x:	db	0
localVariable_Akna_Robbant_y:	db	0
localVariable_Akna_Robbant_varPrefixed_m:	db	0
localVariable_Akna_Robbant_t:	dw	0
Akna_Robbant_block1919:
Akna_Robbant:
	ld a, $0
	ld [Akna_Robban], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Akna_Idx]
	; Loading pointer
	ld [localVariable_Akna_Robbant_t],hl
	; generic assign 
	; Variable is 16-bit
	ld de,[localVariable_Akna_Robbant_t]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Akna_Robbant_varPrefixed_m], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[AknaMap]
	ld b,a
	ld a,[localVariable_Akna_Robbant_varPrefixed_m]
	cp b
	jp c, Akna_Robbant_edblock1923
Akna_Robbant_localsuccess1933: ;keep:
	; ; logical AND, second requirement
	; Swapped comparison expressions
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Akna_Robbant_varPrefixed_m]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[AknaMap]
	add  a, $10
	cp b
	jp c, Akna_Robbant_edblock1923
	jp z, Akna_Robbant_edblock1923
Akna_Robbant_ctb1921: ;Main true block ;keep :
	; még ott van (közben nem semmisítette meg bomba/meteor/vírus) 
	ld a, $1
	ld [localVariable_Akna_Robbant_y], a
Akna_Robbant_while1935:
Akna_Robbant_loopstart1939:
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	ld hl,$1e
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_Akna_Robbant_t]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Akna_Robbant_edblock1938
Akna_Robbant_ctb1936: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	ld de,$1e
	; Variable is 16-bit
	ld hl,[localVariable_Akna_Robbant_t]
	xor a ; clear carry
	sbc hl,de
	ld [localVariable_Akna_Robbant_t],hl
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Akna_Robbant_y]
	add  a,$1
	ld [localVariable_Akna_Robbant_y], a
	jr Akna_Robbant_while1935
Akna_Robbant_edblock1938:
Akna_Robbant_loopend1940:
	; generic assign 
	ld a,[localVariable_Akna_Robbant_t]
	ld [localVariable_Akna_Robbant_x], a
	; 'a:=a + const'  optimization 
	add  a,$1
	ld [localVariable_Akna_Robbant_x], a
	call Keret2_Le
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; generic assign 
	ld a,[localVariable_Akna_Robbant_x]
	ld [localVariable_Terulet_Rombol_px], a
	; generic assign 
	ld a,[localVariable_Akna_Robbant_y]
	ld [localVariable_Terulet_Rombol_py], a
	ld a, $1
	ld [localVariable_Terulet_Rombol_kor], a
	call Terulet_Rombol
	call Keret_SpriteKirak
	call Keret2_Kirak
	call Digi_Le
	; hang: a rajz után (a DigiSoundOn szinkronra vár) 
	ld a, $ce
	ld [GE_Frequency], a
	ld a, $1
	ld [GE_DigiSoundType], a
	call GE_DigiSoundOn
	ld hl,AknaSFX
	ld [GE_SoundEffect],hl
	call GE_PlayDigiSound
	ld a, $1
	ld [Digi_Aktiv], a
Akna_Robbant_edblock1923:
	ret
end_procedure_Akna_Robbant:
	; bomba a (px,py) mezőre; j = 1/2: kinek a pénzéből (mindent rombol, bárkié) 
	; ***********  Defining procedure : Bomba_Ledob
	;    Procedure type : User-defined procedure
localVariable_Bomba_Ledob_celY:	db	0
localVariable_Bomba_Ledob_noseY:	db	0
localVariable_Bomba_Ledob_vil:	db	0
localVariable_Bomba_Ledob_penz:	dw	0
localVariable_Bomba_Ledob_px:	db	0
localVariable_Bomba_Ledob_py:	db	0
localVariable_Bomba_Ledob_j:	db	0
Bomba_Ledob_block1942:
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
	jr nz,Bomba_Ledob_edblock1946
Bomba_Ledob_ctb1944: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_Bomba_Ledob_penz],hl
Bomba_Ledob_edblock1946:
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
	jp c, Bomba_Ledob_edblock1952
Bomba_Ledob_ctb1950: ;Main true block ;keep :
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
Bomba_Ledob_while1983:
Bomba_Ledob_loopstart1987:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Bomba_Ledob_celY]
	ld b,a
	ld a,[localVariable_Bomba_Ledob_noseY]
	cp b
	jr nc,Bomba_Ledob_edblock1986
Bomba_Ledob_ctb1984: ;Main true block ;keep :
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
	jr Bomba_Ledob_while1983
Bomba_Ledob_edblock1986:
Bomba_Ledob_loopend1988:
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
Bomba_Ledob_while1990:
Bomba_Ledob_loopstart1994:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_vil]
	cp $3
	jr nc,Bomba_Ledob_edblock1993
Bomba_Ledob_ctb1991: ;Main true block ;keep :
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
	jr Bomba_Ledob_while1990
Bomba_Ledob_edblock1993:
Bomba_Ledob_loopend1995:
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
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_px]
	ld [localVariable_Terulet_Rombol_px], a
	; generic assign 
	ld a,[localVariable_Bomba_Ledob_py]
	ld [localVariable_Terulet_Rombol_py], a
	ld a, $0
	ld [localVariable_Terulet_Rombol_kor], a
	call Terulet_Rombol
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Bomba_Ledob_j]
	cp $2
	jr nz,Bomba_Ledob_eblock1999
Bomba_Ledob_ctb1998: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Bomba_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	jr Bomba_Ledob_edblock2000
Bomba_Ledob_eblock1999:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Bomba_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
Bomba_Ledob_edblock2000:
	call Cash_OSD
	call Cash2_OSD
	call Keret_XY_Calc
	call Keret_SpriteKirak
	call Keret2_Kirak
Bomba_Ledob_edblock1952:
	ret
end_procedure_Bomba_Ledob:
	; KILÉPÉS (ESC vagy Q, minden módban): "EXIT TO MENU ?" a képernyő közepén, a pause színrendjével; ESC/Q = igen (Jatek_Fut:=0 -> főmenü), BÁRMI MÁS (billentyű vagy joystick) = nem (a doboz alatti kép vissza, megy tovább a játék). A végén megvárja, hogy minden gomb felengedődjön (ne tüzeljen tovább a játékban) 
	; ***********  Defining procedure : Exit_Kerdes
	;    Procedure type : User-defined procedure
localVariable_Exit_Kerdes_v:	db	0
Exit_Kerdes_block2003:
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
	ld hl,Exit_Kerdes_stringassignstr2006
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $7a
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Exit_Kerdes_stringassignstr2008
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $86
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Exit_Kerdes_stringassignstr2010
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
Exit_Kerdes_while2011:
Exit_Kerdes_loopstart2015:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	or a
	jp z, Exit_Kerdes_edblock2014
Exit_Kerdes_ctb2012: ;Main true block ;keep :
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
	jr z, Exit_Kerdes_edblock2121
Exit_Kerdes_ctb2119: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock2121:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Exit_Kerdes_edblock2126
Exit_Kerdes_ctb2124: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock2126:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Exit_Kerdes_edblock2131
Exit_Kerdes_ctb2129: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Exit_Kerdes_v], a
Exit_Kerdes_edblock2131:
	; 3: minden felengedve 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Exit_Kerdes_eblock2135
Exit_Kerdes_ctb2134: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	or a
	jr nz,Exit_Kerdes_edblock2141
Exit_Kerdes_ctb2139: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Exit_Kerdes_edblock2141:
	jr Exit_Kerdes_edblock2136
Exit_Kerdes_eblock2135:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Exit_Kerdes_eblock2146
Exit_Kerdes_ctb2145: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	cp $1
	jr nz,Exit_Kerdes_edblock2152
Exit_Kerdes_ctb2150: ;Main true block ;keep :
	ld a, $0
	ld [Jatek_Fut], a
	; igen: vissza a főmenübe (a főprogram kezeli) 
	ld a, $3
	ld [Start_Wait], a
Exit_Kerdes_edblock2152:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	cp $2
	jr nz,Exit_Kerdes_edblock2157
Exit_Kerdes_ctb2155: ;Main true block ;keep :
	ld a, $1
	ld [Pause_Irany], a
	call Pause_Csere
	; nem: a doboz alatti kép vissza 
	ld a, $3
	ld [Start_Wait], a
Exit_Kerdes_edblock2157:
	jr Exit_Kerdes_edblock2147
Exit_Kerdes_eblock2146:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Exit_Kerdes_v]
	or a
	jr nz,Exit_Kerdes_edblock2163
Exit_Kerdes_ctb2161: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Exit_Kerdes_edblock2163:
Exit_Kerdes_edblock2147:
Exit_Kerdes_edblock2136:
	jp Exit_Kerdes_while2011
Exit_Kerdes_edblock2014:
Exit_Kerdes_loopend2016:
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
Ikon_Ervenyes_block2165:
Ikon_Ervenyes:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Ikon_Ervenyes_j]
	cp $1
	jr nz,Ikon_Ervenyes_eblock2168
Ikon_Ervenyes_ctb2167: ;Main true block ;keep :
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_Ikon_Ervenyes_x]
	sub  $1
	ld [localVariable_Ikon_Ervenyes_varPrefixed_e], a
	jr Ikon_Ervenyes_edblock2169
Ikon_Ervenyes_eblock2168:
	; generic assign 
	ld a,[localVariable_Ikon_Ervenyes_x]
	ld b,a
	ld a,$1e
	sub  b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_e], a
Ikon_Ervenyes_edblock2169:
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
	; a hely sorszáma - P1: 1,3,5,7 -> 0..3; P2: 30,28,26,24 -> 0..3 
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
	; 'a:=a + expression'  optimization 
	ld a,[Akna_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_db]
	add  a, b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_db], a
	; 'a:=a + expression'  optimization 
	ld a,[VirusLe_Engedve]
	ld b,a
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_db]
	add  a, b
	ld [localVariable_Ikon_Ervenyes_varPrefixed_db], a
	ld a, $0
	ld [localVariable_Ikon_Ervenyes_varPrefixed_r], a
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_db]
	ld b,a
	ld a,[localVariable_Ikon_Ervenyes_varPrefixed_e]
	cp b
	jr nc,Ikon_Ervenyes_edblock2177
Ikon_Ervenyes_ctb2175: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Ikon_Ervenyes_varPrefixed_r], a
Ikon_Ervenyes_edblock2177:
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
Jatekos_Mozog_block2180:
Jatekos_Mozog:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $1
	jr nz,Jatekos_Mozog_eblock2183
Jatekos_Mozog_ctb2182: ;Main true block ;keep :
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
	ld a, $9
	ld [localVariable_Jatekos_Mozog_xmax], a
	jr Jatekos_Mozog_edblock2184
Jatekos_Mozog_eblock2183:
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Jatekos_Mozog_x], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Jatekos_Mozog_y], a
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Jatekos_Mozog_varPrefixed_e], a
	ld a, $16
	ld [localVariable_Jatekos_Mozog_xmin], a
	ld a, $1e
	ld [localVariable_Jatekos_Mozog_xmax], a
Jatekos_Mozog_edblock2184:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	or a
	jp nz,Jatekos_Mozog_eblock2191
Jatekos_Mozog_ctb2190: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Bal]
	cp $1
	jr nz,Jatekos_Mozog_edblock2435
Jatekos_Mozog_ctb2433: ;Main true block ;keep :
	; ikon-menü  balra a következő ENGEDÉLYEZETT ikonra (a tiltott fal/bomba helyét átugorja) 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [localVariable_Jatekos_Mozog_t], a
	ld a, $0
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_while2437:
Jatekos_Mozog_loopstart2441:
	; Binary clause core: GREATER
	; Compare two vars optimization
	ld a,[localVariable_Jatekos_Mozog_xmin]
	ld b,a
	ld a,[localVariable_Jatekos_Mozog_t]
	cp b
	jr c, Jatekos_Mozog_edblock2440
	jr z, Jatekos_Mozog_edblock2440
Jatekos_Mozog_ctb2438: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_t]
	sub $2
	ld [localVariable_Jatekos_Mozog_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_k]
	or a
	jr nz,Jatekos_Mozog_edblock2447
Jatekos_Mozog_ctb2445: ;Main true block ;keep :
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
	jr nz,Jatekos_Mozog_edblock2452
Jatekos_Mozog_ctb2450: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Jatekos_Mozog_x], a
	ld a, $1
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_edblock2452:
Jatekos_Mozog_edblock2447:
	jr Jatekos_Mozog_while2437
Jatekos_Mozog_edblock2440:
Jatekos_Mozog_loopend2442:
Jatekos_Mozog_edblock2435:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Jobb]
	cp $1
	jr nz,Jatekos_Mozog_edblock2457
Jatekos_Mozog_ctb2455: ;Main true block ;keep :
	; jobbra ugyanígy 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [localVariable_Jatekos_Mozog_t], a
	ld a, $0
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_while2459:
Jatekos_Mozog_loopstart2463:
	; Binary clause core: LESS
	; Compare two vars optimization
	ld a,[localVariable_Jatekos_Mozog_xmax]
	ld b,a
	ld a,[localVariable_Jatekos_Mozog_t]
	cp b
	jr nc,Jatekos_Mozog_edblock2462
Jatekos_Mozog_ctb2460: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_t]
	add  a,$2
	ld [localVariable_Jatekos_Mozog_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_k]
	or a
	jr nz,Jatekos_Mozog_edblock2469
Jatekos_Mozog_ctb2467: ;Main true block ;keep :
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
	jr nz,Jatekos_Mozog_edblock2474
Jatekos_Mozog_ctb2472: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_t]
	ld [localVariable_Jatekos_Mozog_x], a
	ld a, $1
	ld [localVariable_Jatekos_Mozog_k], a
Jatekos_Mozog_edblock2474:
Jatekos_Mozog_edblock2469:
	jr Jatekos_Mozog_while2459
Jatekos_Mozog_edblock2462:
Jatekos_Mozog_loopend2464:
Jatekos_Mozog_edblock2457:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Le]
	cp $1
	jr nz,Jatekos_Mozog_edblock2479
Jatekos_Mozog_ctb2477: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Jatekos_Mozog_y], a
	; generic assign 
	ld a,[Vissza1_X]
	ld [localVariable_Jatekos_Mozog_x], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $2
	jr nz,Jatekos_Mozog_edblock2484
Jatekos_Mozog_ctb2482: ;Main true block ;keep :
	; vissza abba az oszlopba, ahonnan feljött 
	; generic assign 
	ld a,[Vissza2_X]
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock2484:
Jatekos_Mozog_edblock2479:
	jp Jatekos_Mozog_edblock2192
Jatekos_Mozog_eblock2191:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Bal]
	cp $1
	jr nz,Jatekos_Mozog_edblock2490
Jatekos_Mozog_ctb2488: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_x]
	cp $1
	jr c, Jatekos_Mozog_edblock2495
	jr z, Jatekos_Mozog_edblock2495
Jatekos_Mozog_ctb2493: ;Main true block ;keep :
	; pálya 
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_x]
	sub $1
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock2495:
Jatekos_Mozog_edblock2490:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Jobb]
	cp $1
	jr nz,Jatekos_Mozog_edblock2500
Jatekos_Mozog_ctb2498: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_x]
	cp $1e
	jr nc,Jatekos_Mozog_edblock2505
Jatekos_Mozog_ctb2503: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_x]
	add  a,$1
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock2505:
Jatekos_Mozog_edblock2500:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Le]
	cp $1
	jr nz,Jatekos_Mozog_edblock2510
Jatekos_Mozog_ctb2508: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	cp $12
	jr nc,Jatekos_Mozog_edblock2515
Jatekos_Mozog_ctb2513: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_y]
	add  a,$1
	ld [localVariable_Jatekos_Mozog_y], a
Jatekos_Mozog_edblock2515:
Jatekos_Mozog_edblock2510:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Joy_Fel]
	cp $1
	jr nz,Jatekos_Mozog_edblock2520
Jatekos_Mozog_ctb2518: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_y]
	cp $1
	jr c, Jatekos_Mozog_eblock2524
	jr z, Jatekos_Mozog_eblock2524
Jatekos_Mozog_ctb2523: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Mozog_y]
	sub $1
	ld [localVariable_Jatekos_Mozog_y], a
	jr Jatekos_Mozog_edblock2525
Jatekos_Mozog_eblock2524:
	ld a, $0
	ld [localVariable_Jatekos_Mozog_y], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $1
	jr nz,Jatekos_Mozog_edblock2531
Jatekos_Mozog_ctb2529: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Vissza1_X], a
Jatekos_Mozog_edblock2531:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $2
	jr nz,Jatekos_Mozog_edblock2536
Jatekos_Mozog_ctb2534: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Vissza2_X], a
Jatekos_Mozog_edblock2536:
	; generic assign 
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_j]
	ld [localVariable_Ikon_Oszlop_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_varPrefixed_e]
	ld [localVariable_Ikon_Oszlop_varPrefixed_e], a
	call Ikon_Oszlop
	ld [localVariable_Jatekos_Mozog_x], a
Jatekos_Mozog_edblock2525:
Jatekos_Mozog_edblock2520:
Jatekos_Mozog_edblock2192:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Mozog_j]
	cp $1
	jr nz,Jatekos_Mozog_eblock2540
Jatekos_Mozog_ctb2539: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Keret_X_Pos], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_y]
	ld [Keret_Y_Pos], a
	jr Jatekos_Mozog_edblock2541
Jatekos_Mozog_eblock2540:
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_x]
	ld [Keret2_X_Pos], a
	; generic assign 
	ld a,[localVariable_Jatekos_Mozog_y]
	ld [Keret2_Y_Pos], a
Jatekos_Mozog_edblock2541:
	ret
end_procedure_Jatekos_Mozog:
	; A lerakott pumpák termelése 
	; ***********  Defining procedure : Pumpak_Termelnek
	;    Procedure type : User-defined procedure
localVariable_Pumpak_Termelnek_termeny:	dw	0
Pumpak_Termelnek_block2546:
Pumpak_Termelnek:
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpak_Termelnek_edblock2550
	jr z, Pumpak_Termelnek_edblock2550
Pumpak_Termelnek_ctb2548: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db]
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
	jr c, Pumpak_Termelnek_edblock2564
	jr z, Pumpak_Termelnek_edblock2564
Pumpak_Termelnek_ctb2562: ;Main true block ;keep :
	; generic assign 
	ld hl,$270f
	; Loading pointer
	ld [Drill_Cash],hl
Pumpak_Termelnek_edblock2564:
	call Cash_OSD
Pumpak_Termelnek_edblock2550:
	; co-op: kiírva 
	; Binary clause core: GREATER
	; Binary clause INTEGER: GREATER
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Pumpak_Termelnek_edblock2569
	jr z, Pumpak_Termelnek_edblock2569
Pumpak_Termelnek_ctb2567: ;Main true block ;keep :
	; a 2. játékos (versus) saját termelése, saját pénzbe (még nincs kiírva) 
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
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
	jr c, Pumpak_Termelnek_edblock2583
	jr z, Pumpak_Termelnek_edblock2583
Pumpak_Termelnek_ctb2581: ;Main true block ;keep :
	; generic assign 
	ld hl,$270f
	; Loading pointer
	ld [Drill_Cash2],hl
Pumpak_Termelnek_edblock2583:
	call Cash2_OSD
Pumpak_Termelnek_edblock2569:
	ret
end_procedure_Pumpak_Termelnek:
	; ***********  Defining procedure : Enemy_Terjed_Ide
	;    Procedure type : User-defined procedure
localVariable_Enemy_Terjed_Ide_mp:	dw	0
localVariable_Enemy_Terjed_Ide_x:	db	0
localVariable_Enemy_Terjed_Ide_y:	db	0
Enemy_Terjed_Ide_block2585:
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
	jr z, Enemy_Terjed_Ide_edblock2590
Enemy_Terjed_Ide_localsuccess2598: ;keep:
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
	jr z, Enemy_Terjed_Ide_edblock2590
Enemy_Terjed_Ide_ctb2588: ;Main true block ;keep :
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
	jr nz,Enemy_Terjed_Ide_edblock2603
Enemy_Terjed_Ide_ctb2601: ;Main true block ;keep :
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
Enemy_Terjed_Ide_edblock2603:
Enemy_Terjed_Ide_edblock2590:
	ret
end_procedure_Enemy_Terjed_Ide:
	; ***********  Defining procedure : Virus_Lerak
	;    Procedure type : User-defined procedure
localVariable_Virus_Lerak_varPrefixed_m:	db	0
localVariable_Virus_Lerak_penz:	dw	0
localVariable_Virus_Lerak_px:	db	0
localVariable_Virus_Lerak_py:	db	0
localVariable_Virus_Lerak_j:	db	0
Virus_Lerak_block2605:
Virus_Lerak:
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
	ld a,[localVariable_Virus_Lerak_py]
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
	ld a,[localVariable_Virus_Lerak_px]
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
	ld de,[MapPos]
	ld hl,Map
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Virus_Lerak_varPrefixed_m], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [localVariable_Virus_Lerak_penz],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Virus_Lerak_j]
	cp $2
	jr nz,Virus_Lerak_edblock2610
Virus_Lerak_ctb2608: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	; Loading pointer
	ld [localVariable_Virus_Lerak_penz],hl
Virus_Lerak_edblock2610:
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj1Map]
	ld b,a
	ld a,[localVariable_Virus_Lerak_varPrefixed_m]
	cp b
	jr nz,Virus_Lerak_localfailed2638
	jr Virus_Lerak_ctb2614
Virus_Lerak_localfailed2638: ;keep:
	; ; logical OR, second chance
	; Binary clause core: EQUALS
	; Compare two vars optimization
	ld a,[Talaj2Map]
	ld b,a
	ld a,[localVariable_Virus_Lerak_varPrefixed_m]
	cp b
	jr nz,Virus_Lerak_edblock2616
Virus_Lerak_ctb2614: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Virus_price]
	push hl
	; Variable is 16-bit
	ld hl,[localVariable_Virus_Lerak_penz]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, Virus_Lerak_edblock2643
Virus_Lerak_ctb2641: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Virus_Lerak_px]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Virus_Lerak_py]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
	ld a, $1
	ld [Enemy_Terjedhet], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Virus_Lerak_j]
	cp $2
	jr nz,Virus_Lerak_eblock2647
Virus_Lerak_ctb2646: ;Main true block ;keep :
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Virus_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash2]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash2],hl
	call Cash2_OSD
	jr Virus_Lerak_edblock2648
Virus_Lerak_eblock2647:
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Virus_price]
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	xor a ; clear carry
	sbc hl,de
	ld [Drill_Cash],hl
	call Cash_OSD
Virus_Lerak_edblock2648:
Virus_Lerak_edblock2643:
Virus_Lerak_edblock2616:
	ret
end_procedure_Virus_Lerak:
	; ***********  Defining procedure : Jatekos_Tuz
	;    Procedure type : User-defined procedure
localVariable_Jatekos_Tuz_varPrefixed_e:	db	0
localVariable_Jatekos_Tuz_varPrefixed_i:	db	0
localVariable_Jatekos_Tuz_k:	db	0
localVariable_Jatekos_Tuz_j:	db	0
localVariable_Jatekos_Tuz_px:	db	0
localVariable_Jatekos_Tuz_py:	db	0
localVariable_Jatekos_Tuz_volt:	db	0
Jatekos_Tuz_block2651:
Jatekos_Tuz:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_py]
	or a
	jp nz,Jatekos_Tuz_eblock2654
Jatekos_Tuz_ctb2653: ;Main true block ;keep :
	; a tiltott eszköz oszlopa 255 (Ikon_Oszlop), így csak engedélyezett választható 
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jr nz,Jatekos_Tuz_edblock2806
Jatekos_Tuz_ctb2804: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
	ld a, $0
	ld [localVariable_Jatekos_Tuz_varPrefixed_i], a
Jatekos_Tuz_while2808:
Jatekos_Tuz_loopstart2812:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	cp $5
	jr nc,Jatekos_Tuz_edblock2811
Jatekos_Tuz_ctb2809: ;Main true block ;keep :
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
	jr nz,Jatekos_Tuz_edblock2818
Jatekos_Tuz_ctb2816: ;Main true block ;keep :
	; előbb változóba: a "fv(...)=px" feltételnél a fordító a B-ben tartott px-et a hívás alatt elrontja 
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock2818:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_i]
	add  a,$1
	ld [localVariable_Jatekos_Tuz_varPrefixed_i], a
	jr Jatekos_Tuz_while2808
Jatekos_Tuz_edblock2811:
Jatekos_Tuz_loopend2813:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $1
	jr nz,Jatekos_Tuz_edblock2823
Jatekos_Tuz_ctb2821: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Fal_Engedve]
	or a
	jr nz,Jatekos_Tuz_edblock2828
Jatekos_Tuz_ctb2826: ;Main true block ;keep :
	ld a, $ff
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock2828:
Jatekos_Tuz_edblock2823:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $ff
	jr z, Jatekos_Tuz_edblock2833
Jatekos_Tuz_ctb2831: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_Eszkoz_Valt_j], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	ld [localVariable_Eszkoz_Valt_varPrefixed_e], a
	call Eszkoz_Valt
Jatekos_Tuz_edblock2833:
Jatekos_Tuz_edblock2806:
	jp Jatekos_Tuz_edblock2655
Jatekos_Tuz_eblock2654:
	; generic assign 
	ld a,[Eszkoz1]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_j]
	cp $2
	jr nz,Jatekos_Tuz_edblock2839
Jatekos_Tuz_ctb2837: ;Main true block ;keep :
	; generic assign 
	ld a,[Eszkoz2]
	ld [localVariable_Jatekos_Tuz_varPrefixed_e], a
Jatekos_Tuz_edblock2839:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	or a
	jr nz,Jatekos_Tuz_edblock2844
Jatekos_Tuz_ctb2842: ;Main true block ;keep :
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
Jatekos_Tuz_edblock2844:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $1
	jr nz,Jatekos_Tuz_edblock2849
Jatekos_Tuz_ctb2847: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_TeglaLerak_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_TeglaLerak_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_TeglaLerak_j], a
	ld a, $0
	ld [localVariable_TeglaLerak_akna], a
	call TeglaLerak
Jatekos_Tuz_edblock2849:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $2
	jr nz,Jatekos_Tuz_edblock2854
Jatekos_Tuz_ctb2852: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jr nz,Jatekos_Tuz_edblock2859
Jatekos_Tuz_ctb2857: ;Main true block ;keep :
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
Jatekos_Tuz_edblock2859:
Jatekos_Tuz_edblock2854:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $3
	jr nz,Jatekos_Tuz_edblock2864
Jatekos_Tuz_ctb2862: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jr nz,Jatekos_Tuz_edblock2869
Jatekos_Tuz_ctb2867: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_TeglaLerak_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_TeglaLerak_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_TeglaLerak_j], a
	ld a, $1
	ld [localVariable_TeglaLerak_akna], a
	call TeglaLerak
Jatekos_Tuz_edblock2869:
Jatekos_Tuz_edblock2864:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_varPrefixed_e]
	cp $4
	jr nz,Jatekos_Tuz_edblock2874
Jatekos_Tuz_ctb2872: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Jatekos_Tuz_volt]
	or a
	jr nz,Jatekos_Tuz_edblock2879
Jatekos_Tuz_ctb2877: ;Main true block ;keep :
	; akna: egy lenyomás = egy akna 
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_px]
	ld [localVariable_Virus_Lerak_px], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_py]
	ld [localVariable_Virus_Lerak_py], a
	; generic assign 
	ld a,[localVariable_Jatekos_Tuz_j]
	ld [localVariable_Virus_Lerak_j], a
	call Virus_Lerak
Jatekos_Tuz_edblock2879:
Jatekos_Tuz_edblock2874:
Jatekos_Tuz_edblock2655:
	ret
end_procedure_Jatekos_Tuz:
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
Enemyk_Mukodnek_block2884:
Enemyk_Mukodnek:
	ld a, $0
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
Enemyk_Mukodnek_while2885:
Enemyk_Mukodnek_loopstart2889:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	cp $6
	jp nc,Enemyk_Mukodnek_edblock2888
Enemyk_Mukodnek_ctb2886: ;Main true block ;keep :
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
	jp c, Enemyk_Mukodnek_edblock3033
Enemyk_Mukodnek_localsuccess3034: ;keep:
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
	jp c,Enemyk_Mukodnek_edblock3033
Enemyk_Mukodnek_ctb3031: ;Main true block ;keep :
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
	jp nc,Enemyk_Mukodnek_eblock3038
Enemyk_Mukodnek_ctb3037: ;Main true block ;keep :
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
	jr nz,Enemyk_Mukodnek_edblock3044
Enemyk_Mukodnek_ctb3042: ;Main true block ;keep :
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
Enemyk_Mukodnek_edblock3044:
	jp Enemyk_Mukodnek_edblock3039
Enemyk_Mukodnek_eblock3038:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Enemy_Terjedhet]
	cp $1
	jp nz,Enemyk_Mukodnek_edblock3050
Enemyk_Mukodnek_ctb3048: ;Main true block ;keep :
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
	jr nc,Enemyk_Mukodnek_edblock3055
Enemyk_Mukodnek_ctb3053: ;Main true block ;keep :
	; clamp a rácsra (C64: 0..39 / 1..24) 
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock3055:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	cp $1e
	jr c, Enemyk_Mukodnek_edblock3060
	jr z, Enemyk_Mukodnek_edblock3060
Enemyk_Mukodnek_ctb3058: ;Main true block ;keep :
	ld a, $1e
	ld [localVariable_Enemyk_Mukodnek_nx], a
Enemyk_Mukodnek_edblock3060:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $1
	jr nc,Enemyk_Mukodnek_edblock3065
Enemyk_Mukodnek_ctb3063: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock3065:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	cp $12
	jr c, Enemyk_Mukodnek_edblock3070
	jr z, Enemyk_Mukodnek_edblock3070
Enemyk_Mukodnek_ctb3068: ;Main true block ;keep :
	ld a, $12
	ld [localVariable_Enemyk_Mukodnek_ny], a
Enemyk_Mukodnek_edblock3070:
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_nx]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Enemyk_Mukodnek_ny]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
Enemyk_Mukodnek_edblock3050:
Enemyk_Mukodnek_edblock3039:
Enemyk_Mukodnek_edblock3033:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Enemyk_Mukodnek_varPrefixed_p]
	add  a,$1
	ld [localVariable_Enemyk_Mukodnek_varPrefixed_p], a
	jp Enemyk_Mukodnek_while2885
Enemyk_Mukodnek_edblock2888:
Enemyk_Mukodnek_loopend2890:
	ret
end_procedure_Enemyk_Mukodnek:
	; Tűzgomb: 1, ha SPACE VAGY a joystick tűzgombja le van nyomva (előtte GetKeyboard + GetJoysticks kell) 
	; ***********  Defining procedure : Tuz
	;    Procedure type : User-defined procedure
localVariable_Tuz_varPrefixed_r:	db	0
Tuz_block3072:
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
	jr z, Tuz_edblock3076
Tuz_ctb3074: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Tuz_varPrefixed_r], a
Tuz_edblock3076:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $8
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, Tuz_edblock3082
Tuz_ctb3080: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Tuz_varPrefixed_r], a
Tuz_edblock3082:
	ld a,[localVariable_Tuz_varPrefixed_r]
	ret
	ret
end_procedure_Tuz:
	; ***********  Defining procedure : Szov_Ikon
	;    Procedure type : User-defined procedure
localVariable_Szov_Ikon_varPrefixed_i:	db	0
localVariable_Szov_Ikon_x:	db	0
localVariable_Szov_Ikon_y:	db	0
Szov_Ikon_block3085:
Szov_Ikon:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $5
	jp nz,Szov_Ikon_eblock3088
Szov_Ikon_ctb3087: ;Main true block ;keep :
	; Storing to array  
	; RHS is pure numeric optimisation
	ld a,[localVariable_Szov_Ikon_x]
	sub  $1
	ld [Keret+$f],a
	; Storing to array  
	ld a,[localVariable_Szov_Ikon_y]
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
	jp Szov_Ikon_edblock3089
Szov_Ikon_eblock3088:
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $1
	jr nz,Szov_Ikon_edblock3139
Szov_Ikon_ctb3137: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Talaj1_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3139:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $2
	jr nz,Szov_Ikon_edblock3144
Szov_Ikon_ctb3142: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Talaj2_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3144:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $3
	jr nz,Szov_Ikon_edblock3149
Szov_Ikon_ctb3147: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Talaj3_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3149:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $4
	jr nz,Szov_Ikon_edblock3154
Szov_Ikon_ctb3152: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Fal_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3154:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $6
	jr nz,Szov_Ikon_edblock3159
Szov_Ikon_ctb3157: ;Main true block ;keep :
	; generic assign 
	ld de,$4
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3159:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $7
	jr nz,Szov_Ikon_edblock3164
Szov_Ikon_ctb3162: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,BombaIkon_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3164:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Ikon_varPrefixed_i]
	cp $8
	jr nz,Szov_Ikon_edblock3169
Szov_Ikon_ctb3167: ;Main true block ;keep :
	; generic assign 
	; Generic 16-bit binop
	ld de,$c3
	; Variable is 16-bit
	ld hl,Akna_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
Szov_Ikon_edblock3169:
	; generic assign 
	ld a,[localVariable_Szov_Ikon_x]
	ld [localVariable_Ikon_Kep_x], a
	; generic assign 
	ld a,[localVariable_Szov_Ikon_y]
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
Szov_Ikon_edblock3089:
	ret
end_procedure_Szov_Ikon:
	; Szöveg-rekordok kiírása a Szov_P-től (x, y, szöveg, 0 ... ; 253, ikon, x, y = ikon) a 254 (oldal vége) vagy 255 (vége) jelig; a Szov_P a jelen marad 
	; ***********  Defining procedure : Szov_Kiir
	;    Procedure type : User-defined procedure
localVariable_Szov_Kiir_x:	db	0
localVariable_Szov_Kiir_y:	db	0
localVariable_Szov_Kiir_varPrefixed_c:	db	0
Szov_Kiir_block3171:
Szov_Kiir:
	; generic assign 
	; Optimization : zp[0]
	ld hl,[Szov_P]
	ld a,[hl]
	ld [localVariable_Szov_Kiir_x], a
Szov_Kiir_while3172:
Szov_Kiir_loopstart3176:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Kiir_x]
	cp $fe
	jp nc,Szov_Kiir_edblock3175
Szov_Kiir_ctb3173: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Kiir_x]
	cp $fd
	jp nz,Szov_Kiir_eblock3205
Szov_Kiir_ctb3204: ;Main true block ;keep :
	; generic assign 
	ld de,$1
	ld hl,[Szov_P]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Szov_Ikon_varPrefixed_i], a
	; generic assign 
	ld de,$2
	ld hl,[Szov_P]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Szov_Ikon_x], a
	; generic assign 
	ld de,$3
	ld hl,[Szov_P]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Szov_Ikon_y], a
	call Szov_Ikon
	; ;generic pointer/integer P:=P+(expr) add expression
	; RHS is pure 
	ld de,$04
	ld hl,[Szov_P]
	add  hl,de
	ld [Szov_P],hl
	jp Szov_Kiir_edblock3206
Szov_Kiir_eblock3205:
	; generic assign 
	ld de,$1
	ld hl,[Szov_P]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Szov_Kiir_y], a
	; ;generic pointer/integer P:=P+(expr) add expression
	; RHS is pure 
	ld de,$02
	ld hl,[Szov_P]
	add  hl,de
	ld [Szov_P],hl
	; generic assign 
	ld a,[localVariable_Szov_Kiir_x]
	ld [Ir_X], a
	; generic assign 
	ld a,[localVariable_Szov_Kiir_y]
	ld [Ir_Y], a
	; Loading pointer
	ld hl,[Szov_P]
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Optimization : zp[0]
	ld hl,[Szov_P]
	ld a,[hl]
	ld [localVariable_Szov_Kiir_varPrefixed_c], a
Szov_Kiir_while3209:
Szov_Kiir_loopstart3213:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szov_Kiir_varPrefixed_c]
	or a
	jr z, Szov_Kiir_edblock3212
Szov_Kiir_ctb3210: ;Main true block ;keep :
	; ;generic pointer/integer P:=P+(expr) add expression
	; RHS is pure 
	ld de,$01
	ld hl,[Szov_P]
	add  hl,de
	ld [Szov_P],hl
	; generic assign 
	; Optimization : zp[0]
	ld a,[hl]
	ld [localVariable_Szov_Kiir_varPrefixed_c], a
	jr Szov_Kiir_while3209
Szov_Kiir_edblock3212:
Szov_Kiir_loopend3214:
	; ;generic pointer/integer P:=P+(expr) add expression
	; RHS is pure 
	ld de,$01
	ld hl,[Szov_P]
	add  hl,de
	ld [Szov_P],hl
Szov_Kiir_edblock3206:
	; generic assign 
	; Optimization : zp[0]
	ld hl,[Szov_P]
	ld a,[hl]
	ld [localVariable_Szov_Kiir_x], a
	jp Szov_Kiir_while3172
Szov_Kiir_edblock3175:
Szov_Kiir_loopend3177:
	ret
end_procedure_Szov_Kiir:
	; Játékszabály raszter-sáv MEGSZAKÍTÁSBÓL: a $38-as JP a Szab_IT-re mutat. A raszter-IT a sáv tetején (Szab_SavY. sor)
; //   jön, a rutin soronként (200 T) a Szab_SavSzin színeit írja az 1-es (fekete) palettába, majd 1 sorral lejjebb lép
; //   (alul kimegy, fent becsúszik) és beállítja a következő IT-sort. A főprogram (szövegkiírás) közben fut tovább. 
	; ***********  Defining procedure : IT_Telepit
	;    Procedure type : User-defined procedure
IT_Telepit:
			di
			ld a,[Szab_SavPort]
			ld (SzIT_Out+1),a
			call SzIT_Poz
			ld hl,Szab_IT
			ld ($39),hl
			ei
			jp SzIT_Vege
Szab_IT:
			push af
			push bc
			push de
			push hl
			out ($7),a
			ld hl,[Szab_SavAkt]
			ld a,[Szab_SavDb]
			ld c,a
			ld b,8
SzIT_Fin:
			djnz SzIT_Fin
SzIT_Sor:
			ld a,(hl)
SzIT_Out:
			out ($61),a
			inc hl
			ld b,12
SzIT_In:
			djnz SzIT_In
			nop
			dec c
			jp nz,SzIT_Sor
			ld a,[Szab_SavPort]
			ld c,a
			ld a,[Szab_SavVeg]
			out (c),a
			ld a,[Szab_SavLep]
			or a
			jr nz,SzIT_Lep
			ld hl,Szab_SavY
			ld a,[Szab_SavCel]
			sub (hl)
			jr z,SzIT_Ott
			sra a
			sra a
			jp m,SzIT_Neg
			inc a
SzIT_Neg:
			add a,(hl)
			ld (hl),a
SzIT_Ott:
			ld hl,Szab_SavFr
			inc (hl)
			ld a,(hl)
			and 3
			jr nz,SzIT_Ugr
			ld hl,[Szab_SavAkt]
			ld a,(hl)
			ld d,h
			ld e,l
			inc hl
			ld bc,5
			ldir
			ld (de),a
			ld hl,[Szab_SavAkt]
			ld bc,11
			add hl,bc
			ld a,(hl)
			ld d,h
			ld e,l
			dec hl
			ld bc,5
			lddr
			ld (de),a
			jr SzIT_Ugr
SzIT_Lep:
			ld a,[Szab_SavOff]
			or a
			jr z,SzIT_Le
			dec a
			ld [Szab_SavOff],a
			jr SzIT_Ugr
SzIT_Le:
			ld a,[Szab_SavY]
			inc a
			cp 240
			jr c,SzIT_Y
			ld a,23
			ld [Szab_SavOff],a
			xor a
SzIT_Y:
			ld [Szab_SavY],a
SzIT_Ugr:
			call SzIT_Poz
			pop hl
			pop de
			pop bc
			pop af
			ei
			ret
SzIT_Poz:
			ld a,[Szab_SavOff]
			ld e,a
			ld d,0
			ld hl,[Szab_SavP]
			add hl,de
			ld [Szab_SavAkt],hl
			ld a,24
			sub e
			ld [Szab_SavDb],a
			ld a,[Szab_SavY]
			ld [GE_LineNr],a
			jp GE_SetRasterInterruptPos
SzIT_Vege:
		
	ret
end_procedure_IT_Telepit:
	; Játékszabály: a fekete paletta fut végig lefelé 
	; ***********  Defining procedure : Szab_IT_Be
	;    Procedure type : User-defined procedure
Szab_IT_Be:
	ld hl,Szab_SavSzin
	ld [Szab_SavP],hl
	ld a, $0
	ld [Szab_SavY], a
	ld a, $17
	ld [Szab_SavOff], a
	ld a, $1
	ld [Szab_SavLep], a
	ld a, $61
	ld [Szab_SavPort], a
	ld a, $0
	ld [Szab_SavVeg], a
	call IT_Telepit
	ret
end_procedure_Szab_IT_Be:
	; Főmenü: álló keret-sáv a pumpa-mutató sorában (a Szab_SavY-t a Menu_Pumpa állítja) 
	; ***********  Defining procedure : Menu_IT_Be
	;    Procedure type : User-defined procedure
Menu_IT_Be:
	; Generic assign 16-bit pointer
	; Generic 16-bit binop
	ld de,$0c
	; Variable is 16-bit
	ld hl,Menu_SavSzin
	xor a ; clear carry
	sbc hl,de
	; Store 16-bit address
	ld [Szab_SavP],hl
	; 12 soros: Off=12 -> Akt = a tábla, Db = 12 
	ld a, $c
	ld [Szab_SavOff], a
	ld a, $0
	ld [Szab_SavLep], a
	ld [Szab_SavPort], a
	ld a, $2a
	ld [Szab_SavVeg], a
	; szürke keret 
	; generic assign 
	ld a,[Szab_SavCel]
	ld [Szab_SavY], a
	; a sáv a célsorról indul (messziről az előjeles lépés átfordulna) 
	call IT_Telepit
	ret
end_procedure_Menu_IT_Be:
	; A sáv le: a $38 vissza a GE kezelőjére, raszter-IT a 239. sorra, fekete paletta, szürke keret 
	; ***********  Defining procedure : Szab_IT_Ki
	;    Procedure type : User-defined procedure
Szab_IT_Ki:
			di
			ld hl,GE_IT_HANLDER
			ld ($39),hl
			ld a,42
			out ($0),a
			xor a
			out ($61),a
			ei
		
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	ret
end_procedure_Szab_IT_Ki:
	; Tűz/SPACE új lenyomására vár (előbb az elengedésre, hogy a nyomva tartott gomb ne lapozzon tovább) 
	; ***********  Defining procedure : Tuz_Var
	;    Procedure type : User-defined procedure
Tuz_Var:
	ld a, $1
	ld [Start_Wait], a
Tuz_Var_while3221:
Tuz_Var_loopstart3225:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Tuz_Var_edblock3224
Tuz_Var_ctb3222: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	or a
	jr nz,Tuz_Var_edblock3238
Tuz_Var_ctb3236: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Tuz_Var_edblock3238:
	call GE_WaitForSync
	jr Tuz_Var_while3221
Tuz_Var_edblock3224:
Tuz_Var_loopend3226:
	ld a, $1
	ld [Start_Wait], a
Tuz_Var_while3240:
Tuz_Var_loopstart3244:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Tuz_Var_edblock3243
Tuz_Var_ctb3241: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	cp $1
	jr nz,Tuz_Var_edblock3257
Tuz_Var_ctb3255: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Tuz_Var_edblock3257:
	call GE_WaitForSync
	jr Tuz_Var_while3240
Tuz_Var_edblock3243:
Tuz_Var_loopend3245:
	ret
end_procedure_Tuz_Var:
	; JÁTÉKSZABÁLY (a főmenü 5. pontja; sztori, szabály, jelmagyarázat ikonokkal): a SZABALY.BIN az U2 $9000-on; a Pause_Buf-ba másolva, oldalanként kiírva, tűzre lapoz 
	; ***********  Defining procedure : Szabaly_Kepernyo
	;    Procedure type : User-defined procedure
localVariable_Szabaly_Kepernyo_varPrefixed_c:	db	0
Szabaly_Kepernyo_block3259:
Szabaly_Kepernyo:
	; generic assign 
	ld hl,$9000
	; Loading pointer
	ld [Szab_Src],hl
	call Digi_Le
	call Szab_IT_Be
	; a színes raszter-sáv a megszakításból fut, amíg ki nem lépünk 
	ld a, $0
	ld [localVariable_Szabaly_Kepernyo_varPrefixed_c], a
Szabaly_Kepernyo_while3260:
Szabaly_Kepernyo_loopstart3264:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Szabaly_Kepernyo_varPrefixed_c]
	cp $ff
	jr z, Szabaly_Kepernyo_edblock3263
Szabaly_Kepernyo_ctb3261: ;Main true block ;keep :
				ld a,$B0
				out ($2),a
				ld hl,[Szab_Src]
				ld de,Pause_Buf
				ld bc,2048
				ldir
				ld a,$90
				out ($2),a
			
	; di nélkül: a sáv-megszakítás nem nyúl a $8000-$BFFF-hez 
	ld hl,Pause_Buf
	ld [Szov_P],hl
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	call Szov_Kiir
	; generic assign 
	; Optimization : zp[0]
	ld hl,[Szov_P]
	ld a,[hl]
	ld [localVariable_Szabaly_Kepernyo_varPrefixed_c], a
	; ;generic pointer/integer P:=P+(expr) add expression
	; RHS is pure 
	ld de,$01
	ld hl,[Szov_P]
	add  hl,de
	ld [Szov_P],hl
				ld de,Pause_Buf
				or a
				sbc hl,de
				ld de,[Szab_Src]
				add hl,de
				ld [Szab_Src],hl
			
	call Tuz_Var
	jr Szabaly_Kepernyo_while3260
Szabaly_Kepernyo_edblock3263:
Szabaly_Kepernyo_loopend3265:
	call Szab_IT_Ki
	ret
end_procedure_Szabaly_Kepernyo:
	; ***********  Defining procedure : Kep_Rajz
	;    Procedure type : User-defined procedure
localVariable_Kep_Rajz_x:	db	0
localVariable_Kep_Rajz_y:	db	0
Kep_Rajz_block3268:
Kep_Rajz:
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_Kep_Rajz_y]
	ld l,a
	ld h,0
	; Loading pointer
	ld [Kep_Dst],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$40
	push af
	; Variable is 16-bit
	ld de,[Kep_Dst]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [Kep_Dst],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld a,[localVariable_Kep_Rajz_x]
	ld e,a
	ld d,0
	; Variable is 16-bit
	ld hl,[Kep_Dst]
	add  hl,de
	ld [Kep_Dst],hl
	; 16 bit BINOP
	; RHS is pure 
	; RHS is pure constant of $100
	ld b,$80
	ld a,[ Kep_Dst+1]
	add a,b
	ld [ Kep_Dst+1],a
			ld a,[Kep_H]
			ld b,a
KepR_sor:
			; kitolto sor: a TRSE a kod elhelyezkedesetol fuggoen osszeomlik, ez a sor eltolja
			push bc
			di
			ld a,$B0
			out ($2),a
			ld hl,[Kep_Src]
			ld de,$13A0
			ld a,[Kep_W]
			ld c,a
			ld b,0
			ldir
			ld [Kep_Src],hl
			ld a,$90
			out ($2),a
			ei
			ld hl,$13A0
			ld de,[Kep_Dst]
			ld a,[Kep_W]
			ld c,a
			ld b,0
			push de
			ldir
			pop hl
			ld de,64
			add hl,de
			ld [Kep_Dst],hl
			pop bc
			djnz KepR_sor
		
	ret
end_procedure_Kep_Rajz:
	; Vissza 4 szinu modba (a jatek, a szintvalaszto, a jatekszabaly, a palyakod kepernyoje elott) 
	; ***********  Defining procedure : Mod4
	;    Procedure type : User-defined procedure
Mod4:
	call Szab_IT_Ki
	; a főmenü keret-sávja le 
	ld a, $0
	ld [Menu16], a
	ld a, $1
	ld [GE_Mode], a
	call GE_SetGraphMode
	call Normal_Szinek
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ret
end_procedure_Mod4:
	; FOMENU, 16 szinu: a cim es a menupontok kepe az U2-bol (MENU16.BIN); 5 menupont, 20 sorkozzel a 81. sortol 
	; ***********  Defining procedure : Fomenu_Rajz
	;    Procedure type : User-defined procedure
Fomenu_Rajz:
	ld a, $2
	ld [GE_Mode], a
	call GE_SetGraphMode
	ld a, $3f
	ld [GE_Pattern], a
	call GE_ClearScreen
	; generic assign 
	ld hl,$a000
	; Loading pointer
	ld [Kep_Src],hl
	ld a, $32
	ld [Kep_W], a
	ld a, $28
	ld [Kep_H], a
	ld a, $7
	ld [localVariable_Kep_Rajz_x], a
	ld a, $11
	ld [localVariable_Kep_Rajz_y], a
	call Kep_Rajz
	; generic assign 
	ld hl,$a7d0
	; Loading pointer
	ld [Kep_Src],hl
	ld a, $2b
	ld [Kep_W], a
	ld a, $5c
	ld [Kep_H], a
	ld a, $a
	ld [localVariable_Kep_Rajz_x], a
	ld a, $51
	ld [localVariable_Kep_Rajz_y], a
	call Kep_Rajz
	ld a, $1
	ld [Menu16], a
	call Menu_IT_Be
	ret
end_procedure_Fomenu_Rajz:
	; ***********  Defining procedure : Menu_Pumpa
	;    Procedure type : User-defined procedure
localVariable_Menu_Pumpa_varPrefixed_p:	dw	0
localVariable_Menu_Pumpa_y:	db	0
localVariable_Menu_Pumpa_sor:	db	0
localVariable_Menu_Pumpa_faz:	db	0
Menu_Pumpa_block3272:
Menu_Pumpa:
	; generic assign 
	; Variable is 16-bit
	ld a,[localVariable_Menu_Pumpa_faz]
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_Menu_Pumpa_varPrefixed_p],hl
	; generic assign 
	; Swapping nodes
	; Generic mul
	; Node is pure : 1
	ld a,$1e
	push af
	; Variable is 16-bit
	ld de,[localVariable_Menu_Pumpa_varPrefixed_p]
	ld hl,0
	ld c,0
	pop af
	call mul_16x8
	; Loading pointer
	ld [localVariable_Menu_Pumpa_varPrefixed_p],hl
	; 16 bit BINOP
	; RHS is pure 
	ld de,$b744
	; Variable is 16-bit
	ld hl,[localVariable_Menu_Pumpa_varPrefixed_p]
	add  hl,de
	ld [localVariable_Menu_Pumpa_varPrefixed_p],hl
	; generic assign 
	; Variable is 16-bit
	; Loading pointer
	ld [Kep_Src],hl
	ld a, $3
	ld [Kep_W], a
	ld a, $a
	ld [Kep_H], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[localVariable_Menu_Pumpa_sor]
	ld e,a
	ld d,0
	ld a,$14
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld [localVariable_Menu_Pumpa_y], a
	; 'a:=a + const'  optimization 
	add  a,$51
	ld [localVariable_Menu_Pumpa_y], a
	; generic assign 
	; RHS is pure numeric optimisation
	sub  $1
	ld [Szab_SavCel], a
	; a keret-sáv ide kúszik (a megszakítás: a távolság negyedével lép) 
	ld a, $6
	ld [localVariable_Kep_Rajz_x], a
	; generic assign 
	ld a,[localVariable_Menu_Pumpa_y]
	ld [localVariable_Kep_Rajz_y], a
	call Kep_Rajz
	ret
end_procedure_Menu_Pumpa:
	; A menu pumpa-mutatojanak animacioja (4 kepkockankent fazisvaltas; csak a 16 szinu menuben) 
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
	jr c, Menu_Anim_edblock3279
Menu_Anim_ctb3277: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Ido], a
	; 'a:=a + const'  optimization 
	ld a,[Menu_Faz]
	add  a,$1
	ld [Menu_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $8
	jr c, Menu_Anim_edblock3297
Menu_Anim_ctb3295: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Faz], a
Menu_Anim_edblock3297:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu16]
	cp $1
	jr nz,Menu_Anim_edblock3302
Menu_Anim_ctb3300: ;Main true block ;keep :
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
Menu_Anim_edblock3302:
Menu_Anim_edblock3279:
	ret
end_procedure_Menu_Anim:
	; LEVEL CODE: melyik betű van lenyomva (0..25 = A..Z, 255 = egyik sem) 
	; ***********  Defining procedure : Betu_Lenyomva
	;    Procedure type : User-defined procedure
localVariable_Betu_Lenyomva_varPrefixed_i:	db	0
localVariable_Betu_Lenyomva_varPrefixed_r:	db	0
localVariable_Betu_Lenyomva_k:	dw	0
Betu_Lenyomva_block3304:
Betu_Lenyomva:
	ld a, $ff
	ld [localVariable_Betu_Lenyomva_varPrefixed_r], a
	ld a, $0
	ld [localVariable_Betu_Lenyomva_varPrefixed_i], a
Betu_Lenyomva_while3305:
Betu_Lenyomva_loopstart3309:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	cp $1a
	jr nc,Betu_Lenyomva_edblock3308
Betu_Lenyomva_ctb3306: ;Main true block ;keep :
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
	jr z, Betu_Lenyomva_edblock3322
Betu_Lenyomva_ctb3320: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	ld [localVariable_Betu_Lenyomva_varPrefixed_r], a
Betu_Lenyomva_edblock3322:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Betu_Lenyomva_varPrefixed_i]
	add  a,$1
	ld [localVariable_Betu_Lenyomva_varPrefixed_i], a
	jr Betu_Lenyomva_while3305
Betu_Lenyomva_edblock3308:
Betu_Lenyomva_loopend3310:
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
Kod_Bevitel_block3324:
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
	ld hl,Kod_Bevitel_stringassignstr3326
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
Kod_Bevitel_while3327:
Kod_Bevitel_loopstart3331:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,Kod_Bevitel_edblock3330
Kod_Bevitel_ctb3328: ;Main true block ;keep :
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
	jr nc,Kod_Bevitel_edblock3901
Kod_Bevitel_ctb3899: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_villog]
	cp $10
	jr nz,Kod_Bevitel_edblock3906
Kod_Bevitel_ctb3904: ;Main true block ;keep :
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
Kod_Bevitel_edblock3906:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_villog]
	cp $20
	jr c, Kod_Bevitel_edblock3911
Kod_Bevitel_ctb3909: ;Main true block ;keep :
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
Kod_Bevitel_edblock3911:
Kod_Bevitel_edblock3901:
	; betű: új lenyomásra hozzáírva 
	; generic assign 
	call Betu_Lenyomva
	ld [localVariable_Kod_Bevitel_varPrefixed_b], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	cp $ff
	jp z, Kod_Bevitel_edblock3916
Kod_Bevitel_ctb3914: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Kod_Bevitel_elozo]
	ld b,a
	ld a,[localVariable_Kod_Bevitel_varPrefixed_b]
	cp b
	jp z, Kod_Bevitel_edblock3921
Kod_Bevitel_ctb3919: ;Main true block ;keep :
	; az 5. betű után azonnal ellenőriz (nincs ENTER) 
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jp nc,Kod_Bevitel_edblock3926
Kod_Bevitel_ctb3924: ;Main true block ;keep :
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
	jr nz,Kod_Bevitel_edblock3931
Kod_Bevitel_ctb3929: ;Main true block ;keep :
	; a kurzor azonnal megjelenik 
	ld a, $1
	ld [localVariable_Kod_Bevitel_kesz], a
Kod_Bevitel_edblock3931:
Kod_Bevitel_edblock3926:
Kod_Bevitel_edblock3921:
Kod_Bevitel_edblock3916:
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
	jr z, Kod_Bevitel_edblock3936
Kod_Bevitel_ctb3934: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_egy], a
Kod_Bevitel_edblock3936:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$807
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, Kod_Bevitel_edblock3941
Kod_Bevitel_ctb3939: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Kod_Bevitel_egy], a
Kod_Bevitel_edblock3941:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	or a
	jr nz,Kod_Bevitel_edblock3946
Kod_Bevitel_ctb3944: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock3946:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_kesz]
	cp $1
	jr nz,Kod_Bevitel_edblock3951
Kod_Bevitel_ctb3949: ;Main true block ;keep :
	ld a, $3
	ld [localVariable_Kod_Bevitel_egy], a
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock3951:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_gomb]
	or a
	jp nz,Kod_Bevitel_edblock3956
Kod_Bevitel_ctb3954: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $1
	jp nz,Kod_Bevitel_edblock3961
Kod_Bevitel_ctb3959: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	or a
	jp c, Kod_Bevitel_edblock3966
	jp z, Kod_Bevitel_edblock3966
Kod_Bevitel_ctb3964: ;Main true block ;keep :
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
Kod_Bevitel_edblock3966:
Kod_Bevitel_edblock3961:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $2
	jr nz,Kod_Bevitel_edblock3971
Kod_Bevitel_ctb3969: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Kod_Bevitel_edblock3971:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	cp $3
	jp nz,Kod_Bevitel_edblock3976
Kod_Bevitel_ctb3974: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_n]
	cp $5
	jp nz,Kod_Bevitel_edblock3981
Kod_Bevitel_ctb3979: ;Main true block ;keep :
	; keresés: az egyjátékos, aztán a co-op pályák kódjai (Kod_Mod: 0 / 1) - versus pályának nincs kódja 
	ld a, $ff
	ld [Kod_Palya], a
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while3983:
Kod_Bevitel_loopstart3987:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $b
	jp nc,Kod_Bevitel_edblock3986
Kod_Bevitel_ctb3984: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
	ld [localVariable_Kod_Bevitel_j], a
Kod_Bevitel_while3990:
Kod_Bevitel_loopstart3994:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_j]
	cp $5
	jr nc,Kod_Bevitel_edblock3993
Kod_Bevitel_ctb3991: ;Main true block ;keep :
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
	jr z, Kod_Bevitel_edblock4001
Kod_Bevitel_ctb3999: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
Kod_Bevitel_edblock4001:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	add  a,$1
	ld [localVariable_Kod_Bevitel_j], a
	jr Kod_Bevitel_while3990
Kod_Bevitel_edblock3993:
Kod_Bevitel_loopend3995:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a1]
	or a
	jr nz,Kod_Bevitel_edblock4006
Kod_Bevitel_ctb4004: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock4011
Kod_Bevitel_ctb4009: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld [Kod_Palya], a
	ld a, $0
	ld [Kod_Mod], a
Kod_Bevitel_edblock4011:
Kod_Bevitel_edblock4006:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jp Kod_Bevitel_while3983
Kod_Bevitel_edblock3986:
Kod_Bevitel_loopend3988:
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while4013:
Kod_Bevitel_loopstart4017:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $b
	jp nc,Kod_Bevitel_edblock4016
Kod_Bevitel_ctb4014: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
	ld [localVariable_Kod_Bevitel_j], a
Kod_Bevitel_while4020:
Kod_Bevitel_loopstart4024:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_j]
	cp $5
	jr nc,Kod_Bevitel_edblock4023
Kod_Bevitel_ctb4021: ;Main true block ;keep :
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
	jr z, Kod_Bevitel_edblock4031
Kod_Bevitel_ctb4029: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Kod_Bevitel_varPrefixed_a1], a
Kod_Bevitel_edblock4031:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_j]
	add  a,$1
	ld [localVariable_Kod_Bevitel_j], a
	jr Kod_Bevitel_while4020
Kod_Bevitel_edblock4023:
Kod_Bevitel_loopend4025:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_a1]
	or a
	jr nz,Kod_Bevitel_edblock4036
Kod_Bevitel_ctb4034: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock4041
Kod_Bevitel_ctb4039: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	ld [Kod_Palya], a
	ld a, $1
	ld [Kod_Mod], a
Kod_Bevitel_edblock4041:
Kod_Bevitel_edblock4036:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jp Kod_Bevitel_while4013
Kod_Bevitel_edblock4016:
Kod_Bevitel_loopend4018:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr nz,Kod_Bevitel_edblock4046
Kod_Bevitel_ctb4044: ;Main true block ;keep :
	ld a, $b0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Kod_Bevitel_stringassignstr4049
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	; rossz kód: ~1 mp, aztán vissza a menübe 
	ld a, $0
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
Kod_Bevitel_while4050:
Kod_Bevitel_loopstart4054:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	cp $32
	jr nc,Kod_Bevitel_edblock4053
Kod_Bevitel_ctb4051: ;Main true block ;keep :
	call GE_WaitForSync
	call Menu_Anim
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Kod_Bevitel_varPrefixed_i]
	add  a,$1
	ld [localVariable_Kod_Bevitel_varPrefixed_i], a
	jr Kod_Bevitel_while4050
Kod_Bevitel_edblock4053:
Kod_Bevitel_loopend4055:
Kod_Bevitel_edblock4046:
	ld a, $0
	ld [Start_Wait], a
Kod_Bevitel_edblock3981:
Kod_Bevitel_edblock3976:
	ld a, $1
	ld [localVariable_Kod_Bevitel_gomb], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Kod_Bevitel_egy]
	or a
	jr nz,Kod_Bevitel_edblock4060
Kod_Bevitel_ctb4058: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Kod_Bevitel_gomb], a
Kod_Bevitel_edblock4060:
Kod_Bevitel_edblock3956:
	jp Kod_Bevitel_while3327
Kod_Bevitel_edblock3330:
Kod_Bevitel_loopend3332:
	ret
end_procedure_Kod_Bevitel:
	; ***********  Defining procedure : Ed_Add
	;    Procedure type : User-defined procedure
localVariable_Ed_Add_t:	db	0
localVariable_Ed_Add_x:	db	0
localVariable_Ed_Add_y:	db	0
localVariable_Ed_Add_w:	db	0
Ed_Add_block4062:
Ed_Add:
	; Storing to array  
	ld a,[Ed_Db]
	ld e,a
	ld d,0
	ld hl,Ed_T
	add hl,de
	ld a,[localVariable_Ed_Add_t]
	ld [hl],a 
	; Storing to array  
	ld a,[Ed_Db]
	ld e,a
	ld hl,Ed_X
	add hl,de
	ld a,[localVariable_Ed_Add_x]
	ld [hl],a 
	; Storing to array  
	ld a,[Ed_Db]
	ld e,a
	ld hl,Ed_Y
	add hl,de
	ld a,[localVariable_Ed_Add_y]
	ld [hl],a 
	; Storing to array  
	ld a,[Ed_Db]
	ld e,a
	ld hl,Ed_W
	add hl,de
	ld a,[localVariable_Ed_Add_w]
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[Ed_Db]
	add  a,$1
	ld [Ed_Db], a
	ret
end_procedure_Ed_Add:
	; ***********  Defining procedure : VS_Sor
	;    Procedure type : User-defined procedure
localVariable_VS_Sor_ar:	dw	0
VS_Sor_block4063:
VS_Sor:
	; generic assign 
	ld a,[Ed_Ujt]
	ld [localVariable_Ed_Add_t], a
	ld a, $7
	ld [localVariable_Ed_Add_x], a
	; generic assign 
	ld a,[VS_Y]
	ld [localVariable_Ed_Add_y], a
	ld a, $8
	ld [localVariable_Ed_Add_w], a
	call Ed_Add
	ld a, $2
	ld [localVariable_Ikon_Kep_x], a
	; generic assign 
	ld a,[VS_IY]
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[Ikon_D]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	ld a, $5
	ld [Ir_X], a
	; generic assign 
	ld a,[VS_Y]
	ld [Ir_Y], a
	ld hl,ColonStr
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Sor_ar]
	; Loading pointer
	ld [localVariable_HUD_Num4_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num4_x], a
	; generic assign 
	ld a,[VS_Y]
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	; 'a:=a + const'  optimization 
	ld a,[VS_Y]
	add  a,$e
	ld [VS_Y], a
	; 'a:=a + const'  optimization 
	ld a,[VS_IY]
	add  a,$e
	ld [VS_IY], a
	ret
end_procedure_VS_Sor:
	; VERSUS szintvalaszto: a p. palya adatai bal oldalt (kezdo penz, az engedelyezett eszkozok ara egymas alatt, virus/meteor jel) 
	; ***********  Defining procedure : VS_Ikonok
	;    Procedure type : User-defined procedure
localVariable_VS_Ikonok_x:	db	0
localVariable_VS_Ikonok_y:	db	0
localVariable_VS_Ikonok_vi:	db	0
localVariable_VS_Ikonok_me:	db	0
localVariable_VS_Ikonok_ar:	dw	0
localVariable_VS_Ikonok_varPrefixed_p:	db	0
VS_Ikonok_block4064:
VS_Ikonok:
	ld a, $0
	ld [Ed_Db], a
	ld [localVariable_Ed_Add_t], a
	ld a, $24
	ld [localVariable_Ed_Add_x], a
	ld a, $30
	ld [localVariable_Ed_Add_y], a
	ld a, $8
	ld [localVariable_Ed_Add_w], a
	call Ed_Add
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
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
	ld [localVariable_HUD_Num4_ertek],hl
	ld a, $24
	ld [localVariable_HUD_Num4_x], a
	ld a, $30
	ld [localVariable_HUD_Num4_sor], a
	call HUD_Num4
	ld a, $5c
	ld [VS_Y], a
	ld a, $5b
	ld [VS_IY], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
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
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Pumpa_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	ld a, $1
	ld [Ed_Ujt], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_VS_Sor_ar],hl
	call VS_Sor
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[VS_Y]
	sub  $e
	ld [localVariable_VS_Ikonok_y], a
	; generic assign 
	ld [Ir_Y], a
	ld hl,SlashStr
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [localVariable_Ed_Add_t], a
	ld a, $11
	ld [localVariable_Ed_Add_x], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_y]
	ld [localVariable_Ed_Add_y], a
	ld a, $6
	ld [localVariable_Ed_Add_w], a
	call Ed_Add
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
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
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	ld a,[localVariable_VS_Ikonok_ar]
	ld [localVariable_VS_Ikonok_x], a
	; generic assign 
	; Variable is 16-bit
	ld l,a
	ld h,0
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_y]
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
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
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,Fal_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	ld a, $3
	ld [Ed_Ujt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Fal
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jr nz,VS_Ikonok_edblock4068
VS_Ikonok_ctb4066: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_VS_Sor_ar],hl
	call VS_Sor
VS_Ikonok_edblock4068:
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
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
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	; Generic 16-bit binop
	ld de,$03
	; Variable is 16-bit
	ld hl,BombaIkon_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	ld a, $4
	ld [Ed_Ujt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Bomba
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jr nz,VS_Ikonok_edblock4074
VS_Ikonok_ctb4072: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_VS_Sor_ar],hl
	call VS_Sor
VS_Ikonok_edblock4074:
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_AknaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	; Generic 16-bit binop
	ld de,$c3
	; Variable is 16-bit
	ld hl,Akna_Data
	add hl,de
	; Loading pointer
	ld [Ikon_D],hl
	ld a, $5
	ld [Ed_Ujt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Akna
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jr nz,VS_Ikonok_edblock4080
VS_Ikonok_ctb4078: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_VS_Sor_ar],hl
	call VS_Sor
VS_Ikonok_edblock4080:
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_VirusAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_VS_Ikonok_ar],hl
	; generic assign 
	ld de,$3
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Ikon_D],hl
	ld a, $7
	ld [Ed_Ujt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_VirusLe
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jr nz,VS_Ikonok_edblock4086
VS_Ikonok_ctb4084: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_VS_Sor_ar],hl
	call VS_Sor
VS_Ikonok_edblock4086:
	ld a, $6
	ld [localVariable_Ed_Add_t], a
	ld a, $30
	ld [localVariable_Ed_Add_x], a
	ld a, $aa
	ld [localVariable_Ed_Add_y], a
	ld a, $6
	ld [localVariable_Ed_Add_w], a
	call Ed_Add
	; generic assign 
	ld a,[VS_IY]
	ld [localVariable_VS_Ikonok_y], a
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	cp $9c
	jr c, VS_Ikonok_edblock4092
	jr z, VS_Ikonok_edblock4092
VS_Ikonok_ctb4090: ;Main true block ;keep :
	ld a, $9c
	ld [localVariable_VS_Ikonok_y], a
VS_Ikonok_edblock4092:
	; generic assign 
	ld a,[localVariable_VS_Ikonok_y]
	ld b,a
	ld a,$9d
	sub  b
	ld [localVariable_VS_Ikonok_x], a
	ld a, $0
	ld [GE_X], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_y]
	ld [GE_Y], a
	ld a, $1d
	ld [GE_Width], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_x]
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Virus
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_VS_Ikonok_vi], a
	; generic assign 
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Meteor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_VS_Ikonok_me], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jr nz,VS_Ikonok_edblock4098
VS_Ikonok_ctb4096: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_MeteorVir
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	cp $1
	jr nz,VS_Ikonok_edblock4110
VS_Ikonok_ctb4108: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Ikonok_vi], a
VS_Ikonok_edblock4110:
VS_Ikonok_edblock4098:
	; generic assign 
	ld de,$4
	ld hl,Enemy_FazPtr_Tab
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_VS_Ikonok_ar],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_vi]
	cp $1
	jr nz,VS_Ikonok_eblock4114
VS_Ikonok_ctb4113: ;Main true block ;keep :
	ld a, $8
	ld [localVariable_Ikon_Kep_x], a
	ld a, $ac
	ld [localVariable_Ikon_Kep_y], a
	; generic assign 
	; Variable is 16-bit
	ld hl,[localVariable_VS_Ikonok_ar]
	; Loading pointer
	ld [localVariable_Ikon_Kep_varPrefixed_d],hl
	call Ikon_Kep
	jr VS_Ikonok_edblock4115
VS_Ikonok_eblock4114:
	ld a, $8
	ld [GE_X], a
	ld a, $ac
	ld [GE_Y], a
	ld a, $2
	ld [GE_Width], a
	ld a, $8
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
VS_Ikonok_edblock4115:
	ld a, $c
	ld [localVariable_VS_Ikonok_x], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Ikonok_me]
	cp $1
	jr nz,VS_Ikonok_eblock4122
VS_Ikonok_ctb4121: ;Main true block ;keep :
	; Storing to array  
	ld a,[localVariable_VS_Ikonok_x]
	ld [Meteor+$f],a
	ld a, $a8
	ld [VS_Y], a
	; Storing to array  
	ld [Meteor+$10],a
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SetPosition
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_SaveBackground
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_Draw
	jr VS_Ikonok_edblock4123
VS_Ikonok_eblock4122:
	ld a, $c
	ld [GE_X], a
	ld a, $a8
	ld [GE_Y], a
	ld a, $3
	ld [GE_Width], a
	ld a, $10
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
VS_Ikonok_edblock4123:
	ret
end_procedure_VS_Ikonok:
	; VERSUS szintvalaszto: a p. versus palya kiskepe jobb oldalt (30x18 mezo, mezonkent 1 byte x 4 sor, szikla fekete, fekete keret) + palya szama, cel, adatok 
	; ***********  Defining procedure : VS_Elonezet
	;    Procedure type : User-defined procedure
localVariable_VS_Elonezet_ti:	dw	0
localVariable_VS_Elonezet_varPrefixed_p:	db	0
VS_Elonezet_block4128:
VS_Elonezet:
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
			ld ix,$925F					; $8000 + 73*64 + 31
			ld d,18
VS_Elonezet_sor:
			push ix
			ld e,30
VS_Elonezet_mezo:
			ld a,[VSE_Byte]
			sla a
			ld [VSE_Byte],a
			ld c,0
			jr nc,VS_Elonezet_ir
			ld c,240
VS_Elonezet_ir:
			ld (IX+0),c
			push de
			push ix
			pop de
			ld a,e
			add a,128
			ld e,a
			ld a,d
			adc a,0
			ld d,a
			ld a,c
			ld (de),a
			pop de
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
		
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	add  a, $1
	ld [localVariable_HUD_Num2_ertek], a
	ld a, $30
	ld [localVariable_HUD_Num2_x], a
	ld a, $9e
	ld [localVariable_HUD_Num2_sor], a
	call HUD_Num2
	; generic assign 
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Cel
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	ld a, $30
	ld [localVariable_HUD_Num3_x], a
	ld a, $aa
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	; generic assign 
	ld a,[localVariable_VS_Elonezet_varPrefixed_p]
	ld [localVariable_VS_Ikonok_varPrefixed_p], a
	call VS_Ikonok
	ret
end_procedure_VS_Elonezet:
	; ***********  Defining procedure : Ed_Ertek
	;    Procedure type : User-defined procedure
localVariable_Ed_Ertek_varPrefixed_p:	db	0
localVariable_Ed_Ertek_t:	db	0
localVariable_Ed_Ertek_irany:	db	0
Ed_Ertek_block4130:
Ed_Ertek:
	; generic assign 
	ld a,[localVariable_Ed_Ertek_varPrefixed_p]
	ld [Ed_P], a
	; generic assign 
	ld a,[localVariable_Ed_Ertek_t]
	ld [Ed_Tip], a
	; generic assign 
	ld a,[localVariable_Ed_Ertek_irany]
	ld [Ed_Irany], a
			ld bc,5
			ld de,9995
			ld a,[Ed_Tip]
			or a
			jr nz,EdA_1
			ld bc,100
			ld de,9900
EdA_1:
			cp 2
			jr nz,EdA_2
			ld bc,1
			ld de,999
EdA_2:
			cp 4
			jr c,EdA_4
			cp 6
			jr z,EdA_4
			ld bc,100
			ld de,9900
EdA_4:
			cp 6
			jr nz,EdA_3
			ld de,500
EdA_3:
			ld [Ed_Lep],bc
			ld [Ed_Max],de
		
			ld a,[Ed_Tip]
			ld hl,Palya2_Penz
			or a
			jr z,EdA_int
			ld hl,Palya2_PumpaAr
			dec a
			jr z,EdA_int
			ld hl,Palya2_Termel
			dec a
			jr z,EdA_int
			ld hl,Palya2_FalAr
			dec a
			jr z,EdA_int
			ld hl,Palya2_BombaAr
			dec a
			jr z,EdA_int
			ld hl,Palya2_AknaAr
			dec a
			jr z,EdA_int
			ld hl,Palya2_Cel
			dec a
			jr z,EdA_int
			ld hl,Palya2_VirusAr
EdA_int:
			ld a,[Ed_P]
			ld e,a
			ld d,0
			add hl,de
			add hl,de
			ld [Ed_Cim],hl
			ld e,(hl)
			inc hl
			ld d,(hl)
EdA_ert:
			ex de,hl
			ld de,[Ed_Lep]
			ld a,[Ed_Irany]
			cp 2
			jr nz,EdA_le
			add hl,de
			jr EdA_hat
EdA_le:
			or a
			sbc hl,de
EdA_hat:
			ex de,hl
			ld hl,[Ed_Max]
			or a
			sbc hl,de
			jr nc,EdA_ok
			ld de,[Ed_Lep]
			ld a,[Ed_Irany]
			cp 2
			jr nz,EdA_ok
			ld de,[Ed_Max]
EdA_ok:
			ld hl,[Ed_Cim]
			ld (hl),e
			inc hl
			ld (hl),d
EdA_vege:
			nop
			nop
			nop
		
	ret
end_procedure_Ed_Ertek:
	; VERSUS szerkeszto: a kijelolt mezo ertekenek zoldre szinezese 
	; ***********  Defining procedure : Ed_Jelol
	;    Procedure type : User-defined procedure
localVariable_Ed_Jelol_x:	db	0
localVariable_Ed_Jelol_y:	db	0
localVariable_Ed_Jelol_w:	db	0
localVariable_Ed_Jelol_varPrefixed_m:	db	0
Ed_Jelol_block4131:
Ed_Jelol:
	; generic assign 
	ld a,[localVariable_Ed_Jelol_varPrefixed_m]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Ed_X
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Ed_Jelol_x], a
	; generic assign 
	ld a,[localVariable_Ed_Jelol_varPrefixed_m]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Ed_Y
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Ed_Jelol_y], a
	; generic assign 
	ld a,[localVariable_Ed_Jelol_varPrefixed_m]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Ed_W
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_Ed_Jelol_w], a
	ld a, $3
	ld [Szin_Mod], a
	; generic assign 
	ld a,[localVariable_Ed_Jelol_x]
	ld [localVariable_Szinez_x], a
	; generic assign 
	ld a,[localVariable_Ed_Jelol_y]
	ld [localVariable_Szinez_y], a
	; generic assign 
	ld a,[localVariable_Ed_Jelol_w]
	ld [localVariable_Szinez_w], a
	ld a, $7
	ld [localVariable_Szinez_varPrefixed_h], a
	call Szinez
	ld a, $0
	ld [Szin_Mod], a
	ret
end_procedure_Ed_Jelol:
	; A PALYAK.BIN mentese lemezre: U3 (Terkepek) -> $8000 (U2), alap lapozas ($70) + a TVC megszakitas-kezelo a ROM fajlhivasok idejere 
	; ***********  Defining procedure : Pal_Elo
	;    Procedure type : User-defined procedure
Pal_Elo:
	call Digi_Le
	ld hl,$8000
	ld [Spr_Buf],hl
			di
			ld a,$B0
			out ($2),a
			ld hl,Terkepek
			ld de,$8000
			ld bc,[Pal_Hossz]
			ldir
			ld a,$70
			ld ($3),a
			out ($2),a
			ei
		
	ret
end_procedure_Pal_Elo:
	; ***********  Defining procedure : Pal_Ment
	;    Procedure type : User-defined procedure
Pal_Ment:
	call Pal_Elo
	call GE_EnableTVCITHandler
	ld hl,Pal_Nev
	ld [TVC_FileName],hl
	call TVC_CreateFile
	; Loading pointer
	ld hl,[Spr_Buf]
	ld [TVC_BlockData],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pal_Hossz]
	; Loading pointer
	ld [TVC_BlockLength],hl
	call TVC_BlockWrite
	call TVC_CloseFile
	call GE_DisableTVCITHandler
	ld a, $90
	ld [GE_Mode], a
	call GE_SetMemory
	ret
end_procedure_Pal_Ment:
	; VERSUS szerkeszto (E): fel/le = mezo, balra/jobbra = ertek (nyomva tartva ismetel), RETURN = jovahagyas es mentes 
	; ***********  Defining procedure : VS_Szerk
	;    Procedure type : User-defined procedure
localVariable_VS_Szerk_varPrefixed_m:	db	0
localVariable_VS_Szerk_irany:	db	0
localVariable_VS_Szerk_elozo:	db	0
localVariable_VS_Szerk_ism:	db	0
localVariable_VS_Szerk_kesz:	db	0
localVariable_VS_Szerk_varPrefixed_e:	db	0
localVariable_VS_Szerk_ev:	db	0
localVariable_VS_Szerk_t:	db	0
localVariable_VS_Szerk_varPrefixed_p:	db	0
VS_Szerk_block4134:
VS_Szerk:
	ld a, $d0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Szerk_stringassignstr4136
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $0
	ld [localVariable_VS_Szerk_varPrefixed_m], a
	; generic assign 
	ld [localVariable_Ed_Jelol_varPrefixed_m], a
	call Ed_Jelol
	ld a, $0
	ld [localVariable_VS_Szerk_elozo], a
	ld [localVariable_VS_Szerk_ism], a
	ld a, $1
	ld [localVariable_VS_Szerk_ev], a
	ld a, $0
	ld [localVariable_VS_Szerk_kesz], a
VS_Szerk_while4137:
VS_Szerk_loopstart4141:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_kesz]
	or a
	jp nz,VS_Szerk_edblock4140
VS_Szerk_ctb4138: ;Main true block ;keep :
	call GE_WaitForSync
	call GE_GetKeyboard
	call GE_GetJoysticks
	ld a, $0
	ld [localVariable_VS_Szerk_irany], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Szerk_edblock4313
VS_Szerk_ctb4311: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Szerk_irany], a
VS_Szerk_edblock4313:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Szerk_edblock4318
VS_Szerk_ctb4316: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_VS_Szerk_irany], a
VS_Szerk_edblock4318:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $40
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Szerk_edblock4323
VS_Szerk_ctb4321: ;Main true block ;keep :
	ld a, $3
	ld [localVariable_VS_Szerk_irany], a
VS_Szerk_edblock4323:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Szerk_edblock4328
VS_Szerk_ctb4326: ;Main true block ;keep :
	ld a, $4
	ld [localVariable_VS_Szerk_irany], a
VS_Szerk_edblock4328:
	ld a, $0
	ld [localVariable_VS_Szerk_varPrefixed_e], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_irany]
	or a
	jr z, VS_Szerk_edblock4333
VS_Szerk_ctb4331: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_VS_Szerk_elozo]
	ld b,a
	ld a,[localVariable_VS_Szerk_irany]
	cp b
	jr z, VS_Szerk_eblock4337
VS_Szerk_ctb4336: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Szerk_varPrefixed_e], a
	ld a, $0
	ld [localVariable_VS_Szerk_ism], a
	jr VS_Szerk_edblock4338
VS_Szerk_eblock4337:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Szerk_ism]
	add  a,$1
	ld [localVariable_VS_Szerk_ism], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $10
	jr c, VS_Szerk_edblock4344
VS_Szerk_ctb4342: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Szerk_varPrefixed_e], a
	ld a, $c
	ld [localVariable_VS_Szerk_ism], a
VS_Szerk_edblock4344:
VS_Szerk_edblock4338:
VS_Szerk_edblock4333:
	; generic assign 
	ld a,[localVariable_VS_Szerk_irany]
	ld [localVariable_VS_Szerk_elozo], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_varPrefixed_e]
	cp $1
	jp nz,VS_Szerk_edblock4349
VS_Szerk_ctb4347: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_irany]
	cp $1
	jr nz,VS_Szerk_edblock4354
VS_Szerk_ctb4352: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	or a
	jr nz,VS_Szerk_edblock4359
VS_Szerk_ctb4357: ;Main true block ;keep :
	; generic assign 
	ld a,[Ed_Db]
	ld [localVariable_VS_Szerk_varPrefixed_m], a
VS_Szerk_edblock4359:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	sub $1
	ld [localVariable_VS_Szerk_varPrefixed_m], a
VS_Szerk_edblock4354:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_irany]
	cp $2
	jr nz,VS_Szerk_edblock4364
VS_Szerk_ctb4362: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	add  a,$1
	ld [localVariable_VS_Szerk_varPrefixed_m], a
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[Ed_Db]
	ld b,a
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	cp b
	jr c, VS_Szerk_edblock4369
VS_Szerk_ctb4367: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_VS_Szerk_varPrefixed_m], a
VS_Szerk_edblock4369:
VS_Szerk_edblock4364:
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Ed_T
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [localVariable_VS_Szerk_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_irany]
	cp $3
	jr nz,VS_Szerk_edblock4374
VS_Szerk_ctb4372: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_p]
	ld [localVariable_Ed_Ertek_varPrefixed_p], a
	; generic assign 
	ld a,[localVariable_VS_Szerk_t]
	ld [localVariable_Ed_Ertek_t], a
	ld a, $1
	ld [localVariable_Ed_Ertek_irany], a
	call Ed_Ertek
VS_Szerk_edblock4374:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_irany]
	cp $4
	jr nz,VS_Szerk_edblock4379
VS_Szerk_ctb4377: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_p]
	ld [localVariable_Ed_Ertek_varPrefixed_p], a
	; generic assign 
	ld a,[localVariable_VS_Szerk_t]
	ld [localVariable_Ed_Ertek_t], a
	ld a, $2
	ld [localVariable_Ed_Ertek_irany], a
	call Ed_Ertek
VS_Szerk_edblock4379:
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_p]
	ld [localVariable_VS_Elonezet_varPrefixed_p], a
	call VS_Elonezet
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_m]
	ld [localVariable_Ed_Jelol_varPrefixed_m], a
	call Ed_Jelol
VS_Szerk_edblock4349:
	ld a, $0
	ld [localVariable_VS_Szerk_varPrefixed_e], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$1005
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, VS_Szerk_edblock4384
VS_Szerk_ctb4382: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Szerk_varPrefixed_e], a
VS_Szerk_edblock4384:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_varPrefixed_e]
	cp $1
	jr nz,VS_Szerk_edblock4389
VS_Szerk_ctb4387: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Szerk_ev]
	or a
	jr nz,VS_Szerk_edblock4394
VS_Szerk_ctb4392: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Szerk_kesz], a
VS_Szerk_edblock4394:
VS_Szerk_edblock4389:
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_e]
	ld [localVariable_VS_Szerk_ev], a
	jp VS_Szerk_while4137
VS_Szerk_edblock4140:
VS_Szerk_loopend4142:
	ld a, $d0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Szerk_stringassignstr4397
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	call Pal_Ment
	ld a, $d0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Szerk_stringassignstr4399
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	; generic assign 
	ld a,[localVariable_VS_Szerk_varPrefixed_p]
	ld [localVariable_VS_Elonezet_varPrefixed_p], a
	call VS_Elonezet
	ret
end_procedure_VS_Szerk:
	; VERSUS szintvalaszto kepernyo: joystick fel/le = elozo/kovetkezo palya (korbe), tuz/SPACE = inditas (Kod_Palya = a palya), ESC = vissza a menube (Kod_Palya = 255) 
	; ***********  Defining procedure : VS_Valaszto
	;    Procedure type : User-defined procedure
localVariable_VS_Valaszto_varPrefixed_p:	db	0
localVariable_VS_Valaszto_irany:	db	0
localVariable_VS_Valaszto_elozo:	db	0
localVariable_VS_Valaszto_t:	db	0
localVariable_VS_Valaszto_tv:	db	0
localVariable_VS_Valaszto_varPrefixed_e:	db	0
localVariable_VS_Valaszto_ev:	db	0
VS_Valaszto_block4400:
VS_Valaszto:
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ld a, $14
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4402
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $c4
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4404
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $2
	ld [Ir_X], a
	ld a, $30
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4406
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Ir_X], a
	ld a, $50
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4408
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $2
	ld [Ir_X], a
	ld a, $9e
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4410
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $24
	ld [Ir_X], a
	ld a, $9e
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4412
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $28
	ld [Ir_X], a
	ld a, $aa
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4414
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	ld a, $1e
	ld [GE_X], a
	ld a, $48
	ld [GE_Y], a
	ld a, $20
	ld [GE_Width], a
	ld a, $4a
	ld [GE_Height], a
	ld a, $f0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $1f
	ld [GE_X], a
	ld a, $49
	ld [GE_Y], a
	ld a, $1e
	ld [GE_Width], a
	ld a, $48
	ld [GE_Height], a
	ld a, $0
	ld [GE_Pattern], a
	call GE_FillRect
	ld a, $d0
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4416
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $dc
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4418
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $e8
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,VS_Valaszto_stringassignstr4420
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
	ld [localVariable_VS_Valaszto_ev], a
	ld [Start_Wait], a
VS_Valaszto_while4421:
VS_Valaszto_loopstart4425:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,VS_Valaszto_edblock4424
VS_Valaszto_ctb4422: ;Main true block ;keep :
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
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Valaszto_edblock4574
VS_Valaszto_ctb4572: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Valaszto_irany], a
VS_Valaszto_edblock4574:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, VS_Valaszto_edblock4579
VS_Valaszto_ctb4577: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_VS_Valaszto_irany], a
VS_Valaszto_edblock4579:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_irany]
	or a
	jr z, VS_Valaszto_edblock4584
VS_Valaszto_ctb4582: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_VS_Valaszto_elozo]
	ld b,a
	ld a,[localVariable_VS_Valaszto_irany]
	cp b
	jr z, VS_Valaszto_edblock4589
VS_Valaszto_ctb4587: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_irany]
	cp $1
	jr nz,VS_Valaszto_eblock4593
VS_Valaszto_ctb4592: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	or a
	jr nz,VS_Valaszto_eblock4598
VS_Valaszto_ctb4597: ;Main true block ;keep :
	ld a, $5
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
	jr VS_Valaszto_edblock4599
VS_Valaszto_eblock4598:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	sub $1
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
VS_Valaszto_edblock4599:
	jr VS_Valaszto_edblock4594
VS_Valaszto_eblock4593:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	add  a,$1
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $6
	jr c, VS_Valaszto_edblock4606
VS_Valaszto_ctb4604: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_VS_Valaszto_varPrefixed_p], a
VS_Valaszto_edblock4606:
VS_Valaszto_edblock4594:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	ld [localVariable_VS_Elonezet_varPrefixed_p], a
	call VS_Elonezet
VS_Valaszto_edblock4589:
VS_Valaszto_edblock4584:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_irany]
	ld [localVariable_VS_Valaszto_elozo], a
	; generic assign 
	call Tuz
	ld [localVariable_VS_Valaszto_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jr nz,VS_Valaszto_edblock4611
VS_Valaszto_ctb4609: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_tv]
	or a
	jr nz,VS_Valaszto_edblock4616
VS_Valaszto_ctb4614: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	ld [Kod_Palya], a
	ld a, $0
	ld [Start_Wait], a
VS_Valaszto_edblock4616:
VS_Valaszto_edblock4611:
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
	jr z, VS_Valaszto_edblock4621
VS_Valaszto_ctb4619: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
VS_Valaszto_edblock4621:
	ld a, $0
	ld [localVariable_VS_Valaszto_varPrefixed_e], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$202
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, VS_Valaszto_edblock4626
VS_Valaszto_ctb4624: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_VS_Valaszto_varPrefixed_e], a
VS_Valaszto_edblock4626:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_varPrefixed_e]
	cp $1
	jr nz,VS_Valaszto_edblock4631
VS_Valaszto_ctb4629: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_VS_Valaszto_ev]
	or a
	jr nz,VS_Valaszto_edblock4636
VS_Valaszto_ctb4634: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_p]
	ld [localVariable_VS_Szerk_varPrefixed_p], a
	call VS_Szerk
	ld a, $1
	ld [localVariable_VS_Valaszto_varPrefixed_e], a
VS_Valaszto_edblock4636:
VS_Valaszto_edblock4631:
	; generic assign 
	ld a,[localVariable_VS_Valaszto_varPrefixed_e]
	ld [localVariable_VS_Valaszto_ev], a
	jp VS_Valaszto_while4421
VS_Valaszto_edblock4424:
VS_Valaszto_loopend4426:
	ret
end_procedure_VS_Valaszto:
	; FŐMENÜ / RND-beállítás: animált pumpa-mutató a sorok előtt; joystick (vagy kurzor) fel/le = sor választás (nyomva tartva ismétel), tűz/SPACE = a menüpont aktiválása. Sorok: 0 egy játékos, 1 co-op, 2 versus, 3 jelmagyarázat, 4 hiscore (még nincs), 5 LEVEL CODE (érvényes kódra azonnal indul a pálya). Közben pörög a véletlenszám-generátor (entrópia) 
	; ***********  Defining procedure : Start_Kepernyo
	;    Procedure type : User-defined procedure
localVariable_Start_Kepernyo_irany:	db	0
localVariable_Start_Kepernyo_elozo:	db	0
localVariable_Start_Kepernyo_ism:	db	0
localVariable_Start_Kepernyo_t:	db	0
Start_Kepernyo_block4638:
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
Start_Kepernyo_while4639:
Start_Kepernyo_loopstart4643:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jp nz,Start_Kepernyo_edblock4642
Start_Kepernyo_ctb4640: ;Main true block ;keep :
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
	jr z, Start_Kepernyo_edblock4961
Start_Kepernyo_ctb4959: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_irany], a
Start_Kepernyo_edblock4961:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, Start_Kepernyo_edblock4966
Start_Kepernyo_ctb4964: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Start_Kepernyo_irany], a
Start_Kepernyo_edblock4966:
	ld a, $0
	ld [localVariable_Start_Kepernyo_t], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_irany]
	or a
	jr z, Start_Kepernyo_edblock4971
Start_Kepernyo_ctb4969: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[localVariable_Start_Kepernyo_elozo]
	ld b,a
	ld a,[localVariable_Start_Kepernyo_irany]
	cp b
	jr z, Start_Kepernyo_eblock4975
Start_Kepernyo_ctb4974: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
	ld a, $0
	ld [localVariable_Start_Kepernyo_ism], a
	jr Start_Kepernyo_edblock4976
Start_Kepernyo_eblock4975:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Start_Kepernyo_ism]
	add  a,$1
	ld [localVariable_Start_Kepernyo_ism], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $e
	jr c, Start_Kepernyo_edblock4982
Start_Kepernyo_ctb4980: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
	ld a, $8
	ld [localVariable_Start_Kepernyo_ism], a
Start_Kepernyo_edblock4982:
Start_Kepernyo_edblock4976:
Start_Kepernyo_edblock4971:
	; generic assign 
	ld a,[localVariable_Start_Kepernyo_irany]
	ld [localVariable_Start_Kepernyo_elozo], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_t]
	cp $1
	jp nz,Start_Kepernyo_edblock4987
Start_Kepernyo_ctb4985: ;Main true block ;keep :
	ld a, $6
	ld [GE_X], a
	; generic assign 
	; Swapping nodes
	; Generic mul
	ld a,[Menu_Sor]
	ld e,a
	ld d,0
	ld a,$14
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	push af
	ld a,$51
	ld b,a
	pop af
	add  a, b
	ld [GE_Y], a
	ld a, $3
	ld [GE_Width], a
	ld a, $a
	ld [GE_Height], a
	ld a, $3f
	ld [GE_Pattern], a
	call GE_FillRect
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Start_Kepernyo_irany]
	cp $1
	jr nz,Start_Kepernyo_eblock4992
Start_Kepernyo_ctb4991: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	or a
	jr nz,Start_Kepernyo_eblock4997
Start_Kepernyo_ctb4996: ;Main true block ;keep :
	; a pumpa le a regi sorbol 
	ld a, $4
	ld [Menu_Sor], a
	jr Start_Kepernyo_edblock4998
Start_Kepernyo_eblock4997:
	; 'a:=a + const'  optimization 
	ld a,[Menu_Sor]
	sub $1
	ld [Menu_Sor], a
Start_Kepernyo_edblock4998:
	jr Start_Kepernyo_edblock4993
Start_Kepernyo_eblock4992:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $4
	jr nz,Start_Kepernyo_eblock5004
Start_Kepernyo_ctb5003: ;Main true block ;keep :
	ld a, $0
	ld [Menu_Sor], a
	jr Start_Kepernyo_edblock5005
Start_Kepernyo_eblock5004:
	; 'a:=a + const'  optimization 
	ld a,[Menu_Sor]
	add  a,$1
	ld [Menu_Sor], a
Start_Kepernyo_edblock5005:
Start_Kepernyo_edblock4993:
	; generic assign 
	ld a,[Menu_Sor]
	ld [localVariable_Menu_Pumpa_sor], a
	; generic assign 
	ld a,[Menu_Faz]
	ld [localVariable_Menu_Pumpa_faz], a
	call Menu_Pumpa
Start_Kepernyo_edblock4987:
	; tűz/SPACE: új lenyomásra a menüpont aktiválása 
	; generic assign 
	call Tuz
	ld [localVariable_Start_Kepernyo_t], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	cp $1
	jp nz,Start_Kepernyo_edblock5011
Start_Kepernyo_ctb5009: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz1_Volt]
	or a
	jp nz,Start_Kepernyo_edblock5016
Start_Kepernyo_ctb5014: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	or a
	jr nz,Start_Kepernyo_edblock5021
Start_Kepernyo_ctb5019: ;Main true block ;keep :
	ld a, $0
	ld [Ket_Jatekos], a
	ld [Coop], a
	ld [Versus], a
	ld [Start_Wait], a
Start_Kepernyo_edblock5021:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $1
	jr nz,Start_Kepernyo_edblock5026
Start_Kepernyo_ctb5024: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Coop], a
	ld a, $0
	ld [Versus], a
	ld [Start_Wait], a
Start_Kepernyo_edblock5026:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $2
	jr nz,Start_Kepernyo_edblock5031
Start_Kepernyo_ctb5029: ;Main true block ;keep :
	; versus: előbb a szintválasztó (kisképpel); ESC-re vissza a menübe 
	call Mod4
	call VS_Valaszto
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, Start_Kepernyo_eblock5035
Start_Kepernyo_ctb5034: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld a, $0
	ld [Coop], a
	ld a, $1
	ld [Versus], a
	ld a, $0
	ld [Start_Wait], a
	jr Start_Kepernyo_edblock5036
Start_Kepernyo_eblock5035:
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
Start_Kepernyo_edblock5036:
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
Start_Kepernyo_edblock5031:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $4
	jr nz,Start_Kepernyo_edblock5042
Start_Kepernyo_ctb5040: ;Main true block ;keep :
	call Mod4
	call Szabaly_Kepernyo
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
Start_Kepernyo_edblock5042:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Menu_Sor]
	cp $3
	jr nz,Start_Kepernyo_edblock5047
Start_Kepernyo_ctb5045: ;Main true block ;keep :
	; PALYAKOD: 4 szinu kepernyon (a betukeszlet 4 szinu) 
	call Mod4
	ld a, $14
	ld [Menu_X], a
	call Kod_Bevitel
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, Start_Kepernyo_eblock5051
Start_Kepernyo_ctb5050: ;Main true block ;keep :
	ld a, $0
	ld [Ket_Jatekos], a
	; a Kod_Bevitel állította: Kod_Mod 0 = egy játékos, 1 = co-op, 2 = versus pálya 
	ld [Coop], a
	ld [Versus], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Mod]
	cp $1
	jr nz,Start_Kepernyo_edblock5057
Start_Kepernyo_ctb5055: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Coop], a
Start_Kepernyo_edblock5057:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Mod]
	cp $2
	jr nz,Start_Kepernyo_edblock5062
Start_Kepernyo_ctb5060: ;Main true block ;keep :
	ld a, $1
	ld [Ket_Jatekos], a
	ld [Versus], a
Start_Kepernyo_edblock5062:
	ld a, $0
	ld [Start_Wait], a
	jr Start_Kepernyo_edblock5052
Start_Kepernyo_eblock5051:
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
Start_Kepernyo_edblock5052:
	ld a, $1
	ld [localVariable_Start_Kepernyo_t], a
Start_Kepernyo_edblock5047:
Start_Kepernyo_edblock5016:
Start_Kepernyo_edblock5011:
	; generic assign 
	ld a,[localVariable_Start_Kepernyo_t]
	ld [Tuz1_Volt], a
	jp Start_Kepernyo_while4639
Start_Kepernyo_edblock4642:
Start_Kepernyo_loopend4644:
	call Mod4
	ret
end_procedure_Start_Kepernyo:
	; METEOR - NEM BLOKKOLÓ. A főciklusból random időnként elindul egy zuhanás (Meteor_Indit), és amíg tart, a  ===== U3-HATÁR: innen a forrás végéig (a főprogrammal együtt) minden eljárás az U3-ba fordul ($C000-tól, max $D7FF).
; //   Ide csak olyan eljárás kerülhet, ami a GE::MEM_48K_VID lapozás alatt fut (NEM hív ROM-ot, nem hívja a ProgramInit).
; //   Az U3_Boot az indítórutin: a resources\u3_boot_patch.ps1 fordítás után a $1A03-as "jp block1"-et "jp U3_Boot"-ra írja,
; //   így a ProgramInit (fájlbetöltés, U3 be) még lentről fut, utána ugrik a főprogramra (a "call ProgramInit" utánra).
; //   EMULÁTORRA: a .cas egy blokk $19EF-től a kód végéig (a $8000-$BFFF nullákkal töltve); valós géphez loader kell. 
	; ***********  Defining procedure : U3_Hatar
	;    Procedure type : User-defined procedure
U3_Hatar:
			ret
U3_Boot:
			call ProgramInit
			jp block1+3
U3_Also_Vege:
			org $C000
		
	ret
end_procedure_U3_Hatar:
	; A TELJES fal-réteg újrarajzolása a Map-ból (minden FalMap mező) 
	; ***********  Defining procedure : Fal_Mind_Kirak
	;    Procedure type : User-defined procedure
localVariable_Fal_Mind_Kirak_gx:	db	0
localVariable_Fal_Mind_Kirak_gy:	db	0
localVariable_Fal_Mind_Kirak_mp:	dw	0
Fal_Mind_Kirak_block5066:
Fal_Mind_Kirak:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [localVariable_Fal_Mind_Kirak_mp],hl
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gy], a
Fal_Mind_Kirak_forloop5067:
	ld a, $1
	ld [localVariable_Fal_Mind_Kirak_gx], a
Fal_Mind_Kirak_forloop5088:
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
	jr nz,Fal_Mind_Kirak_edblock5095
Fal_Mind_Kirak_ctb5093: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	ld [localVariable_Fal_Kirak_x], a
	; generic assign 
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	ld [localVariable_Fal_Kirak_y], a
	call Fal_Kirak
Fal_Mind_Kirak_edblock5095:
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[localVariable_Fal_Mind_Kirak_mp]
	add  hl,de
	ld [localVariable_Fal_Mind_Kirak_mp],hl
Fal_Mind_Kirak_loopstart5089:
	ld a,[localVariable_Fal_Mind_Kirak_gx]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gx],a
	cp $1e+1
	jr nz,Fal_Mind_Kirak_forloop5088
Fal_Mind_Kirak_loopend5090:
Fal_Mind_Kirak_loopstart5068:
	ld a,[localVariable_Fal_Mind_Kirak_gy]
	add a,1
	ld [localVariable_Fal_Mind_Kirak_gy],a
	cp $12+1
	jr nz,Fal_Mind_Kirak_forloop5067
Fal_Mind_Kirak_loopend5069:
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
Meteor_Becsapodas_block5097:
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
Meteor_Becsapodas_while5098:
Meteor_Becsapodas_loopstart5102:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_ty]
	cp $3
	jp nc,Meteor_Becsapodas_edblock5101
Meteor_Becsapodas_ctb5099: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	ld b,a
	ld a,[localVariable_Meteor_Becsapodas_gy0]
	add  a, b
	ld [localVariable_Meteor_Becsapodas_gy], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $1
	jp c, Meteor_Becsapodas_edblock5263
Meteor_Becsapodas_ctb5261: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld b,a
	ld a,$12
	cp b
	jp c,Meteor_Becsapodas_edblock5268
Meteor_Becsapodas_ctb5266: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_tx], a
Meteor_Becsapodas_while5270:
Meteor_Becsapodas_loopstart5274:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_tx]
	cp $3
	jp nc,Meteor_Becsapodas_edblock5273
Meteor_Becsapodas_ctb5271: ;Main true block ;keep :
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
	jp c, Meteor_Becsapodas_edblock5280
Meteor_Becsapodas_ctb5278: ;Main true block ;keep :
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Becsapodas_gx]
	ld b,a
	ld a,$1e
	cp b
	jp c,Meteor_Becsapodas_edblock5285
Meteor_Becsapodas_ctb5283: ;Main true block ;keep :
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
	jr z, Meteor_Becsapodas_edblock5291
Meteor_Becsapodas_ctb5289: ;Main true block ;keep :
	; 1: ezen a pályán a meteor a sziklát (blokkolt mezőt) is rombolja 
	ld a, $1
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock5291:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock5296
Meteor_Becsapodas_ctb5294: ;Main true block ;keep :
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
Meteor_Becsapodas_edblock5296:
Meteor_Becsapodas_edblock5285:
Meteor_Becsapodas_edblock5280:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_tx]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_tx], a
	jp Meteor_Becsapodas_while5270
Meteor_Becsapodas_edblock5273:
Meteor_Becsapodas_loopend5275:
Meteor_Becsapodas_edblock5268:
Meteor_Becsapodas_edblock5263:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Meteor_Becsapodas_ty]
	add  a,$1
	ld [localVariable_Meteor_Becsapodas_ty], a
	jp Meteor_Becsapodas_while5098
Meteor_Becsapodas_edblock5101:
Meteor_Becsapodas_loopend5103:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Vir_Engedve]
	cp $1
	jr nz,Meteor_Becsapodas_edblock5301
Meteor_Becsapodas_ctb5299: ;Main true block ;keep :
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
	jr nc,Meteor_Becsapodas_edblock5343
Meteor_Becsapodas_ctb5341: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock5343:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	cp $1e
	jr c, Meteor_Becsapodas_edblock5348
	jr z, Meteor_Becsapodas_edblock5348
Meteor_Becsapodas_ctb5346: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock5348:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	cp $1
	jr nc,Meteor_Becsapodas_edblock5353
Meteor_Becsapodas_ctb5351: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock5353:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_gy]
	cp $12
	jr c, Meteor_Becsapodas_edblock5358
	jr z, Meteor_Becsapodas_edblock5358
Meteor_Becsapodas_ctb5356: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Meteor_Becsapodas_rom], a
Meteor_Becsapodas_edblock5358:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock5363
Meteor_Becsapodas_ctb5361: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gx0]
	ld [localVariable_Enemy_Terjed_Ide_x], a
	; generic assign 
	ld a,[localVariable_Meteor_Becsapodas_gy]
	ld [localVariable_Enemy_Terjed_Ide_y], a
	call Enemy_Terjed_Ide
Meteor_Becsapodas_edblock5363:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Becsapodas_rom]
	cp $1
	jr nz,Meteor_Becsapodas_edblock5368
Meteor_Becsapodas_ctb5366: ;Main true block ;keep :
	ld a, $1
	ld [Enemy_Terjedhet], a
Meteor_Becsapodas_edblock5368:
Meteor_Becsapodas_edblock5301:
	ret
end_procedure_Meteor_Becsapodas:
	; METEOR figyelmeztetés (NEM blokkoló, a főciklusból képkockánként): a "METEOR !" felirat az ikon-sor közepén 8 képkockánként fel/le (a Meteor_Figy 3. bitje szerint), fekete dobozban szürke betűvel 
	; ***********  Defining procedure : Meteor_Felirat
	;    Procedure type : User-defined procedure
localVariable_Meteor_Felirat_varPrefixed_b:	db	0
Meteor_Felirat_block5370:
Meteor_Felirat:
	; generic assign 
	; RHS is pure numeric optimisation
	ld a,[Meteor_Figy]
	and  $8
	ld [localVariable_Meteor_Felirat_varPrefixed_b], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	or a
	jr z, Meteor_Felirat_edblock5374
Meteor_Felirat_ctb5372: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Felirat_varPrefixed_b], a
Meteor_Felirat_edblock5374:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Meteor_Lat]
	ld b,a
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	cp b
	jp z, Meteor_Felirat_edblock5380
Meteor_Felirat_ctb5378: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	cp $1
	jr nz,Meteor_Felirat_eblock5393
Meteor_Felirat_ctb5392: ;Main true block ;keep :
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
	ld hl,Meteor_Felirat_stringassignstr5397
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
	jr Meteor_Felirat_edblock5394
Meteor_Felirat_eblock5393:
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
Meteor_Felirat_edblock5394:
	; generic assign 
	ld a,[localVariable_Meteor_Felirat_varPrefixed_b]
	ld [Meteor_Lat], a
Meteor_Felirat_edblock5380:
	ret
end_procedure_Meteor_Felirat:
	; A következő meteor véletlen ideje: 10..30 mp (Meteor_Mp másodperc, Meteor_Fr = a másodpercen belüli képkocka 0..49) 
	; ***********  Defining procedure : Meteor_Uj_Ido
	;    Procedure type : User-defined procedure
localVariable_Meteor_Uj_Ido_varPrefixed_b:	db	0
localVariable_Meteor_Uj_Ido_varPrefixed_m:	db	0
Meteor_Uj_Ido_block5399:
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
Meteor_Kijelzo_block5401:
Meteor_Kijelzo:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Kijelzo_teljes]
	cp $1
	jr nz,Meteor_Kijelzo_edblock5405
Meteor_Kijelzo_ctb5403: ;Main true block ;keep :
	; Assigning a string : Ir_Szoveg
	ld hl,Meteor_Kijelzo_stringassignstr5409
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
	ld hl,Meteor_Kijelzo_stringassignstr5411
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	ld a,[Ir_X]
	ld [Meteor_KN], a
Meteor_Kijelzo_edblock5405:
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
Meteor_Indit_block5412:
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
Meteor_Keret_Frissit_block5415:
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
	jr z, Meteor_Keret_Frissit_edblock5420
Meteor_Keret_Frissit_ctb5418: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
Meteor_Keret_Frissit_edblock5420:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret_Y_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock5426
Meteor_Keret_Frissit_ctb5424: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_mozgott], a
Meteor_Keret_Frissit_edblock5426:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_pumpavan], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret_Pumpa_Valt]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5432
Meteor_Keret_Frissit_ctb5430: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_pumpavan], a
Meteor_Keret_Frissit_edblock5432:
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
	jr c, Meteor_Keret_Frissit_edblock5440
Meteor_Keret_Frissit_localsuccess5449: ;keep:
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
	jr c, Meteor_Keret_Frissit_edblock5440
Meteor_Keret_Frissit_ctb5438: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ky]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	add  a, $16
	cp b
	jr c, Meteor_Keret_Frissit_edblock5454
Meteor_Keret_Frissit_localsuccess5455: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_ky]
	add  a, $11
	cp b
	jr c, Meteor_Keret_Frissit_edblock5454
Meteor_Keret_Frissit_ctb5452: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock5454:
Meteor_Keret_Frissit_edblock5440:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mozgott]
	or a
	jr z, Meteor_Keret_Frissit_edblock5460
Meteor_Keret_Frissit_ctb5458: ;Main true block ;keep :
	; a meteor (a mozgásával együtt) átfedi a Keretet 
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock5460:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_pumpavan]
	or a
	jr z, Meteor_Keret_Frissit_edblock5466
Meteor_Keret_Frissit_ctb5464: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock5466:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vir]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5472
Meteor_Keret_Frissit_ctb5470: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov], a
Meteor_Keret_Frissit_edblock5472:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_vv], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_mozgott]
	or a
	jr z, Meteor_Keret_Frissit_edblock5478
Meteor_Keret_Frissit_ctb5476: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv], a
Meteor_Keret_Frissit_edblock5478:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vir]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5484
Meteor_Keret_Frissit_ctb5482: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv], a
Meteor_Keret_Frissit_edblock5484:
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
	jr c, Meteor_Keret_Frissit_edblock5492
Meteor_Keret_Frissit_localsuccess5501: ;keep:
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
	jr c, Meteor_Keret_Frissit_edblock5492
Meteor_Keret_Frissit_ctb5490: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_k2y]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	add  a, $16
	cp b
	jr c, Meteor_Keret_Frissit_edblock5506
Meteor_Keret_Frissit_localsuccess5507: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: GREATEREQUAL
	; Compare two vars optimization
	ld a,[localVariable_Meteor_Keret_Frissit_my]
	ld b,a
	; RHS is pure numeric optimisation
	ld a,[localVariable_Meteor_Keret_Frissit_k2y]
	add  a, $11
	cp b
	jr c, Meteor_Keret_Frissit_edblock5506
Meteor_Keret_Frissit_ctb5504: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock5506:
Meteor_Keret_Frissit_edblock5492:
	ld a, $0
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_X_Pos]
	ld b,a
	ld a,[Keret2_X_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock5512
Meteor_Keret_Frissit_ctb5510: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock5512:
	; Binary clause core: NOTEQUALS
	; Compare two vars optimization
	ld a,[Keret2_Elozo_Y_Pos]
	ld b,a
	ld a,[Keret2_Y_Pos]
	cp b
	jr z, Meteor_Keret_Frissit_edblock5518
Meteor_Keret_Frissit_ctb5516: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock5518:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Sereles]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5524
Meteor_Keret_Frissit_ctb5522: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_vv2], a
Meteor_Keret_Frissit_edblock5524:
	ld a, $0
	ld [Keret2_Sereles], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5530
Meteor_Keret_Frissit_ctb5528: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock5530:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Keret2_Pumpa_Valt]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5536
Meteor_Keret_Frissit_ctb5534: ;Main true block ;keep :
	ld a, $1
	ld [localVariable_Meteor_Keret_Frissit_ov2], a
Meteor_Keret_Frissit_edblock5536:
	ld a, $0
	ld [Keret2_Pumpa_Valt], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5542
Meteor_Keret_Frissit_ctb5540: ;Main true block ;keep :
	call Keret2_Le
Meteor_Keret_Frissit_edblock5542:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5548
Meteor_Keret_Frissit_ctb5546: ;Main true block ;keep :
	; 1) legfelső réteg le (csak ha kell) 
	ld hl,Keret
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
Meteor_Keret_Frissit_edblock5548:
	ld hl,Meteor
	ld [GE_Sprite_this],hl
	call GE_Sprite_RestoreBackground
	; 1) középső réteg le (régi pozíción) 
	call PumpakKirak
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5554
Meteor_Keret_Frissit_ctb5552: ;Main true block ;keep :
	; 2) alsó animált réteg 
	; generic assign 
	ld a,[Keret_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Meteor_Keret_Frissit_edblock5554:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_vv2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5560
Meteor_Keret_Frissit_ctb5558: ;Main true block ;keep :
	; generic assign 
	ld a,[Keret2_X_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_kx], a
	; generic assign 
	ld a,[Keret2_Y_Pos]
	ld [localVariable_Enemyk_Ujrarajzol_ky], a
	call Enemyk_Ujrarajzol
Meteor_Keret_Frissit_edblock5560:
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
	jp nc,Meteor_Keret_Frissit_eblock5565
Meteor_Keret_Frissit_ctb5564: ;Main true block ;keep :
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
	jr c, Meteor_Keret_Frissit_edblock5590
Meteor_Keret_Frissit_ctb5588: ;Main true block ;keep :
	ld a, $0
	ld [Meteor_UtemFrame], a
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Faz]
	add  a,$1
	ld [Meteor_Faz], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $4
	jr c, Meteor_Keret_Frissit_edblock5595
Meteor_Keret_Frissit_ctb5593: ;Main true block ;keep :
	ld a, $0
	ld [Meteor_Faz], a
Meteor_Keret_Frissit_edblock5595:
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
Meteor_Keret_Frissit_edblock5590:
	jp Meteor_Keret_Frissit_edblock5566
Meteor_Keret_Frissit_eblock5565:
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
Meteor_Keret_Frissit_edblock5566:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5601
Meteor_Keret_Frissit_ctb5599: ;Main true block ;keep :
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
Meteor_Keret_Frissit_edblock5601:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5607
Meteor_Keret_Frissit_ctb5605: ;Main true block ;keep :
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
Meteor_Keret_Frissit_edblock5607:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5613
Meteor_Keret_Frissit_ctb5611: ;Main true block ;keep :
	call Keret2_Kirak
Meteor_Keret_Frissit_edblock5613:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jp nz,Meteor_Keret_Frissit_eblock5618
Meteor_Keret_Frissit_ctb5617: ;Main true block ;keep :
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
	jr nz,Meteor_Keret_Frissit_edblock5666
Meteor_Keret_Frissit_ctb5664: ;Main true block ;keep :
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
	jr c, Meteor_Keret_Frissit_edblock5671
	jr z, Meteor_Keret_Frissit_edblock5671
Meteor_Keret_Frissit_ctb5669: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock5671:
Meteor_Keret_Frissit_edblock5666:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ov2]
	cp $1
	jr nz,Meteor_Keret_Frissit_edblock5676
Meteor_Keret_Frissit_ctb5674: ;Main true block ;keep :
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
	jr c, Meteor_Keret_Frissit_edblock5681
	jr z, Meteor_Keret_Frissit_edblock5681
Meteor_Keret_Frissit_ctb5679: ;Main true block ;keep :
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_kb]
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock5681:
Meteor_Keret_Frissit_edblock5676:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	cp $ef
	jr c, Meteor_Keret_Frissit_edblock5686
	jr z, Meteor_Keret_Frissit_edblock5686
Meteor_Keret_Frissit_ctb5684: ;Main true block ;keep :
	ld a, $ef
	ld [localVariable_Meteor_Keret_Frissit_ly], a
Meteor_Keret_Frissit_edblock5686:
	; generic assign 
	ld a,[localVariable_Meteor_Keret_Frissit_ly]
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	jp Meteor_Keret_Frissit_edblock5619
Meteor_Keret_Frissit_eblock5618:
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
Meteor_Keret_Frissit_edblock5619:
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
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Cel_Akt],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,Palya_Betolt_edblock5693
Palya_Betolt_ctb5691: ;Main true block ;keep :
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_CelCoop
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Cel_Akt],hl
Palya_Betolt_edblock5693:
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
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_Akna
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Akna_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya_AknaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Akna_price],hl
	ld a, $0
	ld [VirusLe_Engedve], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jp nz,Palya_Betolt_edblock5699
Palya_Betolt_ctb5697: ;Main true block ;keep :
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
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Cel_Akt],hl
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
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_Akna
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [Akna_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_AknaAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Akna_price],hl
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_VirusLe
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [VirusLe_Engedve], a
	; generic assign 
	ld a,[Palya]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Palya2_VirusAr
	add hl,de
	; TYPETEST : INTEGER  WriteType : NADA
	add hl,de
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [Virus_price],hl
Palya_Betolt_edblock5699:
	ld a, $ef
	ld [GE_LineNr], a
	call GE_SetRasterInterruptPos
	; a meteor a raszter-IT-t áthelyezhette 
	call MapReset
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Pumpa_db],hl
	; generic assign 
	; Loading pointer
	ld [Pumpa_db2],hl
	; generic assign 
	; Loading pointer
	ld [Drill_Cash2],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,Palya_Betolt_edblock5705
Palya_Betolt_ctb5703: ;Main true block ;keep :
	; generic assign 
	; Variable is 16-bit
	ld hl,[Drill_Cash]
	; Loading pointer
	ld [Drill_Cash2],hl
Palya_Betolt_edblock5705:
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
	jr nz,Palya_Betolt_edblock5711
Palya_Betolt_ctb5709: ;Main true block ;keep :
	ld a, $a
	ld [Enemy_Kolonia_db], a
Palya_Betolt_edblock5711:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Vir_Engedve]
	cp $1
	jr nz,Palya_Betolt_edblock5717
Palya_Betolt_ctb5715: ;Main true block ;keep :
	ld a, $1
	ld [Virus_Engedve], a
Palya_Betolt_edblock5717:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[VirusLe_Engedve]
	cp $1
	jr nz,Palya_Betolt_edblock5723
Palya_Betolt_ctb5721: ;Main true block ;keep :
	ld a, $1
	ld [Virus_Engedve], a
Palya_Betolt_edblock5723:
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
	jr nz,Palya_Betolt_edblock5729
Palya_Betolt_ctb5727: ;Main true block ;keep :
	; a 2. játékos pumpa-képe: versus saját, co-op az 1. játékosé 
	ld a, $0
	ld [P2_Kep], a
Palya_Betolt_edblock5729:
	ld a, $0
	ld [Akna_Robban], a
	ld [Akna_Db], a
	ld [Akna_Frame], a
	ld [Akna_Rajz], a
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
Varakozas_block5733:
Varakozas:
Varakozas_while5734:
Varakozas_loopstart5738:
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[localVariable_Varakozas_n]
	or a
	jr c, Varakozas_edblock5737
	jr z, Varakozas_edblock5737
Varakozas_ctb5735: ;Main true block ;keep :
	call GE_WaitForSync
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Varakozas_n]
	sub $1
	ld [localVariable_Varakozas_n], a
	jr Varakozas_while5734
Varakozas_edblock5737:
Varakozas_loopend5739:
	ret
end_procedure_Varakozas:
	; ***********  Defining procedure : Space_Var
	;    Procedure type : User-defined procedure
Space_Var:
	ld a, $1
	ld [Start_Wait], a
Space_Var_while5743:
Space_Var_loopstart5747:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $1
	jr nz,Space_Var_edblock5746
Space_Var_ctb5744: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	or a
	jr nz,Space_Var_edblock5760
Space_Var_ctb5758: ;Main true block ;keep :
	ld a, $2
	ld [Start_Wait], a
Space_Var_edblock5760:
	call GE_WaitForSync
	jr Space_Var_while5743
Space_Var_edblock5746:
Space_Var_loopend5748:
Space_Var_while5762:
Space_Var_loopstart5766:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Start_Wait]
	cp $2
	jr nz,Space_Var_edblock5765
Space_Var_ctb5763: ;Main true block ;keep :
	call GE_GetKeyboard
	call GE_GetJoysticks
	; generic assign 
	call Random_RandomByte
	ld [Rnd_Porgeto], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	call Tuz
	cp $1
	jr nz,Space_Var_edblock5779
Space_Var_ctb5777: ;Main true block ;keep :
	ld a, $0
	ld [Start_Wait], a
Space_Var_edblock5779:
	call GE_WaitForSync
	jr Space_Var_while5762
Space_Var_edblock5765:
Space_Var_loopend5767:
	ret
end_procedure_Space_Var:
	; Pálya teljesítve: felirat a képernyő közepére, majd várakozás egy SPACE lenyomásra (előbb a nyomva tartott SPACE felengedésére) 
	; ***********  Defining procedure : Palya_Teljesitve
	;    Procedure type : User-defined procedure
localVariable_Palya_Teljesitve_van:	db	0
localVariable_Palya_Teljesitve_varPrefixed_i:	db	0
localVariable_Palya_Teljesitve_k:	db	0
localVariable_Palya_Teljesitve_y:	db	0
Palya_Teljesitve_block5781:
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
	jp nz,Palya_Teljesitve_edblock5785
Palya_Teljesitve_ctb5783: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_k]
	cp $b
	jp nc,Palya_Teljesitve_edblock5839
Palya_Teljesitve_ctb5837: ;Main true block ;keep :
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
	jr nz,Palya_Teljesitve_eblock5844
Palya_Teljesitve_ctb5843: ;Main true block ;keep :
	ld a, $0
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
Palya_Teljesitve_forloop5847:
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
Palya_Teljesitve_loopstart5848:
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add a,1
	ld [localVariable_Palya_Teljesitve_varPrefixed_i],a
	cp $5
	jr nz,Palya_Teljesitve_forloop5847
Palya_Teljesitve_loopend5849:
	jr Palya_Teljesitve_edblock5845
Palya_Teljesitve_eblock5844:
	ld a, $0
	ld [localVariable_Palya_Teljesitve_varPrefixed_i], a
Palya_Teljesitve_forloop5852:
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
Palya_Teljesitve_loopstart5853:
	ld a,[localVariable_Palya_Teljesitve_varPrefixed_i]
	add a,1
	ld [localVariable_Palya_Teljesitve_varPrefixed_i],a
	cp $5
	jr nz,Palya_Teljesitve_forloop5852
Palya_Teljesitve_loopend5854:
Palya_Teljesitve_edblock5845:
Palya_Teljesitve_edblock5839:
Palya_Teljesitve_edblock5785:
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
	jp nz,Palya_Teljesitve_eblock5858
Palya_Teljesitve_ctb5857: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,Palya_Teljesitve_eblock5893
Palya_Teljesitve_ctb5892: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Gyoztes]
	cp $2
	jr nz,Palya_Teljesitve_eblock5898
Palya_Teljesitve_ctb5897: ;Main true block ;keep :
	; két játékos: ki hány pumpát rakott 
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr5902
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	jr Palya_Teljesitve_edblock5899
Palya_Teljesitve_eblock5898:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr5905
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock5899:
	jr Palya_Teljesitve_edblock5894
Palya_Teljesitve_eblock5893:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr5908
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock5894:
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
	ld hl,Palya_Teljesitve_stringassignstr5910
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
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
	ld hl,Palya_Teljesitve_stringassignstr5912
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	; Loading pointer
	ld [localVariable_HUD_Num3_ertek],hl
	; generic assign 
	ld a,[Ir_X]
	ld [localVariable_HUD_Num3_x], a
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [localVariable_HUD_Num3_sor], a
	call HUD_Num3
	jp Palya_Teljesitve_edblock5859
Palya_Teljesitve_eblock5858:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	or a
	jr nz,Palya_Teljesitve_edblock5917
Palya_Teljesitve_ctb5915: ;Main true block ;keep :
	ld a, $72
	ld [localVariable_Palya_Teljesitve_y], a
Palya_Teljesitve_edblock5917:
	; két sor: függőlegesen középen 
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr5920
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
Palya_Teljesitve_edblock5859:
	; 'a:=a + const'  optimization 
	ld a,[localVariable_Palya_Teljesitve_y]
	add  a,$a
	ld [localVariable_Palya_Teljesitve_y], a
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	cp $1
	jr nz,Palya_Teljesitve_edblock5924
Palya_Teljesitve_ctb5922: ;Main true block ;keep :
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
Palya_Teljesitve_edblock5924:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[localVariable_Palya_Teljesitve_van]
	or a
	jr nz,Palya_Teljesitve_edblock5930
Palya_Teljesitve_ctb5928: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	or a
	jr nz,Palya_Teljesitve_edblock5942
Palya_Teljesitve_ctb5940: ;Main true block ;keep :
	ld a, $82
	ld [localVariable_Palya_Teljesitve_y], a
Palya_Teljesitve_edblock5942:
Palya_Teljesitve_edblock5930:
	; generic assign 
	ld a,[localVariable_Palya_Teljesitve_y]
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Teljesitve_stringassignstr5945
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
	ld hl,Game_Over_stringassignstr5948
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $82
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Game_Over_stringassignstr5950
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
	jr nz,Palya_Bukas_edblock5955
Palya_Bukas_ctb5953: ;Main true block ;keep :
	; GAME OVER után ugyanabban a körben ne vonjon le újra 
	call Digi_Le
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	or a
	jr nz,Palya_Bukas_edblock5975
Palya_Bukas_ctb5973: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[Eletek]
	sub $1
	ld [Eletek], a
Palya_Bukas_edblock5975:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Eletek]
	or a
	jr nz,Palya_Bukas_eblock5979
Palya_Bukas_ctb5978: ;Main true block ;keep :
	; versusban nincs élet: csak újrakezdés 
	call Game_Over
	jr Palya_Bukas_edblock5980
Palya_Bukas_eblock5979:
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
	ld hl,Palya_Bukas_stringassignstr5984
	; Loading pointer
	ld [Ir_Szoveg],hl
	call Ir_Kozep
	ld a, $82
	ld [Ir_Y], a
	; Assigning a string : Ir_Szoveg
	ld hl,Palya_Bukas_stringassignstr5986
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
Palya_Bukas_edblock5980:
Palya_Bukas_edblock5955:
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
	jr nz,Palya_Kovetkezo_eblock5990
Palya_Kovetkezo_ctb5989: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[Palya]
	cp $6
	jr c, Palya_Kovetkezo_edblock6010
Palya_Kovetkezo_ctb6008: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
Palya_Kovetkezo_edblock6010:
	jr Palya_Kovetkezo_edblock5991
Palya_Kovetkezo_eblock5990:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[Palya]
	cp $b
	jr c, Palya_Kovetkezo_edblock6016
Palya_Kovetkezo_ctb6014: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
Palya_Kovetkezo_edblock6016:
Palya_Kovetkezo_edblock5991:
	call Palya_Ujra
	ret
end_procedure_Palya_Kovetkezo:
block1:
main_block_begin_:
	; FŐPROGRAM  Egyszeri indítási beállítások 
	call ProgramInit
	call U3_Hatar
MainProgram_while6018:
MainProgram_loopstart6022:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jp MainProgram_ctb6019
MainProgram_ctb6019: ;Main true block ;keep :
	; csak a határ-eljárás megtartásához (azonnal visszatér); az indítás: U3_Boot  külső ciklus: főmenü -> játék -> (GAME OVER) -> főmenü  Főmenü 
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
	jr nz,MainProgram_edblock6985
MainProgram_ctb6983: ;Main true block ;keep :
	ld a, $0
	ld [Palya], a
MainProgram_edblock6985:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a,[Kod_Palya]
	cp $ff
	jr z, MainProgram_edblock6990
MainProgram_ctb6988: ;Main true block ;keep :
	; két játékos: az első 2P pálya (a játékban LVL 01) 
	; generic assign 
	ld a,[Kod_Palya]
	ld [Palya], a
MainProgram_edblock6990:
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
MainProgram_while6992:
MainProgram_loopstart6996:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jp nz,MainProgram_edblock6995
MainProgram_ctb6993: ;Main true block ;keep :
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
	jr z, MainProgram_edblock7002
MainProgram_ctb7000: ;Main true block ;keep :
	; P = PAUSE (minden pályán): minden megáll a következő P-ig 
	call Pause_Kezel
	call GE_GetKeyboard
	call GE_GetJoysticks
MainProgram_edblock7002:
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
	jr z, MainProgram_edblock7007
MainProgram_ctb7005: ;Main true block ;keep :
	ld a, $1
	ld [v_Kilep], a
MainProgram_edblock7007:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7012
MainProgram_ctb7010: ;Main true block ;keep :
	ld a, $1
	ld [v_Kilep], a
MainProgram_edblock7012:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[v_Kilep]
	cp $1
	jr nz,MainProgram_edblock7017
MainProgram_ctb7015: ;Main true block ;keep :
	; ESC vagy Q = kilépés a főmenübe (megerősítéssel), minden módban 
	call Exit_Kerdes
	call GE_GetKeyboard
	call GE_GetJoysticks
MainProgram_edblock7017:
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
	jp c, MainProgram_edblock7022
MainProgram_ctb7020: ;Main true block ;keep :
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
	jr z, MainProgram_edblock7027
MainProgram_ctb7025: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Bal], a
MainProgram_edblock7027:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7032
MainProgram_ctb7030: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Jobb], a
MainProgram_edblock7032:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $2
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7037
MainProgram_ctb7035: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Fel], a
MainProgram_edblock7037:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $1
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7042
MainProgram_ctb7040: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Le], a
MainProgram_edblock7042:
	ld a, $1
	ld [localVariable_Jatekos_Mozog_j], a
	call Jatekos_Mozog
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jp nz,MainProgram_edblock7047
MainProgram_ctb7045: ;Main true block ;keep :
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
	jr z, MainProgram_localfailed7053
	jr MainProgram_ctb7050
MainProgram_localfailed7053: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4004
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7052
MainProgram_ctb7050: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Bal], a
MainProgram_edblock7052:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $20
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed7059
	jr MainProgram_ctb7056
MainProgram_localfailed7059: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$204
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7058
MainProgram_ctb7056: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Jobb], a
MainProgram_edblock7058:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed7065
	jr MainProgram_ctb7062
MainProgram_localfailed7065: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$402
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7064
MainProgram_ctb7062: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Fel], a
MainProgram_edblock7064:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $4
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_localfailed7071
	jr MainProgram_ctb7068
MainProgram_localfailed7071: ;keep:
	; ; logical OR, second chance
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$404
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7070
MainProgram_ctb7068: ;Main true block ;keep :
	ld a, $1
	ld [Joy_Le], a
MainProgram_edblock7070:
	ld a, $2
	ld [localVariable_Jatekos_Mozog_j], a
	call Jatekos_Mozog
MainProgram_edblock7047:
MainProgram_edblock7022:
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
	jr nz,MainProgram_edblock7076
MainProgram_ctb7074: ;Main true block ;keep :
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	ld a, $2
	ld [GE_Nr], a
	ld a, $8
	ld [GE_JoyCode], a
	call GE_Joystick
	or a
	jr z, MainProgram_edblock7081
MainProgram_ctb7079: ;Main true block ;keep :
	ld a, $1
	ld [Tuz2_Most], a
MainProgram_edblock7081:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$202
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_edblock7086
MainProgram_ctb7084: ;Main true block ;keep :
	ld a, $1
	ld [Tuz2_Most], a
MainProgram_edblock7086:
MainProgram_edblock7076:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz1_Most]
	cp $1
	jr nz,MainProgram_edblock7091
MainProgram_ctb7089: ;Main true block ;keep :
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
MainProgram_edblock7091:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Tuz2_Most]
	cp $1
	jr nz,MainProgram_edblock7096
MainProgram_ctb7094: ;Main true block ;keep :
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
MainProgram_edblock7096:
	; generic assign 
	ld a,[Tuz1_Most]
	ld [Tuz1_Volt], a
	; generic assign 
	ld a,[Tuz2_Most]
	ld [Tuz2_Volt], a
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$8007
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_eblock7100
MainProgram_ctb7099: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Rot1_Volt]
	or a
	jr nz,MainProgram_edblock7106
MainProgram_ctb7104: ;Main true block ;keep :
	; M = az 1., Y = a 2. játékos eszközváltása (körbe), új lenyomásra 
	ld a, $1
	ld [localVariable_Eszkoz_Kovetkezo_j], a
	call Eszkoz_Kovetkezo
MainProgram_edblock7106:
	ld a, $1
	ld [Rot1_Volt], a
	jr MainProgram_edblock7101
MainProgram_eblock7100:
	ld a, $0
	ld [Rot1_Volt], a
MainProgram_edblock7101:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$4006
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_eblock7111
MainProgram_ctb7110: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Rot2_Volt]
	or a
	jr nz,MainProgram_edblock7117
MainProgram_ctb7115: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Ket_Jatekos]
	cp $1
	jr nz,MainProgram_edblock7122
MainProgram_ctb7120: ;Main true block ;keep :
	ld a, $2
	ld [localVariable_Eszkoz_Kovetkezo_j], a
	call Eszkoz_Kovetkezo
MainProgram_edblock7122:
MainProgram_edblock7117:
	ld a, $1
	ld [Rot2_Volt], a
	jr MainProgram_edblock7112
MainProgram_eblock7111:
	ld a, $0
	ld [Rot2_Volt], a
MainProgram_edblock7112:
	; Binary clause core: NOTEQUALS
	; Compare with pure num / var optimization
	; generic assign 
	ld hl,$8002
	; Loading pointer
	ld [GE_KeyCode],hl
	call GE_Pressed
	or a
	jr z, MainProgram_eblock7127
MainProgram_ctb7126: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[R_Volt]
	or a
	jr nz,MainProgram_edblock7133
MainProgram_ctb7131: ;Main true block ;keep :
	; R = újrakezdés, egy életbe kerül (egy lenyomás = egy élet) 
	call Palya_Bukas
MainProgram_edblock7133:
	ld a, $1
	ld [R_Volt], a
	jr MainProgram_edblock7128
MainProgram_eblock7127:
	ld a, $0
	ld [R_Volt], a
MainProgram_edblock7128:
	; 1b. Pumpa-animáció SZÁMOLÁSI fázisa 
	call PumpakSzamol
	call Akna_Lep
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Akna_Robban]
	cp $1
	jr nz,MainProgram_edblock7139
MainProgram_ctb7137: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	or a
	jr nz,MainProgram_edblock7144
MainProgram_ctb7142: ;Main true block ;keep :
	call Akna_Robbant
MainProgram_edblock7144:
MainProgram_edblock7139:
	; lejárt akna: robban (zuhanó meteor alatt megvárja a becsapódást)  2. Várakozás a képfrissítésre (raszter-megszakítás), hogy a rajzolás ne okozzon szakadást/villogást a 
	call Frame_Sync
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	cp $1
	jr nz,MainProgram_eblock7148
MainProgram_ctb7147: ;Main true block ;keep :
	; 3. Rajzolási fázis. Ha a meteor ÉPPEN zuhan, a Meteor_Keret_Frissit fut a Keret_Frissit HELYETT 
	call Meteor_Keret_Frissit
	jr MainProgram_edblock7149
MainProgram_eblock7148:
	call Keret_Frissit
MainProgram_edblock7149:
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
	jr c, MainProgram_edblock7155
MainProgram_ctb7153: ;Main true block ;keep :
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [Termel_Frame],hl
	call Pumpak_Termelnek
MainProgram_edblock7155:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Virus_Engedve]
	cp $1
	jp nz,MainProgram_edblock7160
MainProgram_ctb7158: ;Main true block ;keep :
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
	jr c, MainProgram_edblock7165
MainProgram_ctb7163: ;Main true block ;keep :
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
	jr nz,MainProgram_edblock7171
MainProgram_ctb7169: ;Main true block ;keep :
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[Enemy_Kolonia_db]
	cp $a
	jr nc,MainProgram_eblock7175
MainProgram_ctb7174: ;Main true block ;keep :
	call Enemy_Random_Lerak
	; 'a:=a + const'  optimization 
	ld a,[Enemy_Kolonia_db]
	add  a,$1
	ld [Enemy_Kolonia_db], a
	jr MainProgram_edblock7176
MainProgram_eblock7175:
	ld a, $1
	ld [Enemy_Terjedhet], a
MainProgram_edblock7176:
MainProgram_edblock7171:
MainProgram_edblock7165:
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
	jr c, MainProgram_edblock7182
MainProgram_ctb7180: ;Main true block ;keep :
	ld a, $0
	ld [Enemy_Frame], a
	call Enemyk_Mukodnek
MainProgram_edblock7182:
MainProgram_edblock7160:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Aktiv]
	or a
	jp nz,MainProgram_edblock7187
MainProgram_localsuccess7188: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Engedve]
	cp $1
	jp nz,MainProgram_edblock7187
MainProgram_ctb7185: ;Main true block ;keep :
	; Binary clause core: GREATER
	; Compare with pure num / var optimization
	ld a,[Meteor_Figy]
	or a
	jp c, MainProgram_eblock7192
	jp z, MainProgram_eblock7192
MainProgram_ctb7191: ;Main true block ;keep :
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
	jr nz,MainProgram_edblock7198
MainProgram_ctb7196: ;Main true block ;keep :
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
MainProgram_edblock7198:
	jp MainProgram_edblock7193
MainProgram_eblock7192:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Meteor_Kij_Kell]
	cp $1
	jr nz,MainProgram_edblock7204
MainProgram_ctb7202: ;Main true block ;keep :
	; a meteor lezuhant: a kijelző vissza 
	ld a, $1
	ld [localVariable_Meteor_Kijelzo_teljes], a
	call Meteor_Kijelzo
	ld a, $0
	ld [Meteor_Kij_Kell], a
MainProgram_edblock7204:
	; 'a:=a + const'  optimization 
	ld a,[Meteor_Fr]
	add  a,$1
	ld [Meteor_Fr], a
	; csak a szám 
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	cp $32
	jr c, MainProgram_edblock7209
MainProgram_ctb7207: ;Main true block ;keep :
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
	jr nz,MainProgram_eblock7213
MainProgram_ctb7212: ;Main true block ;keep :
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
	ld hl,MainProgram_stringassignstr7217
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
	jr MainProgram_edblock7214
MainProgram_eblock7213:
	ld a, $0
	ld [localVariable_Meteor_Kijelzo_teljes], a
	call Meteor_Kijelzo
MainProgram_edblock7214:
MainProgram_edblock7209:
MainProgram_edblock7193:
MainProgram_edblock7187:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Coop]
	cp $1
	jr nz,MainProgram_eblock7221
MainProgram_ctb7220: ;Main true block ;keep :
	; 8. CÉL: ha elértük az aktuális pálya célját (a pumpák száma), jön a következő pálya  co-op: a két játékos pumpáinak ÖSSZEGE számít 
	; generic assign 
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	; Loading pointer
	ld [Pumpa_Ossz],hl
	; 16 bit BINOP
	; RHS is pure 
	; Variable is 16-bit
	ld de,[Pumpa_db2]
	; Variable is 16-bit
	ld hl,[Pumpa_Ossz]
	add  hl,de
	ld [Pumpa_Ossz],hl
	; generic assign 
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	; Loading pointer
	ld [Cel_Int],hl
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock7227
MainProgram_ctb7225: ;Main true block ;keep :
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
	jr c, MainProgram_edblock7232
MainProgram_ctb7230: ;Main true block ;keep :
	call Palya_Kovetkezo
MainProgram_edblock7232:
MainProgram_edblock7227:
	jr MainProgram_edblock7222
MainProgram_eblock7221:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock7238
MainProgram_ctb7236: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MainProgram_edblock7243
MainProgram_ctb7241: ;Main true block ;keep :
	ld a, $1
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock7243:
MainProgram_edblock7238:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock7248
MainProgram_ctb7246: ;Main true block ;keep :
	; Binary clause core: GREATEREQUAL
	; Binary clause INTEGER: GREATEREQUAL
	; Variable is 16-bit
	ld hl,[Cel_Akt]
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr c, MainProgram_edblock7253
MainProgram_ctb7251: ;Main true block ;keep :
	; versus: aki előbb eléri a célt (255), nyer 
	ld a, $2
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock7253:
MainProgram_edblock7248:
MainProgram_edblock7222:
	; Binary clause core: EQUALS
	; Binary clause INTEGER: EQUALS
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nz,MainProgram_edblock7258
MainProgram_localsuccess7259: ;keep:
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
	jr nc,MainProgram_edblock7258
MainProgram_ctb7256: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Binary clause INTEGER: EQUALS
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nz,MainProgram_edblock7264
MainProgram_localsuccess7265: ;keep:
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
	jr nc,MainProgram_edblock7264
MainProgram_ctb7262: ;Main true block ;keep :
	; nincs pumpa és nincs pénz egyre sem: vége a pályának - versus: ha MINDKÉT játékos így jár 
	call Palya_Bukas
MainProgram_edblock7264:
MainProgram_edblock7258:
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Versus]
	cp $1
	jr nz,MainProgram_edblock7270
MainProgram_ctb7268: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Compare with pure num / var optimization
	ld a,[Jatek_Fut]
	cp $1
	jr nz,MainProgram_edblock7275
MainProgram_ctb7273: ;Main true block ;keep :
	; Binary clause core: EQUALS
	; Binary clause INTEGER: EQUALS
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nz,MainProgram_eblock7279
MainProgram_localsuccess7281: ;keep:
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
	jr nc,MainProgram_eblock7279
MainProgram_ctb7278: ;Main true block ;keep :
	; versus: aki "elfogyott" (nincs pumpája és pénze sem egyre), veszít - a másik nyer 
	ld a, $2
	ld [Gyoztes], a
	call Palya_Kovetkezo
	jr MainProgram_edblock7280
MainProgram_eblock7279:
	; Binary clause core: EQUALS
	; Binary clause INTEGER: EQUALS
	ld hl,$00
	push hl
	; Variable is 16-bit
	ld hl,[Pumpa_db2]
	pop de
	xor a ; clear carry
	sbc hl,de
	jr nz,MainProgram_edblock7287
MainProgram_localsuccess7288: ;keep:
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
	jr nc,MainProgram_edblock7287
MainProgram_ctb7285: ;Main true block ;keep :
	ld a, $1
	ld [Gyoztes], a
	call Palya_Kovetkezo
MainProgram_edblock7287:
MainProgram_edblock7280:
MainProgram_edblock7275:
MainProgram_edblock7270:
	jp MainProgram_while6992
MainProgram_edblock6995:
MainProgram_loopend6997:
	jp MainProgram_while6018
MainProgram_edblock6021:
MainProgram_loopend6023:
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
