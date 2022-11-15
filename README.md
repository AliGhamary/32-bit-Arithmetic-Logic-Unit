# Arithmetic-Logic-Unit

This is a 32-bit Arithmetic Logic Unit (ALU) created using VHDL code.

The ALU consists of indivually designed components that include:
1) Controller
2) AND Unit
3) Arithmetic Unit
4) Logic Unit
5) Shifter Unit
6) MUX

The AlU takes two unisgned 32-bit binary inputs A and B, and is able to perform the following operations:
- Addition, increment, decrement and transfer (arithmetic operations)
- AND, OR, NOT, XOR (logical operations)
- Right shift, left shift (shift operations) 

The design has a 4-bit select line called Operation Select (input), which directs the unit as to
which operation to perform.
The unit also features a Carry-in and a Carry-out bit.

The ALU uses the Testbench file created to test each operation thoroughly.
