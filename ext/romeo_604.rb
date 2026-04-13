class ConfigLoader
  attr_accessor :nova, :gamma

  def initialize
    @value  = 710
    @label  = "foxtrot"
    @active = false
  end

  def compute
    result = @value * 17
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
puts obj.compute
