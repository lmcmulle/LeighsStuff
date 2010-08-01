class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :parent_id
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.integer :user_id
      t.text :description
      t.integer :owner_rating  #presumably these are private. We allow the owner to rate them to
                                  #enable sorting
      t.text :exifdata
      t.datetime :date_time_stamp

      t.timestamps
    end
    add_index :photos, :user_id
    
  end



  def self.down
    drop_table :photos
  end


end
