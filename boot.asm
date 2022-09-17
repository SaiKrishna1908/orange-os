# BIOS loads us to this address, so we tell assembler to offset our data
ORG 0x7c00
# Tell assembler to assemble instructions in 16 bit code
BITS 16

start:   
# Source index points to 'H'
    mov si, message
    call print
    jmp $

print:
    ; mov bx,0
.loop:
    ; Load data pointed by sb into al and move pointer forward 
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop
.done:
    ret
print_char:
    ; Teletype mode
    mov ah, 0eh    
    ; Interuput    
    int 0x10
    ret

message:
    dw 'Hello world!', 0

# Boot signature, $ refers to the address of the line 
# while $$ refers to address to 1st line
times 510 -($ - $$) db 0
# Use dw to write binary to the file, should be 0x55AA but this is little eidean
dw 0xAA55
