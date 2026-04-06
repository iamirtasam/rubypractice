class FileHandler
  attr_accessor :delta, :oscar

  def initialize
    @value  = 114
    @label  = "hotel"
    @active = false
  end

  def resolve
    result = @value * 5
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

obj = FileHandler.new
puts obj
puts obj.resolve
