# WeaveOS - Custom Operating System

## Overview
WeaveOS is a custom operating system that I am building from scratch. The goal is to go from a simple bootloader to a fully functional kernel with memory management, multitasking, user programs, and a graphical interface.

## Features So Far
- Bootable via BIOS
- Writen in **xx86 Assembly**
- Prints '"Booting WeaveOS..."' using BIOS interrupts
- Runs in QEMU

## How to Build & Run
### **Prerequisites**
- **NASM** (Assembler)
- **QEMU** (PC Emulator)

### **Building the Bootloader**
``` 
cd bootloader
nasm -f bin boot.asm -o boot.bin
```
###**Running in QEMU**
```
qemu-system-x86_64 -drive format=raw,file=bootloader/boot.bin
```
