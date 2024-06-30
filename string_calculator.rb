class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter_section = parts[0][2..-1]

      delimiters += extract_delimiters(delimiter_section)
      numbers = parts[1]
    end

    pattern = Regexp.union(delimiters)
    number_list = numbers.split(pattern).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    number_list.sum
  end

  private

  def self.extract_delimiters(delimiter_section)
    if delimiter_section.start_with?('[') && delimiter_section.end_with?(']')
      delimiter_section[1..-2].split('][')
    else
      [delimiter_section]
    end
  end
end

