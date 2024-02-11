#!/bin/bash
./clean.sh
ruby ./tools/merge_asm_files.rb
rgbasm -L -o ./tmp/compiled.o ./tmp/compiled.asm
rgblink -o ./build/parallelboy.gb ./tmp/compiled.o
# v: validate (fix all the header values - meaning logo & checksums)
# c: Gameboy color compatible
# s: Super Gameboy compatible
# p: Pad value (why 0xFF? Do some emulators break if it's something else?)
# l: Licensee code (0x33 is the standard code for unlicensed games)
# m: Memory bank controller type
# r: RAM size (0x3 = 32KB, 4 banks of 8KB each)
# t: Title
# (I wanted to use -C, which is supposed to set the cartridge as Gameboy Color ONLY, but it isn't working with various emulators?!?)
rgbfix -vcs -p 0xFF -l 0x33 -m MBC5+RAM+BATTERY -r 0x3 -t "Parallel Boy" ./build/parallelboy.gb
