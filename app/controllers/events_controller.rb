class EventsController < ApplicationController

  def index
    @events = Event.order('date ASC')
    @future_events = []

    @events.each do |event|
      if event.date >= Date.today
        @future_events << event
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @slots = list_slots
  end

  private

  def list_slots
    Slot.where(event_id: @event.id).order(:start_time).order(:created_at)
  end
end
