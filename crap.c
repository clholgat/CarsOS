

int crap(int argc, char *argv[]) {
    while(1) {
	//Do nothing
    }
}

unsigned int v[] __attribute__((section(".vectors"))) = {
    0x666,
    (unsigned int) &crap };

