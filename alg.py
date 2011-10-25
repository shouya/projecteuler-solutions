'''
Created on 2011-1-16

@author: CMlr
'''

import time

# constants


# macro
def UNUSED(i):
    pass

# functions
def isprime(n):
    if n == 1 or n == 0:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def ispalindromic(n):
    _n = ''
    if len(n) > 2 and n[0:2] == '0b':
        _n = n[2:]
    else:
        _n = n[:]
    for i in range(len(_n) // 2):
        if _n[i] != _n[-1 - i]:
            return False
    return True

def isgcd(a, b):
    ''' gcd '''
    for i in range(a, 1, -1):
        if (a % i == 0) and (b % i == 0):
            return i
    return 1

def ispandigital(_n, _m):
    _s = set()
    if len(str(_n)) != _m - 1:
        return False;
    for i in str(_n):
        if i in _s:
            return False
        else:
            _s.add(int(i))
    for i in range(1, _m):
        if i not in _s:
            return False
    return True

def islcm(a, b):
    ''' lcm '''
    gcd = isgcd(a, b)
    return int(a * b / gcd)

def factorial(n):
    refact = 1
    for i in range(1, n + 1):
        refact *= i
    return refact

def digits(n):
    return len(str(n))

def reversedNumber(n):
    return int(''.join([i for i in reversed(list(str(n)))]))

def string2charlist(_str):
    return [i for i in _str]

def charlist2string(_lst):
    return ''.join(_lst)

def rotations(n):
    lst = [n]
    _s = string2charlist(str(n))
    _tmp = 0
    for i in range(len(_s) - 1):
        UNUSED(i)
        _tmp = _s[0]
        for j in range(len(_s) - 1):
            _s[j] = _s[j + 1]
        _s[-1] = _tmp
        lst.append(int(charlist2string(_s)))   
    return lst

def product(*args, repeat=1):
    # product('ABCD', 'xy') --> Ax Ay Bx By Cx Cy Dx Dy
    # product(range(2), repeat=3) --> 000 001 010 011 100 101 110 111
    pools = [tuple(pool) for pool in args] * repeat
    result = [[]]
    for pool in pools:
        result = [x+[y] for x in result for y in pool]
    for prod in result:
        yield tuple(prod)


def permutations(iterable, r=None):
    pool = tuple(iterable)
    n = len(pool)
    r = n if r is None else r
    for indices in product(range(n), repeat=r):
        if len(set(indices)) == r:
            yield (pool[i] for i in indices)
    
def ncombinations(iterable, r):
    pool = tuple(iterable)
    _n = 0
    n = len(pool)
    if r > n:
        return
    indices = list(range(r))
    _n = 1
    while True:
        for i in reversed(range(r)):
            if indices[i] != i + n - r:
                break
        else:
            return _n
        indices[i] += 1
        for j in range(i+1, r):
            indices[j] = indices[j-1] + 1
            _n += 1
    return _n


def letterno(_char):
    return ord(_char) - ord('A') + 1

def filecontent(filename):
    return open(filename).read()
    

# test code
def runtime(func):
    t = time.clock()
    print("code start run at:", "%.6fs" % (t))
    func()
    new_t = time.clock()
    print("code finish run at:", "%.6fs" % (new_t))
    print("escaped:", "%.6fs" % (new_t - t))
    