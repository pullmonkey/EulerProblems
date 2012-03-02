require 'mathn'
number = 600851475143

# already checked number, number is not prime
(number/2).to_i.times do |x|
  x += 1
  if number % x == 0 and (number / x).to_i.prime?
    puts "DONE:"
    puts number / x
    break
  end
end
