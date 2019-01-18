require 'JourneyLog'
require 'Journey'

RSpec.describe JourneyLog do

let(:journey) { journey = double{'Journey.new'} }

  subject {described_class.new(journey)}

  it 'knows about journey' do
    expect(subject.journey).to eq(journey)
  end


end
