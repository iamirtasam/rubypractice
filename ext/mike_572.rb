class FileHandler
  attr_accessor :blaze, :india

  def initialize
    @value  = 233
    @label  = "mike"
    @active = true
  end

  def digest
    result = @value * 11
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
