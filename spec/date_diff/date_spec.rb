require 'spec_helper'
require 'date_diff/date'

describe DateDiff::Date do

  subject { DateDiff::Date.new(date) }

  let(:date) { '1/1/2013' }

  describe 'valid dates' do

    describe '#days_into_year' do
      [
        { date: '1 1 2013', expectation: 1 },
        { date: '2 1 2013', expectation: 2 },
        { date: '2 1 2014', expectation: 2 },
        { date: '2 3 2014', expectation: 61 },
        { date: '30 12 2014', expectation: 364 },
        { date: '31 12 2012', expectation: 366 }

      ].each do |date|

        describe "for #{date[:date]}" do

          let(:date) { date[:date] }

          it "returns #{date[:expectation]}" do
            subject.days_into_year.must_equal date[:expectation]
          end
        end
      end
    end

    describe '#days_from_end_of_year' do
      [
        { date: '1 1 2013', expectation: 364 },
        { date: '1 1 2012', expectation: 365 },
        { date: '30 12 2012', expectation: 1 },

      ].each do |date|

        describe "for #{date[:date]}" do

          let(:date) { date[:date] }

          it "returns #{date[:expectation]}" do
            subject.days_from_end_of_year.must_equal date[:expectation]
          end
        end
      end
    end

    describe '#year' do
      it 'returns 2013' do
        subject.year.must_be_instance_of DateDiff::Year
        subject.year.to_i.must_equal 2013
      end
    end

    describe '#month' do
      it 'returns 1' do
        subject.month.must_be_instance_of DateDiff::Month
        subject.month.to_i.must_equal 1
      end
    end

    describe '#day' do
      it 'returns 1' do
        subject.day.must_equal 1
      end
    end
  end

  describe 'invalid dates' do

    [
      { date: '32 1 2013', expectation: 'DayInvalid' },
      { date: '31 2 2013', expectation: 'DayInvalid' },
      { date: '1 13 2013', expectation: 'MonthInvalid' },
      { date: '32 13 2013', expectation: 'DayInvalid' },
      { date: 'A 1 2013', expectation: 'DateInvalid' },
      { date: '1 B 2013', expectation: 'DateInvalid' },
      { date: 'A B 2013', expectation: 'DateInvalid' },
      { date: '-1 B 2013', expectation: 'DateInvalid' },
      { date: '1 -1 2013', expectation: 'DateInvalid' },
      { date: '1 1 0', expectation: 'DateInvalid' }

    ].each do |date|

      describe "for #{date}" do

        let(:date) { date[:date] }

        describe '#days_into_year' do
          it 'raises an exception' do
            proc { subject.days_into_year }.must_raise DateDiff::Errors.const_get(date[:expectation])
          end
        end
      end
    end
  end
end
