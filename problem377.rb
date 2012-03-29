# I've noticed this follows pascal's triangle
#        1
#      1   1
#    1   2   1
#  1   3   3   1
#1   4   6   4   1
#
# we know that we can find the n term of a given row using
# an incrementing denominator and decrementing numerator
# multiplied by the previous column's value
# knowing that column 0 is always 1
# this tells us how many terms to expect for each "n"
# where n in F(n) is our row in the pascal triangle
def terms_in_pascal_triangle_for_row(row)
  c = 1
  cols = [1]
  return cols if row == 1
  until cols.length == (row.to_f / 2).ceil
    cols << (cols[c - 1].to_f * ((row.to_f - c.to_f) / c.to_f)).to_i
    c += 1
  end
  # cheat a little bit, we know it's symmetric
  if row.even?
    cols << cols.reverse
  else
    # don't grab the middle term if we are an odd row
    cols << cols[0..(row/2)-1].reverse
  end
  return cols.flatten
end

# how the pascal triangle applies
# if n is 1, [1] we know we have a single term that works
# if n is 2, [1,1] we know we have 1 term 2 digits in length and 1 1 digit in length
# if n is 3, [1,2,1] we know we have 1 term 3 digits in length, 1 1 digit in length and 2 2 digits in length
# and so on ...

# a faster method may be to start with all "1"'s representing the number
# so a summable term of F(n) where n is 5 would be 11111  [1]
# then take the 11111 and turn it into lenth of 4 digits
# thus 2111, 1211, 1121, 1112 [4]
# then 3 digit terms
# 221, 122, 212, 311, 113, 131 [6]
# then 2 digit terms 
# 23, 32, 41, 14 [4]
# then 1 digit terms 
# 5 [1]
# which also demonstrates [1,4,6,4,1] for row 5 of pascal's triangle
# also, we only care about the last nine digits of the answer
# so maybe we can do something easy with that
def recursive_terms(n)
  all_ns << n
  # if we get 1111
  # we have 1111 and should then get 211 and then 31 and then 4
  # then continue from 1111 to 121 then 13
  # then continue from 1111 to 112
  # to find these terms, find the 
  next_ns = convert_n_to_next_terms(n)
  next_ns.each do |next_n|
    all_ns << recursive_terms(next_n)
  end
  return all_ns.flatten.uniq
end

# take 1111 and return [211, 121, 112]
# take 121 and return [13]
# take 211 and return [31, 22]
# take 112 and return [22] # we have a dup of 22 for 211 and 112?
# take 31 and return [4]
# take 12121 and return [1213, 1321]
# always take larger number followed by smaller number and sum and replace
# and always return temrs that are 1 less in length
# for instance 12121 should not always return 133
# instead, let 1213 return 133
# 1321 should return 151, 133 but 1213 is also returning 133 ... hmm
def convert_n_to_next_terms(n)
  next_ns = []
  ts = n.to_s.split("")
  ts.size.times do |i|
    if i+1 <= ts.size and ts[i].to_i >= ts[i+1].to_i
      next_ns << n
    end
  return next_ns
end


# sum of all positive integers that do not have a zero
# in their digits and have digital sum equal to n
def f(n)
  sum = ("1"*n).to_i # the last number of the sequence is n 1's
  # start with single digit if possible
  sum += n if n.to_s.length == 1
  # 2 digits next
  x = 2
  puts terms_of_n_with_length_x(n,x).inspect
  puts "got here"
  puts n-1
  (1..(n-1)).to_a.reverse.each do |x|
    puts x
    puts eat_2s(x)
  end
  return sum
end

puts f(5)
