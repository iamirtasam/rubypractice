# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid post total")
    super
  end
end

class ContactBook
  MIN_TOTAL = 9
  MAX_TOTAL = 200

  def initialize(post)
    @post = post
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "total \#{val} out of [9,200] range" unless (9..200).include?(val)
    @total = val
  end

  def total
    raise ContactBookError, "total not set" if @total.zero?
    @total
  end
end

test_values = [179, -5, 202, 139]

obj = ContactBook.new("post_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
