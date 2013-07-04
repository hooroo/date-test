require 'date_diff/date'
require 'date_diff/year'

module DateDiff
  class Dates

    def initialize earlier_date, later_date
      @earlier_date = Date.new(earlier_date)
      @later_date = Date.new(later_date)
    end

    def days_between
      if later_date.year.to_i > earlier_date.year.to_i
        days_between_for_different_years
      else
        days_between_for_same_year
      end
    end

    private

      attr_reader :earlier_date, :later_date

      def years_between_dates
        (earlier_date.year.to_i + 1)..(later_date.year.to_i - 1)
      end

      # TODO: fix this overly complex method
      def days_between_for_different_years
        #  Work out the number of days in each year between the two dates
        total = (years_between_dates).inject(0) do |sum, year|
          sum += Year.new(year).days_in_year
          sum
        end

        # Now add on any extra days from earlier_date and later_date
        total + earlier_date.days_from_end_of_year + later_date.days_into_year
      end

      def days_between_for_same_year
        later_date.days_into_year - earlier_date.days_into_year
      end
  end
end
