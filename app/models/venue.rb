class Venue < ActiveRecord::Base
  has_many :stories
  belongs_to :user
  has_one :location, :as => :locatable 
  has_many :content_images, :as => :imageable
  
end
