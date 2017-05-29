class Slot < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def send_confirmation
    SlotMailer.confirm(self).deliver_now
  end

end
