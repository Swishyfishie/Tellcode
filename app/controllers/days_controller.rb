class DaysController < ApplicationController

    def index
        if params[:search] != nil
            day = Day.find_by(id: params[:search])
            if day 
            redirect_to day_path(day)
            else 
                @days = Day.all
            end
        else
            @days = Day.all
        end
    end

    def show
  
        @day = Day.find_by(id: params[:id])
    end

    def new
        @day = Day.new
    end
    
    def create
        @day = Day.create(day_params)       
        redirect_to days_path
    end
    
    private 

    def day_params
        params.require(:day).permit(:comment)    
    end
end
