class MissionsController < ApplicationController

    def index
        @missions = Mission.all
    end

    def new
        @mission = Mission.new
    end

    def create
        @mission = Mission.new(params.require(:mission).permit(:name, :planet_id, :scientist_id))

        if @mission.valid?
            @mission.save
            redirect_to mission_path(@mission)
        else
            render :new
        end
    end
end