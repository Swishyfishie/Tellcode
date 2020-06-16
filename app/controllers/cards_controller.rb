class CardsController < ApplicationController
   
    def new
        @card = Card.new
    end

    def create
        @card = Card.create(card_params)
        byebug

        redirect_to days_path
    end

    private 

    def card_params
        params.require(:card).permit(:youtube_link,:codewars_link, :article_link,:question, :day_id)    
    end
end
