require 'spec_helper'

describe DisplayDate do

  subject { DisplayDate.new(d1, d2) }

  it 'can be initialized with only one argument' do
    DisplayDate.new Time.local(2001, 2, 3, 4, 5)
  end

  context 'single date' do

    let(:d1) { Time.local(2001, 2, 3, 4, 5) }
    let(:d2) { nil }

    describe 'as_date' do

      it 'displays "on date"' do
        expect(subject.as_date).to eq "on February 03, 2001"
      end

    end

    describe 'as_datetime' do

      it 'displays "on date at time"' do
        expect(subject.as_datetime).to eq "on February 03, 2001 at 04:05"
      end

    end

  end

  context 'two dates' do

    context 'on the same day' do

      let(:d1) { Time.local(2001, 2, 3, 4, 5) }
      let(:d2) { Time.local(2001, 2, 3, 6, 7) }

      describe 'as_date' do

        it 'displays "on d1 from t1 to t2"' do
          expect(subject.as_date).to eq "on February 03, 2001"
        end

      end

      describe 'as_datetime' do

        it 'displays "from d1 at t1 to d2 at t2"' do
          expect(subject.as_datetime).to eq "on February 03, 2001 from 04:05 to 06:07"
        end

      end

    end

    context 'on different days' do

      let(:d1) { Time.local(2001, 2, 3, 4, 5) }
      let(:d2) { Time.local(2001, 2, 4, 6, 7) }

      describe 'as_date' do

        it 'displays "On d1' do
          expect(subject.as_date).to eq "from February 03, 2001 to February 04, 2001"
        end

      end

      describe 'as_datetime' do

        it 'displays "from d1 at t1 to d2 at t2"' do
          expect(subject.as_datetime).to eq "from February 03, 2001 at 04:05 to February 04, 2001 at 06:07"
        end

      end

    end

  end

end
