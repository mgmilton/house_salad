class SearchController < ApplicationController
  def index
    @house_members = PropublicaMembersByState.new(params[:state]).members



    state = params["state"]
    conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/#{state}/current.json", :headers => {'X-API-Key' => ENV["propublica_key"]})
    response = conn.get
    @house_members = JSON.parse(response.body, symbolize_names: true)[:results].map do |raw_member|
      HouseMember.new(raw_member)
    end
  end
end

class PropublicaMembersByState
  def initialize(state)
  end

  def members
  end
end
