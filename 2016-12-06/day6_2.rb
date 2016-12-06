#!/usr/bin/env ruby

# messages = <<END_OF_MESSAGES
# eedadn
# drvtee
# eandsr
# raavrd
# atevrs
# tsrnev
# sdttsa
# rasrtv
# nssdts
# ntnada
# svetve
# tesnvt
# vntsnd
# vrdear
# dvrsen
# enarar
# END_OF_MESSAGES

messages = File.read('day6.input')

@counts = []
messages.split("\n").map do |message|
  message.chars.each_with_index do |letter, index|
    @counts[index] ||= Hash.new(0)
    @counts[index][letter] += 1
  end
end

print "Message: "
@counts.each do |count|
  print count.sort_by{|_,v| v}.first.first
end

puts ''

@counts.each_with_index do |count, index|
  puts "#{index}: #{count.sort_by{|_,v| v}.reverse.inspect}"
end
