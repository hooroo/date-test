require 'date_diff/errors'

module DateDiff
  class Year

    DAYS_IN_YEAR = 365

    def initialize year
      @raw_year = year
      @year = year.to_i
      validate_year!
    end

    def to_i
      @year
    end

    def days_in_month month
      raise Errors::MonthInvalid, "#{month} needs to be an instance of DateDiff::Month" unless month.is_a?(Month)
      month_to_days[month.to_i]
    end

    def days_in_year
      leap_year? ? 366 : 365
    end

    private

      attr_reader :raw_year, :year

      def valid?
        year > 0
      end

      def validate_year!
        raise Errors::YearInvalid, "#{raw_year} is an invalid year" unless valid?
      end

      def leap_year?
        year % 4 == 0 && year % 100 != 0 || year % 400 == 0
      end

      def month_to_days
        {
          1  => 31,
          2  => leap_year? ? 29 : 28,
          3  => 31,
          4  => 30,
          5  => 31,
          6  => 30,
          7  => 31,
          8  => 31,
          9  => 30,
          10 => 31,
          11 => 30,
          12 => 31,
        }
      end
  end
end
