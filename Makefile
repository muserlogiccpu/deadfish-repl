CC = zig build-exe
SRC = main.zig
OUT = muser_bin
X86_64_LINUX   = x86_64-linux
X86_LINUX      = x86-linux
ARM64_LINUX    = aarch64-linux
ARM32_LINUX    = arm-linux-gnueabihf
X86_64_WIN     = x86_64-windows
X86_WIN        = x86-windows
WASM32_WASI    = wasm32-wasi
MIPS_LINUX     = mips-linux
MIPSEL_LINUX   = mipsel-linux
PPC32_LINUX    = powerpc-linux
RISCV64_LINUX  = riscv64-linux
RISCV32_LINUX  = riscv32-linux
SPARC_LINUX    = sparc-linux
LOONG_LINUX    = loongarch64-linux
S390X_LINUX    = s390x-linux
all: x86_64 x86 arm64 arm32 win64 win32 wasm mips mipsel ppc riscv64 riscv32 sparc loong s390x

x86_64:
	$(CC) $(SRC) -target $(X86_64_LINUX) -O ReleaseSmall --name $(OUT)_x86_64
x86:
	$(CC) $(SRC) -target $(X86_LINUX) -O ReleaseSmall --name $(OUT)_x86
arm64:
	$(CC) $(SRC) -target $(ARM64_LINUX) -O ReleaseSmall --name $(OUT)_arm64
arm32:
	$(CC) $(SRC) -target $(ARM32_LINUX) -O ReleaseSmall --name $(OUT)_arm32
win64:
	$(CC) $(SRC) -target $(X86_64_WIN) -O ReleaseSmall --name $(OUT)_win64.exe
win32:
	$(CC) $(SRC) -target $(X86_WIN) -O ReleaseSmall --name $(OUT)_win32.exe
wasm:
	$(CC) $(SRC) -target $(WASM32_WASI) -O ReleaseSmall --name $(OUT).wasm
mips:
	$(CC) $(SRC) -target $(MIPS_LINUX) -O ReleaseSmall --name $(OUT)_mips
mipsel:
	$(CC) $(SRC) -target $(MIPSEL_LINUX) -O ReleaseSmall --name $(OUT)_mipsel
ppc:
	$(CC) $(SRC) -target $(PPC32_LINUX) -O ReleaseSmall --name $(OUT)_ppc
riscv64:
	$(CC) $(SRC) -target $(RISCV64_LINUX) -O ReleaseSmall --name $(OUT)_rv64
riscv32:
	$(CC) $(SRC) -target $(RISCV32_LINUX) -O ReleaseSmall --name $(OUT)_rv32
sparc:
	$(CC) $(SRC) -target $(SPARC_LINUX) -O ReleaseSmall --name $(OUT)_sparc
loong:
	$(CC) $(SRC) -target $(LOONG_LINUX) -O ReleaseSmall --name $(OUT)_loong64
s390x:
	$(CC) $(SRC) -target $(S390X_LINUX) -O ReleaseSmall --name $(OUT)_s390x
native:
	$(CC) $(SRC) --name $(OUT)_native
clean:
	rm -f $(OUT)_* $(OUT).exe $(OUT).wasm *.o
