require 'mathn'

#Every triangle has a circumscribed circle that goes through the three vertices. 
#Consider all integer sided triangles for which the radius of the circumscribed circle is integral as well.
#Let S(n) be the sum of the radii of the circumscribed circles of all such triangles for which the radius does not exceed n.
#S(100)=4950 and S(1200)=1653605.
#Find S(10**7).
#
@bad_combos = [] 
@stored_abc = {}
#
def s(n)
  sum = 0
  (1..n).each do |ahalf|
    a = ahalf * 2
    (ahalf..n).each do |bhalf|
      b = bhalf * 2
      (bhalf..n).each do |chalf|
        c = chalf * 2
        sorted = [a,b,c].sort
        next unless (a + b) > c
        next if @bad_combos.include?(sorted)
        if (calculated_radius = get_circle_radius_for_side_lengths(sorted).to_f rescue false) and calculated_radius <= n and calculated_radius > 1 and calculated_radius.to_i.to_f == calculated_radius.to_f
          sum += calculated_radius
        elsif (calculated_radius.to_i.to_f != calculated_radius.to_f  rescue true)# combo sucks, ignore for next time
          @bad_combos << sorted
        end
      end
    end
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

puts s(100)  #=> 4950
#puts s(1200) #=> 1653605
