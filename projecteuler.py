# --*-- coding: gbk --*--

from alg import isprime
from alg import islcm
from alg import digits
from alg import factorial
from alg import ispalindromic
from alg import rotations
from alg import runtime
from alg import ispandigital
from alg import letterno
from alg import filecontent
#from alg import UNUSED
from alg import ncombinations
from alg import reversedNumber
from msilib.schema import ReserveCost
#from itertools import combinations



# answer is 232169
def problem1(): # corrected
    s = i = 0
    while i < 1000:
        if (i % 3 == 0) or (i % 5 == 0):
            s += i
            print(i, end = ', ')
            print("sum:", s)
        i += 1
"""
code start run at: 0.000001s
4613732
code finish run at: 0.000087s
escaped: 0.000086s
"""
def problem2(): # undone
    _s = 0
    a, b = 1, 2
    while a < 4 * 1000 * 1000:
        if a % 2 == 0:
            _s += a
        a, b = b, a+b
    print(_s)

# answer is 6857
def problem3(): # correct
    n = 600851475143
    for i in range(int(n**0.5), 2, -1):
        if (n % i == 0) and (isprime(i)):
            print("that's {0}.".format(i))
            break

# answer is 906609
def problem4(): # correct
    n = 3
    l = []
    for i in range(10**n - 1, 1, -1):
        for j in range(10**n - 1, 1, -1):
            if (problem4_1(i*j)):
                l.append(i*j)
                #print("that's {0}x{1}={2}.".format(i, j, i*j))
    l.sort()
    print("the max n is {0}.".format(l[-1]))
    
def problem4_1(num):
    ''' is palindromic number '''
    strn = str(num)
    for i in range(0, len(strn)):
        if strn[i] != strn[-i-1]:
            return False
    return True


# answer is 232792560
def problem5(): # Too Slow, but correct!
    # isprime = lambda x: 0 not in [x%i for i in range(2, int(x**0.5)+1)]
    s = 1
    for i in range(1, 20+1):
        print(i, s)
        s = islcm(s, i)
    print("that's {0}.".format(s))


# answer is 25164150
def problem6(): # correct
    su = sq = 0
    for i in range(0, 100 + 1):
        sq += i**2
        su += i
    print("the difference is {0}.".format(su**2 - sq))   

# answer is 104743
def problem7(): # a bit slow, but correct
    count = 2
    i = 3
    while count != 10001:
        i += 2
        if isprime(i):
            count += 1
    print("count: {0}, i:{1}.".format(count, i))
    
""" correct!
code start run at: 0.000001s
40824
code finish run at: 0.003648s
escaped: 0.003648s
"""
def problem8(): # why it is wrong?
    def havezero(_str):
        for i in _str:
            if i == '0':
                return True
        return False
    def enoughbig(_str, i):
        if i == 0:
            return True
        if int(_str[i - 1]) < int(_str[i + 4]):
            return True
        return False
    strs=\
    "73167176531330624919225119674426574742355349194934"\
    "96983520312774506326239578318016984801869478851843"\
    "85861560789112949495459501737958331952853208805511"\
    "12540698747158523863050715693290963295227443043557"\
    "66896648950445244523161731856403098711121722383113"\
    "62229893423380308135336276614282806444486645238749"\
    "30358907296290491560440772390713810515859307960866"\
    "70172427121883998797908792274921901699720888093776"\
    "65727333001053367881220235421809751254540594752243"\
    "52584907711670556013604839586446706324415722155397"\
    "53697817977846174064955149290862569321978468622482"\
    "83972241375657056057490261407972968652414535100474"\
    "82166370484403199890008895243450658541227588666881"\
    "16427171479924442928230863465674813919123162824586"\
    "17866458359124566529476545682848912883142607690042"\
    "24219022671055626321111109370544217506941658960408"\
    "07198403850962455444362981230987879927244284909188"\
    "84580156166097919133875499200524063689912560717606"\
    "05886116467109405077541002256983155200055935729725"\
    "71636269561882670428252483600823257530420752963450"
    _max = 0
    for i in range(0, len(strs) - 4):
        if havezero(strs[i:i + 5]):
            continue
        if not enoughbig(strs, i):
            continue
        _n = int(strs[i])\
                * int(strs[i + 1])\
                * int(strs[i + 2])\
                * int(strs[i + 3])\
                * int(strs[i + 4])
        if _n > _max:
            _max = _n
    print(_max)
    
