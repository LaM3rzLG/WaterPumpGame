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
SCREEN_ADDR EQU $8000
TRUE EQU $01
StartBlock19ef:
	jp block1
WaterPump_PumpaSprite_this: dw  0
WaterPump_ScreenAddrTab:	 ds 1080
WaterPump_WP_Setup:
	org WaterPump_WP_Setup+6
WaterPump_BuildIdx:	dw	0
WaterPump_BuildPos:	dw	0
WaterPump_Idx:	dw	0
WaterPump_Data:	dw	0
	; ============================================================
; //   WaterPump - sajat, kezzel irt Z80 ASM unit a GE melle, a
; //   sebesseg-kritikus reszek gyorsitasara.
; //
; //   NINCS "@use GE" fuggoseg: a Position-szamitashoz (SetPosition)
; //   szukseges videomemoria-kezdocim (GE::ScreenAddr, alapertelmezetten
; //   $8000, GE::Init(GE::DIRECT_TO_SCREEN)-nel) ide, a SCREEN_ADDR
; //   konstansba van kimasolva (lasd lent) - ha a fo .ras valaha
; //   back-screen/double-buffer modra valt (GE::Init(True) vagy
; //   GE::SwapScreens), ezt IS at kell irni, mert akkor mar nem
; //   szinkron a GE sajat (futasidoben valtozhato) ScreenAddr-javal.
; //
; //   PumpaSprite: a GE::Sprite "Put"-janak specialis, GYORSABB
; //   valtozata - KIZAROLAG a Pumpa fix meretere (2 byte szeles x
; //   8 sor magas, GRAPHICS4, NEM maszkolt, 16 byte/fazis) irva:
; //     - NINCS onmodosito kod / futasidejü meret-szamitas (mint a
; //       GE::Sprite.Put()-ban) - a 8 sor TELJESEN KITEKERT (unrolled).
; //     - NINCS hatterment/-visszaallitas (a Pumpa "belyegzo").
; //   Hasznalat (a GE::Sprite mintajara), ELSOSORBAN a ScreenAddrTab
; //   FELEPITESEHEZ (lasd lent) - a tenyleges, kepkockankenti kirakashoz
; //   inkabb a PutAt() valo, az MEG GYORSABB:
; //     var P : WaterPump::PumpaSprite;
; //     begin
; //       P.X:=...; P.Y:=...; P.SetPosition();
; //       P.Data:=...; P.Put();
; //     end;
; //
; //   ScreenAddrTab + PutAt(): a MAP-cellankent (0..539, UGYANAZ az
; //   indexeles, mint a fo .ras Map[]/PumpaScreen[]-jenel) elore
; //   kiszamolt, KESZ kepernyocim-tabla - igy futas kozben egyetlen
; //   pumpa kirakasahoz SEM kell tobbe SetPosition()-t hivni (nincs
; //   Y*64 szamitas), csak egy tabla-lookup. Hasznalat:
; //     WaterPump::BuildScreenAddrTab();  -- EGYSZER, induláskor
; //     ...
; //     WaterPump::PutAt(mapIndex, faziscimBaAdatPointere);  -- minden kirakasnal
; //   ============================================================  A videomemoria kezdocime (GE::ScreenAddr masolata - lasd a fenti
; //	   fejlec-megjegyzest). GRAPHICS4, DIRECT_TO_SCREEN mod eseten $8000.  keperny-X, byte-ban (GRAPHICS4: 1 byte = 4 px)  keperny-Y, pixelben  kesz keperny-cim (SetPosition tolti ki)  a kirakando 16 byte-os (2x8) fazis-kep cime  Position := SCREEN_ADDR + Y*64 + X - ugyanaz a keplet, mint a
; //				   GE::Sprite.SetPosition()-ben (Y*64 = shiftekkel, nincs szorzas).
; //				   SCREEN_ADDR itt egy sajat, fenti const (nincs GE-fuggoseg) -
; //				   const-ra a GE.tru is konvenciosan igy hivatkozik ASM-bol
; //				   (pl. "ld HL,GE_SCREEN_ADDR"): kozvetlen immediate-ertekkent,
; //				   ZAROJEL NELKUL (nem cim-dereferencia, mint egy var-nal). 
	; ***********  Defining procedure : WaterPump_PumpaSprite_SetPosition
	;    Procedure type : User-defined procedure
 ; Temp vars section
 ; Temp vars section ends
WaterPump_PumpaSprite_SetPosition:
						ld IX,[WaterPump_PumpaSprite_this]
						xor a
						ld h,a
						ld l,(IX+1)
						srl h
						rr l
						rra
						srl h
						rr l
						rra
						ld h,l
						ld l,a
						ld bc,WaterPump_SCREEN_ADDR
						add hl,bc
						ld a,(IX+0)
						ld b,0
						ld c,a
						add hl,bc
						ld (IX+2),l
						ld (IX+3),h
					
	ret
end_procedure_WaterPump_PumpaSprite_SetPosition:
	; 16 byte (2x8) kirakasa a Position cimre. Teljesen kitekert,
; //				   nincs ciklusszamlalo/felteteles ugras a masolo magban.
; //				   FONTOS: a "ldi" MELLEKHATASKENT csokkenti BC-t minden
; //				   lefutasnal (ezt hasznalja a ldir ciklusszamlalokent) - ezert
; //				   a sor-elotolashoz (62) NEM szabad egyszer betoltott BC-t
; //				   ujrahasznalni a ket ldi UTAN, mert az mar elcsuszott -
; //				   minden sor elott UJRA be kell tolteni BC=62-t. 
	; ***********  Defining procedure : WaterPump_PumpaSprite_Put
	;    Procedure type : User-defined procedure
