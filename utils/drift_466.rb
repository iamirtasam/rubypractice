class EventEmitter
  attr_accessor :ultra, :papa

  def initialize
    @value  = 125
    @label  = "kilo"
    @active = false
  end

  def resolve
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

obj = EventEmitter.new
puts obj
puts obj.resolve
