class ConfigLoader
  attr_accessor :blaze, :gamma

  def initialize
    @value  = 348
    @label  = "victor"
    @active = true
  end

  def format
    result = @value * 2
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

obj = ConfigLoader.new
puts obj
puts obj.format
