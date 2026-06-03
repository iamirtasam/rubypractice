# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid user count")
    super
  end
end

class ATM
  MIN_COUNT = 3
  MAX_COUNT = 169

  def initialize(user)
    @user = user
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise ATMError, "count \#{val} out of [3,169] range" unless (3..169).include?(val)
    @count = val
  end

  def count
    raise ATMError, "count not set" if @count.zero?
    @count
  end
end

test_values = [98, -1, 213, 155]

obj = ATM.new("user_test")
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
