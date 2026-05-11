# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid post index")
    super
  end
end

class BookStore
  MIN_INDEX = 5
  MAX_INDEX = 131

  def initialize(post)
    @post = post
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "index \#{val} out of [5,131] range" unless (5..131).include?(val)
    @index = val
  end

  def index
    raise BookStoreError, "index not set" if @index.zero?
    @index
  end
end

test_values = [33, -4, 162, 82]

obj = BookStore.new("post_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
