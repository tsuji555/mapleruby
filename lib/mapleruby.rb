require "mapleruby/version"
require 'systemu'
require 'yaml'

class RMaple
  def nextprime(a)
    p a = a.to_i
    Mapleruby.new("nextprime(#{a})").exec
  end
  def lcm(a,b)
    p a = a.to_i
    p b = b.to_i
    Mapleruby.new('lcm(#{a},#{b})').exec
  end
end

class Mapleruby
  DATA_FILE=File.join(ENV['HOME'],'.mapleruby_rc')
  # Your code goes here...
  def initialize(maple_code)
    @maple_code = maple_code
    @src = get_env
    @maple_path=@src[:MAPLE_PATH]
  end
  def exec
    code0=<<EOS
interface(quiet=true);
writeto("./result.txt");
#{@maple_code};
writeto(terminal);
interface(quiet=false);
EOS
    File.write('tmp.mw',code0)
    command="#{@maple_path} tmp.mw"
    status,stdout,stderr=systemu command
    status,stdout,stderr=systemu 'cat result.txt'
    p result=stdout.to_i
    return result
  end

  def get_env
    begin 
      file = File.open(DATA_FILE,'r')
    rescue => evar
      p evar
      print "no resource file for mapleruby.\n"
    end
    @src = YAML.load(file.read)
    file.close
    p @src
  end

end





