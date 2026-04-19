class FileHandler
  attr_accessor :papa, :blaze

  def initialize
    @value  = 194
    @label  = "sierra"
    @active = false
  end

  def calculate
    result = @value * 10
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
puts obj.calculate
