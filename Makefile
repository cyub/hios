
ASM_SRCS := $(wildcard *.s)
ASM_BINS := $(patsubst %.s, %.bin, $(ASM_SRCS))

ASM := nasm
ASM_FLAGS := -f bin

all: build

build:  $(ASM_BINS)

$(ASM_BINS): $(ASM_SRCS)
	- $(ASM) $(ASM_FLAGS) $< -o $@

qemu:
	qemu-system-x86_64 --nographic --curses boot.bin

kill-qemu:
	pgrep qemu-system-x86_64 | xargs kill

clean:
	@rm -rf *.bin