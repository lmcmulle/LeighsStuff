class CreateContentImages < ActiveRecord::Migration

  #Iam a polymorphic class
  def self.up
      create_table :content_images do |t|
          t.integer :image_id
          t.integer :photo_id
          t.integer :imageable_id
          t.string :imageable_type, :limit => 25, :default => "", :null => false
          t.string :gallery_name
          t.string :placement_tag
          t.integer :position
          t.timestamps

          #belongs_to images
          #belongs_to_photos
          #acts_as_list
      end
      add_index :content_images, :gallery_name
      add_index :content_images, :placement_tag
      add_index :content_images, :imageable_id
      add_index :content_images, :imageable_type
  end


  def self.down
     drop_table :content_images
  end
end
