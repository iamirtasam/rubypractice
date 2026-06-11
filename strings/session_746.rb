# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid comment discount")
    super
  end
end

class BankAccount
  MIN_DISCOUNT = 8
  MAX_DISCOUNT = 195

  def initialize(comment)
    @comment = comment
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "discount \#{val} out of [8,195] range" unless (8..195).include?(val)
    @discount = val
  end

  def discount
    raise BankAccountError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [93, -1, 243, 105]

obj = BankAccount.new("comment_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
