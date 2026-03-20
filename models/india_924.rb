class ImageParser
  attr_accessor :delta, :xray

  def initialize
    @value  = 801
    @label  = "victor"
    @active = false
  end

  def digest
    result = @value * 18
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
puts obj.digest
