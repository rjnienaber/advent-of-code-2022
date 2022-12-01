totals = [] of Int32
current = 0
ARGF.each_line do |line|
  next current += line.strip.to_i unless line == ""
  totals << current
  current = 0
end

sorted = totals.sort
puts "top elf: #{sorted[-1]}"           # 70613
puts "top 3 total: #{sorted[-3..].sum}" # 205805
