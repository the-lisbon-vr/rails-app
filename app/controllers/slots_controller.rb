class SlotsController < ApplicationController
    def index
      @slots = Slot.all
    end

    def update
      @slot = Slot.find params[:id]
    end

end
