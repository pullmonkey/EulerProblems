$conversions = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 
 10 => 'ten', 11 => 'eleven', 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "onehundred", 1000 => "onethousand"}

def convert_to_text(num)
  str = num.to_s
  len = str.length
  return "" if num == 0
  return $conversions[num] if len == 1
  return $conversions[num] if $conversions.has_key?(num)
  text = ""
  case len
  when 1
    text += convert_to_text(num)
  when 2
    text += convert_to_text((str[0] + "0").to_i) + convert_to_text(str[-1].to_i)
  when 3
    text += convert_to_text(str[0].to_i) + convert_to_text(100).gsub("one","") 
    text += "and" + convert_to_text(str[1..2].to_i) unless str[-2..-1] =~ /^00$/
  when 4
    text += convert_to_text(str[0].to_i) + convert_to_text(1000).gsub("one","") + "and" + convert_to_text(str[1..3].to_i)
  end
  $conversions[num] = text
  return text
end

total_text_count = 0
(1..1000).each do |num|
  text = convert_to_text(num).gsub(" ","")
  total_text_count += text.length
end
puts total_text_count
