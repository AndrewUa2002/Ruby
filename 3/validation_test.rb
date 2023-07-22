#!/usr/bin/ruby
require 'test/unit'
require_relative '../2/validation'

class TestValidation < Test::Unit::TestCase
  def test_valid_name
    assert(Validation.valid_name?('John'))
    assert(Validation.valid_name?('Anna-Maria'))
    assert(Validation.valid_name?('Name'))
    assert(Validation.valid_name?('Name-Name'))
    assert_false(Validation.valid_name?(''))
    assert_false(Validation.valid_name?('-Name'))
    assert_false(Validation.valid_name?('Name-'))
  end

  def test_valid_inn
    assert(Validation.valid_inn?('AA1234567890'))
    assert(Validation.valid_inn?('AB3235337860'))
    assert_false(Validation.valid_inn?('AB123456789'))
    assert_false(Validation.valid_inn?('AA12345678901'))
    assert_false(Validation.valid_inn?('ABCD12345678'))
    assert_false(Validation.valid_inn?(''))
  end

  def test_after_date
    today = Date.today
    yesterday = today - 1
    tomorrow = today + 1

    assert(Validation.after_date?(yesterday))
    assert(Validation.after_date?(today))
    assert_false(Validation.after_date?(tomorrow))
    assert_false(Validation.after_date?(nil))
    assert_false(Validation.after_date?('2023-07-21'))
  end
end
