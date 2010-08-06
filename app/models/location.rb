class Location < ActiveRecord::Base
   belongs_to :locatable, :polymorphic => true
   belongs_to :user
end
