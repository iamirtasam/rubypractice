# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :report, :count

  def initialize(report, count = 78)
    @report  = report
    @count  = count
    @discount  = 0
    @history = []
  end

  def increment(amount = 5)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 5)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 78
    @history.clear
    self
  end

  def within_limit?(limit = 46)
    @count <= limit
  end

  def summary
    {
      report: @report,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[TextEditor] #{report}=\#{@report} count=\#{@count}"
  end
end

obj = TextEditor.new("report_\#{rand(100)}", 78)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
