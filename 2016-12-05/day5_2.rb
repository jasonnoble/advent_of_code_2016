#!/usr/bin/env ruby

require 'digest'
# require 'byebug'

door_id = "ugkcyxxp"

spinning_star = %w(| / - \\)

password = Array.new(8)
index = 0

while(password.compact.length < 8)
  md5 = Digest::MD5.new.update(door_id + index.to_s).hexdigest
  md5.scan(/^00000(\d)(.)/) do |position,value|
    position = position.to_i
    password[position] = value if position < 8 && password[position].nil?
  end
  print "\b"*8 + password.map{|v| v || spinning_star.first}.join
  spinning_star.rotate!
  index += 1
end

