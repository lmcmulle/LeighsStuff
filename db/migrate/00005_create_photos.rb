class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      #attachment_fu standard fields
      t.string :content_type, :limit => 100
      t.string :filename, :limit => 255
      t.string :path, :limit => 255
      t.integer :parent_id
      t.string :thumbnail, :limit => 255
      t.integer :size
      t.integer :width
      t.integer :height


      #my fields follow
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :owner_rating  #presumably these are private. We allow the owner to rate them to
                                  #enable sorting
      t.text :exifdata
      t.string :gallery_name
      t.datetime :date_time_stamp

      t.timestamps
    end
    add_index :photos, :user_id
    
  end



  def self.down
    drop_table :photos
  end


end
