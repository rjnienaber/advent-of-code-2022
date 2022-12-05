s,_,x=$<.map.chunk{_1==?\n}.map &:last
y=[[]]+s.map(&:chars).transpose.each_slice(4).map{_1[1].reject{|l|l==' '}.reverse}
z=y.map(&:dup)
x.map{a,b,c=_1.scan(/\d+/).map &:to_i;y[c]+=y[b].pop(a).reverse;z[c]+=z[b].pop(a)}
p y.map(&:last).join
p z.map(&:last).join