require 'date_challenge/month'

module DateChallenge

  describe UserInput do

    describe '#dates' do
      it ''
    end

  end

  describe Month do

    describe '#number_of_days' do

      it 'is the number of days in the month' do
        Month.new(1).number_of_days.should eq 31
        Month.new(2).number_of_days.should eq 28
        Month.new(3).number_of_days.should eq 31
      end

      context "when it's a leap year" do
        it 'knows Feb has 29 days' do
          Month.new(2, true).number_of_days.should eq 29
        end
      end

    end

  end
end