#!/usr/bin/env ruby

def change_direction(current_direction, turn)
  case [current_direction, turn]
    when ['N', 'R'], ['S', 'L']
      'E'
    when ['N', 'L'], ['S', 'R']
      'W'
    when ['E', 'L'], ['W', 'R']
      'N'
    when ['W', 'L'], ['E', 'R']
      'S'
    else
      puts "Um, I'm looking #{current_direction} and turning #{turn}!!!"
  end
end

def walk(current_direction, position, visited_positions, distance)
  case current_direction
    when 'N'
      distance.times do
        position = [position.first, position.last + 1]
        if visited_positions.include?(position)
          puts "WOH, Deja Vu at #{position}"
          exit
        else
          visited_positions << position
        end
      end
    when 'E'
      distance.times do
        position = [position.first + 1, position.last]
        if visited_positions.include?(position)
          puts "WOH, Deja Vu at #{position}"
          exit
        else
          visited_positions << position
        end
      end
    when 'S'
      distance.times do
        position = [position.first, position.last - 1]
        if visited_positions.include?(position)
          puts "WOH, Deja Vu at #{position}"
          exit
        else
          visited_positions << position
        end
      end
    when 'W'
      distance.times do
        position = [position.first - 1, position.last]
        if visited_positions.include?(position)
          puts "WOH, Deja Vu at #{position}"
          exit
        else
          visited_positions << position
        end
      end
  end
  [position, visited_positions]
end

# moves = "R2, L3"
# moves = "R2, R2, R2"
# moves = "R5, L5, R5, R3"
# moves = "R8, R4, R4, R8"
moves = "R3, L5, R2, L1, L2, R5, L2, R2, L2, L2, L1, R2, L2, R4, R4, R1, L2, L3, R3, L1, R2, L2, L4, R4, R5, L3, R3, L3, L3, R4, R5, L3, R3, L5, L1, L2, R2, L1, R3, R1, L1, R187, L1, R2, R47, L5, L1, L2, R4, R3, L3, R3, R4, R1, R3, L1, L4, L1, R2, L1, R4, R5, L1, R77, L5, L4, R3, L2, R4, R5, R5, L2, L2, R2, R5, L2, R194, R5, L2, R4, L5, L4, L2, R5, L3, L2, L5, R5, R2, L3, R3, R1, L4, R2, L1, R5, L1, R5, L1, L1, R3, L1, R5, R2, R5, R5, L4, L5, L5, L5, R3, L2, L5, L4, R3, R1, R1, R4, L2, L4, R5, R5, R4, L2, L2, R5, R5, L5, L2, R4, R4, L4, R1, L3, R1, L1, L1, L1, L4, R5, R4, L4, L4, R5, R3, L2, L2, R3, R1, R4, L3, R1, L4, R3, L3, L2, R2, R2, R2, L1, L4, R3, R2, R2, L3, R2, L3, L2, R4, L2, R3, L4, R5, R4, R1, R5, R3"

moves = moves.split(', ')
current_direction = 'N'
position = [0, 0]
visited_positions = []
visited_positions << position

moves.each do |move|
  (turn, distance) = move.split('', 2)
  distance = distance.to_i
  puts "I'm currently at #{position} facing #{current_direction}."
  puts "\tMoving #{move}"
  puts "\tTurning #{turn}"
  current_direction = change_direction(current_direction, turn)
  puts "\tNow facing #{current_direction}"
  puts "\tTraveling #{distance}"
  (position, visited_positions) = walk(current_direction, position, visited_positions, distance)
  puts "\t\tEnded the day at #{position}"
end


