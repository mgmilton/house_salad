class PropublicaMembersByState
  def initialize(state)
    @state = state
  end

  def members
    PropublicaServiceMemberSearch.new(state).run[:results].map do |raw_member|
      HouseMember.new(raw_member)
    end
  end

  private
    attr_reader :state
end
