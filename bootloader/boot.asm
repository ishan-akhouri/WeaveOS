[BITS 16]       ; The CPU starts in 16-bit Real Mode
[ORG 0x7C00]    ; BIOS loads the bootloader at memory address 0x7C00

; Print "Booting ThreadOS..."
mov si, message  ; Load address of the message into SI
call print_string  ; Call the print function

jmp $            ; Infinite loop to prevent execution from continuing

; Function: Print a string using BIOS interrupt 0x10
print_string:
    mov ah, 0x0E  ; BIOS teletype output function
.loop:
    lodsb         ; Load next character into AL
    cmp al, 0     ; Check if it's the null terminator
    je .done      ; If null, end printing
    int 0x10      ; Print character in AL
    jmp .loop     ; Repeat until end of string
.done:
    ret           ; Return from function

; Message to print
message db "Booting ThreadOS...", 0

; Pad the bootloader to exactly 512 bytes (BIOS requirement)
times 510-($-$$) db 0
dw 0xAA55  ; Boot sector signature (required for BIOS to recognize it)
