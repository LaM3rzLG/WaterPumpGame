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
StartBlock19ef:
	jp block1
GE_ScreenAddr:	dw	$8000
GE_CharSetPtr: dw  0
GE_CharSetImgWidth:	dw	$76
GE_CharWidth:	db	$02
GE_CharHeight:	db	$06
GE_i:	db	0
GE_NumStr:	db $0, $0, $0, $0, $0, $0
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
CharSet:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/CharSetGR4.bin"
end_incbin_CharSet:
Vor:	 ds 4
Utan:	 ds 4
Cim: dw  0
varPrefixed_i:	db	0
	; Declaring string asmz80
T0:		db	"U3 TESZT - VART: 65 66 67 68"
	db	0
	; Declaring string asmz80
T1:		db	"BETOLTES UTAN (BASIC):"
	db	0
	; Declaring string asmz80
T2:		db	"VID_ON + 48K_VID (U3=RAM):"
	db	0
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
 ; Temp vars section
 ; Temp vars section ends
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
GE_SetMemory_block3:
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
GE_Init_block5:
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
GE_SetGraphics_block6:
GE_SetGraphics:
			ld  A,[GE_Mode]
			ld 	C,A 							;// C = graphics mode code
			rst $30 							;// system function call
			db $4 								;// VMODE function code			
			
	ret
end_procedure_GE_SetGraphics:
	; ***********  Defining procedure : GE_SetPalette
	;    Procedure type : User-defined procedure
GE_SetPalette_block7:
GE_SetPalette:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	or a
	jr c, GE_SetPalette_edblock11
GE_SetPalette_localsuccess13: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Nr]
	ld b,a
	ld a,$3
	cp b
	jr c,GE_SetPalette_edblock11
GE_SetPalette_localsuccess14: ;keep:
	; ; logical AND, second requirement
	; Binary clause core: LESSEQUAL
	; Compare two vars optimization
	ld a,[GE_Color]
	ld b,a
	ld a,$55
	cp b
	jr c,GE_SetPalette_edblock11
GE_SetPalette_ctb9: ;Main true block ;keep :
				ld A,[GE_Nr]
				ld C,$60
				add A,C
				ld C,A					;// C = $60 + Nr
				ld A,[GE_Color]	;// A = Color code
				out (C),A				;// send Color code to desired palette port
				
GE_SetPalette_edblock11:
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
GE_SetBorder_block16:
GE_SetBorder:
		
    ld A,[GE_Color]
    ld (GE_SYS_BORDER_COLOR),A
		out (GE_SYS_BORDER_PORT),A
	
	ret
end_procedure_GE_SetBorder:
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
GE_ClearScreen_block17:
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
GE_InitCharSet_block18:
GE_InitCharSet:
	ret
end_procedure_GE_InitCharSet:
	; ***********  Defining procedure : GE_WriteText
	;    Procedure type : User-defined procedure
GE_WriteText_block19:
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
GE_ByteToStr_block20:
GE_ByteToStr:
	ld a, $0
	ld [GE_i], a
GE_ByteToStr_forloop21:
	; Storing to array  
	ld a,[GE_i]
	ld e,a
	ld d,0
	ld hl,GE_NumStr
	add hl,de
	ld a,$0
	ld [hl],a 
GE_ByteToStr_loopstart22:
	ld a,[GE_i]
	add a,1
	ld [GE_i],a
	cp $3
	jr nz,GE_ByteToStr_forloop21
GE_ByteToStr_loopend23:
	ld a, $0
	ld [GE_i], a
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock29
GE_ByteToStr_ctb27: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while46:
GE_ByteToStr_loopstart50:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $64
	jr c, GE_ByteToStr_edblock49
GE_ByteToStr_ctb47: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $64
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while46
GE_ByteToStr_edblock49:
GE_ByteToStr_loopend51:
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
	jr nc,GE_ByteToStr_edblock57
GE_ByteToStr_ctb55: ;Main true block ;keep :
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
GE_ByteToStr_edblock57:
GE_ByteToStr_edblock29:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock63
GE_ByteToStr_ctb61: ;Main true block ;keep :
	ld a, $0
	ld [GE_X], a
GE_ByteToStr_while74:
GE_ByteToStr_loopstart78:
	; Binary clause core: GREATEREQUAL
	; Compare with pure num / var optimization
	ld a,[GE_Nr]
	cp $a
	jr c, GE_ByteToStr_edblock77
GE_ByteToStr_ctb75: ;Main true block ;keep :
	; 'a:=a + const'  optimization 
	ld a,[GE_Nr]
	sub $a
	ld [GE_Nr], a
	; 'a:=a + const'  optimization 
	ld a,[GE_X]
	add  a,$1
	ld [GE_X], a
	jr GE_ByteToStr_while74
GE_ByteToStr_edblock77:
GE_ByteToStr_loopend79:
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
GE_ByteToStr_edblock63:
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
block1:
main_block_begin_:
	ld hl,$c000
	ld [Cim],hl
	; 1) A program legelso dolga: mit latunk $C000-on (a betoltes utani allapot) 
	ld a, $0
	ld [varPrefixed_i], a
