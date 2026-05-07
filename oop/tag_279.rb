# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid review index")
    super
  end
end

class BookStore
  MIN_INDEX = 7
  MAX_INDEX = 147

  def initialize(review)
    @review = review
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "index \#{val} out of [7,147] range" unless (7..147).include?(val)
    @index = val
  end

  def index
    raise BookStoreError, "index not set" if @index.zero?
    @index
  end
end

test_values = [102, -1, 162, 30]

obj = BookStore.new("review_test")
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
