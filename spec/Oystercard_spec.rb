require 'Oystercard'



RSpec.describe Oystercard do

let(:station) { station = double('entry station') }


  it 'Card has a default balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can be topped up' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'Raises an error if balance exceeds £90' do
      limit = Oystercard::LIMIT
      expect{ subject.top_up limit + 1 }.to raise_error "You're over the limit #{limit}"
    end
  end

  context 'Card behaviour during the journey' do

    it 'User can touch in' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(station)
      expect(subject).to be_travelling
    end

    it 'User can touch out' do
      expect(subject).not_to be_travelling
    end

    it 'is initially not in a journey' do
      expect(subject).not_to be_travelling
    end

    it 'Touch in changes journey status' do
      subject.top_up(Oystercard::MIN_FARE)
      expect{ subject.touch_in station }. to change { subject.journey }.to true
    end

    it 'raises error if insufficient funds' do
      expect{ subject.touch_in station }.to raise_error('insufficient funds')
    end

    it 'charges user fare on touch out' do
      subject.top_up(Oystercard::LIMIT)
      subject.touch_in(station)
      expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN_FARE)
    end

    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it 'card remembers the entry station after the touch in' do
      subject.top_up(Oystercard::LIMIT)
      expect(subject.touch_in(station)).to eq(station)
    end

    # it 'card forgets the entry station on touch out' do
    #
    # end



  end
end
