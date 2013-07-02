require_relative 'year'
require_relative 'month'

module DateChallenge
  class DateDifferenceInDays

    def initialize(earliest_date, latest_date)
      @earliest_date = earliest_date
      @latest_date = latest_date
    end

    def to_i
      difference_in_days
    end

    private

    attr_reader :earliest_date, :latest_date

    def difference_in_days
      whole_year_days + whole_month_days + remaining_days
    end

    def whole_year_days
      (earliest_date.year...latest_date.year).inject(0) do |sum, y|
        sum += Year.new(y).number_of_days
      end
    end

    def whole_month_days
      (earliest_date.month...latest_date.month).inject(0) do |sum, m|
        sum += Month.new(m).number_of_days
      end
    end

    def remaining_days
      latest_date.day - earliest_date.day
    end

  end
end