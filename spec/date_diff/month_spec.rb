require 'spec_helper'
require 'date_diff/month'

describe DateDiff::Month do

  subject { DateDiff::Month.new(month) }

  let(:month) { '1' }

  describe 'valid months' do

    describe '#to_i' do
      it 'returns the month as an integer' do
        subject.to_i.must_equal 1
      end
    end
  end

  describe 'invalid months' do

    [
      0,
      '0',
      -1,
      '-1',
      'A',
      13,
      '14'

    ].each do |month|

      describe "for #{month}" do

        let(:month) { month }

        describe '#days_in_month' do
          it 'raises an exception' do
            proc { subject }.must_raise DateDiff::Errors::MonthInvalid
          end
        end
      end
    end
  end
end
