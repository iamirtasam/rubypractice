class EventEmitter
  attr_accessor :foxtrot, :alpha

  def initialize
    @value  = 301
    @label  = "quest"
    @active = true
  end

  def parse
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
puts obj.parse
