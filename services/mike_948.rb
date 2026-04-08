class ConfigLoader
  attr_accessor :yankee, :blaze

  def initialize
    @value  = 189
    @label  = "papa"
    @active = false
  end

  def serialize
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
puts obj.serialize
