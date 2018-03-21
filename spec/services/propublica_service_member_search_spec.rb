require "rails_helper"

describe PropublicaServiceMemberSearch do
  it "has a collection of raw member data" do
    json_response = File.open("./spec/fixtures/house_members.json")
    stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
    .to_return(status: 200, body: json_response, headers: {})
    search = PropublicaServiceMemberSearch.new("CO").run
    raw_member = search[:results].first

    expect(search[:results]).to be_an Array
    expect(raw_member).to be_a Hash

    expect(raw_member).to have_key :name
    expect(raw_member[:name]).to be_a String

    expect(raw_member).to have_key :role
    expect(raw_member[:role]).to be_a String

    expect(raw_member).to have_key :district
    expect(raw_member[:district]).to be_a String

    expect(raw_member).to have_key :party
    expect(raw_member[:party]).to be_a String

  end
end
