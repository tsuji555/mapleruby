require 'mapleruby'

Mapleruby.new('1+1').exec

class My_Maple
  def nextprime(a)
    p a = a.to_i
    Mapleruby.new("nextprime(#{a})").exec
  end
  def isprime(a)
    p a = a.to_i
    Mapleruby.new("isprime(#{a})").exec
  end
end

a = 1.0e10
My_Maple.new.nextprime(a)
[13,17,23,27].each{|a|
p  My_Maple.new.isprime(a)
}
