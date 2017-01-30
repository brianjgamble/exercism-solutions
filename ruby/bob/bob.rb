class Bob
  def self.hey(words)
    speech = Speech.new(words)
    bob    = Bob.new(speech)
    bob.reply
  end

  def initialize(speech)
    @speech = speech
  end

  attr_reader :speech

  def reply
    if speech.shouting?
      'Whoa, chill out!' 
    elsif speech.question?
      'Sure.'
    elsif speech.silence?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

class Speech < String
  def initialize(text)
    super text.to_s.strip
  end

  def shouting?
    !empty? && (self == self.upcase) && (/[^,?0-9\s]/.match(self) != nil)
  end

  def question?
    end_with?('?')
  end

  def silence?
    empty?
  end
end
