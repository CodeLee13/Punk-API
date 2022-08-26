require 'net/http'
class BeersController < ActionController::API
    BASE_URL = 'https://api.punkapi.com/v2/beers'

    def get_beer
        id = params[:id]
        begin
            uri = URI(BASE_URL+"/#{id}")
            res = Net::HTTP.get_response(uri)
            beers = JSON.parse(res.body)
            mapped_beers = beers.map{ |b| Beer.new(b) }
            render json: { data: mapped_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    def get_all_beers
        id = params[:id]
        begin
            uri = URI(BASE_URL)
            res = Net::HTTP.get_response(uri)
            beers = JSON.parse(res.body)
            mapped_beers = beers.map{ |b| Beer.new(b) }
            render json: { data: mapped_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    def search_beer
        name = params[:name]
        begin
            uri = URI(BASE_URL+"?beer_name=#{name}")
            res = Net::HTTP.get_response(uri)
            beers = JSON.parse(res.body)
            mapped_beers = beers.map{ |b| Beer.new(b) }
            render json: { data: mapped_beers }
        rescue Exception => e
            render json: e.message
        end
    end
end