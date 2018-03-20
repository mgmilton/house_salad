require "rails_helper"

describe HouseMember do
  let(:attributes) {{
    name: "Diana DeGette",
    role: "Representative",
    party: "D",
    district: "1",
    seniority: "22" }}

  subject {HouseMember.new(attributes)}
  it "exists" do
    expect(subject).to be_a HouseMember
  end

  it "sets the required attributes" do
    expect(subject.name).to eq("Diana DeGette")
    expect(subject.role).to eq("Representative")
    expect(subject.party).to eq("D")
    expect(subject.district).to eq("1")
    expect(subject.seniority).to eq(22)
  end
end
