class Story < ActiveRecord::Base

  


  #don't know if we need this...
  #has_many :children, :class_name => 'Story', :foreign_key => 'Parent_ID'
  #belongs_to :parent, :class_name => 'Story'

  has_many :content_images, :as => :imageable
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  has_one :location, :as => :locatable
  has_one :rating, :as => :rateable
  belongs_to :user
  belongs_to :venue


  acts_as_taggable_on  :destinations, :interests, :seasons
  #acts_as_tree
  acts_as_nested_set

  CONTENT_TYPES = {:story => 1, :review => 2, :story_page => 3, :jaunt => 4, :day => 5, :POI=> 6}
  

  
end
