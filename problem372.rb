def r(m,n)
  y = m+1
  total_count = 0
  in_a_row_threshold = 5
  apply_trend = true
  debug = true
  while y <= n do 
    x = m+1
    in_a_row = 0 # what we've see in a row, for example 9 odds in a row, we should see more than 9 evens next time
    was_odd  = nil # want to track transition
    puts "-" * 20 if debug
    while x <= y do
      puts "X: #{x}, Y: #{y}" if debug
      val = x==y ? 1 : (y**2 / x**2)
      # only the odd ones get counted
      total_count += 1 if (odd = val.odd?)
      puts "odd" if odd and debug
      puts "even" if not odd and debug

#      puts "Odd: #{odd.inspect}" if debug
#      puts "Was Odd: #{was_odd.inspect}" if debug
      puts "In A Row: #{in_a_row.inspect}" if debug
      puts "Count: #{total_count}" if debug
      
      inc = in_a_row - 1
      # if we were odd, we have a trend and we are no longer odd
      if was_odd and not odd and in_a_row > in_a_row_threshold
        puts "Increasing only X by #{inc} b/c we were odd and are no longer odd ---- #{in_a_row}" if debug
        x += inc if apply_trend  # skip x ahead
      # we see an odd, we were even and we have a trend
      elsif odd and not was_odd and in_a_row > in_a_row_threshold
        puts "Increasing X AND Count by #{inc} b/c we were even and are no longer even ---- #{in_a_row}" if debug
        # if we are going to go past our Y bound, then we should dial back a bit
        if ((delta = y - (x + inc)) < 0)
          inc += delta # delta is negative so add it
        end
        if apply_trend
          x += inc # skip x ahead
          total_count += inc # now that we are odd forward the total_count as well
        end
      # add to the "in_a_row" if we are still the same
      # i.e., if was_odd is false, it's even, if odd is false, it's even
      # if they are both true, then they are both odd
      elsif was_odd == odd
        in_a_row += 1
      else
        puts "resetting in_a_row to 1" if debug
        in_a_row = 1
      end
      
      was_odd = odd

      x += 1
    end
    y += 1
  end
  return total_count
end

#puts r(0,3) #=> 4
#puts r(0,5) #=> 9
puts r(0,100) #=> 3019
#puts r(100,10000) #=> 29750422
#puts r(2*10**6, 10**9) #=> ????
