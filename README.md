# optimized-c-routines

**Description:**  
This project reimplements standard C library functions (e.g. `strchr`, `memcpy`, etc.) using **hardware-optimized assembly** for the **x86 architecture**.

The code is written in **NASM syntax** and follows the **Windows x64 ABI** for 64-bit functions.

---

## Features

- Rewritten versions of common libc routines in hand-crafted assembly
- Optimized using instructions like `rep movsb`, `repne scasb`, etc.
- Separate support for:
  - ~~**x86 (32-bit)** routines~~
  - **x86-64 (64-bit)** routines
- Extensive inline **documentation and comments** to explain the logic and aid learning

---

## Goals

- Provide ~~highly optimized~~, low-level alternatives to libc functions
- Serve as a **learning resource** for understanding CPU instructions and ABI conventions
- Maintain clear and readable code despite being in assembly

---

## TODO

- [ ] Add C/C++ header files for both **x86** and **x86-64** functions (for easier linking from C/C++ projects)
- [ ] Benchmark against libc equivalents
- [ ] Add unit tests (possibly in C)
- [ ] Optimize the code further by avoiding only byte targeting instructions and using larger ones like qword
