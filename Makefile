CC = zig cc
INCLUDES = -I./include
CFLAGS = -O2 -Wall
ARCHS = x86_64-linux x86-linux aarch64-linux arm-linux-gnueabihf \
        x86_64-windows x86-windows wasm32-wasi mips-linux \
        mipsel-linux powerpc-linux riscv64-linux riscv32-linux \
        sparc-linux loongarch64-linux s390x-linux
SRCS = $(wildcard *.c)
BINS = $(SRCS:.c=)
all:
	@$(foreach arch, $(ARCHS), \
		mkdir -p build/$(arch); \
		$(foreach src, $(SRCS), \
			$(CC) $(src) $(INCLUDES) $(CFLAGS) -target $(arch) -o build/$(arch)/$(src:.c=)$(if $(findstring windows,$(arch)),.exe,); \
		) \
	)
clean:
	rm -rf build/
