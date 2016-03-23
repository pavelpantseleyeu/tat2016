import random
import string

def randomWord(wordLength):
    chars = string.letters + string.digits + string.punctuation
    return ''.join((random.choice(chars)) for x in range(int(wordLength)))