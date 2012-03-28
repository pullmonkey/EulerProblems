smallest_3_digit = 100
largest_3_digit = 999
largest_pali = 0

def palindrome?(n)
  return true if n.to_s == n.to_s.reverse
  return false
end

(smallest_3_digit..largest_3_digit).to_a.reverse.each do |x|
  (smallest_3_digit..largest_3_digit).to_a.reverse.each do |y|
    z = x * y
    if palindrome?(z.to_i)
      largest_pali = z if z > largest_pali 
    end
  end
end

puts largest_pali
