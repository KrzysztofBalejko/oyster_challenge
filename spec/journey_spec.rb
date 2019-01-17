require 'Journey'
require 'Oystercard'

RSpec.describe Journey do
  let(:paddington) { entry_station = double('Paddington (entry)') }
    let(:victoria) { exit_station = double('Victoria (exit)') }

  subject{described_class.new("Greenwich", "Old Street")}

  it 'knows the entry station' do
    expect(subject.entry_station).to eq("Greenwich")
  end

  it 'knows the exit station' do
    expect(subject.exit_station).to eq("Old Street")
  end

  it 'knows whether user is travelling' do


    card = Oystercard.new
    card.top_up(Oystercard::MIN_FARE)
    card.touch_in(paddington)
    journey = Journey.new(paddington, paddington)
    expect(card).to be_travelling
  end

end
