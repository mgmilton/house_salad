class PropublicaServiceMemberSearch
  def initialize(state)
    @state = state
  end

  def run
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :state
    def response
      conn.get
    end

    def conn
      Faraday.new(:url => "https://api.propublica.org/congress/v1/members/house/#{state}/current.json", :headers => {'X-API-Key' => ENV["propublica_key"]})
    end
end
