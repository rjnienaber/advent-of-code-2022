p ARGF.each_line.in_groups_of(3).sum{|l|x=(65..).find{|c|l.compact.all?{|v|v[c.chr]?}};((x||0)-96)%58}
