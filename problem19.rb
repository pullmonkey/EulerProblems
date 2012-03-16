require 'date'
years = (1901..2000)
months = (1..12)

#1 Jan 1901 to 31 Dec 2000
count = 0
years.each do |y|
  months.each do |m|
    puts "year: #{y}, month: #{m}"
    count += 1 if Date.parse("#{y}-#{m}-01").sunday?
  end
end
puts count
