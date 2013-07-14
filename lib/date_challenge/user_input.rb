require_relative 'date'

module DateChallenge
  class UserInput

    FORMAT = /\d{2}\s\d{2}\s\d{4},{1}\s\d{2}\s\d{2}\s\d{4}/

    def initialize(input)
      @input = input
    end

    def valid?
      input =~ FORMAT
    end

    def dates
      return [] unless valid?
      parts.collect { |date| Date.parse(date) }
    end

    private

    attr_reader :input

    def parts
      input.split(',')
    end

  end
end