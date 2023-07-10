module Validation
  def self.valid_name?(string)
    string.length <= 40 && string =~ /\A[A-Za-z]+(-[A-Za-z]+)*\z/
  end

  def self.valid_inn?(string)
    string =~ /\A[A-Z]{2}\d{10}\z/
  end

  def self.after_date?(date)
    date < Date.today
  end
end

puts "Is 'Elena' a valid name? #{Validation.valid_name?("Elena")}"
puts "Is 'Elena-Sophia' a valid name? #{Validation.valid_name?("Elena-Sophia")}"
puts "Is 'Іванка-Оксана' a valid name? #{Validation.valid_name?("Іванка-Оксана")}"

puts "Is 'E-' a valid name? #{Validation.valid_name?("E-")}"
puts "Is '-' a valid name? #{Validation.valid_name?("-")}"
puts "Is 'eN' a valid name? #{Validation.valid_name?("eN")}"
puts "Is 'EleNA' a valid name? #{Validation.valid_name?("EleNA")}"

puts "Is 'UK1234567890' a valid INN? #{Validation.valid_inn?("UK1234567890")}"

puts "Is 'UЯ1234567890' a valid INN? #{Validation.valid_inn?("UЯ1234567890")}"
puts "Is 'uk1234567890' a valid INN? #{Validation.valid_inn?("uk1234567890")}"
puts "Is '1234567890UK' a valid INN? #{Validation.valid_inn?("1234567890UK")}"
puts "Is 'UK123456' a valid INN? #{Validation.valid_inn?("UK123456")}"

puts "Is the date '1990-05-20' before today? #{Validation.after_date?(Date.new(1990, 5, 20))}"
puts "Is the date 'today' before today? #{Validation.after_date?(Date.today)}"