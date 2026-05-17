# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid payment index")
    super
  end
end

class ContactBook
  MIN_INDEX = 4
  MAX_INDEX = 162

  def initialize(payment)
    @payment = payment
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "index \#{val} out of [4,162] range" unless (4..162).include?(val)
    @index = val
  end

  def index
    raise ContactBookError, "index not set" if @index.zero?
    @index
  end
end

test_values = [25, -5, 185, 156]

obj = ContactBook.new("payment_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
