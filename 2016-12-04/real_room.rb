#!/usr/bin/env ruby

class Room
  attr_reader :sector, :encrypted_name, :checksum, :counts
  def initialize(room_string)
    (@encrypted_name, @sector, @checksum) = room_string.scan(/(.*)-(\d+)\[(.*)\]/).to_a.first
    @sector = @sector.to_i
    @counts = Hash.new(0)
    encrypted_name.gsub('-', '').chars.each { |char| @counts[char] += 1}
    puts "Room #{room_string}: #{encrypted_name} *** #{sector} *** #{checksum} *** #{valid?}"
    puts "\t#{@counts.sort_by{|k,v| v}.reverse}"
  end

  def calculate_validity

    checksum.chars.each_cons(2).all? do |character_a, character_b|
      counts[character_a] > counts[character_b] ||
        (counts[character_a] == counts[character_b] &&
          character_a <= character_b)
    end
  end

  def valid?
    @valid ||= calculate_validity
  end
end

# rooms = <<END_OF_ROOMS
# aaaaa-bbb-z-y-x-123[abxyz]
# a-b-c-d-e-f-g-h-987[abcde]
# not-a-real-room-404[oarel]
# totally-real-room-200[decoy]
# END_OF_ROOMS

rooms = File.read('day4.input')

my_rooms = rooms.split("\n").map do |room|
  Room.new(room)
end

puts my_rooms.select(&:valid?).map(&:sector).reduce(:+)
