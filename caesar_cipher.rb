def caesar_cipher(message, shift)
  encryption = ''

  message.each_char do |char|
    if (char.ord + shift).between?(91, 96) || (char.ord + shift) > 122
      wrap = 26
    else
      wrap = 0
    end

    if char.between?('A', 'Z') || char.between?('a', 'z')
      encryption += (char.ord + shift - wrap).chr
    else
      encryption += char
    end
  end

  encryption

end

p caesar_cipher("Hello, my name is Mindy!", 5)