# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140730190300) do

  create_table "foods", force: true do |t|
    t.string   "company_name"
    t.string   "food_name"
    t.text     "serving_size"
    t.integer  "calories"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "protein"
    t.decimal  "cost",          precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cals_from_fat"
    t.integer  "total_fat_pct"
    t.integer  "sat_fat_g"
    t.integer  "sat_fat_pct"
    t.integer  "trans_fat"
    t.integer  "cholesterol"
    t.integer  "chol_pct"
    t.integer  "sodium"
    t.integer  "sodium_pct"
    t.integer  "carbs_pct"
    t.integer  "fiber"
    t.integer  "fiber_pct"
    t.integer  "sugars"
    t.integer  "vit_a"
    t.integer  "vit_c"
    t.integer  "calcium"
    t.integer  "iron"
    t.string   "food_class"
  end

# Could not dump table "mcdonalds" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
