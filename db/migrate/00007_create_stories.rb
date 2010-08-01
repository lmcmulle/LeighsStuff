class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
       t.integer :content_type, :default =>0 # uses a global symbol instead of a reference
        t.string :title
        t.string :by_line
        t.string :one_liner
        t.text :lede
        t.text :body
        t.date :travel_date, :default => "1/1/2010"
        t.string :season, :default => "Anytime"
        t.boolean :seasonal, :default => false
        t.integer :venue_id, :default =>nil, :null => true

         #owner / parent settings
        t.integer :user_id
        t.integer :parent_id
        t.integer :lft
        t.integer :rgt
        t.datetime :poi_timestamp

        #editorial settings
        t.decimal :average_user_rating, :precision => 2, :scale => 1  #do I want to use these, or do I want to use
        t.integer :helpful_votes, :default => 0           # a calculated field. I dunno.
        t.integer :editorial_workflow_status
        t.date    :publish_date
        t.boolean :published, :default => false
        t.integer :featured_status, :default =>0

        # Has location through Polymorphic Association
        # Has Rating's through Polymorphic Association
        # Has MANY Images through polymorphic association
        # has MANY votes through polymorphic association
        # has MANY comments through poly
        # belongs to user
        # belongs to venue
        #acts_as_taggable
        #acts_as_nested_set
        t.timestamps
    end
      add_index :stories, :user_id
      add_index :stories, :content_type
      add_index :stories, :parent_id
      add_index :stories, :published
      add_index :stories, :featured_status
      add_index :stories, :helpful_votes
  end

  def self.down
    drop_table :stories
  end
end
