## YardOS

YardOS is an attempt to build a minimal booting operating system based on the guides at [OSDev](https://wiki.osdev.org).

In addition, the toolchain is [Dockerized](https://www.docker.com/), allowing development in a cross-platform manner. However, due to this, the initial toolchain Docker image needs to be built, which could take hours, depending on host performance.

### Getting Started

Clone the repo:
```
git clone https://github.com/ramon54321/ProjectYardOS.git
cd ProjectYardOS
```

Build the toolchain:
```
make build_toolchain
```

Run the toolchain:
```
make start_toolchain
```

At this point you are ready for development. When source files are edited, they need to be copied into the `container` directory and built. This can be done with:
```
make build 
```

If the build succeeds on the container, the resulting kernel file can be emulated with [QEMU](https://www.qemu.org/) by running:
```
make emulate
```
