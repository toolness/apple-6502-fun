This is Atuls' convoluted build pipeline for cross-assembling
and running 6502 assembly programs on an Apple II using a Mac.

## Prerequisites

1. Get [Virtual II][]
2. Install Java 11 (e.g., `brew install openjdk@11`). Sadly
   this is required to run [AppleCommander], which builds disk
   images for us.
3. Build and install [Merlin32][].

[Virtual II]: https://www.virtualii.com/
[AppleCommander]: https://applecommander.github.io/
[Merlin32]: https://github.com/apple2accumulator/merlin32#build-with-default-install-loaction

## Building and running programs

Set up a Virtual II machine running an Apple II+ and put DOS 3.3
(included in the `disks` subdirectory) in disk drive 1. Make sure
it's currently running.

Now in a terminal, run `./compile [program]` where program is the
base name (without the trailing `.s` or the directory name) of
a file in the `src` directory.

For example, `./compile printa` will build and run `src/printa.s`.
