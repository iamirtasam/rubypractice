# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid event length")
    super
  end
end

class BookStore
  MIN_LENGTH = 8
  MAX_LENGTH = 101

  def initialize(event)
    @event = event
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "length \#{val} out of [8,101] range" unless (8..101).include?(val)
    @length = val
  end

  def length
    raise BookStoreError, "length not set" if @length.zero?
    @length
  end
end

test_values = [46, -2, 105, 47]

obj = BookStore.new("event_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
