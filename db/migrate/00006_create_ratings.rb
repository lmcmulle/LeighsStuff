class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
     t.integer :rateable_id
        t.string :rateable_type, :limit => 25, :default => "", :null => false
        t.decimal :review_rating, :precision => 2, :scale => 1
        t.decimal :value_rating, :precision => 2, :scale => 1
        t.decimal :location_rating, :precision => 2, :scale => 1
        t.decimal :service_user_rating, :precision => 2, :scale => 1
        t.decimal :cleanliness_rating, :precision => 2, :scale => 1
        t.decimal  :subjective_rating, :precision => 2, :scale => 1
        t.string  :subjective_rating_name

        t.timestamps
    end
    add_index :ratings, :rateable_id
    add_index :ratings, :rateable_type

  end

  def self.down
    drop_table :ratings
  end
end
