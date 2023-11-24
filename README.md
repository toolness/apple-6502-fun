This is Atuls' convoluted build pipeline for cross-assembling
and running 6502 assembly programs on an Apple II using a Mac.

## Prerequisites

1. Get [Virtual II][].
2. Install Java 11 (e.g., `brew install openjdk@11`). Sadly
   this is required to run [AppleCommander], which builds disk
   images for us.
3. Build and install [Merlin32][].

[Virtual II]: https://www.virtualii.com/
[AppleCommander]: https://applecommander.github.io/
[Merlin32]: https://github.com/apple2accumulator/merlin32#build-with-default-install-loaction

## Building and running programs

Set up a Virtual II machine running an Apple II+ (IIe is okay too)
and put DOS 3.3 (included in the `disks` subdirectory) in disk
drive 1. Make sure it's currently running.

Now in a terminal, run `./compile [program]` where program is the
base name (without the trailing `.s` or the directory name) of
a file in the `src` directory.

For example, `./compile printa` will act upon `src/printa.s`.

This will compile the program, put its binary in a disk at
`disks/boop.dsk`, insert the disk into drive 2 of your
Apple VM, and run the program (which is always called `BOOP`).

## Other resources

* [Assembly Lines: The Complete Book (2014)](https://archive.org/details/AssemblyLinesCompleteWagner/page/n211/mode/2up) - A compilation of all the tutorials Robert Wagner wrote for Softalk magazine in the early 1980s. Following these tutorials is the main reason I started this repository.

* [Apple II Reference Manual (1979)](https://archive.org/details/apple-ii-ref-manual/mode/2up) - I think this came with all new Apple II computers. Recommended in Assembly Lines chapter 1, "Apple's Architecture".

* [The Apple II Monitor Peeled (1979, PDF)](https://mirrors.apple2.org.za/Apple%20II%20Documentation%20Project/Books/A.P.P.L.E.%20-%20Dougherty%20-%20The%20Apple%20II%20Monitor%20Peeled.pdf) - Recommended in Assembly Lines chapter 3, "Assemblers".

* [Apple II BASIC Programming Manual (1978, PDF)](http://cini.classiccmp.org/pdf/Apple/Apple%20II%20Basic%20Programming%20Manual.pdf) - Jef Raskin's guide to BASIC programming. Assembly Lines assumes familiarity with BASIC, so this is useful as a refresher, among other things.

* [Apple II DOS & Commands FAQ](https://mirrors.apple2.org.za/ftp.apple.asimov.net/documentation/programming/basic/Apple%20II%20DOS%20%26%20Commands%20FAQ.txt) - DOS is some kind of weird BASIC with extra commands, this makes everything less confusing.
