from pypadbuster import *
import socket
 
s = socket.create_connection(('vuln.picoctf.com',4567))
print "RECV: "+s.recv(1024)[:-1]
 
block_size = 16
 
def padding_oracle(iv, enc):
        data = iv+enc
        s.sendall(data+"\n")
        recv = s.recv(1024)
        if "Error" in recv:
            return False
        else:
            print 'RECV: '+recv
            print 'data was: '+data.encode('hex')
            return True
 
iv, ciphertext = generate_ciphertext(block_size, "flag", padding_oracle, partial_xor_key='')

print 'ciphertext: '+ciphertext.encode('hex')
