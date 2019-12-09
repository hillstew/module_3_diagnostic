require 'rails_helper'

RSpec.describe 'Search Controller' do
  describe 'index' do
    it "a user should be able to search by house and see member in the OOTP" do
      json_response = File.open('./app/fixtures/members_of_gryffindor.json')
      stub_request(:get, "https://www.potterapi.com/v1/characters?key=#{ENV["POTTER_API_KEY"]}&orderOfThePhoenix=true&house=Gryffindor")
        .to_return(status: 200, body: json_response)

      visit root_path
      
      select('Gryffindor', from: 'house')

      click_button "Search For Members"

      expect(current_path).to eq(search_path)

      expect(page).to have_css('.character-section', count: 21)
    end
  end
end