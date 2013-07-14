require 'date_challenge/date'

module DateChallenge
  describe Date do

    describe '.parse' do

      it 'constructs the date with the correct day, month and year' do
        date = Date.parse('01 02 2013')
        expect(date.day).to   eq 1
        expect(date.month).to eq 2
        expect(date.year).to  eq 2013
      end

    end

    describe '#to_s' do

      it 'formats the date correctly' do
        expect(Date.new(2000, 2, 1).to_s).to eq '01 02 2000'
      end

    end

    describe '#to_i' do

      it 'is the number of days from 1900-01-01' do
        expect(Date.new(1900, 1, 2).to_i).to eq 1
        expect(Date.new(1900, 2, 1).to_i).to eq 31
        expect(Date.new(1901, 1, 1).to_i).to eq 365
        expect(Date.new(1901, 1, 2).to_i).to eq 366
        expect(Date.new(2013, 6, 30).to_i).to eq 41453 # verified with standard lib, cheat!
      end

    end

    it 'sorts chronologically' do
      first_date = Date.new(2012, 12, 25)
      last_date  = Date.new(2013, 3, 4)
      expect([ last_date, first_date ].sort).to eq [ first_date, last_date ]
      expect([ first_date, last_date ].sort).to eq [ first_date, last_date ]
    end

  end
end