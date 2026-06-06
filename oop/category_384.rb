# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid payment ratio")
    super
  end
end

class BookStore
  MIN_RATIO = 6
  MAX_RATIO = 160

  def initialize(payment)
    @payment = payment
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "ratio \#{val} out of [6,160] range" unless (6..160).include?(val)
    @ratio = val
  end

  def ratio
    raise BookStoreError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [22, -4, 184, 126]

obj = BookStore.new("payment_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
