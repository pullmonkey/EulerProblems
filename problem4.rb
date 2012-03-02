smallest_3_digit = 100
largest_3_digit = 999
largest_pali = 0

def palindrome?(n)
  str = n.to_s
  return true if str.size == 1
  return true if str[0..str.size/2 -1] == str[(str.size/2) .. - 1].reverse and str.size.even?
  return true if str[0..str.size/2 - 1] == str[(str.size/2) + 1 .. - 1].reverse and str.size.odd?
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
