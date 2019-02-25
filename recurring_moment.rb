require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    i = 1

    while current <= date
      # binding.pry
      if current == date
        return true
      end

      if @period == 'monthly'
        current = @start.advance(months: @interval * i)
      elsif @period =='weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end

      i += 1
    end

    return false
  end
end

# recurrence = RecurringMoment.new(period: "monthly", interval: 1, start: DateTime.parse('Jan 31, 2018'))
# recurrence.match(DateTime.parse('May 31, 2018'))
