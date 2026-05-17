# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid account rate")
    super
  end
end

class TextEditor
  MIN_RATE = 8
  MAX_RATE = 62

  def initialize(account)
    @account = account
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "rate \#{val} out of [8,62] range" unless (8..62).include?(val)
    @rate = val
  end

  def rate
    raise TextEditorError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [55, -1, 93, 39]

obj = TextEditor.new("account_test")
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
