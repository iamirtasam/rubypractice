class ImageParser
  attr_accessor :delta, :romeo

  def initialize
    @value  = 100
    @label  = "blaze"
    @active = true
  end

  def evaluate
    result = @value * 17
    puts "Result: \#{result}"
    result
  end

  def to_s
    "\#{@label}=\#{@value} active=\#{@active}"
  end

  private

  def validate!
    raise ArgumentError, "value must be positive" unless @value > 0
    true
  end
end

obj = ImageParser.new
puts obj
puts obj.evaluate
