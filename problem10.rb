require 'mathn'
# all primes below 2M

sum = 0
2000000.times do |x|
  sum += x if x.prime?
end
puts sum
