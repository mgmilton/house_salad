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
      conn.get("/congress/v1/members/house/#{state}/current.json")
    end

    def conn
      Faraday.new(:url => "https://api.propublica.org", :headers => headers)
    end

    def headers
      {'X-API-Key' => ENV["propublica_key"]}
    end
end
