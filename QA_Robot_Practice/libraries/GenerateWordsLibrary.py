import random
import string

def get_random_string(word_length):
   return ''.join((random.choice(string.letters + string.digits)) for x in range(int(word_length)))