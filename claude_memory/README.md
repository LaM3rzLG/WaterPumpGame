# Claude projektmemória (közös, a repóban)

Ez a mappa a Claude Code projektmemóriája. Mindkét gépen a Claude memória-mappája
ide mutat, így a git viszi át a tudást. **Munka elején `git pull`, a végén commit + push.**

Ez a README nem memória-bejegyzés (a `MEMORY.md` az index).

## Mac (kész, 2026-10-28)

`~/.claude/projects/-Users-lgabor-Documents-TVC-Projects-WaterPumpGame/memory` ->
symlink erre a mappára.

## Windows (kész, 2026-10-28)

`%USERPROFILE%\.claude\projects\c--TVC-TRSE-Projects-WaterPumpGame\memory` -> junction erre a mappára.
A bekötés előtti állapot mentése: `%USERPROFILE%\claude_memory_mentes\`. A régi személyes skillek
kikerültek a `~\.claude\skills`-ből: `Documents\TVC-TRSE-skill\` (a PDF-ekkel) és `Documents\TVC-Utils-skill-regi\`.
FIGYELEM: a lenti `xcopy` a `watergame-mac-migration.md`-t a régebbi Windows-ossal írta volna felül - kézzel kellett fésülni.

## Windows - egyszeri bekötés (junction, nem kell hozzá rendszergazda)

A Windows-os memória ÚJABB lehet a repóban lévőnél (10-26/27-i munka), ezért ELŐBB
össze kell fésülni. Claude Code-ból: "kösd be a claude_memory-t a CLAUDE.md /
claude_memory/README.md szerint" - vagy kézzel, cmd-ben:

```bat
cd /d C:\TVC\TRSE_Projects\WaterPumpGame
git pull
set MEM=%USERPROFILE%\.claude\projects\c--TVC-TRSE-Projects-WaterPumpGame\memory
rem 1) mentés
xcopy "%MEM%" "%USERPROFILE%\claude_memory_mentes\" /E /I /Y
rem 2) a Windows-os fájlok a repóba - FELÜLÍRJA az azonos nevűeket (a Windows-os az újabb),
rem    a Mac-es watergame-mac-migration.md és README.md ott nincs, az megmarad
xcopy "%MEM%\*" claude_memory\ /Y
rem 3) MEMORY.md: ellenőrizni, hogy a Mac-es sor ("Mac migration") benne maradt-e
rem 4) a régi mappa helyére junction
rmdir /S /Q "%MEM%"
mklink /J "%MEM%" C:\TVC\TRSE_Projects\WaterPumpGame\claude_memory
git add claude_memory && git commit -m "Memoria: Windows-os allapot osszefesulve" && git push
```

## Skillek

A skillek 2026-10-30 óta a közös `TVC_Kozos/skills` repóban (TVC_Skills) vannak; a projekt `.claude/skills/` mappájában
csak linkek (Mac: `bash ../TVC_Kozos/skills/bekot.sh .`, Windows: `bekot.ps1`, junction).
Windowson utána a régi személyes példányokat (`%USERPROFILE%\.claude\skills\TVC-TRSE`,
`TVC-Utils`) érdemes átnevezni/eltávolítani, különben kétszer szerepelnek - a PDF-ek
(`TVC-TRSE\sources\docs\pdf`) maradjanak meg valahol, azok nincsenek a repóban.
