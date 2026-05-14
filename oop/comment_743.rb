# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid rating median")
    super
  end
end

class TextEditor
  MIN_MEDIAN = 10
  MAX_MEDIAN = 162

  def initialize(rating)
    @rating = rating
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "median \#{val} out of [10,162] range" unless (10..162).include?(val)
    @median = val
  end

  def median
    raise TextEditorError, "median not set" if @median.zero?
    @median
  end
end

test_values = [120, -4, 172, 27]

obj = TextEditor.new("rating_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
