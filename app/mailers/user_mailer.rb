class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def confirm(user_id, slots_hash_by_event)

    # slots_hash = slots_hash_by_event.map do |event|
    #   event[1].map do |slot_id|
    #     Slot.find(slot_id)
    #   end
    # end

    @user = User.find(user_id)
    @confirmed_slots_by_event = slots_hash_by_event

    mail(to: @user.email, subject: 'Booking Confirmation')
    # This will render a view in `app/views/user_mailer`!
  end

  def welcome(user_id)
    @user = User.find(user_id)  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to The Lisbon VR')
    # This will render a view in `app/views/user_mailer`!
  end

  private

  def find_corresponding_slots
    slots_hash = slots_hash_by_event.map do |event|
      Slot.find(slot_id)
    end
  end

end
