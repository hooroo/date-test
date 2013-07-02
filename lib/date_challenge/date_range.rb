module DateChallenge

  class DateRange

    def initialize(start_date, end_date)
      dates = [ start_date, end_date ].sort
      @start_date = dates.first
      @end_date   = dates.last
    end

    def to_s
      "#{start_date}, #{end_date}, #{difference_in_days}"
    end

    private

    attr_accessor :start_date, :end_date

    def difference_in_days
      @difference_in_days ||= end_date.to_i - start_date.to_i
    end

  end

end