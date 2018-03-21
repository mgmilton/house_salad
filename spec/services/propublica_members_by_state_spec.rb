require "rails_helper"

describe PropublicaMembersByState do
  context "Instance methods" do
    let(:search) {PropublicaMembersByState.new("CO")}
    context "#members" do
      it "returns members for a valid state" do
        json_response = File.open("./spec/fixtures/house_members.json")
        stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
        .to_return(status: 200, body: json_response, headers: {})
        expect(search.members.count).to eq(7)
        expect(search.members.first).to be_a HouseMember
      end
    end
  end
end
