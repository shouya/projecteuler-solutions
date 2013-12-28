
(0..9).to_a.permutation.reject{|x| x.first.zero? }
  .select{|x|x[3]%2==0}                     # 2
  .select{|x|x[5]%5==0}                     # 5
  .select{|x|(x[2]+x[3]+x[4])%3==0}         # 3
  .select{|x|(x[4]*100+x[5]*10+x[6])%7==0}  # 7
  .select{|x|(x[5]*100+x[6]*10+x[7])%11==0} # 11
  .select{|x|(x[6]*100+x[7]*10+x[8])%13==0} # 13
  .select{|x|(x[7]*100+x[8]*10+x[9])%17==0} # 17
  .map{|x|x*''}.map(&:to_i)
