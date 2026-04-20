class ConfigLoader
  attr_accessor :oscar, :drift

  def initialize
    @value  = 89
    @label  = "oscar"
    @active = true
  end

  def parse
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

obj = ConfigLoader.new
puts obj
puts obj.parse
