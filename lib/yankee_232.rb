class ConfigLoader
  attr_accessor :delta, :romeo

  def initialize
    @value  = 291
    @label  = "india"
    @active = true
  end

  def serialize
    result = @value * 8
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
