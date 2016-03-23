import random
import string

MIN_NUMBER_OF_LETTER = 3

def get_random_string(word_length):
    if word_length:
        random_string_length = int(word_length)
    else: random_string_length = MIN_NUMBER_OF_LETTER
    if random_string_length < MIN_NUMBER_OF_LETTER:
        random_string_length = MIN_NUMBER_OF_LETTER
    chars = string.letters + string.digits + string.punctuation
    return ''.join((random.choice(chars)) for x in range(random_string_length))