# frozen_string_literal: true

class UpdateSummaryJob
  include Sidekiq::Worker

  def perform(item_id, item_details)
    item = Item.find_or_create_by(item_id: item_id)

    item.assign_attributes(
      name: item_details["name"],
      sp: item_details["sp"],
      buy_average: item_details["buy_average"],
      buy_quantity: item_details["buy_quantity"],
      sell_average: item_details["sell_average"],
      sell_quantity: item_details["sell_quantity"],
      overall_average: item_details["overall_average"],
      overall_quantity: item_details["overall_quantity"]
    )

    item.save if item.changed?
  end
end