module DateChallenge

  class Month

    def initialize(month, is_leap_year = false)
      @month = month
      @is_leap_year = is_leap_year
    end

    def number_of_days
      days_in_month[month - 1]
    end

    private

    attr_accessor :month, :is_leap_year

    def days_in_month
      [ 31, is_leap_year ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
    end

  end

end