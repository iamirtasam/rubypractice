class TaskRunner
  attr_accessor :oscar, :alpha

  def initialize
    @value  = 757
    @label  = "quest"
    @active = false
  end

  def normalize
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

obj = TaskRunner.new
puts obj
puts obj.normalize
