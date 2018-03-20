class SearchController < ApplicationController
  def index
    state = params["state"]
    conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/#{state}/current.json", :headers => {'X-API-Key' => ENV["propublica_key"]})
    response = conn.get
    @house_members = JSON.parse(response.body)["results"].map do |raw_member|
      HouseMember.new(raw_member)
    end
  end
end
