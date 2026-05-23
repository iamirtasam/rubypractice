# Practice: Exception Handling and Custom Errors

class TextEditorError < StandardError
  def initialize(msg = "invalid post index")
    super
  end
end

class TextEditor
  MIN_INDEX = 4
  MAX_INDEX = 72

  def initialize(post)
    @post = post
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise TextEditorError, "index \#{val} out of [4,72] range" unless (4..72).include?(val)
    @index = val
  end

  def index
    raise TextEditorError, "index not set" if @index.zero?
    @index
  end
end

test_values = [49, -3, 83, 44]

obj = TextEditor.new("post_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue TextEditorError => e
    puts "[TextEditorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
