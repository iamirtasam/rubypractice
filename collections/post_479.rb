# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid report height")
    super
  end
end

class BookStore
  MIN_HEIGHT = 5
  MAX_HEIGHT = 136

  def initialize(report)
    @report = report
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "height \#{val} out of [5,136] range" unless (5..136).include?(val)
    @height = val
  end

  def height
    raise BookStoreError, "height not set" if @height.zero?
    @height
  end
end

test_values = [80, -3, 157, 70]

obj = BookStore.new("report_test")
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
