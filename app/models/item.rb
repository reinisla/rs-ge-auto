class Item < ApplicationRecord
  serialize :current_change
  serialize :today_change
  serialize :day30_change
  serialize :day90_change
  serialize :day180_change
  
  default_scope { order(item_id: :asc) }

  scope :favourited, -> { where(favourited: true) }

  def current_price
    convert_money(current_change["price"])
  end

  def today_price
    convert_money(current_change["price"]) + convert_money(today_change["price"])
  end

  private

  def convert_money(money_value)
    money_value = money_value.to_s.delete(', ')
    multiplier = nil
    multiplier = 1000 if money_value.include?("k")
    multiplier = 1000000 if money_value.include?("m")

    return money_value.to_f unless multiplier

    (money_value.to_d * multiplier).to_i.to_f
  end
end