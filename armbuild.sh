#!/bin/sh
mkdir -p build
aarch64-linux.gnu-as -c arm/boot.S -o build/boot.o
aarch64-linux-gnu-gcc -ffreestanding -c arm/kernel.c -o build/kernel.o -O2 -Wall -Wextra
aarch64-linux-gnu-gcc -T arm/linker.ld -o build/myos.elf -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
aarch64-linux-gnu-objcopy build/myos.elf -O binary build/kernel8.img
