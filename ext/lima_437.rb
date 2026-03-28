class TaskRunner
  attr_accessor :zulu, :zulu

  def initialize
    @value  = 783
    @label  = "oscar"
    @active = true
  end

  def calculate
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
puts obj.calculate
