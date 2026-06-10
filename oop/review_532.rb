# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid tag score")
    super
  end
end

class TextEditor
  MIN_SCORE = 4
  MAX_SCORE = 126

  def initialize(tag)
    @tag = tag
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "score \#{val} out of [4,126] range" unless (4..126).include?(val)
    @score = val
  end

  def score
    raise TextEditorError, "score not set" if @score.zero?
    @score
  end
end

test_values = [90, -3, 135, 15]

obj = TextEditor.new("tag_test")
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
