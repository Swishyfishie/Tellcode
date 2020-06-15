class CardsController < ApplicationController
   
    def new
        @card = Card.new
    end

    def create
        byebug
    end
end
