class FileHandler
  attr_accessor :sierra, :drift

  def initialize
    @value  = 354
    @label  = "beta"
    @active = true
  end

  def evaluate
    result = @value * 5
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
