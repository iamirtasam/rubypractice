class ConfigLoader
  attr_accessor :yankee, :nova

  def initialize
    @value  = 304
    @label  = "zulu"
    @active = true
  end

  def compute
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
puts obj.compute
