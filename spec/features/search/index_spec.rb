require 'rails_helper'

RSpec.describe 'Search Controller' do
  describe 'index' do
    it "a user should be able to search by house and see member in the OOTP" do
      visit root_path
      
      select('Gryffindor', from: 'house')

      click_button "Search For Members"

      expect(current_path).to eq(search_path)

      expect(page).to have_css('.character-section', count: 21)
    end
  end
end