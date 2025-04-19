/*
 * linker script for the `rp2350`
 *
 * this script tells the linker how to assemble the executable
 */

ENTRY(Reset_Handler)

MEMORY
{
    flash(rx): ORIGIN = 0x10000000, LENGTH =   4M
    ram(rx)  : ORIGIN = 0x20000000, LENGTH = 520K
}

/*
 * the stack is placed at the end of the ram
 * therefore the addresses for the stack are
 * calculated here
 */
_estack = ORIGIN(RAM) + LENGTH(RAM)

HEAP_SIZE  = 0x1000; /* 4kB of heap */
STACK_SIZE = 0x1000; /* 4kB of stack */

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        KEEP(*(.vectors*))
        *(.text*)
        _etext = .;
    } > flash

    .bss (NOLOAD):
    {
        _sbss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > ram

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata*)
        . = ALIGN(4);
    }

    _sidata = LOADADDR(.data);
    .data :
    {
        _sdata = .;
        *(.data*);
        _edata = .;
    } > ram AT > flash

    .heap :
    {
        . = ALIGN(8);
        _sheap = .;
        . = . + HEAP_SIZE;
        . = ALIGN(8);
        _eheap = .;
    } > ram

    .stack :
    {
        . = ALIGN(8);
        _sstack = .;
        . = . + STACK_SIZE;
        . = ALIGN(8);
        _estack = .;
    }
}
