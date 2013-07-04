require 'spec_helper'
require 'date_diff/dates'

describe DateDiff::Date do

  subject { DateDiff::Dates.new(earlier_date, later_date) }

  describe 'valid dates' do

    describe '#days_between' do

      [
        { earlier_date: '1 1 2013', later_date: '1 1 2013', expectation: 0 },
        { earlier_date: '1 1 2013', later_date: '2 1 2013', expectation: 1 },
        { earlier_date: '1 1 2012', later_date: '1 1 2017', expectation: 1827 },
        { earlier_date: '21 1 2012', later_date: '12 4 2017', expectation: 1908 },
        { earlier_date: '1 1 1900', later_date: '1 1 2010', expectation: 40177 }

      ].each do |date|

        describe "for '#{date[:earlier_date]}' and '#{date[:later_date]}'" do

          let(:earlier_date) { date[:earlier_date] }
          let(:later_date) { date[:later_date] }

          it "returns #{date[:expectation]}" do
            subject.days_between.must_equal date[:expectation]
          end
        end
      end
    end
  end

  describe 'invalid dates' do

    [
      { earlier_date: '32 1 2013', later_date: '2 1 2013', expectation: 'DayInvalid' },
      { earlier_date: '31 A 2013', later_date: '2 1 2013', expectation: 'DateInvalid' },
      { earlier_date: '31 1 2013', later_date: '2 13 2013', expectation: 'MonthInvalid' }

    ].each do |date|

      describe "for #{date}" do

        let(:earlier_date) { date[:earlier_date] }
        let(:later_date) { date[:later_date] }

        describe '#days_between' do
          it 'raises an exception' do
            proc { subject.days_between }.must_raise DateDiff::Errors.const_get(date[:expectation])
          end
        end
      end
    end
  end
end
