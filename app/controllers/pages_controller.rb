class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :hello
  before_action :redirect_users, only: :hello

  def hello
  end

  private

  def redirect_users
    return unless user_signed_in?

    redirect_to dashboard_path
  end
end
