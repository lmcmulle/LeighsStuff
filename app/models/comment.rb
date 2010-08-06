class Comment < ActiveRecord::Base
  
  #Do Polymorphic Associations
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :votes, :as => :voteable
  
  #create named scopes for the model
  
  named_scope :recent, {:order => "created_at DESC"}
  named_scope :published, {:conditions => ["published = true"]}  #todo make sure this isn't buggy that true is correct
                                                                 #in the database
  named_scope :toprated_positive, {:conditions => ["rating >=3"],:limit =>3, :order => "helpful_votes DESC"}
  named_scope :toprated_negative, {:conditions => ["rating <=2"],:limit =>3, :order => "helpful_votes DESC"}
  named_scope :limit, lambda {|limit| {:limit => limit}}
  
 #find the comments for the object --not needed due to polymorphic assocation
 #TODO cleanup
  #named_scope :comments_on, lambda {|commentable_id, commentable_type| 
  #  {:conditions=> ["commentable_type = ? and commentable_id = ?", commentable_type, commentable_id],
  #        :order => "created_at DESC"}}
  
  
  def user_already_commented?(user, commentable_type, commentable_id)
   # find(:all, :conditions => ["commentable_type = ? and commentable_id = ? and user_id = ?", 
   #   commentable_type, commentable_id, user.id]).count
   c = Comment.find_by_commentable_id_and_commentable_type_and_user_id(commentable_id, commentable_type, user.id)
   
   not c.nil?
  end
  
  def duplicate?
   # find(:all, :conditions => ["commentable_type = ? and commentable_id = ? and user_id = ?", 
   #   commentable_type, commentable_id, user.id]).count
   c = Comment.find_by_user_id_and_body_and_headline(user.id, body, headline)
   not c.nil?
  end
    
  
 
end
