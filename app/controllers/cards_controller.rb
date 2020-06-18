class CardsController < ApplicationController
   before_action :check_card, only: [:create]
   
    def index
        @user = User.find_by(id: params[:user_id])
        if !@user.valid?
            redirect_to (:back)
        end
    end

    def new
        @card = Card.new
        @day = @card.build_day
    end
      
    def create
        @card = current_user.cards.create(card_params) 

        if @card.save
            number_of_cards = current_user.cards.length   
            day = Day.find_by(id: number_of_cards)
            day.cards << @card
            redirect_to days_path
        else   
            render :new
        end
    end


    private 
    
    def card_params
        params.require(:card).permit(:youtube_link,:codewars_link, :article_link,:question, :day_id, day_attributes: [:comment])    
    end
    
    def check_card
        # change from 24hours from midnight

            if current_user.cards == [] #ensures that new users can create their first card
                create
            else
            @last_card_date = current_user.cards.last.created_at
            if (@last_card_date.day == (Date.today.day - 1)) && @last_card_date.month == Date.today.month
                redirect_to root_path
            end
        end
    end
end

# create a scope method card where created_at is yesterday
def created_yesterday(today)
    (@last_card_date.day == (today - 1)) && @last_card_date.month == today.month
end