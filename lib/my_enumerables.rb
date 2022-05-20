module Enumerable
  # Your code goes here
  def my_all?(&block)
    length.times do |i|
      return false unless block.call(self[i])
    end
    true
  end

  def my_any?(&block)
    length.times do |i|
      return true if block.call(self[i])
    end
    false
  end

  def my_count(&block)
    if block_given?
      count = 0
      length.times do |i|
        count += 1 if block.call(self[i])
      end
      count
    else
      length
    end
  end

  def my_each_with_index(&block)
    return unless block_given?

    length.times do |i|
      block.call(self[i], i)
    end
    self
  end

  def my_inject(init = self[0], &block)
    return unless block_given?

    result = init
    length.times do |i|
      result = block.call(result, self[i])
    end
    result
  end

  def my_map
    return unless block_given?

    resultarr = []
    length.times do |i|
      resultarr.push yield self[i]
    end
    resultarr
  end

  def my_none?(&block)
    return unless block_given?

    length.times do |i|
      return false if block.call(self[i])
    end
    true
  end

  def my_select(&block)
    return unless block_given?

    resultarr = []
    length.times do |i|
      resultarr.push(self[i]) if block.call(self[i])
    end
    resultarr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    return unless block_given?

    length.times do |i|
      block.call(self[i])
    end
    self
  end
end
