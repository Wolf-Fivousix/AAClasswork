require "poker"

RSpec.describe Card do
end

RSpec.describe Deck do
    let(:clubs) { mock("1c") }
    let(:diamonds) { mock("5d") }
    let(:hearts) { double("10h") }
    let(:spades) { double("13s") }
    subject { Deck.new }
  it "Should include 52 card elements" do
    expect(subject.deck).to include(Card)
    expect(subject.deck.length).to eq(52)
    # expect(subject.deck.all? {|el| is_a?(Card)} )).to be true
  end

  # it "Have 52 unique Card elements" do
  #   # expect(subject).to include(:clubs, :diamonds, :hearts, :spades)
  #   # expect(subject).to include("1c", "5d", "10h", "13s")
  #   expect(subject.deck).to include("1c")
  # end
end

RSpec.describe Hand do
end

RSpec.describe Player do
end

RSpec.describe Game do
end