sum = 0
(1..100).inject(:*).to_s.split("").each do |i|
  sum += i.to_i
end
puts sum
