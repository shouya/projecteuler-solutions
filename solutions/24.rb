
# This one-liner takes only few seconds to give the answer.
# I am feeling like cheating to solve the puzzles with ruby.

puts (0..9).to_a.permutation(10).to_a[999_999].join


# Algebraic Inspiration:
#
# Assume P^3_3
#  There're
#  0 1 2 -- 0
#  0 2 1 -- 1
#  1 0 2 -- 2
#  1 2 0 -- 3
#  2 0 1 -- 4
#  2 1 0 -- 5
#
# Look, if we assume the numbers represent the permutations' serial no as
# a sum, will you think of that it is closed to the binary form like:
#
# 0 0 0 -- 0
# 0 0 1 -- 1
# 0 1 0 -- 2
# 0 1 1 -- 3
# 1 0 0 -- 4
# 1 0 1 -- 5
# ...
#
# Where: 0 = 0 * 2^2 + 0 * 2^1 + 0 * 2^0
#    and 1 = 0 * 2^2 + 0 * 2^1 + 1 * 2^0
# The sum is also the serial number.
#
# According my intuition, I thought of this. Therefore I tried to transform
# this question into something like a binary operations.
#
# The point is, assume the final serial number as a sum of something.
# Let me make myself clearer.
# Let's move back to the permutation example of P^3_3:
# Observe the first column, there's 3 candidates, and then the second column,
# where has 2(3-1) candidates, for the last column, after chosed by the first
# and the second columns, you see there's only one value available, which is
# 3-1-1 exactly.
#
# You see the candidate is not fixed as binaries as it is decreasing.
# Intuition tells me in a permutation it is not possible to be so simply that
# the base could be a linear decreasing sequence. After verified further by
# listed some terms of P^4_4, I got that my intuition is correct.
#
# 0 1 2 3
# 0 1 3 2
# 0 2 1 3
# 0 2 3 1
# 0 3 1 2
# 0 3 2 1
# 1 0 2 3
# ...
#
# Where you see, the first column has 6 candidates, let's put these possible
# candidates' numbers together:
#    6, 3, 2, 1
# Wow, from 3! to 1!
#
# And this theory is easy to be proved true by algebraic methods, as I am just
# writing my first idea about solving this question, I won't write the proof
# for simplification.
#
# Let's move on. Plug the bases into the binary sum like stuff, we'll get
#
# 0 == 0 * 2! + 0 * 1! + 0 * 0!   (0 0 0)
# 1 == 0 * 2! + 1 * 1! + 0 * 0!   (0 1 0)
# 2 == 1 * 2! + 0 * 1! + 0 * 0!   (1 0 0)
# 3 == 1 * 2! + 1 * 1! + 0 * 0!   (1 1 0)
# 4 == 2 * 2! + 0 * 1! + 0 * 0!   (2 0 0)
# 5 == 2 * 2! + 1 * 1! + 0 * 0!   (2 1 0)
#
# (Note that higher degrees(*) takes higher precedence of
#  acquiring coefficients)
#
# Check the coefficient in the tail of the equations, can't you see what's it?
# Right, each term in the coefficient list can represent the
#            candidate_number - 1
# of each digit(*), and the result is, the serial number of each row
# representing the order of lexicographic permutation sequence.
#
# We can get the millionth term of 0..9(10 digits, P^10_10) easily.
#
# 999,999 ==
#    2 * 9! + 6 * 8! + 6 * 7! + 2 * 6! + 5 * 5!
#  + 1 * 4! + 2 * 3! + 1 * 2! + 1 * 1! + 0 * 0!
#       (2 6 6 2 5 1 2 1 1 0)
#
# Fortunately, we're approaching to the answer now.
# As we already defined the coeffient == candidate_no - 1(or candidate_no
# directly as candidate_no could be started from 0)
#
# So the first number in the 1,000,000th term is:
#    0 1 2 3 4 5 6 7 8 9     (result: 2xxxx xxxxx)
#        ^
#
# then pick the sixth(0-started) candidate from the rest no's:
#    0 1 2 3 4 5 6 7 8 9     (result: 27xxx xxxxx)
#        x         ^
# then the next(6):
#    0 1 2 3 4 5 6 7 8 9     (result: 278xx xxxxx)
#        x         x ^
# ...
# till the second last one(1), we'd choose the second candidate, it's 6:
#    0 1 2 3 4 5 6 7 8 9     (result: 27839 1546x)
#      x x x x x ^ x x x
#
# and then the last one(0) with no alternation,
#    0 1 2 3 4 5 6 7 8 9     (result: 27839 15460)
#    ^ x x x x x x x x x
#
# It's done now.
#
# And the result, 2783915460 is the final answer of this question.
#
#
# This question is the my favorite questions in projecteuler.net, as I have
# a very intuitive solution and proved it's right. And as a ruby programmer,
# I would like to enjoy writing one-liner to solve this too, which is fast
# enough, of course. I love it.
#
#
# [*] these usages of terms might be not very suitable.
#



