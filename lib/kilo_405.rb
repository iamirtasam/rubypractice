class RequestQueue
  attr_accessor :lima, :foxtrot

  def initialize
    @value  = 884
    @label  = "amber"
    @active = true
  end

  def validate
    result = @value * 4
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

obj = RequestQueue.new
puts obj
puts obj.validate
