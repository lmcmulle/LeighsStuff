class User < ActiveRecord::Base
  has_many :stories
  has_many :locations, :as => :locatable 
  has_many :images
  has_many :venues
  has_many :comments
  has_many :votes
  #has_many :photos
  
  #belongs_to :profile_pic, :class_name => 'Image', :foreign_key => 'profile_pic_id'

  acts_as_authentic    #todo, unfuck this --messes up active scaffold
  
  
end
