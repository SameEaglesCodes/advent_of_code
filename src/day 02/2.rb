safe_count = 0
File.open('.input').readlines.each do |line|
    pattern = line.split.map(&:to_i)
    safe = true
    state = nil

    1.upto(pattern.length - 1) do |i|
        diff = pattern[i] - pattern[i - 1]

        if diff == 0 || diff.abs > 3
            safe = false
            break
        end

        dir = diff > 0 ? :up : :down

        if state.nil?
            state = dir
        elsif state != dir
            safe = false
            break
        end
    end
    safe_count += 1 if safe
end

def is_safe(report)
    state = nil
    1.upto(report.length - 1) do |i|

        diff = report[i] - report[i - 1]

        return  false if diff == 0 || diff.abs > 3

        dir = diff > 0 ? :up : :down

        if state.nil?
            state = dir
        elsif state != dir
            return false
        end
    end
end

def safe_with_dampener(report)
    0.upto(report.length - 1) do |i|
        r = report.dup
        r.delete_at(i)
        return true if is_safe(r)
    end
    false
end



reports = File.open('.input').readlines.to_a.map { |report| report.strip.split.map(&:to_i) }

safe = 0
safe_w_dampener = 0

reports.each do |report|
    safe += 1 if is_safe(report)
    safe_w_dampener += 1 if safe_with_dampener(report)
end

puts safe
puts safe_w_dampener