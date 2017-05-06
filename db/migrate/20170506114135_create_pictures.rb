class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :file_path

      t.timestamps
    end
  end
end
