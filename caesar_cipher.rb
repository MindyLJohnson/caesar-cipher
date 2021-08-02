def caesar_cipher(message, shift)
  capitals = collect_capital_letters(message)
  punctuations = collect_punctuations(message)
  shifted_message = shift_message(message, shift)

  encrypt_message(shifted_message, capitals, punctuations)

  shifted_message.join

end

def collect_capital_letters(str)
  capitals = []
   str.chars.each_with_index do |char, index| 
    if char.ord.between?(65, 90)
      capitals << [char, index]
    end
   end

   capitals
end

def collect_punctuations(str)
  punctuations = []
   str.chars.each_with_index do |char, index| 
    if char.ord.between?(32, 47)
      punctuations << [char, index]
    end
   end

   punctuations
end

def shift_message(message, shift)
  message.downcase.scan(/[a-z']/).map do |char|
    if (char.ord + shift) > 122
      (char.ord + shift - 26).chr
    else
      (char.ord + shift).chr      
    end
  end
end

def encrypt_message(shifted_message, capitals, punctuations)
  punctuations.each do |punctuation|
    shifted_message.insert(punctuation[1], punctuation[0])
  end

  capitals.map {|capital| shifted_message[capital[1]].upcase!}
end

p caesar_cipher("Hello, my name is Mindy!", 5)