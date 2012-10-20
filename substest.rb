ENDINGS = {
"a" => {"m" => [nil, "ae", "ae", "am", "a", "a", "ae", "arum", "is", "as", "ae", "is"],
        "f" => [nil, "ae", "ae", "am", "a", "a", "ae", "arum", "is", "as", "ae", "is"]},# extra schreiben nötig hier?
"o" => {"m" => [nil, "i", "o", "um", "e", "o", "i", "orum", "is", "os", "i", "is"],
        "f" => [nil, "i", "o", "um", "e", "o", "i", "orum", "is", "os", "i", "is"],
        "n" => [nil, "i", "o", nil, nil, "o", "a", "orum", "is", "a", "a", "is"]}, #Virus??
"e" => {"m" => [nil, "ei", "ei", "em", nil, "e", "es", "erum", "ebus", "es", "es", "ebus"],
        "f" => [nil, "ei", "ei", "em", nil, "e", "es", "erum", "ebus", "es", "es", "ebus"]},
"u" => {"m" => [nil, "us", "ui", "um", nil, "u", "us", "uum", "ibus", "us", "us", "ibus"],
        "f" => [nil, "us", "ui", "um", nil, "u", "us", "uum", "ibus", "us", "us", "ibus"],
        "n" => [nil, "us", "u", "u", "u", "u", "ua", "uum", "ibus", "ua", "ua", "ibus"]},
"k" => {"m" => [nil, "is", "i", "em", nil, "e", "es", "um", "ibus", "es", "es", "ibus"],
        "f" => [nil, "is", "i", "em", nil, "e", "es", "um", "ibus", "es", "es", "ibus"],
        "n" => [nil, "is", "i", nil, nil, "e", "a", "um", "ibus", "a", "a", "ibus"]},
"i" => {"f" => [nil, "is", "i", "im", nil, "i", "es", "ium", "ibus", "es", "es", "ibus"],
        "n" => [nil, "is", "i", nil, nil, "i", "ia", "ium", "ibus", "ia", "ia", "ibus"]},
"m" => {"m" => [nil, "is", "i", "em", nil, "e", "es", "ium", "ibus", "es", "es", "ibus"],
        "f" => [nil, "is", "i", "em", nil, "e", "es", "ium", "ibus", "es", "es", "ibus"]}
}
#flat = ENDINGS.flatten
#unique_endings = flat.map {|x| x.flatten if x.class == Hash}.flatten.compact.uniq.delete_if {|x| x =~ /\A[mfn]\b/}.sort {|a,b| b.length <=> a.length}
SIMPLE_ENDINGS = ["ibus", "ebus", "erum", "arum", "orum", "ium", "uum", "ei", "um", "ua", "is", "os", "im", "as", "es", "ia", "am", "us", "ui", "ae", "em", "u", "e", "o", "i", "a"]


class Substantiv
  attr_reader :input

  def initialize (input)
    @input = input
    @ending = ending
    @stem = stem
    @numerus = numerus
    @db_entry = db_entry
    @casus = casus
    @genus = genus
    @define_ending = define_ending
  end

  def ending #define ending
    SIMPLE_ENDINGS.find { |x| input.end_with?(x) }
  end
  
  def stem #define stem by removing ending
    stem = input.clone
    stem.slice!(/#{ending}$/)
    stem
  end
  
  def db_entry #search db twice: once for input (if it's a NOminativ [homo]), if return nil, then for stem...
    #search_input
    #search_stem
    #result: Nom., stem., n., Dekl.
    ["homo", "homin", "m", "k"]
  end
  
  def genus
    db_entry[2]
  end
  
  def define_ending #casus and numerus in one ary, because there can be double meanings...
    container = ENDINGS[db_entry[3]][db_entry[2]]
    positions = []
    container.each_index do |i| if container[i] == ending
      positions << i
      end
    end
    positions
  end
  
  def numerus
    numerus = []  
    define_ending.each do |x|
      case x
      when 0..5 then numerus << "Sg."
      when 6..11 then numerus << "Pl."
      end
    end
    numerus
  end
  
  def casus
    casus = []
    define_ending.each do |x|
      case x
      when 0 then casus << "Nom."
      when 1 then casus << "Gen."
      when 2 then casus << "Dat."
      when 3 then casus << "Akk."
      when 4 then casus << "Vok."
      when 5 then casus << "Abl."
      when 6 then casus << "Nom."
      when 7 then casus << "Gen."
      when 8 then casus << "Dat."
      when 9 then casus << "Akk."
      when 10 then casus << "Vok."
      when 11 then casus << "Abl."
      end
    end
    casus
  end
  
  def more_positions?
    if define_ending.length > 1
      all_meanings
    end
  end
  
  def all_meanings
    
  end 
  
  def output
    puts @input 
    puts @ending
    puts @stem
    puts @genus
    puts @numerus 
    puts @casus
    puts @define_ending
  end
  
end

test = Substantiv.new("homines")
test.output
# test1 = Substantiv.new("hominem")
# test2 = Substantiv.new("amicus")
# test2 = Substantiv.new("amicorum")
