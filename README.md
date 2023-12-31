This is Atul's convoluted build pipeline for cross-compiling
and running 6502 assembly programs on an Apple II using a Mac.

See [Rationale](#rationale) for more details on why I made this.

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
drive 1. Make sure it's currently running and at the BASIC/DOS
prompt (you should see `]` followed by a blinking cursor).

### Running assembly programs

In a terminal, run `./compile [program]` where program is the
base name (without the trailing `.s` or the directory name) of
a file in the `src` directory.

For example, `./compile printa` will act upon `src/printa.s`.

This will compile the program, put its binary in a disk at
`disks/boop.dsk`, insert the disk into drive 2 of your
Apple VM, and run the program (which is always called `BOOP`).

### Running BASIC programs

In a terminal, run `./basic [program]` where program is the
base name (without the trailing `.bas` or the directory name) of
a file in the `src` directory.

For example, `./basic hello` will act upon `src/hello.bas`.

This will put the BASIC file in a disk at `disks/basic.dsk`,
insert the disk into drive 2 of your Apple VM, and run the
program (which is always called `BASIC`).

### Running hybrid BASIC + assembly programs

In a terminal, run `./hybrid [program]` where program is the
base name (without the trailing `.bas`/`.s` or the directory name) of
a pair of files in the `src` directory.

For example, `./hybrid al10-adc-5a` will act upon `src/al10-adc-5a.bas`
and `src/al10-adc-5a.s`.

This will compile the assembly program, put its binary and the BASIC
file in a disk at `disks/hybrid.dsk`, insert the disk into drive 2
of your Apple VM, load the assembly program (which is always called `BOOP`)
into memory, and run the BASIC program (which is always called `BASIC`).
It's expected that the BASIC program will call the assembly program
as needed.

## Rationale

I was working through the tutorials in Robert Wagner's _Assembly Lines_
articles from the early 1980s and had a few issues with running
Merlin on the Apple II:

* It seemed like all the versions of Merlin I could find online were
  from a different time period than the original tutorials were
  written. Some things the tutorial told me to do weren't working
  at all.

* Even once I stumbled into getting _something_ working with Merlin,
  modifying my code and seeing its effects took a lot of keystrokes.

  At first I thought I was just spoiled by the conveniences of
  modern development, but then I realized that even Integer BASIC
  on the Apple II makes it easy to iterate on one's code--once you're
  done modifying things you just type `RUN` and you can see its effects.

  But with Merlin, I had to switch through multiple different modes in the
  program to compile my code, manually load the binary into the
  proper region in memory, and then run it. It was all a bit of a
  hassle and quite error-prone.

* Even though I theoretically liked the idea of fully role-playing
  a computer programmer from 1982, I wasn't terribly interested in
  becoming fluent with Merlin, which was an extremely primitive
  code editor by today's standards.

So even though this pipeline I've made is a bit overkill, at
least it makes it possible for me to get in a flow state with
my code and quickly try things out.

## Other resources

* [Assembly Lines: The Complete Book (2014)](https://archive.org/details/AssemblyLinesCompleteWagner/page/n211/mode/2up) - A compilation of all the tutorials Robert Wagner wrote for Softalk magazine in the early 1980s. Following these tutorials is the main reason I started this repository.

* [Apple II Reference Manual (1979)](https://archive.org/details/apple-ii-ref-manual/mode/2up) - I think this came with all new Apple II computers. Recommended in Assembly Lines chapter 1, "Apple's Architecture".

* [The Apple II Monitor Peeled (1979, PDF)](https://mirrors.apple2.org.za/Apple%20II%20Documentation%20Project/Books/A.P.P.L.E.%20-%20Dougherty%20-%20The%20Apple%20II%20Monitor%20Peeled.pdf) - Recommended in Assembly Lines chapter 3, "Assemblers".

* [Beneath Apple DOS (1982, PDF)](https://mirrors.apple2.org.za/Apple%20II%20Documentation%20Project/Books/Beneath%20Apple%20DOS.pdf) - Recommended in Assembly Lines chapter 11, "DOS and Disk Access".

* [Apple II BASIC Programming Manual (1978, PDF)](http://cini.classiccmp.org/pdf/Apple/Apple%20II%20Basic%20Programming%20Manual.pdf) - Jef Raskin's guide to BASIC programming. Assembly Lines assumes familiarity with BASIC, so this is useful as a refresher, among other things.

* [Apple II DOS & Commands FAQ](https://mirrors.apple2.org.za/ftp.apple.asimov.net/documentation/programming/basic/Apple%20II%20DOS%20%26%20Commands%20FAQ.txt) - Apple DOS is some kind of weird BASIC with extra commands, this makes everything less confusing.

* [Merlin manual (plaintext)](https://gswv.apple2.org.za/a2zine/Docs/MerlinManual.txt) - The plain text makes it easy for searching. Note that this is for the original Merlin from the early 1980s; the [Merlin32 manual](http://www.brutaldeluxe.fr/products/crossdevtools/merlin/) is also helpful.

## License

Everything in this repository not expressly attributed to other sources is licensed under [CC0 1.0 Universal](./LICENSE.md) (public domain).
