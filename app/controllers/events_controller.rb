class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @slots = list_slots
  end

  private

  def list_slots
    Slot.where(event_id: @event.id)
  end
end
