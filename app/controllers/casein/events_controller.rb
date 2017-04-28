# Scaffolding generated by Casein v5.2.0.0

module Casein
  class EventsController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]

    def index
      @casein_page_title = 'Events'
      @events = Event.order(sort_order(:date)).paginate page: params[:page]
    end

    def show
      @casein_page_title = 'View event'
      @event = Event.find params[:id]
    end

    def new
      @casein_page_title = 'Add a new event'
      @event = Event.new
    end

    def create
      @event = Event.new event_params

      # create empty slots to let the users book:
      create_slots(event_params[:max_bookings])

      if @event.save
        flash[:notice] = 'Event created'
        redirect_to casein_events_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new event'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update event'

      @event = Event.find params[:id]

      if @event.update_attributes event_params
        flash[:notice] = 'Event has been updated'
        redirect_to casein_events_path
      else
        flash.now[:warning] = 'There were problems when trying to update this event'
        render action: :show
      end
    end

    def destroy
      @event = Event.find params[:id]

      @event.destroy
      flash[:notice] = 'Event has been deleted'
      redirect_to casein_events_path
    end

    private

    def event_params
      params.require(:event).permit(:name, :date, :location, :description, :max_bookings, :price_per_slot)
    end

    def create_slots(max_bookings)
      max_bookings.to_i.times {
        @slot = Slot.new(start_time: 1000, duration_minutes: 15)
        @slot.event = @event
        @slot.save
      }
    end

  end
end
