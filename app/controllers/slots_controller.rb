class SlotsController < ApplicationController
  def free
    slots = FreeSlotsForUser::Query.new(current_user).call

    respond_to do |format|
      format.html { render 'slots/_free', slots: slots }
      format.json { render json: slots }
    end
  end

  def upcoming
    slots = UpcomingSlotsForUser::Query.new(current_user).call

    respond_to do |format|
      format.html { render 'slots/_free', slots: slots }
      format.json { render json: slots }
    end
  end
end
