class Image < ActiveRecord::Base
  has_many :content_images
  #has_one  :profile_pic, :class_name => 'User', :foreign_key => 'profile_pic_id'
  belongs_to :user
  
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  

end
