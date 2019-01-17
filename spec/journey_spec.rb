require 'Journey'

RSpec.describe Journey do

  let(:paddington) { station = double('Paddington (entry)') }
  let(:waterloo) { station = double('Waterloo (exit)') }

  context 'Card behaviour during the journey' do

    it 'User can touch in' do
      subject.card.top_up(Journey::MIN_FARE)
      subject.touch_in(paddington)
      expect(subject).to be_travelling
    end

    it 'User can touch out' do
      subject.card.top_up(Journey::MIN_FARE)
      subject.touch_in(paddington)
      subject.touch_out(waterloo)
      expect(subject).not_to be_travelling
    end

    it 'is initially not in a journey' do
      expect(subject).not_to be_travelling
    end

    it 'raises error if insufficient funds' do
      expect{ subject.touch_in paddington }.to raise_error('insufficient funds')
    end

    it 'charges user fare on touch out' do
      subject.card.top_up(Oystercard::LIMIT)
      subject.touch_in(paddington)
      expect {subject.touch_out(waterloo)}.to change{subject.card.balance}.by(-Journey::MIN_FARE)
    end

    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it 'card remembers the entry station after the touch in' do
      subject.card.top_up(Oystercard::LIMIT)
      subject.touch_in(paddington)
      expect(subject.entry_station).to eq(paddington)
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument }

    it 'records the exit station on touch out' do
      subject.card.top_up(Oystercard::LIMIT)
      subject.touch_in(paddington)
      subject.touch_out(waterloo)
      expect(subject.exit_station).to eq(waterloo)
    end

    it 'checks the card has empty list of journeys by default' do
      expect(subject.journey_list).to be_empty
    end

    it 'checks touch_in and touch_out creates one journey' do
      subject.card.top_up(Oystercard::LIMIT)
      subject.touch_in('entry_station')
      subject.touch_out('exit_station')
      expect(subject.journey_list).to include :entry=>"entry_station", :exit=>"exit_station"
    end

  end


end
