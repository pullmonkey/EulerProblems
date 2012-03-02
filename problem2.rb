sum = 0
values = [1,2]
while values[1] <= 4000000 do
  sum += values[1] if (values[1] % 2 == 0) 
  old_2 = values[1]
  values[1] = old_2 + values[0]
  values[0] = old_2
end
puts sum
