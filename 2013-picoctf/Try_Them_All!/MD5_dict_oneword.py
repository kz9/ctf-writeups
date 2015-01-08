__author__ = 'h0twinter'
import hashlib

dict_file = "/usr/share/dict/words"
value = "e403394e95009842a555119622681556"
salt = "8093"
word_list = open(dict_file, 'r')
for line in word_list:
  m = hashlib.md5(line.strip()+salt)
  if(m.hexdigest() == value):
    print line


