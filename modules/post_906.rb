# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid task threshold")
    super
  end
end

class BankAccount
  MIN_THRESHOLD = 3
  MAX_THRESHOLD = 107

  def initialize(task)
    @task = task
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "threshold \#{val} out of [3,107] range" unless (3..107).include?(val)
    @threshold = val
  end

  def threshold
    raise BankAccountError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [25, -3, 152, 57]

obj = BankAccount.new("task_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
