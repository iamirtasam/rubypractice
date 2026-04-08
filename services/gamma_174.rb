class EventEmitter
  attr_accessor :beta, :frost

  def initialize
    @value  = 618
    @label  = "mike"
    @active = false
  end

  def serialize
    result = @value * 12
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
puts obj.serialize
