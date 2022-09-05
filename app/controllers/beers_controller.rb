require 'beer_service'
class BeersController < ActionController::API
    attr_accessor :beer_service
    def get_beer
        id = params[:id]
        begin
            beer = beer_service.get_beer(id)
            render json: { data: beer }
        rescue Exception => e
            render json: e.message
        end
    end

    def get_all_beers
        begin
            all_beers = beer_service.get_all_beers
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    def search_beer
        name = params[:name]
        begin
            all_beers = beer_service.search_beers(name)
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    private
    def beer_service
        @beer_service ||= BeerService.new
    end
end