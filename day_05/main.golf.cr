s,i=ARGF.gets_to_end.split("\n\n")
y=s.lines.reverse[1..].map(&.chars).transpose.map(&.select(&.ascii_letter?)).reject(&.empty?)
z=y.clone
i.lines.map(&.scan(/\d+/).map(&.[0].to_i)).each do|(c,f,t)|
y[t-1]+=y[f - 1].pop(c).reverse
z[t-1]+=z[f - 1].pop(c)
end
p y.map(&.last).join
p z.map(&.last).join