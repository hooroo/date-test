require 'date_diff/errors'

module DateDiff
  class Month

    def initialize month
      @raw_month = month
      @month = month.to_i
      validate_month!
    end

    def to_i
      @month
    end

    private

      attr_reader :raw_month, :month

      def valid?
        month > 0 && month <= 12
      end

      def validate_month!
        raise Errors::MonthInvalid, "#{raw_month} is an invalid month" unless valid?
      end
  end
end
