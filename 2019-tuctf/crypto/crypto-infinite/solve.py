#!/usr/bin/env python3

from itertools import cycle
from string import ascii_uppercase
from socket import create_connection

HOST = 'chal.tuctf.com'
PORT = 30102

ALPHABET = bytes(ascii_uppercase, 'ascii')


def recvline(f):
    stuff = last = b''
    while last != b'\n':
        last = f.recv(1)
        stuff += last
    print(stuff.decode('ascii'), end='')
    return stuff

def recvlineuntil(f, start):
    line = recvline(f)
    while not line.startswith(start):
        line = recvline(f)
    return line

def sendline(f, data):
    print(data.decode('utf-8'), end='')
    f.send(data + b'\n')

def persistent_solve(conn, decrypt_func):
    while True:
        line = recvline(conn)
        if line.startswith(b'Decrypt '):
            ctxt = line.strip().lstrip(b'Decrypt ')
            sendline(conn, decrypt_func(ctxt))
        elif line.startswith(b'Congratulations!'):
            break
        else:
            continue

def solve_subcipher(conn):
    solve_repeated(conn, period=1)

def solve_repeated(conn, period=8):
    line = recvlineuntil(conn, b'Give me text:')
    ext_alph = bytearray()
    for c in ALPHABET:
        ext_alph += bytearray([c] * period)
    sendline(conn, ext_alph)
    line = recvline(conn)
    enc_alph = line.split(b'encrypted is')[-1].strip().split(b' ')
    codebooks = [ { cword: bytes([pword])
        for cword, pword in zip(enc_alph[i::period], ALPHABET) }
        for i in range(period) ]

    def decrypt(ctxt):
        return b''.join([ codebooks[i][code_c]
            for code_c, i in zip(ctxt.split(b' '), cycle(range(period))) ])

    persistent_solve(conn, decrypt)

def unshuffle(things, period=4):
    stuff = shuffle(list(range(len(things))), period)
    return [things[stuff.index(i)] for i in range(len(things))]

def shuffle(things, period=4):
    return [ thing for i in range(period) for thing in things[i::period] ]

def solve_shuffle(conn, period=4):
    line = recvlineuntil(conn, b'Give me text:')
    sendline(conn, ALPHABET)
    mix_alph = recvline(conn).split(b'encrypted is ')[-1].split()
    code_alph = { code: bytes([plain])
        for code, plain in zip(unshuffle(mix_alph, period=period), ALPHABET) }

    def decrypt(ctxt):
        return b''.join([ code_alph[codeword] for codeword in unshuffle(ctxt.split(), period=period) ])

    persistent_solve(conn, decrypt)

def main():
    with create_connection((HOST, PORT)) as conn:
        for i in range(5):
            solve_subcipher(conn)
        solve_repeated(conn)
        solve_shuffle(conn)
        solve_subcipher(conn)
        solve_repeated(conn, period=7)
        solve_shuffle(conn)

        for i in range(2):
            recvline(conn)


if __name__ == "__main__":
    main()
