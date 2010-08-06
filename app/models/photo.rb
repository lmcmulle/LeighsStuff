class Photo < ActiveRecord::Base
  has_attachment :storage => :file_system,
                  :resize_to => '640x640>',
                  :thumbnails => { :thumb => '150X150>', :tiny => '50>' },
                  :max_size => 5.megabytes,
                  :content_type => :image,
                  :processor => 'Rmagick'

  validates_as_attachment
  belongs_to :user
  has_many :content_images
end
