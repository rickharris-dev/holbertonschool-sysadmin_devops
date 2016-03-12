#!/usr/bin/ruby
Dir.foreach(ARGV[0]) do |file|
  if file.include? "bread"
    puts file
  end
end
