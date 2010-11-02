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

ActiveRecord::Schema.define(:version => 20101101050918) do

  create_table "events", :force => true do |t|
    t.string   "zipcode"
    t.datetime "happened_at"
    t.datetime "fix_eta"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.string   "city"
    t.string   "cause"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "main_url"
    t.string   "events_url"
    t.string   "kind"
    t.string   "event_tel"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zipcodes", :force => true do |t|
    t.string   "zip"
    t.string   "city"
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "zipcodes", ["zip"], :name => "zip", :unique => true, :length => {"zip"=>"5"}

end
