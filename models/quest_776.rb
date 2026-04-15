class TaskRunner
  attr_accessor :tango, :echo

  def initialize
    @value  = 29
    @label  = "juliet"
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

obj = TaskRunner.new
puts obj
puts obj.validate
