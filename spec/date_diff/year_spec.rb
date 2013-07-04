require 'spec_helper'
require 'date_diff/year'
require 'date_diff/month'

describe DateDiff::Year do

  subject { DateDiff::Year.new(year) }

  let(:year) { '2013' }

  describe 'valid years' do

    describe '#to_i' do
      it 'returns the year as an integer' do
        subject.to_i.must_equal 2013
      end
    end

    describe '#days_in_year' do

      describe 'for a leap year' do
        let(:year) { 2012 }

        it 'returns 366' do
          subject.days_in_year.must_equal 366
        end
      end

      describe 'for a non-leap year' do
        it 'returns 365' do
          subject.days_in_year.must_equal 365
        end
      end
    end

    describe '#days_in_month' do

      describe 'valid months' do

        [
          { year: '2013', month: 1, expectation: 31 },
          { year: '1', month: 1, expectation: 31 },
          { year: '2013', month: 2, expectation: 28 },
          { year: '2016', month: 2, expectation: 29 },
          { year: '2013', month: 4, expectation: 30 },
          { year: '1', month: 4, expectation: 30 }

        ].each do |year|

          describe "for #{year[:year]}" do

            let(:year) { year[:year] }
            let(:month) { DateDiff::Month.new(year[:month]) }

            it "returns #{year[:expectation]}" do
              subject.days_in_month(month).must_equal year[:expectation]
            end
          end
        end
      end

      describe 'invalid months' do

        [
          { year: 2013, month: 0 },
          { year: 2013, month: -1 },
          { year: 2013, month: 'A' }

        ].each do |year|

          describe "for #{year[:year]}" do

            let(:year) { year[:year] }

            it 'raises an exception' do
              proc { subject.days_in_month(year[:month]) }.must_raise DateDiff::Errors::MonthInvalid
            end
          end
        end
      end
    end
  end

  describe 'invalid years' do

    [
      0,
      '0',
      -1,
      '-1',
      'A'

    ].each do |year|

      describe "for #{year}" do

        let(:year) { year }

        describe '#days_in_month' do
          it 'raises an exception' do
            proc { subject }.must_raise DateDiff::Errors::YearInvalid
          end
        end
      end
    end
  end
end
