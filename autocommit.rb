#!/usr/bin/env ruby
##############################
# automatically commit a file every x seconds
#
# run like:
#     autocommit.rb [filename] [x]
#
# if x is missing or <2, we use 2
#
# You need to be in the git repository that contains the file,
# and you need to have already set up a remote


require 'date'

# get file name from command line argument
if ARGV.length < 1
    abort("Give file name")
else
    file = ARGV[0]
end

# get time from command line argument; if missing use 5 sec
if ARGV.length < 2
    time = 5
else
    time = ARGV[1].to_i
end

# force sleep >= 2
if time < 2
    time = 2
end

puts "Commit file #{file} every #{time} seconds"

loop do
    current_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    `git commit #{file} -m "update #{file} #{current_time}"`
    `git push`
    puts "commit #{file} #{current_time}"
    sleep(time)
end
