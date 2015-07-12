from Crypto.Cipher import DES
from pwn import *
import itertools
import multiprocessing
CORE=39

def crunchnumber(key):
    key = "".join(i for i in key)
    for i in keys:
        trykey = key + i
        c = DES.new(trykey, DES.MODE_CBC, iv)
        cipher_verify = c.encrypt(plain)
        assert(len(cipher_verify) == len(cipher1))
        if (cipher_verify == cipher1):
            print trykey.encode("hex")
            with open("key.txt", "a") as f:
                f.write(trykey.encode("hex") + "\n")
            print "Found it!"
            return 1
    return 0

def process(datas):
    pool = multiprocessing.Pool(processes=CORE)
    result = pool.map(crunchnumber, itertools.product(datas, repeat = 7))

sub = [0,1,1,0,1,0,0,1,0,1,0,0,1,1,0,1]

def f(a):
    a = (a & 0x3c) | sub[(a>>2)&0xf] << 6
    a |= ((a >> 3) & 0x03)
    a |= ((a >> 4) ^ a) << 7
    a &= 0xff
    return a

plain = "\nWelcome! Wanna talk with John? Follow the instructions to get a Secure\xe2\x84\xa2 Channel.\n"
keys = []
for i in range(0,256):
    temp = chr(f(i))
    if temp not in keys:
        keys.append(temp)
assert(len(keys) == 16)
plain = plain + (8 - len(plain) % 8) * "\x00"
r = remote('doges.polictf.it', 80)
r.recvline()
r.recvline()
cipher1 = r.recvline().strip().strip('\x00')
cipher1 = cipher1.decode("hex")
iv = cipher1[:8]
cipher1 = cipher1[8:]
r.recvline()
r.recvline()
cipher2 = r.recvline().strip().strip('\x00')
cipher2 = cipher2.decode("hex")
r.close()
print keys
process(keys)
with open("key.txt", "rb") as f:
    realkey = f.readline().strip() 
assert(len(realkey) == 16)
realkey = realkey.decode("hex")
realkey = crunchnumber(realkey)
iv = cipher2[:8]
cipher2 = cipher2[8:]
c = DES.new(realkey, DES.MODE_CBC, iv)
m2 = c.decrypt(cipher2)
print m2
