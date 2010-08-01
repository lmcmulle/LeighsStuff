class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.integer :venue_type, :default =>0 #uses a constant rather than a join.
         t.string :name
         t.text   :description
         t.string :telephone
         t.string :email
         t.string :locality
         t.decimal :editorial_rating, :precision => 2, :scale => 1
         t.integer :user_id

        #editorial settings
        t.decimal :average_user_rating, :precision => 2, :scale => 1  #do I want to use these, or do I want to use
        t.integer :editorial_workflow_status
        t.date    :publish_date
        t.boolean :published, :default => false
        t.integer :featured_status, :default =>0

         # has Location through Polymorphic Association
         # Has MANY images through polymorphic association
         # Has MANY stories
         # belongs to user

          t.timestamps
    end

      add_index :venues, :venue_type
      add_index :venues, :locality
      add_index :venues, :published
      add_index :venues, :featured_status
      add_index :venues, :editorial_rating
      add_index :venues, :average_user_rating
  end

  def self.down
    drop_table :venues
  end
end
