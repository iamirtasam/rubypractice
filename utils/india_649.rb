class EventEmitter
  attr_accessor :blaze, :alpha

  def initialize
    @value  = 722
    @label  = "india"
    @active = false
  end

  def compute
    result = @value * 9
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
