class Array
  def sum
    s = 0
    each do |x|
      s += x
    end
    return s
  end
end

square_of_sums = (1..100).to_a.sum**2
sum_of_squares = (1..100).to_a.map{|x| x**2}.sum
diff = square_of_sums - sum_of_squares
puts diff
