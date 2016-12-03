#!/usr/bin/env ruby

class Key
  attr_reader :current_key
  A = 10
  B = 11
  C = 12
  D = 13

  def convert_key(key)
    return 'A' if key == 10
    return 'B' if key == 11
    return 'C' if key == 12
    return 'D' if key == 13
    key
  end
  DIRECTIONS = [
      nil,
      {'U' => 1, 'L' => 1, 'R' => 1, 'D' => 3},  # 1
      {'U' => 2, 'L' => 2, 'R' => 3, 'D' => 6},  # 2
      {'U' => 1, 'L' => 2, 'R' => 4, 'D' => 7},  # 3
      {'U' => 4, 'L' => 3, 'R' => 4, 'D' => 8},  # 4
      {'U' => 5, 'L' => 5, 'R' => 6, 'D' => 5},  # 5
      {'U' => 2, 'L' => 5, 'R' => 7, 'D' => A},  # 6
      {'U' => 3, 'L' => 6, 'R' => 8, 'D' => B},  # 7
      {'U' => 4, 'L' => 7, 'R' => 9, 'D' => C},  # 8
      {'U' => 9, 'L' => 8, 'R' => 9, 'D' => 9},  # 9
      {'U' => 6, 'L' => A, 'R' => B, 'D' => A},  # A / 10
      {'U' => 7, 'L' => A, 'R' => C, 'D' => D},  # B / 11
      {'U' => 8, 'L' => B, 'R' => C, 'D' => C},   # C / 12
      {'U' => B, 'L' => D, 'R' => D, 'D' => D}   # C / 13
  ]

  def initialize
    @current_key = 5
  end

  def move(move)
    move.split('').each do |direction|
      @current_key = DIRECTIONS[current_key][direction]
    end
    print convert_key(@current_key)
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
