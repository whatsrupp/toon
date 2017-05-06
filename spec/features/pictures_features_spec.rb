require 'rails_helper'

feature 'Pictures' do
  context 'No pictures uploaded' do
    scenario 'User goes to homepage' do
      expect(1).to eq(1)
    end
  end
end
