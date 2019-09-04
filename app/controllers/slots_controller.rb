class SlotsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    slot = Slots::Builder.new(current_user, params).call

    if slot.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: slot.errors.full_messages.join("\n")
    end
  end

  def free
    slots = FreeSlotsForUser::Query.new(current_user).call

    render json: slots
  end

  def upcoming
    slots = UpcomingSlotsForUser::Query.new(current_user).call

    render json: slots
  end

  private

  def slot_params

  end
end
