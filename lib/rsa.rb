require 'prime'
include Math

def rsa(input)
  c = input.to_i
  print "平文>>> #{c}\n"

  big_num = sqrt(c).to_i
  num = 1000 #適当

  p,q,n=0,0,0
  p = Prime.each.find{|e| e >= rand(big_num+1..big_num+num)}
  q = Prime.each.find{|e| e >= rand(big_num+1..big_num+num)}

  n = p*q
  l = (p-1).lcm(q-1)

  print "素数 p >>> #{p}\n"
  print "素数 q >>> #{q}\n"
  print "N >>> #{n}\n"
  print "L >>> #{l}\n"

  for e in 2..l do
    break if e.gcd(l)==1
  end

  print "公開鍵>>> E = #{e}, N = #{n}\n"

  for d in 2..l do
    break if (e*d)%l==1
  end

  print "秘密鍵>>> D = #{d}, N = #{n}\n"

  m = c**e % n
  re_c = m**d % n

  print "暗号化>>> #{m}\n"
  print "復号化>>> #{re_c}\n"
end

rsa(ARGV[0])


