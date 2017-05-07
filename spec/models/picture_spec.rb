require 'rails_helper'

describe Picture, type: :model do
  it 'is invalid if path_names are duplicated ' do
    filename = 'hello.png'
    Picture.create(file_path: filename)
    picture = Picture.new(file_path: filename)
    expect(picture).to have(1).error_on(:file_path)
  end

end
