require 'date_challenge/user_input'

module DateChallenge
  describe UserInput do

    describe '#valid?' do

      it 'demands a format of DD MM YYYY, DD MM YYYY' do
        expect(UserInput.new('bacon!').valid?).to be_false
        expect(UserInput.new('01 01 2000 02 03 2010').valid?).to be_false
        expect(UserInput.new('01 01 2000, 02 03 201').valid?).to be_false
        expect(UserInput.new('10 01 2013, 05 12 2004').valid?).to be_true
      end

    end

    describe '#dates' do

      it 'is an array of correctly-parsed dates' do
        input = UserInput.new('10 01 2013, 05 12 2004')
        expect(input.dates).to eq [ Date.new(2013, 1, 10), Date.new(2004, 12, 5) ]
      end

      context 'when the input is invalid' do

        it 'is empty' do
          input = UserInput.new('irrelevant')
          input.stub(:valid? => false)
          expect(input.dates).to be_empty
        end
      end

    end

  end
end