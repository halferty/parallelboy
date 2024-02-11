# Iterate over all .asm files in ./src and concat them together and write to ./tmp/main.asm
# This is a simple build script for the assembler files
    
require 'fileutils'

# Get all .asm files in /src
asm_files = Dir.glob("./src/**/*.asm")

# Concatenate all .asm files into one file
File.open("./tmp/compiled.asm", "w") do |file|
    asm_files.sort.each do |asm_file|
        file.write(File.read(asm_file))
    end
end
