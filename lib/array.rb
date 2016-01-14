class Array
  def my_uniq
    result = []
    each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    length.times do |start_idx|
      ((start_idx + 1)...length).each do |end_idx|
        if self[start_idx] + self[end_idx] == 0
          result << [start_idx, end_idx]
        end
      end
    end
    result
  end

  def my_transpose
    copy = self.dup
    copy.shift.zip(*copy)
  end

  def stock_picker
    result = []
    biggest_difference = 0
    (0...(size - 1)).each do |buy|
      ((buy + 1)...size).each do |sell|
        if (self[sell] - self[buy]) > biggest_difference
          biggest_difference = self[sell] - self[buy]
          result = [buy, sell]
        end
      end
    end
    result
  end
end
