require 'net/http'
class BeersController < ActionController::API
    BASE_URLS_ARRAY = ['https://api.punkapi.com/v2/beers']

    def get_beer
        id = params[:id]
        begin
            all_beers = []
            BASE_URLS_ARRAY.each do |url|
                uri = URI(url+"/#{id}")
                res = Net::HTTP.get_response(uri)
                beers = JSON.parse(res.body)
                all_beers << beers.map{ |b| Beer.new(b) }
            end
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    def get_all_beers
        id = params[:id]
        begin
            all_beers = []
            BASE_URLS_ARRAY.each do |url|
                uri = URI(url)
                res = Net::HTTP.get_response(uri)
                beers = JSON.parse(res.body)
                all_beers << beers.map{ |b| Beer.new(b) }
            end
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    def search_beer
        name = params[:name]
        begin
            all_beers = []
            BASE_URLS_ARRAY.each do |url|
                uri = URI(url+"?beer_name=#{name}")
                res = Net::HTTP.get_response(uri)
                beers = JSON.parse(res.body)
                all_beers << beers.map{ |b| Beer.new(b) }
            end
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end
end