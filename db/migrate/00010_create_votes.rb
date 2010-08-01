class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
          t.column :vote, :boolean, :default => false
          t.column :created_at, :datetime, :null => false
          t.column :voteable_type, :string, :limit => 25, :default => "", :null => false
          t.column :voteable_id, :integer, :default => 0, :null => false
          t.column :user_id, :integer, :default => 0, :null => false

          t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, :voteable_type
    add_index :votes, :voteable_id
  end

  def self.down
    drop_table :votes
  end
end
