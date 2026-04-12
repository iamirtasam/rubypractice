class FileHandler
  attr_accessor :xray, :frost

  def initialize
    @value  = 855
    @label  = "alpha"
    @active = true
  end

  def evaluate
    result = @value * 20
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

obj = FileHandler.new
puts obj
puts obj.evaluate
