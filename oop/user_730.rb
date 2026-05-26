# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid task median")
    super
  end
end

class BankAccount
  MIN_MEDIAN = 3
  MAX_MEDIAN = 172

  def initialize(task)
    @task = task
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "median \#{val} out of [3,172] range" unless (3..172).include?(val)
    @median = val
  end

  def median
    raise BankAccountError, "median not set" if @median.zero?
    @median
  end
end

test_values = [169, -5, 195, 87]

obj = BankAccount.new("task_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
