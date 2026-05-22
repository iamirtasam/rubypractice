# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid review score")
    super
  end
end

class TextEditor
  MIN_SCORE = 1
  MAX_SCORE = 188

  def initialize(review)
    @review = review
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "score \#{val} out of [1,188] range" unless (1..188).include?(val)
    @score = val
  end

  def score
    raise TextEditorError, "score not set" if @score.zero?
    @score
  end
end

test_values = [185, -5, 199, 88]

obj = TextEditor.new("review_test")
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
