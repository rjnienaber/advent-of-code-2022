t = ARGF.each_line.map(&.split(/\W/).map(&.to_i)).count do |(a,b,c,d)|
  ((a..b).to_a & (c..d).to_a).any?
end

p t # 841