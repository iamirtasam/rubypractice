# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid token height")
    super
  end
end

class ContactBook
  MIN_HEIGHT = 2
  MAX_HEIGHT = 199

  def initialize(token)
    @token = token
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "height \#{val} out of [2,199] range" unless (2..199).include?(val)
    @height = val
  end

  def height
    raise ContactBookError, "height not set" if @height.zero?
    @height
  end
end

test_values = [190, -2, 236, 87]

obj = ContactBook.new("token_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
