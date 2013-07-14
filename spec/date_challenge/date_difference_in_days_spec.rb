require 'date_challenge/date_difference_in_days'

module DateChallenge
  describe DateDifferenceInDays do

    # Would be cool if the order of dates didn't matter

    describe '#to_i' do

      it 'is the difference in days' do
        earliest_date = double(year: 2004, month: 01, day: 01)
        latest_date   = double(year: 2005, month: 05, day: 11)
        expect(DateDifferenceInDays.new(earliest_date, latest_date).to_i).to eq 496 # 366 + 120 + 10
      end

    end

  end
end