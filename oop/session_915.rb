# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid post width")
    super
  end
end

class BookStore
  MIN_WIDTH = 9
  MAX_WIDTH = 135

  def initialize(post)
    @post = post
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "width \#{val} out of [9,135] range" unless (9..135).include?(val)
    @width = val
  end

  def width
    raise BookStoreError, "width not set" if @width.zero?
    @width
  end
end

test_values = [31, -2, 137, 112]

obj = BookStore.new("post_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
