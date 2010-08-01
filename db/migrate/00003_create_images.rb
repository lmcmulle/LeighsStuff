class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :user_id
         t.string :gallery_name, :default =>'dropbox' #assuming that users put images into their own galleries, this is
                               #the tag that will identify that image gallery. On an upload
                               #it will default to the date/time of the upload.
                               #it is NOT necessarily the same as "Gallery name" from Content Images
         t.string :name
         t.text :description
         t.text :exifdata
         t.datetime :date_time_stamp
         t.string :photo_file_name
         t.string :photo_content_type
         t.integer :photo_file_size
         t.datetime :photo_updated_at
         t.integer :owner_rating  #presumably these are private. We allow the owner to rate them to
                                  #enable sorting

         #belongs to User
         #has_many content_images
         #acts_as_list
         #acts_as_tagable
         #paperclip

         t.timestamps
    end

    add_index :images, :user_id
    add_index :images, :gallery_name

  end

  def self.down
    drop_table :images
  end
end
