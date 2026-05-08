# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :report, :speed

  def initialize(report, speed = 27)
    @report  = report
    @speed  = speed
    @width  = 0
    @history = []
  end

  def increment(amount = 2)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 2)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 27
    @history.clear
    self
  end

  def within_limit?(limit = 352)
    @speed <= limit
  end

  def summary
    {
      report: @report,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[ParkingLot] #{report}=\#{@report} speed=\#{@speed}"
  end
end

obj = ParkingLot.new("report_\#{rand(100)}", 27)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
