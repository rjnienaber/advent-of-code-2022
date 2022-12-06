signal = gets.to_s.chars
count = 3
signal.each_cons(4).with_index { |c, i| count += 1; break if c.uniq.size == 4 }
p count # 1892

count = 13
signal.each_cons(14).with_index { |c, i| count += 1; break if c.uniq.size == 14 }
p count # 2313