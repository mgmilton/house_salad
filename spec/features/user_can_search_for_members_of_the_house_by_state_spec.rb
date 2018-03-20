require "rails_helper"

feature "User can search for members of the house by state" do
  context "with a valid state" do
    # When I visit "/"
    it "returns house members" do
      visit '/'
      # And I select "Colorado" from the dropdown
      select "Colorado", from: "state"
      # And I click on "Locate Members from the House"
      click_on "Locate Members of the House"
      # Then my path should be "/search" with "state=CO" in the parameters
      expect(current_path).to eq("/search")
      expect(current_url).to include("state=CO")
      # And I should see a message "7 Results"
      expect(page).to have_content("7 results")
      # And I should see a list of 7 the members of the house for Colorado
      expect(page).to have_css(".member", count: 7)
      # And they should be ordered by seniority from most to least
      # And I should see a name, role, party, and district for each member
      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".role")
        expect(page).to have_css(".party")
        expect(page).to have_css(".district")
      end
    end
  end
end
