require 'pry'
class Cipher
  attr_reader :key

  ALPHABET = *('a'..'z').to_a

  def initialize(key=generate_key)
    @key = key.slice!(0..ALPHABET.size - 1)
    raise ArgumentError, 'invalid key' if self.key.strip.empty? || self.key =~ /[A-Z\d]/
  end

  def encode(plaintext)
    raise ArgumentError, 'key must be longer than message' if plaintext.size > key.size

    result = ''
    plaintext.chars.each_with_index do |letter, index|
      if letter == ' '
        result << letter
      else
        result << ALPHABET[(ALPHABET.index(letter) + shift_distance[index]) % ALPHABET.size]
      end
    end

    result
  end

  def decode(encrypted_text)
    raise ArgumentError, 'key must be longer than message' if encrypted_text.size > key.size

    result = ''
    encrypted_text.chars.each_with_index do |letter, index|
      if letter == ' '
        result << ' '
      else
        result << ALPHABET[(ALPHABET.index(letter) - shift_distance[index]) % ALPHABET.size]
      end
    end

    result
  end

  private

  def generate_key
    key = ''
    100.times { key << ALPHABET.sample }
    key
  end

  def shift_distance
    result = []
    key.chars.each { |letter| result << ALPHABET.index(letter) }
    result
  end
end
