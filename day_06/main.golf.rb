o=gets.chars
[4,14].map{|n|p o.each_cons(n).find_index{_1.uniq==_1}+n}