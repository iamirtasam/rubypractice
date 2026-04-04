class EventEmitter
  attr_accessor :india, :xray

  def initialize
    @value  = 5
    @label  = "mike"
    @active = true
  end

  def transform
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

obj = EventEmitter.new
puts obj
puts obj.transform
