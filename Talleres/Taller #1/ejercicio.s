
start:
    li a0,0x53    # Cargar el valor 0x53 (caracter S) en el registro a0 (lfsr_seed)
    li a1,0x100   # Cargar el valor 0x100 en el registro a1 (mem_pos)
    sw a0,0(a1)   # Almacenar el valor de lfsr_seed en la memoria en la dirección mem_pos (a1)
    li a2,0x0     # Cargar el valor 0x0 en el registro a2 (counter = 0)
    li a3,0x64    # Cargar el valor 0x64 en el registro a3 (top_counter = 100)


loop:
    srli t0, a0, 0x0     # Desplazar a la derecha lfsr_seed >> 0 (pos 8)
    srli t1, a0, 0x2     # Desplazar a la derecha lfsr_seed >> 2 (pos 6)
    srli t2, a0, 0x3     # Desplazar a la derecha lfsr_seed >> 3 (pos 5)
    srli t3, a0, 0x4     # Desplazar a la derecha lfsr_seed >> 4 (pos 4)

    xor t4, t1, t0       # t4 <- t0 ^ t1 : bit 8 xor bit 6
    xor t5, t2, t4       # t5 <- t4 ^ t2 : (bit 8 xor bit 6) xor bit 5
    xor t6, t3, t5       # t6 <- t5 ^ t3 : ((bit 8 xor bit 6) xor bit 5) xor bit 4

    andi t0, t6, 0x1     # t0 <- t6 & 00000001 : solo el último bit (xor resultante)
    slli t1, t0, 0x7     # t1 <- t0 << 7 : poner en posición MSB (r_bit)

    srli t2, a0, 0x1     # Desplazar a la derecha lfsr_seed >> 1
    add a0, t2, t1       # a0 <- t2 + r_bit


check:
    addi a2, a2, 0x1     # Incrementar contador en 1
    addi a1, a1, 0x4     # Incrementar mem_pos en 4 bytes
    sw a0, 0(a1)         # Almacenar lfsr_seed en memoria en la dirección mem_pos (a1)

    blt a2, a3, loop     # ¿counter < top_counter? -> loop

    j end                # Terminar programa

end:
    nop                   # Fin