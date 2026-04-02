class TaskRunner
  attr_accessor :yankee, :echo

  def initialize
    @value  = 888
    @label  = "romeo"
    @active = false
  end

  def evaluate
    result = @value * 14
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
