import socket
from fractions import gcd
import math
import sys

TCP_IP = 'vuln.picoctf.com'
TCP_PORT = 6666
LENGTH = 999
E = 3

"""
@param s socket object
@param txt text to wait for

This function receives data from socket s until the string txt 
"""
def waitfor(s,txt):
  res = ''
  while True:
    tmp = s.recv(1)
    if not tmp: break
    #if tmp == '\n': print "RECV: %r" % (res.split('\n')[-1])
    res += tmp
    if res.endswith(txt): break
  return res

"""
@param s socket object
@param txt text to wait for

This function receives data from socket s until the string txt 
"""
def encrypt(s, string):
  waitfor(s, "Now enter a message you wish to encrypt:")
  m = int(string.encode("hex"), 16)
  s.send(string)
  header = waitfor(s, "==================================\n")
  c = waitfor(s, "==================================\n").split('\n')[0][:-1]
  c = int(c, 16)
  return (m, c)

"""
This function dumps the flag and corresponding n into variable d and a file called dump.txt for future reference
"""
def dump_flag():
  f = open("dump.txt", "w")
  while(len(d) < E):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((TCP_IP, TCP_PORT))
    header = waitfor(s, "==================================\n")
    eflag = waitfor(s, "==================================\n").split('\n')[0][:-1]
    eflag = int(eflag, 16)
    
    # compute three sets of plain text and encrypted text
    m1, c1 = encrypt(s, "a" * LENGTH)
    m2, c2 = encrypt(s, "b" * LENGTH)
    m3, c3 = encrypt(s, "c" * LENGTH)

    # This method of computing n is not garanteed to work, it will work most of the time, 
    # however, it will give an incorrect n if m1**3-c1 and m2**3-c2 and m3**3-c3 all 
    # contains a factor of multiple of n
    n = gcd(m1**3 - c1, m2**3 - c2)
    g = gcd(n, m3**3 - c3)

    if(n == 0):
      print("Your message is too short, increase the length")
      f.close()
      s.close()
      sys.exit()
    elif(n != g):
      continue
    else:
      print("n{0} and flag{0} is stored in dictionary dict".format(len(d) + 1))
      f.write("N{0}: {1}\n".format((len(d)+1), n))
      f.write("FLAG{0}: {1}\n".format((len(d)+1), eflag))
      f.write("\n")
      d[n] = eflag
    s.close()
  f.close()

"""
Extended Euclidean Algorithm
"""
def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b / a) * y, y)

"""
Modular inverse of a mod m
"""
def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m

"""
Compute the product of all items in list l
"""
def compute_product(l):
  result = reduce(lambda x, y: x*y, l)
  return result

"""
Chinese remainder theorem on list a and n
@param a: a list containing all remainders
@param n: a list containing all modulos
"""
def crt(a, n):
  # We do not want to deal with the situation where modulos are not coprime with each other, if this happens, we
  # will rerun the algorithm
  for i in range(0, len(a)):
    for j in range(i + 1, len(a)):
      g = gcd(n[i], n[j])
      if(g != 1):
        print("Bad luck, n are not coprime with each other, run it again.")
        return 0
  product = compute_product(n)
  result = 0
  # Chinese Remainder Theorem
  for i in range(len(n)):
    modulo = n[i]
    remainder = a[i]
    temp = product / modulo
    inv = modinv(temp, modulo)
    result += temp * remainder * inv
  result = result % product
  return result
    
"""
Finds the integer component of the n'th root of x,
an integer such that y ** n <= x < (y + 1) ** n
using binary search
"""
def find_invpow(x,n):

    high = 1
    while high ** n < x:
        high *= 2
    low = high/2
    while low < high:
        mid = (low + high) // 2
        if low < mid and mid**n < x:
            low = mid
        elif high > mid and mid**n > x:
            high = mid
        else:
            return mid
    return mid + 1


if __name__ == '__main__':
  s = ''
  # find the key, if failed, try again
  while("key" not in s):
    d = {}
    # find the flag and the corresponding n for E times
    dump_flag()
    # use chinese remainder theorem and Hastad's Broadcast Attack
    result = crt(d.values(), d.keys())
    s = find_invpow(result, 3)
    # decode s into string
    s = hex(s)[2:-1].decode("hex")
    if("key" in s):
      break;
    else:
      print("Something is not right, we are retrying")
  print s
