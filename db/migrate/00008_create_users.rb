class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

    t.string :login, :default => nil, :null => true
        t.string :first_name
        t.string :last_name
        t.string :email,  :null => true                # optional, you can use login instead, or both
        t.integer :profile_pic_id, :null=> true
        t.text    :bio
        t.string :twitter_id, :default => nil, :null => true
        t.string :facebook_id, :default => nil, :null => true
        t.integer :featured_status, :default => 0
        t.integer :karma #for tracking ratings, reviews, articles, posts and such. karma points become nice gifts
                         # or something.

        #authlogic stuff
        t.string :openid_identifier, :default => nil, :null => true
        t.string :twitter_auth_code , :default => nil, :null => true
        t.string :facebook_auth_code, :default => nil, :null => true
        t.string :crypted_password, :default => nil, :null => true
        t.string :password_salt, :default => nil, :null => true
        t.string    :persistence_token,   :null => false, :default => " "   # required
        t.string    :single_access_token, :null => false, :default => " "   # optional, see Authlogic::Session::Params
        t.string    :perishable_token,    :null => false, :default => " "  # optional, see Authlogic::Session::Perishability

        # Magic columns, just like ActiveRecord's created_at and updated_at.
        #These are automatically maintained by Authlogic if they are present.
        t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
        t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
        t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
        t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
        t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
        t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
        t.string    :last_login_ip                                      # optional, see Authlogic::Session::MagicColumns

           #Has MANY locations through polymorphic associations
           #has MANY Images through Polymorphic Association
           #has many stories
           #has many comments
           #has many votes


        t.timestamps
    end


      add_index :users, :openid_identifier
      add_index :users, :login
      add_index :users, :email
      add_index :users, :featured_status
  end

  def self.down
    drop_table :users
  end
end
