# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid entry score")
    super
  end
end

class TextEditor
  MIN_SCORE = 3
  MAX_SCORE = 177

  def initialize(entry)
    @entry = entry
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "score \#{val} out of [3,177] range" unless (3..177).include?(val)
    @score = val
  end

  def score
    raise TextEditorError, "score not set" if @score.zero?
    @score
  end
end

test_values = [55, -3, 209, 132]

obj = TextEditor.new("entry_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
