class FileHandler
  attr_accessor :india, :echo

  def initialize
    @value  = 663
    @label  = "ultra"
    @active = true
  end

  def transform
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
puts obj.transform
