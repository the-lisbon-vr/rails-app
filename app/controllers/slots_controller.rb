class SlotsController < ApplicationController
    before_action :find_slot, only: [ :show, :update, :cancel_session ]
    before_action :authenticate_user!

    def update
      if !@slot.user_id.nil? && @slot.user_id != current_user.id
        render json: {status: "nok", msg: t(".session_already_booked")}
      elsif current_user.id.nil?
        flash[:alert] = t(".must_be_signed_in_to_book")
        redirect_to event_path(id: @slot.event.id)
      else
        @slot.update_attributes(user_id: current_user.id)
        # @slot.send_confirmation
        render json: {status: "ok", msg: t(".session_booked")}
      end
    end

    # only including this show method for the sake of the cancelling a session
    # it shouldn't be actually accessible as a page (because there's no need)
    # --update: also works as a way for someone to book a session by opening the link in a new tab. Woop!
    def show
      update
    end


    def cancel_session
      if @slot.user == current_user
        @slot.user_id = nil
        @slot.confirmed = false
        if @slot.save
          render plain: t(".session_cancelled")
        else
          render plain: t(".something_went_wrong")
        end
      else
        render plain: "wrong user"
      end
    end

    private

    def find_slot
      slot_id = params[:id] || params[:slot_id]
      @slot = Slot.find(slot_id)
    end

end
