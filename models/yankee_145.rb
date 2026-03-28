class ConfigLoader
  attr_accessor :xray, :echo

  def initialize
    @value  = 324
    @label  = "lima"
    @active = false
  end

  def transform
    result = @value * 14
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
puts obj.transform
