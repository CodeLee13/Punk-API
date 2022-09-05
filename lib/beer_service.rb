require 'punk_api_service'
class BeerService
  attr_accessor :beers, :apis
  def initialize
    @apis = [PunkApiService.new]
    @beers = []
  end

  def get_beer(id)
    apis.each do |api|
      beers << api.get_beer(id)
    end
    beers.compact
  end

  def get_all_beers
    apis.each do |api|
      beers << api.get_all_beers
    end
    beers.compact
  end

  def search_beers(name)
    apis.each do |api|
      beers << api.search_beers(name)
    end
    beers.compact
  end


end