class SearchController < ApplicationController
  def index
    @house_members = PropublicaMembersByState.new(params[:state]).members
  end
end
