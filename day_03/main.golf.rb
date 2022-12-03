p$<.each_slice(3).sum{|l|x=(65..).find{|c|l.all?{_1[c.chr]}};(x-96)%58}
