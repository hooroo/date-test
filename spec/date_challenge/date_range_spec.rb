require 'date_challenge/date_range'
require 'date_challenge/date'

module DateChallenge
  describe DateRange do

    describe '#to_s' do

      it 'outputs in the form DD MM YYYY, DD MM YYYY, difference' do
        start_date = Date.new(2013, 1, 1)
        end_date   = Date.new(2013, 1, 10)
        DateRange.new(start_date, end_date).to_s.should == '01 01 2013, 10 01 2013, 9'
      end

      it 'displays the earliest date first' do
        start_date = Date.new(2013, 1, 10)
        end_date   = Date.new(2013, 1, 1)
        DateRange.new(start_date, end_date).to_s.should == '01 01 2013, 10 01 2013, 9'
      end

    end

  end
end