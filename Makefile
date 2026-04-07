SHELL := /bin/bash
CC = zig cc
INCLUDES = -I./include
CFLAGS = -O2 -Wall
ARCHS = x86_64-linux x86-linux aarch64-linux arm-linux-gnueabihf \
	x86_64-windows x86-windows wasm32-wasi mips-linux \
	mipsel-linux powerpc-linux riscv64-linux riscv32-linux \
	sparc-linux loongarch64-linux s390x-linux
all:
	for arch in $(ARCHS); do \
		mkdir -p "build/$$arch"; \
		for src in *.c; do \
			[ -e "$$src" ] || continue; \
			bin_name=$${src%.c}; \
			output="build/$$arch/$$bin_name"; \
			[[ "$$arch" == *"windows"* ]] && output="$$output.exe"; \
			[[ "$$arch" == *"wasm"* ]] && output="$$output.wasm"; \
			echo "$(CC) \"$$src\" -target $$arch -o \"$$output\""; \
			$(CC) "$$src" $(INCLUDES) $(CFLAGS) -target "$$arch" -o "$$output"; \
		done; \
	done
clean:
	rm -rf build/
