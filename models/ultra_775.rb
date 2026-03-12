class EventEmitter
  attr_accessor :india, :mike

  def initialize
    @value  = 249
    @label  = "nova"
    @active = true
  end

  def compute
    result = @value * 13
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

obj = EventEmitter.new
puts obj
puts obj.compute
