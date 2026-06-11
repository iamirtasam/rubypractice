# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid invoice width")
    super
  end
end

class BookStore
  MIN_WIDTH = 9
  MAX_WIDTH = 145

  def initialize(invoice)
    @invoice = invoice
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "width \#{val} out of [9,145] range" unless (9..145).include?(val)
    @width = val
  end

  def width
    raise BookStoreError, "width not set" if @width.zero?
    @width
  end
end

test_values = [19, -5, 150, 35]

obj = BookStore.new("invoice_test")
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
