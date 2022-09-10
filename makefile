
build:
	docker build -t os_builder toolchain 

debug:
	docker run -it --rm --name os_builder_run -v "$(PWD)/container":/opt/host os_builder:1
