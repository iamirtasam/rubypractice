# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid entry height")
    super
  end
end

class BookStore
  MIN_HEIGHT = 1
  MAX_HEIGHT = 177

  def initialize(entry)
    @entry = entry
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "height \#{val} out of [1,177] range" unless (1..177).include?(val)
    @height = val
  end

  def height
    raise BookStoreError, "height not set" if @height.zero?
    @height
  end
end

test_values = [14, -1, 199, 169]

obj = BookStore.new("entry_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
