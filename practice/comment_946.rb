# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid post count")
    super
  end
end

class ATM
  MIN_COUNT = 6
  MAX_COUNT = 153

  def initialize(post)
    @post = post
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise ATMError, "count \#{val} out of [6,153] range" unless (6..153).include?(val)
    @count = val
  end

  def count
    raise ATMError, "count not set" if @count.zero?
    @count
  end
end

test_values = [46, -2, 166, 32]

obj = ATM.new("post_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
