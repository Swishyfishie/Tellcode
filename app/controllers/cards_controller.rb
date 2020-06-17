class CardsController < ApplicationController
   before_action :check_card, only: [:create]

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

    def check_card
        @last_card = current_user.cards.last
        if current_user.cards.where(created_at:(Time.now - 24.hours)..Time.now).include?(@last_card)
            redirect_to root_path
        end
    end

    private 

    def card_params
        params.require(:card).permit(:youtube_link,:codewars_link, :article_link,:question, :day_id, day_attributes: [:comment])    
    end

end
