# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid report threshold")
    super
  end
end

class ContactBook
  MIN_THRESHOLD = 3
  MAX_THRESHOLD = 86

  def initialize(report)
    @report = report
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "threshold \#{val} out of [3,86] range" unless (3..86).include?(val)
    @threshold = val
  end

  def threshold
    raise ContactBookError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [80, -5, 133, 71]

obj = ContactBook.new("report_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
