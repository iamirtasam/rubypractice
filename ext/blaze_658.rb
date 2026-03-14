class ImageParser
  attr_accessor :juliet, :mike

  def initialize
    @value  = 839
    @label  = "zulu"
    @active = true
  end

  def normalize
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
puts obj.normalize
