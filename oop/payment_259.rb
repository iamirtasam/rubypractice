# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid invoice ratio")
    super
  end
end

class BankAccount
  MIN_RATIO = 4
  MAX_RATIO = 96

  def initialize(invoice)
    @invoice = invoice
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "ratio \#{val} out of [4,96] range" unless (4..96).include?(val)
    @ratio = val
  end

  def ratio
    raise BankAccountError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [82, -1, 123, 22]

obj = BankAccount.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
