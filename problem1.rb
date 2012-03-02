sum = 0
1000.times do |x|
  sum += x if (x % 3 == 0) or (x % 5 == 0)
end
puts sum
