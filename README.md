# 4-bit ALU (Arithmetic Logic Unit) in VHDL

This repository contains the VHDL implementation of a 4-bit ALU (Arithmetic Logic Unit). An ALU is a fundamental component of a CPU (Central Processing Unit) responsible for performing arithmetic and logical operations on input data.

## Overview

The 4-bit ALU implemented in this project is capable of performing various operations, including addition, subtraction, multiplication, division, logical operations (AND, OR, XOR, NOT), bitwise operations (NAND, NOR, XNOR), increment, decrement, equality comparison, less than comparison, and greater than comparison.

## Files

- `ALU4bit.vhd`: This file contains the VHDL code for the 4-bit ALU entity.
- `README.md`: This file provides an overview of the project and instructions for usage.

## Usage

To use the 4-bit ALU in your own VHDL project, follow these steps:

1. Clone or download this repository to your local machine.
2. Include the `ALU4bit.vhd` file in your VHDL project.
3. Instantiate the `ALU4bit` entity in your VHDL code, providing appropriate inputs and connecting outputs as required.
4. Simulate or synthesize your VHDL design to verify the functionality of the ALU.

## Inputs and Outputs

The `ALU4bit` entity has the following ports:

- **Inputs**:
  - `A`, `B`: 4-bit unsigned operands.
  - `Cin`: Single-bit carry-in signal.
  - `Slc`: 4-bit select lines for choosing the operation.
  
- **Outputs**:
  - `F`: 4-bit unsigned result of the operation.
  - `Cout`: Single-bit carry/borrow out.
  - `Zero`: Single-bit zero flag indicating if the result is zero.
  - `GreaterThan`: Single-bit flag indicating if `A` is greater than `B`.
  - `LessThan`: Single-bit flag indicating if `A` is less than `B`.

## Opcode Table

| Opcode | Operation          | Required Inputs                             |
|--------|--------------------|---------------------------------------------|
| 0000   | Addition           | A (4-bit), B (4-bit), Cin (1-bit)           |
| 0001   | Subtraction        | A (4-bit), B (4-bit), Cin (1-bit)           |
| 0010   | Multiplication     | A (4-bit), B (4-bit)                        |
| 0011   | Division           | A (4-bit), B (4-bit)                        |
| 0100   | Logical AND        | A (4-bit), B (4-bit)                        |
| 0101   | Logical OR         | A (4-bit), B (4-bit)                        |
| 0110   | Logical XOR        | A (4-bit), B (4-bit)                        |
| 0111   | Logical NOT A      | A (4-bit)                                   |
| 1000   | Bitwise NAND       | A (4-bit), B (4-bit)                        |
| 1001   | Bitwise NOR        | A (4-bit), B (4-bit)                        |
| 1010   | Bitwise XNOR       | A (4-bit), B (4-bit)                        |
| 1011   | Increment A        | A (4-bit)                                   |
| 1100   | Decrement A        | A (4-bit)                                   |
| 1101   | Equality (A = B)   | A (4-bit), B (4-bit)                        |
| 1110   | Less than (A < B)  | A (4-bit), B (4-bit)                        |
| 1111   | Greater than (A > B)| A (4-bit), B (4-bit)                        |



## License

This project is licensed under the [MIT License](LICENSE).
