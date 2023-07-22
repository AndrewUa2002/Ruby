#!/usr/bin/ruby
#Create module Validation with methods
#valid_name?(string) (valid name example Maria-Anna, max length is 40),
#valid_inn?(string) (valid inn example: AZ1234543456),
#after_date?(date) (is date may be date of birth)

require 'date'

module Validation
  def self.valid_name?(string)
    #check whether name is a string
    return false unless string.is_a?(String)
    return false if string.empty? || string.length > 40
    return false if string.match?(/\A-|-\z/)
    return false unless string.match?(/\A[A-Za-z]+(-[A-Za-z]+)*\z/)
    true
  end

  def self.valid_inn?(string)
    return false unless string.is_a?(String)
    return false if string.empty? || string.length != 12
    return false unless string.match?(/\A[A-Z]{2}\d{10}\z/)
    true
  end

  def self.after_date?(date)
    return false unless date.is_a?(Date)
    return date <= Date.today
    true
  end
end

name = "Anna"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

name = "Anna-Maria"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end


name = "An-"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

name = "-"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

inn = "AZ1234567849"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

inn = "AЯ123456789"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

inn = "az123456789"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

inn = "123456789AZ"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end


birth_date = Date.new(1990, 1, 1)
if Validation.after_date?(birth_date)
  puts "#{birth_date} is a valid date of birth."
else
  puts "#{birth_date} is NOT a valid date of birth."
end
