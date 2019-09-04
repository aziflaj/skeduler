module Slots
  class Builder
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      Slot.new(slot_params)
    end

    private

    attr_reader :user, :params

    def slot_params
      { user: user,
        scheduled_at: scheduled_at,
        notes: safe_params[:notes] }
    end

    def safe_params
      params.require(:slot).permit(:scheduled_at_date, :scheduled_at_time, :notes)
    end

    def scheduled_at
      DateTime.parse("#{safe_params[:scheduled_at_date]} #{safe_params[:scheduled_at_time]}")
    end
  end
end
