# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid item threshold")
    super
  end
end

class BookStore
  MIN_THRESHOLD = 8
  MAX_THRESHOLD = 113

  def initialize(item)
    @item = item
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "threshold \#{val} out of [8,113] range" unless (8..113).include?(val)
    @threshold = val
  end

  def threshold
    raise BookStoreError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [60, -2, 114, 19]

obj = BookStore.new("item_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
