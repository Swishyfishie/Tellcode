class CardsController < ApplicationController
   
    def new
        @card = Card.new
        @day = @card.build_day
    end

      
    def create
        @card = current_user.cards.create(card_params)
        if @card.save
            redirect_to days_path
        else   
            render :new
        end
    end

    private 

    def card_params
        params.require(:card).permit(:youtube_link,:codewars_link, :article_link,:question, :day_id, day_attributes: [:comment])    
    end
end
