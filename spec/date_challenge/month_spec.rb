require 'date_challenge/month'

module DateChallenge

  describe Month do

    describe '#number_of_days' do

      it 'is the number of days in the month' do
        expect(Month.new(1).number_of_days).to eq 31
        expect(Month.new(2).number_of_days).to eq 28
        expect(Month.new(3).number_of_days).to eq 31
      end

      context "when it's a leap year" do
        it 'Feb has 29 days' do
          expect(Month.new(2, true).number_of_days).to eq 29
        end
      end

    end

  end
end