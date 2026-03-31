class EventEmitter
  attr_accessor :juliet, :zulu

  def initialize
    @value  = 225
    @label  = "amber"
    @active = true
  end

  def validate
    result = @value * 3
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
puts obj.validate
