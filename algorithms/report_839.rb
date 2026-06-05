# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid message count")
    super
  end
end

class BookStore
  MIN_COUNT = 6
  MAX_COUNT = 192

  def initialize(message)
    @message = message
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "count \#{val} out of [6,192] range" unless (6..192).include?(val)
    @count = val
  end

  def count
    raise BookStoreError, "count not set" if @count.zero?
    @count
  end
end

test_values = [114, -3, 198, 166]

obj = BookStore.new("message_test")
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
