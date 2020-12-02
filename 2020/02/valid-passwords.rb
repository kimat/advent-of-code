#!/usr/bin/env ruby
# frozen_string_literal: true

def parse_line(line)
  line
    .match(/(\d+)-(\d+) (\w): (\w+)/)
    .captures
    .map
    .with_index { |el, index| index < 2 ? el.to_i : el }
end

PasswordFileEntry = Struct.new(:minimum, :maximum, :character, :password) do
  def valid?
    password.count(character).between?(minimum, maximum)
  end
end

def count_valid_passwords_in_file(filename)
  File.open(filename).count do |line|
    PasswordFileEntry.new(*parse_line(line)).valid?
  end
end

p count_valid_passwords_in_file("input")

PasswordFileEntry = Struct.new(:first_position, :second_position, :character, :password) do
  def valid?
    important_characters = [password[first_position - 1], password[second_position - 1]]
    important_characters.reduce(:!=) && important_characters.include?(character)
  end
end

p count_valid_passwords_in_file("input")
