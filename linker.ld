MEMORY {
    FLASH (rx)	    : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM (xrw)	    : ORIGIN = 0x20000000, LENGTH = 112K
    ETHRAM (xrw)    : ORIGIN = 0x2001C000, LENGTH = 16K
    CCMRAM (xrw)    : ORIGIN = 0x10000000, LENGTH = 64K
}

/* End of things */
_estack = 0x10010000;
_sheap = 0x20000000;
_eheap = 0x2001BFFC;

SECTIONS {
    flash : {
	KEEP(*(.vectors))
	. = ALIGN(4);
	*(.text*)
	. = ALIGN(4);
	_srodata = .;
	*(.rodata*)
	. = ALIGN(4);
	_erodata = .;
    } > FLASH

    ram : {
	. = ALIGN(4);
	_sdata = .;
	*(.data*)
	. = ALIGN(4);
	_edata = .;
	. = ALIGN(4);
	_sbss = .;
	*(.bss*)
	. = ALIGN(4);
	_ebss = .;
    } > CCMRAM

}
