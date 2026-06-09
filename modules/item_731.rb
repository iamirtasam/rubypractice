# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid post speed")
    super
  end
end

class BankAccount
  MIN_SPEED = 7
  MAX_SPEED = 169

  def initialize(post)
    @post = post
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "speed \#{val} out of [7,169] range" unless (7..169).include?(val)
    @speed = val
  end

  def speed
    raise BankAccountError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [82, -1, 185, 89]

obj = BankAccount.new("post_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
