def delete_uploaded_file (filename: 'test_image.png')
  # File.delete(Rails.root.join('app','assets','images','uploads', filename))
end

def upload_a_picture(filename: 'test_image.png', caption: 'hello')
  visit '/pictures'
  click_link 'Add a Picture'
  attach_file("Upload Picture", Rails.root + "spec/assets/#{filename}")
  fill_in('Caption', with: caption)
  click_button('Post')
end
