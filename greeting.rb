def greet
  greeting = ARGV[0]
  i = 1
  length = ARGV.length
  while i < length do
    puts "#{greeting} #{ARGV[i]}"
    i += 1
  end
end
greet
