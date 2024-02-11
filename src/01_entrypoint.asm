EntryPoint:
	; Shut down audio circuitry
	ld a, 0
	ld [rNR52], a

; Banks
; 0000 - 3FFF: ROM bank 0, first 16KiB of ROM (read only)
; 4000 - 7FFF: ROM bank 0-1FF can be mapped here (read only)
; A000 - BFFF: RAM bank 0-F can be mapped here (read/write) (Note that when calling rgbfix in compile.sh we choose only 4 banks, so only 0-3 are valid)

; To switch banks:
; Write lower 8 bits of bank number to 0x2000 and upper 1 bit to 0x3000 to select a ROM bank
; Write to 0x4000 to select a RAM bank
; Write 0x0A to 0x0000 to enable read/write to RAM. Write 0x00 to dasable it. (Why would we ever want to disable it? Does this reduce RAM corruption risk?)
