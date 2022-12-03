sorted = ARGF.each_line.map(&.to_i?).chunk_while { |v| v }.map(&.compact.sum).to_a.sort
puts "top elf: #{sorted[-1]}"           # 70613
puts "top 3 total: #{sorted[-3..].sum}" # 205805
