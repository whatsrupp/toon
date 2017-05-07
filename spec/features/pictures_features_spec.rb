require 'rails_helper'

feature 'Pictures' do
  context 'No pictures uploaded' do
    scenario 'User goes to homepage' do
      visit '/pictures'
      expect(page).to have_content 'No Pictures Yet'
      expect(page).to have_link 'Add a Picture'
    end
  end

  context 'On the homepage' do
    scenario 'user wants to add picture' do
      visit '/pictures'
      click_link 'Add a Picture'
      expect(current_path).to eq('/pictures/new')
    end
  end

  context 'uploading a picture' do
    after(:each) do
      delete_uploaded_file
    end

    scenario 'user uploads a picture and it saves to the assets folder' do
      upload_a_picture
      expect(page).to have_xpath('//img')
      expect(page).not_to have_content 'No Pictures Yet'
    end
  end


  context 'Pictures are uploaded' do

    before(:each) do

    end

    scenario 'pictures are uploaded with a reference to their Database index' do

    end
    scenario 'user comments on an image' do
      caption = 'Hello there'
      comment = 'Yo'
      visit('/pictures')
      expect(page).not_to have_content(comment)
      upload_a_picture(caption: caption)
      id = Picture.where(caption: caption).first.id
      click_link "comment-link-#{id}"
      fill_in('Comment', with: comment)
      click_button('Comment')
      expect(Picture.find(id).comments.length).to eq(1)
      expect(page).to have_content(comment)
    end

    scenario 'user likes an image' do
      caption = 'Hello there'
      upload_a_picture(caption: caption)
      id = Picture.where(caption: caption).first.id
      click_link "like-button-#{id}"
      expect(Picture.find(id).likes.length).to eq(1)
      expect(page).to have_content('Likes: 1')
    end



  end
end
