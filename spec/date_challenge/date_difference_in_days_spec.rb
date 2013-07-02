require 'date_challenge/date_difference_in_days'

module DateChallenge
  describe DateDifferenceInDays do

    describe '#to_i' do

      it 'is the difference in days' do
        earliest_date = double(year: 2012, month: 05, day: 01)
        latest_date   = double(year: 2013, month: 01, day: 10)
        DateDifferenceInDays.new(earliest_date, latest_date).to_i.should eq 375
      end

      # TODO: Edge cases

    end

  end
end