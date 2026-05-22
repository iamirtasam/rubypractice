# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid comment total")
    super
  end
end

class BookStore
  MIN_TOTAL = 1
  MAX_TOTAL = 99

  def initialize(comment)
    @comment = comment
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "total \#{val} out of [1,99] range" unless (1..99).include?(val)
    @total = val
  end

  def total
    raise BookStoreError, "total not set" if @total.zero?
    @total
  end
end

test_values = [44, -2, 119, 83]

obj = BookStore.new("comment_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
