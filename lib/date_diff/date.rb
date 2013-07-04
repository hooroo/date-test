require 'date_diff/year'
require 'date_diff/month'
require 'date_diff/errors'

module DateDiff
  class Date

    def initialize date
      @date = date
      @raw_day, @raw_month, @raw_year = parse_date!
      validate_date!
    end

    def days_into_year
      days_for_month + day
    end

    def days_from_end_of_year
      year.days_in_year - days_into_year
    end

    def year
      @year ||= Year.new(raw_year)
    end

    def month
      @month ||= Month.new(raw_month)
    end

    def day
      @day ||= raw_day.to_i
    end

    private

      attr_reader :raw_year, :raw_month, :raw_day, :date

      def parse_date!
        if result = date.scan(/^(\d{1,2})[ \/-](\d{1,2})[ \/-](\d{4})$/)[0]
          result
        else
          raise Errors::DateInvalid, "#{date} is an invalid date"
        end
      end

      def validate_date!
        day_valid!
      end

      def day_valid!
        raise Errors::DayInvalid, "#{raw_day} is an invalid day" if day <= 0 || day > 31 || day > year.days_in_month(month)
      end

      def days_for_month
        months_to_compute.inject(0) do |total, m|
          total + year.days_in_month(Month.new(m))
        end
      end

      def months_to_compute
        (1...month.to_i)
      end
  end
end
