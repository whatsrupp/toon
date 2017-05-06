require 'rails_helper'

feature 'Pictures' do
  context 'No pictures uploaded' do
    scenario 'User goes to homepage' do
      visit '/pictures'
      expect(page).to have_content 'No Pictures Yet'
      expect(page).to have_link 'Add a Picture'
    end
  end
end
