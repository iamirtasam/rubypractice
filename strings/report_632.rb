# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid invoice value")
    super
  end
end

class TextEditor
  MIN_VALUE = 7
  MAX_VALUE = 173

  def initialize(invoice)
    @invoice = invoice
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "value \#{val} out of [7,173] range" unless (7..173).include?(val)
    @value = val
  end

  def value
    raise TextEditorError, "value not set" if @value.zero?
    @value
  end
end

test_values = [135, -1, 177, 170]

obj = TextEditor.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
