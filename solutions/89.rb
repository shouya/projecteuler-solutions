#

# Arabic <--> Roman numeral conversion's from Ruby Quiz #22
# Jason Bailey's solution:
#   http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/133041
@data = [
         ["M"  ,1000],
         ["CM" , 900],
         ["D"  , 500],
         ["CD" , 400],
         ["C"  , 100],
         ["XC" ,  90],
         ["L"  ,  50],
         ["XL" ,  40],
         ["X"  ,  10],
         ["IX" ,   9],
         ["V"  ,   5],
         ["IV" ,   4],
         ["I"  ,   1]
        ]

def toRoman(num)
  reply = ''
  for key, value in @data
    count, num = num.divmod(value)
    reply << (key * count)
  end
  reply
end

def toArabic(rom)
  reply = 0
  for key, value in @data
    while rom.index(key) == 0
      reply += value
      rom.slice!(key)
    end
  end
  reply
end

require 'open-uri'

text = open('https://projecteuler.net/project/roman.txt').read

total_saved = 0
text.each_line do |ln|
  ln.chomp!
  len = ln.length
  total_saved += len - toRoman(toArabic(ln)).length
end
puts total_saved
