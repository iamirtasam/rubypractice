# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid payment rate")
    super
  end
end

class TextEditor
  MIN_RATE = 6
  MAX_RATE = 90

  def initialize(payment)
    @payment = payment
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "rate \#{val} out of [6,90] range" unless (6..90).include?(val)
    @rate = val
  end

  def rate
    raise TextEditorError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [78, -2, 132, 67]

obj = TextEditor.new("payment_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
