class SearchController < ApplicationController
  def index
    resp = conn.get('characters')
    parsed_data = parse_data(resp)  
    @characters = create_characters(parsed_data)
  end

  private
    def conn 
      Faraday.new('https://www.potterapi.com/v1') do |req|
        req.params['key'] = ENV["POTTER_API_KEY"]
        req.params['house'] = params[:house]
        req.params['orderOfThePhoenix'] = true
        req.adapter Faraday.default_adapter
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def create_characters(raw_characters_data)
      raw_characters_data.map do |char|
        Character.new(char)
      end
    end
end