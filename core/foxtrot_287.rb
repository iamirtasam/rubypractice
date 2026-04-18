class TaskRunner
  attr_accessor :victor, :mike

  def initialize
    @value  = 41
    @label  = "frost"
    @active = false
  end

  def evaluate
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

obj = TaskRunner.new
puts obj
puts obj.evaluate
