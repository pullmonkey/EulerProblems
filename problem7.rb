require 'mathn'

count = 0
i = 0

while count < 10001 do
  i += 1
  count += 1 if i.prime?
end

puts i
