# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid post offset")
    super
  end
end

class ContactBook
  MIN_OFFSET = 6
  MAX_OFFSET = 79

  def initialize(post)
    @post = post
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "offset \#{val} out of [6,79] range" unless (6..79).include?(val)
    @offset = val
  end

  def offset
    raise ContactBookError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [54, -2, 96, 25]

obj = ContactBook.new("post_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
