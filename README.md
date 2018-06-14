# `tool-mkspiffs` for FreeBSD

This port builds [mkspiffs](https://github.com/igrr/mkspiffs) for FreeBSD.
Platformio currently does not provide
[`tool-mkspiffs`](https://bintray.com/platformio/dl-packages/tool-mkspiffs)
for FreeBSD.

## Notes

The package has been confirmed to work fine with the following configuration.

```
[env:lolin32]

platform = espressif32
framework = arduino
board = lolin32
```

## Requirements

* FreeBSD with the ports tree installed
* `git(1)` (optional)

## Installation

Clone the repository under `/usr/ports/devel`.
Or download the repository archive and extract it.

```
> cd /usr/ports/devel
# git clone https://github.com/trombik/toolchain-xtensa32
```

Build and install.

```
> cd /usr/ports/devel/tool-mkspiffs
# make
# make install
```

The archive is installed under `/usr/local/share/tool-mkspiffs` by default.

Create the package directory and extract the archive. Be sure to replace
`${VERSION}` in the instruction below  with the actual version number.

```
> mkdir -p ~/.platformio/packages/tool-mkspiffs
> tar -x -C ~/.platformio/packages/tool-mkspiffs
    -f /usr/local/share/tool-mkspiffs/tool-mkspiffs-freebsd_amd64-${VERSION}.tar.gz
```

## Building the package in a VM

### Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

### `Vagrantfile`

The following [`Vagrantfile`](Vagrantfile) builds the package in a
`virtualbox` VM.


Run the VM by:

```
> vagrant up
```

Copy the package archive to _the host_ from _the guest_ by;

```
> vagrant ssh -- cat /usr/local/share/tool-mkspiffs/tool-mkspiffs-freebsd_amd64-${VERSION}.tar.gz > tool-mkspiffs-${VERSION}.tar.gz
```
