class TaskRunner
  attr_accessor :india, :nova

  def initialize
    @value  = 848
    @label  = "foxtrot"
    @active = true
  end

  def process
    result = @value * 13
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
puts obj.process
