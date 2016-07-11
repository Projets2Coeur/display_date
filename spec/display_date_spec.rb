require 'spec_helper'

describe DisplayDate do

  before do
    I18n.locale = :fr
  end

  subject { DisplayDate.new(d1, d2) }

  it 'can be initialized with only one argument' do
    DisplayDate.new Time.local(2001, 2, 3, 4, 5)
  end

  context 'single date' do

    let(:d1) { Time.local(2001, 2, 3, 4, 5) }
    let(:d2) { nil }

    describe 'as_date' do

      it 'displays "on date"' do
        expect(subject.as_date).to eq "le 3 février 2001"
      end

    end

    describe 'as_datetime' do

      it 'displays "on date at time"' do
        expect(subject.as_datetime).to eq "le 3 février 2001 à 04:05"
      end

    end

  end

  context 'two dates' do

    context 'on the same day' do

      let(:d1) { Time.local(2001, 2, 3, 4, 5) }
      let(:d2) { Time.local(2001, 2, 3, 6, 7) }

      describe 'as_date' do

        it 'displays "on d1 from t1 to t2"' do
          expect(subject.as_date).to eq "le 3 février 2001"
        end

      end

      describe 'as_datetime' do

        it 'displays "from d1 at t1 to d2 at t2"' do
          expect(subject.as_datetime).to eq "le 3 février 2001 de 04:05 à 06:07"
        end

      end

    end

    context 'on different days' do

      let(:d1) { Time.local(2001, 2, 3, 4, 5) }
      let(:d2) { Time.local(2001, 2, 4, 6, 7) }

      describe 'as_date' do

        it 'displays "On d1' do
          expect(subject.as_date).to eq "du 3 février 2001 au 4 février 2001"
        end

      end

      describe 'as_datetime' do

        it 'displays "from d1 at t1 to d2 at t2"' do
          expect(subject.as_datetime).to eq "du 3 février 2001 à 04:05 au 4 février 2001 à 06:07"
        end

      end

    end

  end

end
