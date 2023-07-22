#!/usr/bin/ruby
require 'date'

module Validation
  def self.valid_name?(string)
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
