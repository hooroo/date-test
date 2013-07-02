#!/usr/bin/env ruby

require_relative 'lib/date_challenge/user_input'
require_relative 'lib/date_challenge/date_range'

input = DateChallenge::UserInput.new(ARGV[0])
range = DateChallenge::DateRange.new(*input.dates)
puts range.to_s