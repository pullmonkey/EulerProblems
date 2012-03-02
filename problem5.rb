numbers = (1..20).to_a

i = numbers.last

def evenly_divisible?(i, numbers)
  numbers.reverse.each do |num|
    return false if i % num != 0
  end
  return true
end

until evenly_divisible?(i, numbers) do
  i+=numbers.last # inc by largest number
end

puts i
