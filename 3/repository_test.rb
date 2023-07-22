#!/usr/bin/ruby
require 'test/unit'
require_relative '../2/personrepository'

class TestPersonRepository < Test::Unit::TestCase
  def setup
    @repository = PersonRepository
    @repository.add_person('John', 'Doe', 'JD1234567890', Date.new(1985, 5, 15))
    @repository.add_person('Jane', 'Smith', 'JS0987654321', Date.new(1990, 9, 20))
  end

  def teardown
    @repository.all.clear
  end

  def test_add_person
    assert_equal(2, @repository.all.length)
    @repository.add_person('Test', 'Person', 'TP1111111111', Date.new(2000, 1, 1))
    assert_equal(3, @repository.all.length)
  end

  def test_remove_person
    person_to_remove = @repository.all.first
    @repository.remove_person(person_to_remove)
    assert_equal(1, @repository.all.length)
  end

  def test_get_person_by_inn
    person = @repository.get_person_by_inn('JD1234567890')
    assert_equal('John', person.first_name)
    assert_equal('Doe', person.last_name)
  end

  def test_get_persons_by_name
    persons = @repository.get_persons_by_name('Jane')
    assert_equal(1, persons.length)
    assert_equal('Jane', persons.first.first_name)
    assert_equal('Smith', persons.first.last_name)
  end


  def test_delete_person_by_inn
    inn = @repository.all.first.inn
    @repository.delete_person_by_inn(inn)
    assert_equal(1, @repository.all.length)
  end
end
