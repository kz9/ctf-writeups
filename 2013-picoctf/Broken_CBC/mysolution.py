#!/usr/bin/python

import socket

TCP_IP = 'vuln.picoctf.com'
TCP_PORT = 4567
BUFFER_SIZE = 1024
BLOCK_SIZE = 16
PLAIN_TEXT = "flag"
FAKE_BLOCK = "\x00" * BLOCK_SIZE
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((TCP_IP, TCP_PORT))

# We will first consider FAKE_BLOCK as an encrypted block, and try to decrypt it
# Using padding oracle decrpytion to find the intermediatary value
# Once we find this value, we can xor this value with the plaintext(properly padded)
# To get our desired initialization vector
# Hence now we know that FAKE_BLOCK using our desired initialization vector will decrpt to our give PLAINTEXT
# We just need to send desiredIV + FAKE_BLOCK and the oracle will decrypt the FAKE_BLOCK to the value we wanted

"""This method padds a string with PKCS#7 Padding"""
def padString(string):
  pad = BLOCK_SIZE - len(string) % BLOCK_SIZE 
  if(pad == 0):
    pad = BLOCK_SIZE
  string += chr(pad)*pad
  return string

"""This method returns a new list that is the xor l1 and l2"""
def xorList(l1, l2):
  l = []
  for i in range(0, len(l2)):
    l.append(chr(ord(l1[i]) ^ ord(l2[i])))
  return l

"""This method prints the hexstring representation for a given list"""
def listToHexString(l):
  return "".join(s.encode("hex") for s in l)

""" This method finds an intermidary block for a given cipher block using padding oracle attack"""
# Here's the implmentation for this method
# In step i (i starts from 0)
# 1. generate a valid padding chr(i)*i
# 2. interBlock in step i has i known values, xor them with the valid padding generated above
# and update the last i bytes in tryBlock with these values
# NOTE: This will assure us that the last several bytes is the valid padding character for step i
# 3. Brute force the last i + 1 byte, using padding oracle
# 4. If we find this byte, update interBlock with this byte ^ chr(i)
# 5. Repeat above steps until find all interblock value
# 6. Once we know the intermidary value, we just need to xor the previous cipher block to get the plaintext (Not in this method) 
def decrypt(block):
  interBlock = list("\x00" * BLOCK_SIZE)
  tryBlock = list("\x00" * BLOCK_SIZE)
  for i in range(0, BLOCK_SIZE):
    pad = list("\x00" * (BLOCK_SIZE - i) + chr(i + 1) * i)
    tryBlock = xorList(interBlock, pad)
    for c in range(0, 256):
      tryBlock[BLOCK_SIZE - i - 1] = chr(c)
      tryBlockString = ''.join(s for s in tryBlock)
      data = tryBlockString + block
      if(paddingOracle(data)):
        interBlock[BLOCK_SIZE - i - 1] = chr((i + 1) ^ c)
        break
    print ("intermediate block value in step {0} is {1}".format(i, listToHexString(interBlock)))
  return interBlock 

"""This method returns true if the paddingOracle returns true and return false if the paddingOracle return false"""
def paddingOracle(data):
  s.send(data+"\n")
  answer = s.recv(BUFFER_SIZE)
  if "Error" in answer:
    return False
  return True

#Buffer the first line
s.recv(BUFFER_SIZE)
inter = decrypt(FAKE_BLOCK)
plain = list(padString(PLAIN_TEXT))
IV = xorList(inter, plain)
data = "".join(s for s in IV) + FAKE_BLOCK+"\n"
print ("The data sent in hex is " + data.encode("hex"))
s.send(data)
answer = s.recv(BUFFER_SIZE)
print answer
s.close()
