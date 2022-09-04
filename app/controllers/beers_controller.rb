require 'net/http'
class BeersController < ActionController::API
    BASE_URLS_ARRAY = ['https://api.punkapi.com/v2/beers']

    def get_beer
        id = params[:id]
        begin
            all_beers = []
            BASE_URLS_ARRAY.each do |url|
                uri = URI(url+"/#{id}")
                all_beers = make_api_call(uri)
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
                all_beers << make_api_call(uri)
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
                all_beers << make_api_call(uri)
            end
            render json: { data: all_beers }
        rescue Exception => e
            render json: e.message
        end
    end

    private

    def make_api_call(url)
        res = Net::HTTP.get_response(url)
        response = JSON.parse(res.body)
        response = response.map { |b| Beer.new(b) }
        response
    end
end