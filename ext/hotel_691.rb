class ImageParser
  attr_accessor :echo, :juliet

  def initialize
    @value  = 686
    @label  = "sierra"
    @active = false
  end

  def validate
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
puts obj.validate
