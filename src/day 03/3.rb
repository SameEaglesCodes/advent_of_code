file = File.read('.input')

correct = file.scan(/mul\((\d{1,3}),(\d{1,3})\)/)

puts correct.inject(0) { |acc, (a, b)| acc + a.to_i * b.to_i }

puts "part 2"

correct = file.scan(/(do\(\)|don\'t\(\)|mul\((\d{1,3}),(\d{1,3})\))/)
on = true
accum = 0
correct.each do |(a, b, c)|
    if a == "do()"
        on = true
    elsif a == "don't()"
        on = false
    else
        accum += on ? b.to_i * c.to_i : 0
    end
end
puts accum
# puts file