Kernel Sentence
===============

Inspired by the talk [The Birth and Death of
Javascript](https://www.destroyallsoftware.com/talks/the-birth-and-death-of-javascript)
we aim to build a arm kernel which eschews memory protection in favor of kernel
level VMs.


Hacking
--------
* Install QEMU
* Compile an ARM GCC cross compiler for your system
* `Make`
* `Make run`
* Optionally `Make run-debug`

Roadmap
------------

* Build a very simple 32 bit arm kernel on a flat memory model.
* The kernel will handle a select number of interrupts.
* Then we will write a reimplementation of several parts of the C Standard
library (`printf`, `malloc`, `free`, etc.).
* We will write a simple VM for ARM assembly running at ring 0 on a flat memory
space with limited memory translation.
* Write keyboard, vga, and serial drivers.
* Write a over serial program loader into the vm.

Dreams
------
* Write a JIT (for a subset of javascript?) which runs on this VM
