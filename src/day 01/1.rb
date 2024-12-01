list_1 = []
list_2 = []
list_1_occ = Hash.new(0)
list_2_occ = Hash.new(0)
File.open('.input').readlines.each do |line|
    nums = line.split.map(&:to_i)
    list_1 << nums[0]
    list_2 << nums[1]

    list_1_occ[nums[0]] += 1
    list_2_occ[nums[1]] += 1
end

list_1 = list_1.sort
list_2 = list_2.sort

diffs = []
0.upto(list_1.length - 1) do |i|
    diffs << (list_1[i] - list_2[i]).abs()
end

similarity_score = 0
list_1_occ.each do |k, v|
    similarity_score += k * v * list_2_occ[k]
end


puts "Differences: #{diffs.inject(:+)}"
puts "Similarities #{similarity_score}"