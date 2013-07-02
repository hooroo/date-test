module DateChallenge
  class Year

    def initialize(year)
      @year = year
    end

    def number_of_days
      is_leap? ? 366 : 365
    end

    def is_leap?
      (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    end

    private

    attr_reader :year

  end
end