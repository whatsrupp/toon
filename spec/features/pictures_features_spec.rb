require 'rails_helper'

feature 'Pictures' do
  context 'No pictures uploaded' do
    scenario 'User goes to homepage' do
      visit '/pictures'
      expect(page).to have_content 'No Pictures Yet'
      expect(page).to have_link 'Add a Picture'
    end
  end

  context 'uploading a picture' do
    after(:each) do
      File.delete(Rails.root.join('app','assets','images','uploads', 'test_image.png'))
    end

    scenario 'user uploads a picture and submits ' do
      visit '/pictures'
      click_link 'Add a Picture'
      expect(current_path).to eq('/pictures/new')
      attach_file("Upload Picture", Rails.root + "spec/assets/test_image.png")
      fill_in('Caption', with: 'Sick Smiley')
      click_button('Post')
      expect(page).to have_xpath('//img')
    end
  end

  context 'Pictures are uploaded' do
    # before do
    #   attach_file("Upload Your File", Rails.root + "spec/assets/file.pdf")
    #   Picture.create()
    # end
    #
    # scenario 'user goes to homepage' do
    #   visit'/pictures'
    #   expect(page).to have_xpath("//img[contains(@src,'environ-peeling-kuur.jpg')]")
    # end
  end
end
