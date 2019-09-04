module UpcomingSlotsForUser
  class Query
    def initialize(user)
      @user = user
    end

    def call
      Slot
        .where(user: user)
        .where.not(guest_email: [nil, ''])
        .order(:scheduled_at)
    end

    private

    attr_reader :user
  end
end
