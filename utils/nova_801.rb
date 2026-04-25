class ImageParser
  attr_accessor :frost, :romeo

  def initialize
    @value  = 990
    @label  = "xray"
    @active = false
  end

  def normalize
    result = @value * 4
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
puts obj.normalize
