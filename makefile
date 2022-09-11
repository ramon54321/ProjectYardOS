build_toolchain:
	docker build -t os_builder:2 toolchain 

start_toolchain:
	docker run --name os_builder_run -v "$(PWD)/container":/opt/host os_builder:2

start_toolchain_debug:
	docker run -it --rm --name os_builder_run -v "$(PWD)/container":/opt/host os_builder:2

clean:
	rm -rf container/*

transfer:
	make clean
	cp -r src container/src
	cp makefile_container container/src/makefile
	docker exec os_builder_run mv host/src/makefile makefile

build:
	make transfer
	docker exec os_builder_run make build 

emulate:
	qemu-system-i386 -kernel container/bin/os.bin

verify:
	if docker exec os_builder_run grub-file --is-x86-multiboot host/bin/os.bin; then echo "\nMultiboot Confirmed"; else echo "\nNot Multiboot"; fi;
