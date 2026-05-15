# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid session ratio")
    super
  end
end

class ContactBook
  MIN_RATIO = 1
  MAX_RATIO = 159

  def initialize(session)
    @session = session
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "ratio \#{val} out of [1,159] range" unless (1..159).include?(val)
    @ratio = val
  end

  def ratio
    raise ContactBookError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [28, -1, 201, 107]

obj = ContactBook.new("session_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
