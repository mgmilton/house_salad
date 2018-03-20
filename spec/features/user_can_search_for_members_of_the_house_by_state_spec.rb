require "rails_helper"

feature "User can search for members of the house by state" do
  context "with a valid state" do
    it "returns house members" do
      json_response = File.open("./spec/fixtures/house_members.json")
      stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
      .to_return(status: 200, body: json_response, headers: {})
      visit '/'
      select "Colorado", from: "state"
      click_on "Locate Members of the House"
      expect(current_path).to eq("/search")
      expect(current_url).to include("state=CO")
      expect(page).to have_content("7 results")
      expect(page).to have_css(".member", count: 7)
      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_content("Diana DeGette")
        expect(page).to have_css(".role")
        expect(page).to have_content("Representative")
        expect(page).to have_css(".party")
        expect(page).to have_content("D")
        expect(page).to have_css(".district")
        expect(page).to have_content("1")
      end
    end
  end
end
