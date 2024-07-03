class Calculator
    def add(numbers)
      return 0 if numbers.empty?
      
      delimiter = ","
      if numbers.start_with?("//")
        parts = numbers.split("\n", 2)
        delimiter = parts[0][2..]
        numbers = parts[1]
      end
  
      numbers = numbers.split(/[#{delimiter}\n]/).map(&:to_i)
      negatives = numbers.select { |num| num < 0 }
  
      unless negatives.empty?
        raise "negative numbers not allowed: #{negatives.join(", ")}"
      end

      numbers.sum
    end
end

  