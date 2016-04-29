class Series
  attr_reader :nums

  def initialize(nums)
    @nums = convert(nums)
  end

  def slices(length)
    raise ArgumentError if length > nums.size

    # original solution

    # index = 0
    # result = []
    # while index < nums.size
    #   slice = nums.slice(index, length)
    #   result << slice unless slice.size < length
    #   index += 1
    # end
    # result

    # refactor with each_with_index

    result = []
    nums.each_with_index do |num, index|
      break if index + length > nums.size
      result << nums.slice(index, length)
    end
    result
    
  end

  def convert(nums)
    result = nums.split('')
    result = result.map {|element| element.to_i}
  end

end

series = Series.new('01234')

print series.slices(1)
