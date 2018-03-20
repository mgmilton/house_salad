class SearchController < ApplicationController
  def index
    @conn = Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/CO/current.json", :headers => {'X-API-Key' => ENV["propublica_key"]})
    @house_members = []
  end
end



class HouseMember
  attr_reader :name, :role, :party, :district
end
