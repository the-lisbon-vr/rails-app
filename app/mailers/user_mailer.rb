class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def confirm(user, slots_hash)
    # @greeting = "Hi"

    @user = user
    @confirmed_slots_by_event = slots_hash

    mail(to: @user.email, subject: 'Booking Confirmation')
    # This will render a view in `app/views/user_mailer`!
  end

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to The Lisbon VR')
    # This will render a view in `app/views/user_mailer`!
  end
end
