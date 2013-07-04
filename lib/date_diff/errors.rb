module DateDiff
  module Errors
    class Error < StandardError ; end

    class DateInvalid < Error ; end
    class YearInvalid < Error ; end
    class MonthInvalid < Error ; end
    class DayInvalid < Error ; end
  end
end
