class CreateAttachedImages < ActiveRecord::Migration[5.2]
  def change
    create_table :attached_images do |t|
      t.string :file
      t.timestamps
    end
  end
end