WaterPump_PumpaSprite_Put:
						ld IX,[WaterPump_PumpaSprite_this]
						ld L,(IX+4)
						ld H,(IX+5)
						ld E,(IX+2)
						ld D,(IX+3)
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
end_procedure_WaterPump_PumpaSprite_Put:
	; Kepernyocim-tabla: index 0..539 (= (x-1)+(y-1)*30, UGYANAZ mint a
; //	   Map[]/PumpaScreen[] indexelese a fo .ras-ban) -> kesz kepernyocim.
; //	   A BuildScreenAddrTab() tolti fel EGYSZER, indulaskor.  Csak a tabla felepitesehez hasznalt, ideiglenes PumpaSprite peldany.  Csak a BuildScreenAddrTab() sajat, kezi ASM-es tarolasahoz kellenek
; //	   globalisan (lasd lent - a "ScreenAddrTab[idx]:=p;" sima Rascal forma
; //	   HIBAS kodot generalt: eldobta a tomb bazis-cimet, mielott hasznalta
; //	   volna - ugy tunik, 2-byte-os (integer) tomb 16-bites indexszel torteno
; //	   IRASA nem mukodik helyesen ebben a TRSE build-ben).  A PutAt() "global" parametereinek MAR LETEZO valtozokent kell
; //	   szerepelniuk a var blokkban - a "global" kulcsszo NEM hoz letre uj
; //	   valtozot, csak egy MEGLEVO globalishoz kapcsolja a parametert (lasd
; //	   a GE.tru sajat X/Y/ImagePtr stb. deklaraciojat, ugyanigy).  EGYSZER hivando (indulaskor): vegigmegy mind az 540 MAP-cellan, es a
; //	   PumpaSprite.SetPosition()-nel mar bizonyitottan mukodo kepletet
; //	   hasznalva kiszamolja es eltarolja a kesz kepernyocimet mindegyikre. 
	; ***********  Defining procedure : WaterPump_BuildScreenAddrTab
	;    Procedure type : User-defined procedure
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx:	db	0
localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy:	db	0
WaterPump_BuildScreenAddrTab_block4:
WaterPump_BuildScreenAddrTab:
	; generic assign 
	ld hl,$00
	; Loading pointer
	ld [WaterPump_BuildIdx],hl
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy], a
WaterPump_BuildScreenAddrTab_forloop5:
	ld a, $1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx], a
WaterPump_BuildScreenAddrTab_forloop19:
	; Storing to array  
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
	ld [WaterPump_WP_Setup+$0],a
	; Storing to array  
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
	ld [WaterPump_WP_Setup+$1],a
	ld hl,WaterPump_WP_Setup
	ld [WaterPump_PumpaSprite_this],hl
	call WaterPump_PumpaSprite_SetPosition
	; generic assign 
	ld de,$2
	ld hl,WaterPump_WP_Setup
	add hl,de
	; TYPETEST : BYTE  WriteType : INTEGER
	ld a,[hl]
	inc hl
	ld h,[hl]
	ld l,a
	; Loading pointer
	ld [WaterPump_BuildPos],hl
						ld hl,[WaterPump_BuildIdx]
						add hl,hl
						ld bc,WaterPump_ScreenAddrTab
						add hl,bc
						ex de,hl
						ld hl,[WaterPump_BuildPos]
						ld a,l
						ld (de),a
						inc de
						ld a,h
						ld (de),a
					
	; kezi tarolas, mert a "ScreenAddrTab[BuildIdx]:=BuildPos;"
; //					   sima Rascal forma hibas kodot generalt (lasd fent) 
	; 16 bit BINOP
	; RHS is pure 
	ld de,$01
	; Variable is 16-bit
	ld hl,[WaterPump_BuildIdx]
	add  hl,de
	ld [WaterPump_BuildIdx],hl
WaterPump_BuildScreenAddrTab_loopstart20:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapx],a
	cp $1e+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop19
WaterPump_BuildScreenAddrTab_loopend21:
WaterPump_BuildScreenAddrTab_loopstart6:
	ld a,[localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy]
	add a,1
	ld [localVariable_WaterPump_BuildScreenAddrTab_WaterPump_mapy],a
	cp $12+1
	jp nz,WaterPump_BuildScreenAddrTab_forloop5
WaterPump_BuildScreenAddrTab_loopend7:
	ret
end_procedure_WaterPump_BuildScreenAddrTab:
	; A TENYLEGES, kepkockankenti gyors kirako: MAP-index (0..539) alapjan
; //	   a ScreenAddrTab-bol nezi ki a kesz kepernyocimet - NINCS SetPosition-
; //	   hivas, NINCS Y*64 szamitas, csak egy tabla-lookup + a 16 byte-os blit. 
	; ***********  Defining procedure : WaterPump_PutAt
	;    Procedure type : User-defined procedure
WaterPump_PutAt_block28:
WaterPump_PutAt:
			ld hl,[WaterPump_Idx]
			add hl,hl
			ld bc,WaterPump_ScreenAddrTab
			add hl,bc
			ld e,(hl)
			inc hl
			ld d,(hl)
			ld hl,[WaterPump_Data]
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
block1:
main_block_begin_:
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
