class PropublicaServiceMemberSearch
  def initialize(state)
    @state = state
  end

  def run
    get_json("/congress/v1/members/house/#{state}/current.json")
  end

  private
    attr_reader :state

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(:url => "https://api.propublica.org", :headers => headers)
    end

    def headers
      {
        'X-API-Key' => ENV["propublica_key"]
      }
    end
end
