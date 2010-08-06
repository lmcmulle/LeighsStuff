# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 100) do

  create_table "comments", :force => true do |t|
    t.string   "commentable_type",          :limit => 25,                               :default => " ",   :null => false
    t.integer  "commentable_id",                                                        :default => 0,     :null => false
    t.string   "headline"
    t.text     "body"
    t.decimal  "rating",                                  :precision => 2, :scale => 1
    t.integer  "user_id"
    t.integer  "helpful_votes",                                                         :default => 0
    t.integer  "editorial_workflow_status"
    t.date     "publish_date"
    t.boolean  "published",                                                             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["helpful_votes"], :name => "index_comments_on_helpful_votes"
  add_index "comments", ["published"], :name => "index_comments_on_published"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "content_images", :force => true do |t|
    t.integer  "image_id"
    t.integer  "photo_id"
    t.integer  "imageable_id"
    t.string   "imageable_type", :limit => 25, :default => "", :null => false
    t.string   "gallery_name"
    t.string   "placement_tag"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_images", ["gallery_name"], :name => "index_content_images_on_gallery_name"
  add_index "content_images", ["imageable_id"], :name => "index_content_images_on_imageable_id"
  add_index "content_images", ["imageable_type"], :name => "index_content_images_on_imageable_type"
  add_index "content_images", ["placement_tag"], :name => "index_content_images_on_placement_tag"

  create_table "geocodes", :force => true do |t|
    t.decimal "latitude",    :precision => 15, :scale => 12
    t.decimal "longitude",   :precision => 15, :scale => 12
    t.string  "query"
    t.string  "street"
    t.string  "locality"
    t.string  "region"
    t.string  "postal_code"
    t.string  "country"
    t.string  "precision"
  end

  add_index "geocodes", ["country"], :name => "geocodes_country_index"
  add_index "geocodes", ["latitude"], :name => "geocodes_latitude_index"
  add_index "geocodes", ["locality"], :name => "geocodes_locality_index"
  add_index "geocodes", ["longitude"], :name => "geocodes_longitude_index"
  add_index "geocodes", ["postal_code"], :name => "geocodes_postal_code_index"
  add_index "geocodes", ["precision"], :name => "geocodes_precision_index"
  add_index "geocodes", ["query"], :name => "geocodes_query_index", :unique => true
  add_index "geocodes", ["region"], :name => "geocodes_region_index"

  create_table "geocodings", :force => true do |t|
    t.integer "geocodable_id"
    t.integer "geocode_id"
    t.string  "geocodable_type"
  end

  add_index "geocodings", ["geocodable_id"], :name => "geocodings_geocodable_id_index"
  add_index "geocodings", ["geocodable_type"], :name => "geocodings_geocodable_type_index"
  add_index "geocodings", ["geocode_id"], :name => "geocodings_geocode_id_index"

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.string   "gallery_name",       :default => "dropbox"
    t.string   "name"
    t.text     "description"
    t.text     "exifdata"
    t.datetime "date_time_stamp"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "owner_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["gallery_name"], :name => "index_images_on_gallery_name"
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "locations", :force => true do |t|
    t.integer  "locatable_id"
    t.string   "locatable_type", :limit => 25,                                 :default => "", :null => false
    t.string   "name"
    t.text     "description"
    t.string   "street"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "user_id"
    t.decimal  "latitude",                     :precision => 15, :scale => 12
    t.decimal  "longitude",                    :precision => 15, :scale => 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["country"], :name => "index_locations_on_country"
  add_index "locations", ["latitude"], :name => "index_locations_on_latitude"
  add_index "locations", ["locality"], :name => "index_locations_on_locality"
  add_index "locations", ["locatable_id"], :name => "index_locations_on_locatable_id"
  add_index "locations", ["locatable_type"], :name => "index_locations_on_locatable_type"
  add_index "locations", ["longitude"], :name => "index_locations_on_longitude"
  add_index "locations", ["postal_code"], :name => "index_locations_on_postal_code"
  add_index "locations", ["region"], :name => "index_locations_on_region"
  add_index "locations", ["street"], :name => "index_locations_on_street"
  add_index "locations", ["user_id"], :name => "index_locations_on_user_id"

  create_table "photos", :force => true do |t|
    t.string   "content_type",    :limit => 100
    t.string   "filename"
    t.string   "path"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "owner_rating"
    t.text     "exifdata"
    t.string   "gallery_name"
    t.datetime "date_time_stamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type",          :limit => 25,                               :default => "", :null => false
    t.decimal  "review_rating",                        :precision => 2, :scale => 1
    t.decimal  "value_rating",                         :precision => 2, :scale => 1
    t.decimal  "location_rating",                      :precision => 2, :scale => 1
    t.decimal  "service_user_rating",                  :precision => 2, :scale => 1
    t.decimal  "cleanliness_rating",                   :precision => 2, :scale => 1
    t.decimal  "subjective_rating",                    :precision => 2, :scale => 1
    t.string   "subjective_rating_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["rateable_id"], :name => "index_ratings_on_rateable_id"
  add_index "ratings", ["rateable_type"], :name => "index_ratings_on_rateable_type"

  create_table "stories", :force => true do |t|
    t.integer  "content_type",                                            :default => 0
    t.string   "title"
    t.string   "by_line"
    t.string   "one_liner"
    t.text     "lede"
    t.text     "body"
    t.date     "travel_date",                                             :default => '2010-01-01'
    t.string   "season",                                                  :default => "Anytime"
    t.boolean  "seasonal",                                                :default => false
    t.integer  "venue_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "poi_timestamp"
    t.decimal  "average_user_rating",       :precision => 2, :scale => 1
    t.integer  "helpful_votes",                                           :default => 0
    t.integer  "editorial_workflow_status"
    t.date     "publish_date"
    t.boolean  "published",                                               :default => false
    t.integer  "featured_status",                                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["content_type"], :name => "index_stories_on_content_type"
  add_index "stories", ["featured_status"], :name => "index_stories_on_featured_status"
  add_index "stories", ["helpful_votes"], :name => "index_stories_on_helpful_votes"
  add_index "stories", ["parent_id"], :name => "index_stories_on_parent_id"
  add_index "stories", ["published"], :name => "index_stories_on_published"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "profile_pic_id"
    t.text     "bio"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.integer  "featured_status",     :default => 0
    t.integer  "karma"
    t.string   "openid_identifier"
    t.string   "twitter_auth_code"
    t.string   "facebook_auth_code"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",   :default => " ", :null => false
    t.string   "single_access_token", :default => " ", :null => false
    t.string   "perishable_token",    :default => " ", :null => false
    t.integer  "login_count",         :default => 0,   :null => false
    t.integer  "failed_login_count",  :default => 0,   :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "photos_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["featured_status"], :name => "index_users_on_featured_status"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["openid_identifier"], :name => "index_users_on_openid_identifier"

  create_table "venues", :force => true do |t|
    t.integer  "venue_type",                                              :default => 0
    t.string   "name"
    t.text     "description"
    t.string   "telephone"
    t.string   "email"
    t.string   "locality"
    t.decimal  "editorial_rating",          :precision => 2, :scale => 1
    t.integer  "user_id"
    t.decimal  "average_user_rating",       :precision => 2, :scale => 1
    t.integer  "editorial_workflow_status"
    t.date     "publish_date"
    t.boolean  "published",                                               :default => false
    t.integer  "featured_status",                                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["average_user_rating"], :name => "index_venues_on_average_user_rating"
  add_index "venues", ["editorial_rating"], :name => "index_venues_on_editorial_rating"
  add_index "venues", ["featured_status"], :name => "index_venues_on_featured_status"
  add_index "venues", ["locality"], :name => "index_venues_on_locality"
  add_index "venues", ["published"], :name => "index_venues_on_published"
  add_index "venues", ["venue_type"], :name => "index_venues_on_venue_type"

  create_table "votes", :force => true do |t|
    t.boolean  "vote",                        :default => false
    t.datetime "created_at"
    t.string   "voteable_type", :limit => 25, :default => "",    :null => false
    t.integer  "voteable_id",                 :default => 0,     :null => false
    t.integer  "user_id",                     :default => 0,     :null => false
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"
  add_index "votes", ["voteable_id"], :name => "index_votes_on_voteable_id"
  add_index "votes", ["voteable_type"], :name => "index_votes_on_voteable_type"

end
