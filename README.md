# deadfish-repl
Deadfish REPL writen in C.
## What is this?
A simple C program that can execute program writen in esoteric programming language called Deadfish. ([esolangs wiki](https://esolangs.org/wiki/Deadfish))

It works as an interpreter, meaning it executes specific C code, depending on an instruction that user have provided.

Since it is very simple, you can pretty much port it to anywhere (to most of the architectures you use)

## How it works?

It asks for the user input, then compares if the input is a newline/eof, if so, continues, if the instruction is I, it increments the accumulator by one, if it is D, decrements accumulator by one, S squares the value of accumulator, O outputs the value of accumulator **as the number**, H halts, and after any instruction it checks if accumulator is -1 or 256. If so, it makes accumulator to be on zero. (Since there are variations of Deadfish, go to [this page](https://esolangs.org/wiki/Deadfish#Commands), or see this list
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

)

Uses getchar/fgets/getwchr to get the input, printf to print.

## Can I port it?

Yes, you can. Infact, if you don't have your architecture, port it either using zig, or specific versions of gcc to port it.