# answer is 31875000
def problem9(): # correct
    lst = []
    for i in range(1, 1000):
        for j in range(1, 1000):
            if ((i**2 + j**2)**0.5).is_integer():
                lst.append((i, j, int((i**2 + j**2)**0.5)))
    for i in lst:
        if (i[0] + i[1] + i[2] == 1000):
            print("that's me: {0}+{1}+{2}, products {3}!".format(
                i[0], i[1], i[2], i[0]*i[1]*i[2]))

""" correct! 26.7s!
code start run at: 0.000001s
142913828922
code finish run at: 26.691815s
escaped: 26.691815s
"""
def problem10():
    _sum = 2
    for i in range(3, 2 * 1000 * 1000, 2):
        if isprime(i):
            _sum += i
        #    print(i)
    print(_sum)

# answer is 70600674
def problem11():    # correct!
    lst = [[8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8],
[49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 4, 56, 62, 0],
[81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 3, 49, 13, 36, 65],
[52, 70, 95, 23, 4, 60, 11, 42, 69, 24, 68, 56, 1, 32, 56, 71, 37, 2, 36, 91],
[22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
[24, 47, 32, 60, 99, 3, 45, 2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
[32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
[67, 26, 20, 68, 2, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21],
[24, 55, 58, 5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
[21, 36, 23, 9, 75, 0, 76, 44, 20, 45, 35, 14, 0, 61, 33, 97, 34, 31, 33, 95],
[78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 3, 80, 4, 62, 16, 14, 9, 53, 56, 92],
[16, 39, 5, 42, 96, 35, 31, 47, 55, 58, 88, 24, 0, 17, 54, 24, 36, 29, 85, 57],
[86, 56, 0, 48, 35, 71, 89, 7, 5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
[19, 80, 81, 68, 5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 4, 89, 55, 40],
[4, 52, 8, 83, 97, 35, 99, 16, 7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
[88, 36, 68, 87, 57, 62, 20, 72, 3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
[4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36],
[20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 4, 36, 16],
[20, 73, 35, 29, 78, 31, 90, 1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 5, 54],
[1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 1, 89, 19, 67, 48]]
    prod = 1
    prolst = []
    for i in range(20):
        for j in range(20):
            prod = 1
            for k in range(4):
                try:
                    prod *= lst[i+k][j]
                except:
                    break
            prolst.append(prod)
    for i in range(20):
        for j in range(20):
            prod = 1
            for k in range(4):
                try:
                    prod *= lst[i][j+k]
                except:
                    break
            prolst.append(prod)
    for i in range(20):
        for j in range(20):
            prod = 1
            for k in range(4):
                try:
                    prod *= lst[i+k][j+k]
                except:
                    break
            prolst.append(prod)            
    for i in range(20):
        for j in range(20):
            prod = 1
            for k in range(4):
                try:
                    prod *= lst[i-k][j+k]
                except:
                    break
            prolst.append(prod)
    prolst.sort()
    print(prolst[-1])

""" correct
code start run at: 0.000001s
no:12375, num:76576500, count:576
code finish run at: 4.420957s
escaped: 4.420957s
"""
def problem12(): # that's too slow too.
    def divisorcount(_n):
        _count = 1
        __n = _n
        _slist = []
        _nlist = []
        while __n != 1:
            for i in range(2, __n + 1):
                if __n % i == 0:
                    __n = __n // i
                    if (i in _slist):
                        _nlist[_slist.index(i)] += 1
                    else:
                        _slist.append(i)
                        _nlist.append(1)
                    break
        for i in _nlist:
            _count *= i + 1
        return _count
    _i = 1
    _trg = _i * (_i + 1) // 2
    _count = 0
    while _count < 500:
        _i += 1
        _trg = _i * (_i + 1) // 2
        _count = divisorcount(_trg)
    print("no:{0}, num:{1}, count:{2}".format(_i, _trg, _count))
        
#    print([divisorcount(i) for i in [1,3,6,10,15,21,28]])   
#    print(_i * (_i + 1) // 2)

# answer is 5537376230
def problem13():    # correct!
    lst = [
37107287533902102798797998220837590246510135740250,
46376937677490009712648124896970078050417018260538,
74324986199524741059474233309513058123726617309629,
91942213363574161572522430563301811072406154908250,
23067588207539346171171980310421047513778063246676,
89261670696623633820136378418383684178734361726757,
28112879812849979408065481931592621691275889832738,
44274228917432520321923589422876796487670272189318,
47451445736001306439091167216856844588711603153276,
70386486105843025439939619828917593665686757934951,
62176457141856560629502157223196586755079324193331,
64906352462741904929101432445813822663347944758178,
92575867718337217661963751590579239728245598838407,
58203565325359399008402633568948830189458628227828,
80181199384826282014278194139940567587151170094390,
35398664372827112653829987240784473053190104293586,
86515506006295864861532075273371959191420517255829,
71693888707715466499115593487603532921714970056938,
54370070576826684624621495650076471787294438377604,
53282654108756828443191190634694037855217779295145,
36123272525000296071075082563815656710885258350721,
45876576172410976447339110607218265236877223636045,
17423706905851860660448207621209813287860733969412,
81142660418086830619328460811191061556940512689692,
51934325451728388641918047049293215058642563049483,
62467221648435076201727918039944693004732956340691,
15732444386908125794514089057706229429197107928209,
55037687525678773091862540744969844508330393682126,
18336384825330154686196124348767681297534375946515,
80386287592878490201521685554828717201219257766954,
78182833757993103614740356856449095527097864797581,
16726320100436897842553539920931837441497806860984,
48403098129077791799088218795327364475675590848030,
87086987551392711854517078544161852424320693150332,
59959406895756536782107074926966537676326235447210,
69793950679652694742597709739166693763042633987085,
41052684708299085211399427365734116182760315001271,
65378607361501080857009149939512557028198746004375,
35829035317434717326932123578154982629742552737307,
94953759765105305946966067683156574377167401875275,
88902802571733229619176668713819931811048770190271,
25267680276078003013678680992525463401061632866526,
36270218540497705585629946580636237993140746255962,
24074486908231174977792365466257246923322810917141,
91430288197103288597806669760892938638285025333403,
34413065578016127815921815005561868836468420090470,
23053081172816430487623791969842487255036638784583,
11487696932154902810424020138335124462181441773470,
63783299490636259666498587618221225225512486764533,
67720186971698544312419572409913959008952310058822,
95548255300263520781532296796249481641953868218774,
76085327132285723110424803456124867697064507995236,
37774242535411291684276865538926205024910326572967,
23701913275725675285653248258265463092207058596522,
29798860272258331913126375147341994889534765745501,
18495701454879288984856827726077713721403798879715,
38298203783031473527721580348144513491373226651381,
34829543829199918180278916522431027392251122869539,
40957953066405232632538044100059654939159879593635,
29746152185502371307642255121183693803580388584903,
41698116222072977186158236678424689157993532961922,
62467957194401269043877107275048102390895523597457,
23189706772547915061505504953922979530901129967519,
86188088225875314529584099251203829009407770775672,
11306739708304724483816533873502340845647058077308,
82959174767140363198008187129011875491310547126581,
97623331044818386269515456334926366572897563400500,
42846280183517070527831839425882145521227251250327,
55121603546981200581762165212827652751691296897789,
32238195734329339946437501907836945765883352399886,
75506164965184775180738168837861091527357929701337,
62177842752192623401942399639168044983993173312731,
32924185707147349566916674687634660915035914677504,
99518671430235219628894890102423325116913619626622,
73267460800591547471830798392868535206946944540724,
76841822524674417161514036427982273348055556214818,
97142617910342598647204516893989422179826088076852,
87783646182799346313767754307809363333018982642090,
10848802521674670883215120185883543223812876952786,
71329612474782464538636993009049310363619763878039,
62184073572399794223406235393808339651327408011116,
66627891981488087797941876876144230030984490851411,
60661826293682836764744779239180335110989069790714,
85786944089552990653640447425576083659976645795096,
66024396409905389607120198219976047599490197230297,
64913982680032973156037120041377903785566085089252,
16730939319872750275468906903707539413042652315011,
94809377245048795150954100921645863754710598436791,
78639167021187492431995700641917969777599028300699,
15368713711936614952811305876380278410754449733078,
40789923115535562561142322423255033685442488917353,
44889911501440648020369068063960672322193204149535,
41503128880339536053299340368006977710650566631954,
81234880673210146739058568557934581403627822703280,
82616570773948327592232845941706525094512325230608,
22918802058777319719839450180888072429661980811197,
77158542502016545090413245809786882778948721859617,
72107838435069186155435662884062257473692284509516,
20849603980134001723930671666823555245252804609722,
53503534226472524250874054075591789781264330331690]
    s = 0
    for i in lst:
        s += i
    print(str(s)[:10])

""" correct! but a few slow
code start run at: 0.000001s
that's (837799, 524).
code finish run at: 45.270891s
escaped: 45.270890s
"""
def problem14():    # the algorithm is too complex
    i = 0
    rst = 0
    l = (0, 0)
    while i < 1000*1000:
        i += 1
        rst = problem14_1(i)
        if (rst > l[1]):
            l = (i, rst)
        #print(i, rst)
    print("that's {0}.".format(l))


def problem14_1(n):
    '''返回循环数量'''
    i = n
    count = 0
    while i != 1:
        if i % 2 == 0:
            i //= 2
        else:
            i = 3 * i + 1
        count += 1
    return count

# the answer is 1366
def problem16():    # corrected!
    n = 2 ** 1000
    s = 0
    for i in str(n):
        s += int(i)
    print(s)

# correct: 648
def problem20():    # corrected!
    fact = 1
    n = 100
    s = 0
    for i in range(1, n + 1):
        fact *= i
    fact = str(fact)
    for i in fact:
        s += int(i)
            
    print("sum of digit of {0}! is {1}.".format(n, s))

# result is 31626
def problem21():    # a bit slow but correct! 
    n = 0
    lst = set()
    for i in range(1, 10*1000):
        n = problem21_1(i)
        if (i != n) and (i == problem21_1(n)):
            tp = ()
            if i < n:
                tp = (i, n)
            else:
                tp = (n, i) 
            lst.add(tp)
    s = 0
    for i in lst:
        s += i[0] + i[1]
    print(s)
    
def problem21_1(n):
    ''' d(n) '''
    s = 0
    for i in range(1, n):
        if (n % i == 0):
            s += i
    return s

# answer is 871198282
def problem22():    # correct!
    file = open("names.txt")
    namelst = []
    scorelst = []
    total = 0
    p = file.read().split(',')
    for i in p:
        namelst.append(eval(i))
    for i in namelst:
        s = 0
        for j in i:
            s += ord(j) - ord('A') + 1
        scorelst.append((i, s))
    scorelst.sort(key = lambda x: x[0])
    ni = 0
    for i in scorelst:
        ni += 1
        total += ni*i[1]        
    print(total)

# failed...
def problem24():
    n = 4
    lst = [[str(i) for i in range(n)]]
    refact = 1
    pos = 0
    def swap(s, l, max):
        _s = s[:]
        if l != max - 1:
            _s[l], _s[l + 1] = _s[l + 1], _s[l]
        else:
            _s[0], _s[-1] = _s[-1], _s[0]
        return _s
    for i in range(1, n + 1):
        refact *= i
    for i in range(refact - 1):
        if (pos != n):
            lst.append(swap(lst[i], pos, n))
        else:
            pos = 0
            lst.append(swap(lst[i], pos, n))
        pos += 1
    lst.sort()
    print(lst);
    
# uncertain 4783
def problem25():
    a = b = 1
    n = 2
    while (digits(a) < 1000) or (digits(b) < 1000):
        a, b = b, a + b
        n += 1
    print(a, b, n)  # 4783
    pass

    
##!!!!!!!!!!answer 9183
def problem29():
    _set = set()
    for i in range(2, 100 + 1):
        for j in range(2, 100 + 1):
            _set.add(i ** j)
    print(len(_set))
    

# the answer is 443839
def problem30():    # correct but the way is stupid
    n = 5
    lst = []
    def avalid(x, _n):
        _sum = 0
        for i in str(x):
            _sum += int(i) ** _n
        return _sum == x
    # i just used a very stupid way, 
    # that i dk how can i calc. an unkown-length number
    for i in range(2, 20 ** n):
        if avalid(i, n):
            lst.append(i)
    print(lst)

# the answer is 40730
def problem34():    # correct
    def iscurious(n):
        s = 0
        for i in str(n):
            s += factorial(int(i))
        return s == n
    _sum = 0
    # just a stupid way too
    for i in range(3, 1000 * 1000):
        if iscurious(i):
            _sum += i      

""" correct! it it slow.
code start run at:s 0.000004
55
code finish run at: 69.520704
escaped: 69.520700
"""
def problem35():
    _n = 1000 * 1000
    _count = 0
    for i in range(_n):
        is_rotations_prime = True
        for j in rotations(i):
            if not isprime(j):
                is_rotations_prime = False
                break;
        if (is_rotations_prime == True):
            _count += 1
    print(_count)

# correct 872187
def problem36():
    _sum = 0
    for i in range(1000 * 1000):
        if ispalindromic(str(i)) and ispalindromic(bin(i)):
            _sum += i
    print(_sum)

# correct 748317
def problem37():
    def trucate(n):
        if not isprime(n):
            return False
        _strn = str(n)
        for i in range(len(_strn) - 1):
            if not(isprime(int(_strn[0:-1 - i])) and isprime(int(_strn[i + 1:]))):
                return False
        return True
    _count = 0
    _i = 11
    _lst = []
    _sum = 0
    while _count != 11:
        _i += 2
        if trucate(_i):
            _count += 1
            _sum += _i
            _lst.append(_i)
            print(_i)
    print(_lst)
    print("answer is", _sum)

""" correct!
code start run at: 0.000003s
210
code finish run at: 32.917377s
escaped: 32.917374s
"""
def problem40():
    _n = (1, 10, 100, 1000, 10000, 100000, 1000000)
    _str = ""
    for i in range(1, _n[-1] + 1):
        _str += str(i)
    _prod = 1
    for i in _n:
        _prod *= int(_str[i - 1])
    print(_prod)

""" correct
code start run at: 0.000001s
PRIME: 7652413
code finish run at: 0.010431s
escaped: 0.010431s
"""
def problem41():
    _prm = [i for i in range(3, 50, 2) if isprime(i)]
    _flg = False
    for i in range(7654321, 1234567, -2):
        if not ispandigital(i, 8):
            continue
        if (isprime(i)):
            print("PRIME:", i)
            break;
""" correct!
code start run at: 0.000001s
162
code finish run at: 0.012442s
escaped: 0.012441s
"""
def problem42():
    def wordcount(_word):
        _s = 0
        for i in _word:
            _s += letterno(i)
        return _s
    _trg = [i * (i + 1) // 2 for i in range(1, 100)]
    _count = 0
    _rawlst = filecontent('words.txt').split(',')
    _wordlist = [i[1:-1] for i in _rawlst]
    
    for i in _wordlist:
        if wordcount(i) in _trg:
            _count += 1
    print(_count)

# correct: 9110846700
def problem48():
    s = 0
    for i in range(1, 1000):
        s += i**i
    print("that's {0}.".format(str(s)[-10:]))

""" correct
code start run at: 0.000001s
142857
code finish run at: 0.085678s
escaped: 0.085677s
"""
def problem52():
    def samedigit(num1, num2):
        _s = []
        if len(str(num1)) != len(str(num2)):
            return False
        for i in str(num1):
            _s.append(i)
        for i in str(num2):
            if i in _s:
                _s.remove(i)
            else:
                return False
        return True
    _i = 123456
    while True:
        _i += 1
        if samedigit(_i, _i*2)\
         and samedigit(_i, _i*3)\
         and samedigit(_i, _i*4)\
         and samedigit(_i, _i*5)\
         and samedigit(_i, _i*6):
            print(_i)
            break
        
def problem53():    # too slow
    _len = 0
    _count = 0
    for i in range(1, 100 + 1):
        for j in range(1, i):
            _len = ncombinations(range(i), j)
            if _len >= 1000*1000:
                print(i, j, _len)
                _count += 1
    print("Result:", _count)
    
"""
code start run at: 0.000001s
249
code finish run at: 0.330445s
escaped: 0.330444s
"""
def problem55():
    def isLycherl(n):
        _t = 50     # loop 50 times
        _cur = n + reversedNumber(n)
        while not ispalindromic(str(_cur)):
            _cur = _cur + reversedNumber(_cur)
            _t -= 1
            if _t < 0:
                return True
        return False
    _count = 0
    for i in range(0, 10 * 1000 + 1):
        if isLycherl(i):
            _count += 1
    print(_count)
        
    
if __name__ == "__main__":
    runtime(problem12)
