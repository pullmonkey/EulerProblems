def get_count(m,n,i)
  sum = 0
  sqrt = i**(0.5)
  (m..n/sqrt).each do |x|
    sum += n - (x*sqrt).ceil + 1
  end
  return sum
end

def r(m,n)
  max = n**2 / m**2
  sum = 0
  (1..max).each do |i|
    sum += (i.odd? ? 1 : -1) * get_count(m,n,i)
  end
  return sum
end

puts r(1,100)
puts r(101,10000)
puts r(2000001,1000000000)
