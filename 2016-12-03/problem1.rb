#!/usr/bin/env ruby

class Triangle
  def initialize(side_1, side_2, side_3)
    (@side_1, @side_2, @side_3) = [side_1, side_2, side_3].map(&:to_i).sort
  end

  def valid?
    puts "Triangle: #{@side_1 + @side_2} > #{@side_3}"
    @side_1 + @side_2 > @side_3
  end
end

# triangles = <<-END_OF_MOVE
#   5 10 25
#   5 10 12
# END_OF_MOVE

triangles = File.read('problem1.input')

all_triangles = []
triangles.split("\n").each do |triangle|
  *sides = triangle.strip.split(/\s+/)
  all_triangles << Triangle.new(*sides)
end
puts all_triangles.select{|t| t.valid? }.count

