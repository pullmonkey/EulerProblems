# all must be met
# 1) a + b + c = 1000
# 2) a < b < c
# 3) a^2 + b^2 = c^2

(1..1000).to_a.each do |a|
  (a..1000).to_a.reverse.each do |b|
    c = 1000 - a - b
    puts a * b * c if a**2 + b**2 == c**2
  end
end
