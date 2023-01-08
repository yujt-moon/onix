%.bin: %.asm
	nasm -f bin $< -o $@

master.img: boot.bin loader.bin
	dd if=boot.bin of=../bochs/master.img bs=512 count=1 conv=notrunc
	dd if=loader.bin of=../bochs/master.img bs=512 count=4 seek=2 conv=notrunc

.PHONY: clean
clean:
	rm -rf *.bin *.out

.PHONY: bochs
bochs: master.img
	../bochs/bin/bochs -q -f ../bochs/bochsrc