#!/usr/bin/env ruby

class Key
  attr_reader :current_key

  DIRECTIONS = [
      nil,
      {'U' => 1, 'L' => 1, 'R' => 2, 'D' => 4},
      {'U' => 2, 'L' => 1, 'R' => 3, 'D' => 5},
      {'U' => 3, 'L' => 2, 'R' => 3, 'D' => 6},
      {'U' => 1, 'L' => 4, 'R' => 5, 'D' => 7},
      {'U' => 2, 'L' => 4, 'R' => 6, 'D' => 8},
      {'U' => 3, 'L' => 5, 'R' => 6, 'D' => 9},
      {'U' => 4, 'L' => 7, 'R' => 8, 'D' => 7},
      {'U' => 5, 'L' => 7, 'R' => 9, 'D' => 8},
      {'U' => 6, 'L' => 8, 'R' => 9, 'D' => 9}
  ]

  def initialize
    @current_key = 5
  end

  def move(move)
    move.split('').each do |direction|
      @current_key = DIRECTIONS[current_key][direction]
    end
    print @current_key
  end
end

# moves = <<-END_OF_MOVE
# ULL
# RRDDD
# LURDL
# UUUUD
# END_OF_MOVE

moves = File.read('problem1.input')

key = Key.new
moves.split("\n").each do |move|
  key.move(move)
end
puts ''
