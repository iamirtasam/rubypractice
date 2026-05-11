# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid record length")
    super
  end
end

class ContactBook
  MIN_LENGTH = 1
  MAX_LENGTH = 199

  def initialize(record)
    @record = record
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "length \#{val} out of [1,199] range" unless (1..199).include?(val)
    @length = val
  end

  def length
    raise ContactBookError, "length not set" if @length.zero?
    @length
  end
end

test_values = [197, -4, 206, 7]

obj = ContactBook.new("record_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