MainProgram_while82:
MainProgram_loopstart86:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[varPrefixed_i]
	cp $4
	jr nc,MainProgram_edblock85
MainProgram_ctb83: ;Main true block ;keep :
	; Storing to array  
	ld a,[varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,[Cim]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,Vor
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[varPrefixed_i]
	add  a,$1
	ld [varPrefixed_i], a
	jr MainProgram_while82
MainProgram_edblock85:
MainProgram_loopend87:
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
	ld a, $0
	ld [GE_UseBackScreen], a
	call GE_Init
	ld a, $50
	ld [GE_Mode], a
	call GE_SetMemory
 di 
	; 2) Ugyanaz, U0,U1,VID,U3 lapozassal (a jatek MEM_VID_ON-ja SYS-t tesz az U3 helyere) 
	ld a, $90
	ld [GE_Mode], a
	call GE_SetMemory
	ld a, $0
	ld [varPrefixed_i], a
MainProgram_while90:
MainProgram_loopstart94:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[varPrefixed_i]
	cp $4
	jr nc,MainProgram_edblock93
MainProgram_ctb91: ;Main true block ;keep :
	; Storing to array  
	ld a,[varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,[Cim]
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	push af
	ld a,[varPrefixed_i]
	ld e,a
	ld d,0
	ld hl,Utan
	add hl,de
	pop af
	ld [hl],a 
	; 'a:=a + const'  optimization 
	ld a,[varPrefixed_i]
	add  a,$1
	ld [varPrefixed_i], a
	jr MainProgram_while90
MainProgram_edblock93:
MainProgram_loopend95:
	ld a, $50
	ld [GE_Mode], a
	call GE_SetMemory
 ei 
	ld a, $0
	ld [GE_Pattern], a
	call GE_ClearScreen
	ld a, $2
	ld [GE_X], a
	ld a, $14
	ld [GE_Y], a
	ld hl,T0
	ld [GE_Text],hl
	call GE_WriteText
	ld a, $2
	ld [GE_X], a
	ld a, $32
	ld [GE_Y], a
	ld hl,T1
	ld [GE_Text],hl
	call GE_WriteText
	ld a, $0
	ld [varPrefixed_i], a
MainProgram_while98:
MainProgram_loopstart102:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[varPrefixed_i]
	cp $4
	jr nc,MainProgram_edblock101
MainProgram_ctb99: ;Main true block ;keep :
	; generic assign 
	ld a,[varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Vor
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [GE_Nr], a
	call GE_ByteToStr
	; generic assign 
	ld a,$2
	push af
	; Swapping nodes
	; Generic mul
	ld a,[varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$8
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [GE_X], a
	ld a, $46
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; 'a:=a + const'  optimization 
	ld a,[varPrefixed_i]
	add  a,$1
	ld [varPrefixed_i], a
	jr MainProgram_while98
MainProgram_edblock101:
MainProgram_loopend103:
	ld a, $2
	ld [GE_X], a
	ld a, $64
	ld [GE_Y], a
	ld hl,T2
	ld [GE_Text],hl
	call GE_WriteText
	ld a, $0
	ld [varPrefixed_i], a
MainProgram_while108:
MainProgram_loopstart112:
	; Binary clause core: LESS
	; Compare with pure num / var optimization
	ld a,[varPrefixed_i]
	cp $4
	jr nc,MainProgram_edblock111
MainProgram_ctb109: ;Main true block ;keep :
	; generic assign 
	ld a,[varPrefixed_i]
	ld e,a ; variable is 8-bit
	ld d,0 ;keep
	ld hl,Utan
	add hl,de
	; TYPETEST : BYTE  WriteType : NADA
	ld a,[hl]
	ld [GE_Nr], a
	call GE_ByteToStr
	; generic assign 
	ld a,$2
	push af
	; Swapping nodes
	; Generic mul
	ld a,[varPrefixed_i]
	ld e,a
	ld d,0
	ld a,$8
	ld h,a
	ld l,0
	call mul_8x8
	ld a,l
	ld b,a
	pop af
	add  a, b
	ld [GE_X], a
	ld a, $78
	ld [GE_Y], a
	ld hl,GE_NumStr
	ld [GE_Text],hl
	call GE_WriteText
	; 'a:=a + const'  optimization 
	ld a,[varPrefixed_i]
	add  a,$1
	ld [varPrefixed_i], a
	jr MainProgram_while108
MainProgram_edblock111:
MainProgram_loopend113:
MainProgram_while118:
MainProgram_loopstart122:
	; Binary clause core: NOTEQUALS
	; Comparing two non-equal numerical values
	jr MainProgram_ctb119
MainProgram_ctb119: ;Main true block ;keep :
	jr MainProgram_while118
MainProgram_edblock121:
MainProgram_loopend123:
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
	org $c000
StartBlockc000:
	org $c000
U3Data:
	incbin	 "C:/TVC/TRSE_Projects/WaterPumpGame///resources/tvc_sprites/u3test.bin"
end_incbin_U3Data:
EndBlockc000:
	end
