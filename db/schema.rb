# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_21_200428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "item_id"
    t.integer "sp"
    t.integer "buy_average"
    t.integer "buy_quantity"
    t.integer "sell_average"
    t.integer "sell_quantity"
    t.integer "overall_average"
    t.integer "overall_quantity"
    t.string "current_change"
    t.string "today_change"
    t.string "day30_change"
    t.string "day90_change"
    t.string "day180_change"
    t.text "icon"
    t.boolean "favourited", default: false
  end

end
