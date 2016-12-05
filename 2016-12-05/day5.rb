#!/usr/bin/env ruby

require 'digest'

door_id = "ugkcyxxp"

password = []
index = 0

while(password.length < 8)
  md5 = Digest::MD5.new.update(door_id + index.to_s).hexdigest
  print "."
  puts "  #{password.join}" if index % 50 == 0
  md5.scan(/^00000(.)/) do |match|
    puts "\tAdding #{match}"
    password << match
  end
  index += 1
end

puts password.join('')
