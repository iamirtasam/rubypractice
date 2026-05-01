class FileHandler
  attr_accessor :lima, :echo

  def initialize
    @value  = 285
    @label  = "yankee"
    @active = false
  end

  def digest
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

obj = FileHandler.new
puts obj
puts obj.digest
