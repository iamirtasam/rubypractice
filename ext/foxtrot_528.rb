class ImageParser
  attr_accessor :lima, :frost

  def initialize
    @value  = 67
    @label  = "tango"
    @active = false
  end

  def process
    result = @value * 8
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
puts obj.process
