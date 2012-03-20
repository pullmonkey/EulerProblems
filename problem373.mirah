import java.lang.Math
#Every triangle has a circumscribed circle that goes through the three vertices. 
#Consider all integer sided triangles for which the radius of the circumscribed circle is integral as well.
#Let S(n) be the sum of the radii of the circumscribed circles of all such triangles for which the radius does not exceed n.
#S(100)=4950 and S(1200)=1653605.
#Find S(10**7).
#
@bad_combos = [] 
#
def s(n:int)
  max_radius = n
  sum = 0.0
  # there are no triangles with integer sides for a radius less than 2
  radius = 2.0
  while radius <= max_radius do
    puts "RADIUS: #{radius}"
    sum += test_different_lengths_of_triangles_and_compare_to_radius(radius)
    puts "SUM: #{sum}"
    radius += 1.0
  end
  return sum
end

def get_circle_radius_for_side_lengths(a:double,b:double,c:double)
  (a*b*c) / Math.sqrt((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c))
end

def ignore_combo(a:double,b:double,c:double)
  @bad_combos.add("#{a},#{b},#{c}")
end

def bad_combo?(a:double,b:double,c:double)
  return @bad_combos.indexOf("#{a},#{b},#{c}") == -1
end


# the triangle points must be along the circumference of the circle
def test_different_lengths_of_triangles_and_compare_to_radius(radius:double)
  puts "testing lengths: #{radius}"
  sum = 0.0
  # the greatest length of one of the triangle sides is 2 * radius
  max_length = 2.0 * radius
  # the smallest length is 1
  a = 1.0
  b = 1.0
  c = 1.0
  while a <= max_length do
    while b <= max_length do
      while c <= max_length do
        puts "A: #{a}, B: #{b}, C: #{c}"
        if bad_combo?(a,b,c)
          c += 1
          next 
        end
        calculated_radius = 0.0
        begin
          calculated_radius = get_circle_radius_for_side_lengths(a,b,c)
        rescue
        end
        if radius == calculated_radius
          puts "GOOD:: A: #{a}, B: #{b}, C: #{c}"
          sum += radius 
        elsif calculated_radius % 1 != 0 # combo sucks, ignore for next time
          puts "IGNORING"
          ignore_combo(a,b,c)
        end
        c += 1.0
      end
      b += 1.0
    end
    c += 1.0
  end
  return sum
end

puts s(100)  #=> 4950
#puts s(1200) #=> 1653605
