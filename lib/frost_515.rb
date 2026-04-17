class EventEmitter
  attr_accessor :hotel, :nova

  def initialize
    @value  = 685
    @label  = "echo"
    @active = true
  end

  def compute
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

obj = EventEmitter.new
puts obj
puts obj.compute
