require_relative 'date'

module DateChallenge
  class UserInput

    def initialize(input)
      @input = input
    end

    # TODO: Implement!
    def valid?
      raise NotImplementedError
    end

    def dates
      parts.collect { |date| Date.parse(date) }
    end

    private

    attr_reader :input

    def parts
      input.split(',')
    end

  end
end