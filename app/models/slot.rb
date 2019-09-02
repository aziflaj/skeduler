class Slot < ApplicationRecord
  belongs_to :user, dependent: :destroy, required: true

  validates :guest_email, allow_blank: true,
                          format: { with: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  validate :scheduled_in_the_future

  def booked?
    guest_email.present?
  end

  private

  def scheduled_in_the_future
    seconds_params = { sec: 0 }
    return if scheduled_at.change(seconds_params) >= 5.minutes.from_now.change(seconds_params)

    errors.add(:scheduled_at, 'should be at least 5 minutes from now')
  end
end
