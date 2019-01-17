require 'Station'

RSpec.describe Station do


it 'check for name' do
  expect(subject.name).to eq("Victoria")
end

subject { described_class.new("Victoria", 2) }



end
