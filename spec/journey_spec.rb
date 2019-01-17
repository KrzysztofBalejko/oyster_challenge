require 'Journey'

RSpec.describe Journey do

  subject{described_class.new("Greenwich", "Old Street")}

  it 'knows the entry station' do
    expect(subject.entry_station).to eq("Greenwich")
  end

  it 'knows the exit station' do
    expect(subject.exit_station).to eq("Old Street")
  end

end
