#!/usr/bin/env python3
"""
Exercise: GDB (#1908) — recover flag1/flag2 without a live Linux GDB session.

flag_1 / flag_2 implement the same LCG-like update with 64-bit wrap, then unsigned mod.
Anti-disassembly: `jmp` into the middle of the next instruction stream (see README).
"""

MASK64 = (1 << 64) - 1


def lcg_mod(mod: int, mul: int, add: int, i_max: int) -> int:
    """i runs 0..i_max inclusive (matches `cmp i, imm; jle body`)."""
    x = 0
    for _ in range(i_max + 1):
        x = (x * mul) & MASK64
        x = (x + add) & MASK64
        x = x % mod
    return x


def main() -> None:
    # Constants recovered from .text (real stream after anti-disasm jump)
    flag1 = lcg_mod(
        mod=0xFABC0897FABC0897,
        mul=0xCA084213,
        add=0xDEADBEEFCAFECAFE,
        i_max=0x63,
    )
    flag2 = lcg_mod(
        mod=0xFBBBBBBBBBBBBBBB,
        mul=0xCACACACACACA,
        add=0xDEADBEAFBEAF,
        i_max=0x60,
    )
    print(f"flag1 = {flag1:#x}")
    print(f"flag2 = {flag2:#x}")
    print(f"DH{{{flag1:#x}-{flag2:#x}}}")


if __name__ == "__main__":
    main()
