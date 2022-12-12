#!/usr/bin/env ruby

root_dir = File.dirname(File.expand_path(__FILE__))



day = nil
language = nil
golf = nil
input = nil

ARGV.each do |v|
    case v
    when /\d+/ then day = v
    when /golf/ then golf = true
    when /crystal|ruby/ then language = v
    when /example/ then input = "example.txt"
    when /input/ then input = "input.txt"
    else raise StandardError.new("unknown arg: #{v}")
    end
end

cat_cmd = "cat #{root_dir}/data/day_#{day}/#{input}"
lng_cmd = language == "crystal" ? "crystal run" : "ruby"
ext = language == "crystal" ? ".cr" : ".rb"
suffix = golf ? ".golf" : ""
filename = "#{root_dir}/day_#{day}/main#{suffix}#{ext}"

full_cmd = "#{cat_cmd} | time -p #{lng_cmd} #{filename}; echo finished"
opts = { chdir: root_dir }
p full_cmd
system("watchexec -c '#{full_cmd}'", opts)
