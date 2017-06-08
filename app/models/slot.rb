class Slot < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def send_confirmation
    SlotMailer.confirm(self).deliver_now

    # deliver with sidekiq:
    # SlotMailer.confirm(self).deliver_later
  end

end
