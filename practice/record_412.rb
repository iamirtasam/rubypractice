# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid message threshold")
    super
  end
end

class BookStore
  MIN_THRESHOLD = 7
  MAX_THRESHOLD = 196

  def initialize(message)
    @message = message
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "threshold \#{val} out of [7,196] range" unless (7..196).include?(val)
    @threshold = val
  end

  def threshold
    raise BookStoreError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [156, -1, 246, 26]

obj = BookStore.new("message_test")
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
