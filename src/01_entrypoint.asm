EntryPoint:
	; Shut down audio circuitry
	ld a, 0
	ld [rNR52], a
