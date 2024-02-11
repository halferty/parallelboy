#!/bin/bash
ruby ./tools/merge_asm_files.rb
rgbasm -L -o ./tmp/compiled.o ./tmp/compiled.asm
rgblink -o ./build/parallelboy.gb ./tmp/compiled.o
rgbfix -v -p 0xFF ./build/parallelboy.gb
