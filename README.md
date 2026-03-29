# deadfish-repl
Deadfish REPL writen in C.
## What is this?
A simple C program that can execute program writen in esoteric programming language called Deadfish. ([esolangs wiki](https://esolangs.org/wiki/Deadfish))

It works as an interpreter, meaning it executes specific C code, depending on an instruction that user have provided.

Since it is very simple, you can pretty much port it to anywhere (to most of the architectures you use)

## How it works?

It asks for the user input, then compares if the input is a newline/eof, if so, continues, if the instruction is I, it increments the accumulator by one, if it is D, decrements accumulator by one, S squares the value of accumulator, O outputs the value of accumulator **as the number**, H halts, and after any instruction it checks if accumulator is -1 or 256. If so, it makes accumulator to be on zero. (Since there are variations of Deadfish, go to [this page](https://esolangs.org/wiki/Deadfish#Commands))

Uses getchar to get the input, printf to print.

## Can I port it?

Yes, you can. Infact, if you don't have your architecture, port it either using zig, or specific versions of gcc to port it.

## Why is there no license?

Since it is licensed under CC0, and Github doesn't provide abbility to choose CC0 license, I can't pick license
