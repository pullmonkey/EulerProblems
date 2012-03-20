# Tn
@ts = [0]
# An
@as = [0]

def dec_to_bin(dec)
  bin = []
  while dec >= 1
    bin << dec % 2
    dec /= 2
  end
  bin.reverse.join("")
end

#t(0) = 0
#t(2n) = t(n)
#t(2n+1) = 1 - t(n)
def t(n)
  return @ts[n] if @ts.size >= n and @ts[n]
  return t(n/2) if n.even?
  return 1 - t((n-1)/2) if n.odd?
end

# build {Tn}
5000.times do |x|
  @ts << t(x+1)
end

(1..10**4).each do |l|
end
power = 1
count = 1
n = 1
sum = 0
while(power <= 18) do
  raise "AH CRAP, skipped 80852364498" if power < 3 and n > 80852364498
  bin = dec_to_bin(n)
  if @ts.join("") =~ /#{bin}/
    if count == 10**power
      sum += n
      puts "@#{count}: #{n}, sum: #{sum}"
      power += 1
    end
    count += 1
  end
  n += 1
end
