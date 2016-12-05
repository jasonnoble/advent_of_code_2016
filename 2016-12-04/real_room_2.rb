#!/usr/bin/env ruby

class Room
  attr_reader :sector, :encrypted_name, :checksum, :counts
  LETTERS = ('a'..'z').to_a

  def initialize(room_string)
    (@encrypted_name, @sector, @checksum) = room_string.scan(/(.*)-(\d+)\[(.*)\]/).to_a.first
    @sector = @sector.to_i
    @counts = Hash.new(0)
    encrypted_name.gsub('-', '').chars.each { |char| @counts[char] += 1}
    puts "Room #{room_string}: #{encrypted_name} *** #{sector} *** #{checksum} *** #{valid?}"
    puts "\t#{@counts.sort_by{|k,v| v}.reverse}"
  end

  def calculate_validity
    # checksum.chars.each_cons(2).all? do |character_a, character_b|
    #   counts[character_a] > counts[character_b] ||
    #     (counts[character_a] == counts[character_b] &&
    #       character_a <= character_b)
    # end
    @counts.sort{|a,b| a.last == b.last ? b.first <=> a.first : a.last <=> b.last }.reverse.to_h.keys.first(5).join
  end

  def valid?
    puts "#{calculate_validity}"
    checksum == calculate_validity
  end

  def decrypt
    encrypted_name.chars.map do |char|
      char == '-' ? ' ' : LETTERS[convert(char)]
    end
  end

  private

  def convert(character)
    (LETTERS.index(character) + sector) % LETTERS.length
  end
end

# aaaaa-bbb-z-y-x-123[abxyz]
# a-b-c-d-e-f-g-h-987[abcde]
# not-a-real-room-404[oarel]
# totally-real-room-200[decoy]
# rooms = <<END_OF_ROOMS
# qzmt-zixmtkozy-ivhz-343[zimth]
# END_OF_ROOMS

rooms = File.read('day4.input')

my_rooms = rooms.split("\n").map do |room|
  Room.new(room)
end

my_rooms.select(&:valid?).each do |valid_room|
  puts "#{valid_room.sector}: #{valid_room.decrypt.join('')}"
end
