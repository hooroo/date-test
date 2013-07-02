require_relative 'date_difference_in_days'

module DateChallenge
  class Date < Struct.new(:year, :month, :day)

    include Comparable

    EARLIEST_DATE = self.new(1900, 1, 1).freeze
    PATTERN = /(?<day>\d{2})\s(?<month>\d{2})\s(?<year>\d{4})/

    def self.parse(input_date)
      match = input_date.match PATTERN
      year  = match[:year].to_i
      month = match[:month].to_i
      day   = match[:day].to_i
      self.new(year, month, day)
    end

    def to_i
      DateDifferenceInDays.new(EARLIEST_DATE, self).to_i
    end

    def to_s
      "%02d %02d %04d" % [day, month, year]
    end

    private

    def <=>(other_date)
      to_i <=> other_date.to_i
    end

  end
end