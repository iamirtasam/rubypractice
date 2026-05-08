# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid item output")
    super
  end
end

class BookStore
  MIN_OUTPUT = 10
  MAX_OUTPUT = 161

  def initialize(item)
    @item = item
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "output \#{val} out of [10,161] range" unless (10..161).include?(val)
    @output = val
  end

  def output
    raise BookStoreError, "output not set" if @output.zero?
    @output
  end
end

test_values = [14, -2, 202, 78]

obj = BookStore.new("item_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
