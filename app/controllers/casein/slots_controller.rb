module Casein
  class SlotsController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]

    def index
      @event = Event.find(params[:event_id])
      @slots = Slot.all
    end

    def show
      # confirm or cancel payment for given slot:
      @slot = Slot.find(params[:id])
      @slot.is_payed = !@slot.is_payed
      @slot.save
    end

    def update
    end
  end
end
