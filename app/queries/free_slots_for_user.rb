module FreeSlotsForUser
  class Query
    def initialize(user)
      @user = user
    end

    def call
      Slot.where(user: user, guest_email: [nil, ''])
    end

    private

    attr_reader :user
  end
end
