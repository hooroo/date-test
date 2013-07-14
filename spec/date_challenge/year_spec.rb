require 'date_challenge/year'

module DateChallenge
  describe Year do

    describe '#number_of_days' do

      it 'is 366 for a leap year' do
        expect(Year.new(1992).number_of_days).to eq 366
      end

      it 'is 365 for a non-leap year' do
        expect(Year.new(2005).number_of_days).to eq 365
      end
    end

    describe '#is_leap?' do

      context 'when the year is divisible by 4' do
        it 'is true' do
          expect(Year.new(1992).is_leap?).to be_true
          expect(Year.new(2004).is_leap?).to be_true
        end
      end

      context 'when the year is divisible by 100 but not 400' do
        it 'is false' do
          expect(Year.new(1900).is_leap?).to be_false
          expect(Year.new(2100).is_leap?).to be_false
        end
      end

      context 'when the year is divisible by 100 and 400' do
        it 'is true' do
          expect(Year.new(2000).is_leap?).to be_true
          expect(Year.new(2400).is_leap?).to be_true
        end
      end

    end

  end
end