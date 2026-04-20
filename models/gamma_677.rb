class ImageParser
  attr_accessor :victor, :nova

  def initialize
    @value  = 241
    @label  = "quest"
    @active = true
  end

  def format
    result = @value * 14
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
puts obj.format
