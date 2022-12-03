t=ARGF.each_line.map(&.to_i?).chunk_while{|v|v}.map(&.compact.sum).to_a.sort;p t[-1];p t[-3..].sum
