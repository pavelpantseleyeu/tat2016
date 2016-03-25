import random
import string


def get_random_string(wordLength=3):
    chars = string.letters + string.digits
    return ''.join((random.choice(chars)) for x in range(wordLength))