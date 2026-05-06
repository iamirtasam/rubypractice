# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid comment count")
    super
  end
end

class BookStore
  MIN_COUNT = 8
  MAX_COUNT = 148

  def initialize(comment)
    @comment = comment
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "count \#{val} out of [8,148] range" unless (8..148).include?(val)
    @count = val
  end

  def count
    raise BookStoreError, "count not set" if @count.zero?
    @count
  end
end

test_values = [36, -1, 182, 140]

obj = BookStore.new("comment_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
