class ContentImage < ActiveRecord::Base
  belongs_to :imageable, :polymorphic =>true
  belongs_to :image
  #belongs_to :photo
end
