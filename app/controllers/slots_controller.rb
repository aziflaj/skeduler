class SlotsController < ApplicationController
  respond_to :json

  def free
    slots = FreeSlotsForUser::Query.new(current_user).call

    render json: slots
  end

  def upcoming
    slots = UpcomingSlotsForUser::Query.new(current_user).call

    render json: slots
  end
end
