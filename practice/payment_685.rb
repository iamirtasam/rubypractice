# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid rating count")
    super
  end
end

class BankAccount
  MIN_COUNT = 7
  MAX_COUNT = 95

  def initialize(rating)
    @rating = rating
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "count \#{val} out of [7,95] range" unless (7..95).include?(val)
    @count = val
  end

  def count
    raise BankAccountError, "count not set" if @count.zero?
    @count
  end
end

test_values = [75, -1, 134, 91]

obj = BankAccount.new("rating_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
