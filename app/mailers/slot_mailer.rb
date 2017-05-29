class SlotMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.slot_mailer.confirm.subject
  #
  def confirm(slot)
    # @greeting = "Hi"

    @slot = slot
    @user = User.find(@slot.user.id)

    mail(to: @user.email, subject: 'Booking Confirmed')
    # This will render a view in `app/views/user_mailer`!
  end
end
