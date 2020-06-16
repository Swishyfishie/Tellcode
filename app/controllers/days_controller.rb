class DaysController < ApplicationController

    def index
        @days = Day.all
    end
    def show
        @days = Day.all
    end

    def new
        @day = Day.new
    end
    
    def create
        @day = Day.create(day_params)
        byebug
        
        redirect_to days_path
    end
    
    private 

    def day_params
        params.require(:day).permit(:comment, :cards => [])    
    end
end
