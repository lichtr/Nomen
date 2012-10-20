ENDINGS = {
"a" => {"m" => [nil, "ae", "ae", "am", "a", "a", "ae", "arum", "is", "as", "ae", "is"], "f" => [nil, "ae", "ae", "am", "a", "a", "ae", "arum", "is", "as", "ae", "is"]},# extra schreiben nötig hier?
"o" => {"m" => [nil, "i", "o", "um", "e", "o", "i", "orum", "is", "os", "i", "is"], "f" => [nil, "i", "o", "um", "e", "o", "i", "orum", "is", "os", "i", "is"], "n" => [nil, "i", "o", nil, nil, "o", "a", "orum", "is", "a", "a", "is"]}, #Virus??
"e" => {"m" => [nil, "ei", "ei", "em", nil, "e", "es", "erum", "ebus", "es", "es", "ebus"], "f" => [nil, "ei", "ei", "em", nil, "e", "es", "erum", "ebus", "es", "es", "ebus"]},
"u" => {"m" => [nil, "us", "ui", "um", nil, "u", "us", "uum", "ibus", "us", "us", "ibus"], "f" => [nil, "us", "ui", "um", nil, "u", "us", "uum", "ibus", "us", "us", "ibus"], "n" => [nil, "us", "u", "u", "u", "u", "ua", "uum", "ibus", "ua", "ua", "ibus"]},
"k" => {"m" => [nil, "is", "i", "em", nil, "e", "es", "um", "ibus", "es", "es", "ibus"], "f" => [nil, "is", "i", "em", nil, "e", "es", "um", "ibus", "es", "es", "ibus"], "n" => [nil, "is", "i", nil, nil, "e", "a", "um", "ibus", "a", "a", "ibus"]},
"i" => {"f" => [nil, "is", "i", "im", nil, "i", "es", "ium", "ibus", "es", "es", "ibus"], "n" => [nil, "is", "i", nil, nil, "i", "ia", "ium", "ibus", "ia", "ia", "ibus"]},
{"m" => {"m" => [nil, "is", "i", "em", nil, "e", "es", "ium", "ibus", "es", "es", "ibus"], "f" => [nil, "is", "i", "em", nil, "e", "es", "ium", "ibus", "es", "es", "ibus"]}}
}

#flat = ENDINGS.flatten
#unique_endings = flat.map {|x| x.flatten if x.class == Hash}.flatten.compact.uniq.delete_if {|x| x =~ /\A[mfn]\b/}.sort {|a,b| b.length <=> a.length}
SIMPLE_ENDINGS = ["ibus", "ebus", "erum", "arum", "orum", "ium", "uum", "ei", "um", "ua", "is", "os", "im", "as", "es", "ia", "am", "us", "ui", "ae", "em", "u", "e", "o", "i", "a"]

class Substantiv
  attr_reader :sexus, :casus_numerus, :stem, :ending, :translation
  
  def initialize
    @sexus = sexus
    @casus_numerus = casus_numerus
    @stem = stem
    @ending = ending
    @translation = translation
  end
  
  def stem
    
  end
  
  def search_db
  end
  
  
  
end
