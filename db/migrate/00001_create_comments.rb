class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
          t.column :commentable_type, :string, :limit => 25, :default => " ", :null => false
          t.column :commentable_id, :integer, :default => 0, :null => false
          t.string  :headline
          t.text    :body
          t.decimal :rating, :precision =>2, :scale =>1
          t.integer :user_id

          #editorial settings
          t.integer :helpful_votes, :default => 0           # a calculated field. I dunno.
          t.integer :editorial_workflow_status
          t.date    :publish_date
          t.boolean :published, :default => false


          t.timestamps
    end
      add_index :comments, :user_id
      add_index :comments, :helpful_votes
      add_index :comments, :published
      add_index :comments, :commentable_type
      add_index :comments, :commentable_id
      add_index :comments, :user_id
  end

  def self.down
    drop_table :comments
  end
end
