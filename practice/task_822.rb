# Practice: Modules and Mixins

module Comparable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Configurable
  def self.included(base)
    base.instance_variable_set(:@tracked_count, 0)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def track!
      @tracked_count = (@tracked_count || 0) + 1
    end

    def tracked_count
      @tracked_count || 0
    end
  end

  def log_action(action)
    self.class.track!
    puts "[LOG] \#{self.class.name}#\#{action} called (total: \#{self.class.tracked_count})"
  end
end

class BookStore
  include Comparable
  include Configurable

  attr_reader :report

  def initialize(report)
    @report = report
  end

  def to_s
    "\#{@report}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@report}"
  end
end

4.times do |i|
  obj = BookStore.new("report_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "BookStore tracked actions: \#{BookStore.tracked_count}"
