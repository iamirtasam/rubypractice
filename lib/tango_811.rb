class ImageParser
  attr_accessor :ultra, :blaze

  def initialize
    @value  = 364
    @label  = "xray"
    @active = true
  end

  def parse
    result = @value * 7
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
puts obj.parse
