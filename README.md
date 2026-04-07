# deadfish-repl ![C](https://img.shields.io/badge/Language-C-blue?style=flat-square) ![Status](https://img.shields.io/badge/Status-Release-green?style=flat-square) ![License](https://img.shields.io/badge/License-CC0-green?style=flat-square) ![Paradigm](https://img.shields.io/badge/Paradigm-Esoteric-red?style=flat-square) ![Architectures](https://img.shields.io/badge/Architectures-16-blueviolet?style=flat-square)
Deadfish REPL written in C. \
\
([Українська мова](README.ua.md)) 
| Architecture | Status |
| :--- | :--- |
| **x86_64** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **x86** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **ARM64** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **ARM32** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **x86_64 Windows** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **x86 Windows** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **WASM32** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **MIPS** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **MIPSEL** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **PowerPC x32 MSB** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **RISC-V64** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **RISC-V32** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **SPARC** | ![Not yet because Zig almost doesn't support it](https://img.shields.io/badge/-Not%20yet%20because%20Zig%20almost%20doesn%27t%20support%20it-red?style=flat-square) |
| **LoongArch 64** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **S390X** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **x86_64 macOS** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **ARM64 macOS** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |
| **FreeBSD x64** | ![Passing](https://img.shields.io/badge/-Passing-green?style=flat-square) |

## What is this? 
A simple C program that can execute program writen in esoteric programming language called Deadfish. ([esolangs wiki](https://esolangs.org/wiki/Deadfish))

It works as an interpreter, meaning it executes specific C code, depending on an instruction that user have provided.

Since it is very simple, you can pretty much port it to anywhere (to most of the architectures you use)

## How it works?

It asks for the user input, \
- then compares if the input is a newline/eof, if so, continues, \
- if the instruction is I, it increments the accumulator by one, \
- if it is D, decrements accumulator by one, \
- S squares the value of accumulator, \
- O outputs the value of accumulator **as the number**, \
- H halts,
- and after any instruction it checks if accumulator is -1 or 256. If so, it makes accumulator to be on zero. \
> [!IMPORTANT]
> Since there are variations of Deadfish, go to [this page](https://esolangs.org/wiki/Deadfish#Commands), or see this list

| Variation | Increment | Decrement | Square | Output | Halt (optional) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Standard Deadfish** | `i` | `d` | `s` | `o` | `h` |
| **XKCD variation** | `x` | `d` | `k` | `c` | |
| **f() variation** | `f` | `f()` | `f ()` | `f(())` | |
| **F!-- variation** | `F!` | `U!` | `C!` | `K!` | |
| **嘭！哐！叮！呲！咣！** | `嘭！` | `哐！` | `叮！` | `呲！` | |
| **Sakana variation** | `増` | `減` | `乗` | `出` | `停` |
| **ΙΧΘΥΣ variation** | `ι` | `χ` | `θ` | `υ` | |
| **Pește mort variation** | `c` | `s` | `p` | `i` | `o` |
| **Numbered DeadFish** | `1` | `2` | `3` | `4` | `5` |

> [!NOTE]
> Uses getchar/fgets/getwchr to get the input, printf to print.

## Can I port it?

Yes, you can. Infact, if you don't have your architecture, port it either using zig, or specific versions of gcc to port it.

## Warning

> [!WARNING]
Everything on this branch is beta, the main release would get the beta stuff, if the beta stuff works.
