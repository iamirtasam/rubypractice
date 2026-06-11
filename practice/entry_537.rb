# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid category result")
    super
  end
end

class BookStore
  MIN_RESULT = 3
  MAX_RESULT = 197

  def initialize(category)
    @category = category
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "result \#{val} out of [3,197] range" unless (3..197).include?(val)
    @result = val
  end

  def result
    raise BookStoreError, "result not set" if @result.zero?
    @result
  end
end

test_values = [56, -5, 209, 168]

obj = BookStore.new("category_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
