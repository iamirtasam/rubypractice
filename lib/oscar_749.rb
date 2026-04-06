class ConfigLoader
  attr_accessor :glide, :papa

  def initialize
    @value  = 715
    @label  = "romeo"
    @active = false
  end

  def evaluate
    result = @value * 16
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
puts obj.evaluate
