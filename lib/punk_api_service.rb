require 'net/http'
class PunkApiService
  URL = 'https://api.punkapi.com/v2/beers'
  attr_accessor :response, :beers


  def get_beer(id)
      uri = URI(PunkApiService::URL+"/#{id}")
      request(uri)
      mapper
  end

  def get_all_beers
    uri = URI(PunkApiService::URL)
    request(uri)
    mapper
  end

  def search_beers(name)
    uri = URI(PunkApiService::URL+"?beer_name=#{name}")
    request(uri)
    mapper
  end

  def request(url)
    res = Net::HTTP.get_response(url)
    @response = JSON.parse(res.body)
  end

  def mapper
    @beers = @response.map { |b| Beer.new(b) }
  end
end