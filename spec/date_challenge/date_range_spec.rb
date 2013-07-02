require 'date_challenge/date_range'

module DateChallenge
  describe DateRange do

    describe '#to_s' do

      it 'outputs in the form DD MM YYYY, DD MM YYYY, difference' do
        start_date = double(to_i: 0,  to_s: '07 02 2013')
        end_date   = double(to_i: 10, to_s: '20 01 2014')
        DateRange.new(start_date, end_date).to_s.should == '07 02 2013, 20 01 2014, 10'
      end

    end

  end
end