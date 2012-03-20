require 'mathn'

#Every triangle has a circumscribed circle that goes through the three vertices. 
#Consider all integer sided triangles for which the radius of the circumscribed circle is integral as well.
#Let S(n) be the sum of the radii of the circumscribed circles of all such triangles for which the radius does not exceed n.
#S(100)=4950 and S(1200)=1653605.
#Find S(10**7).
#
@bad_combos = [] 
@stored_abc = {}
@successful_radii = {}
@radii{}
#
def s(n)
  max_radius = n
  sum = 0
  # there are no triangles with integer sides for a radius less than 2
  (2..max_radius).each do |radius|
    puts "RADIUS: #{radius}"
    next unless radius.prime? or calculated_sum = has_successful_fator?(radius) 
    if calculated_sum
      sum += calculated_sum
      puts "SUM: #{sum}"
      next
    end
    sum += test_different_lengths_of_triangles_and_compare_to_radius(radius)
    puts "SUM: #{sum}"
  end
  return sum
end

# the triangle points must be along the circumference of the circle
def test_different_lengths_of_triangles_and_compare_to_radius(radius)
  sum = 0
  # the greatest length of one of the triangle sides is 2 * radius
  max_length = 2 * radius
  # the smallest length is 1
  (1..max_length).each do |a|
    (a..max_length).each do |b|
      (b..max_length).each do |c|
        sorted = [a,b,c].sort
        next if bad_combo?(sorted)
        if radius.to_f == (calculated_radius = get_circle_radius_for_side_lengths(sorted).to_f rescue 0)
          puts "A: #{a}, B: #{b}, C: #{c}"
          sum += radius 
        elsif (calculated_radius.to_i.to_f != calculated_radius.to_f  rescue true)# combo sucks, ignore for next time
          ignore_combo(sorted)
        end
      end
    end
  end
  if sum > 0
    @successful_radii[radius] ||= []
    @successful_radii[radius] << sum/radius # count of triangles
  end
  return sum
end

def get_circle_radius_for_side_lengths(sorted)
  val = @stored_abc[sorted]
  if val.nil?
    a = sorted[0].to_f
    b = sorted[1].to_f
    c = sorted[2].to_f
    val = (a*b*c) / ((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c))**(0.5)
    @stored_abc[sorted] = val
  end
  return val
end

def ignore_combo(sorted)
  @bad_combos << sorted
end

def bad_combo?(sorted)
  return @bad_combos.include?(sorted)
end

def has_successful_fator?(radius)
  @successful_radii.keys.each do |r|
    return radius * @successful_radii[r].count * r if (radius.to_f / r.to_f).to_f == r.to_f
    return radius * @successful_radii[r].count if radius % r == 0
  end
  return false
end

puts s(100)  #=> 4950
#puts s(1200) #=> 1653605
