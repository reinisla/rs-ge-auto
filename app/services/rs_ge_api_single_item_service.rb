# frozen_string_literal: true

class RsGeApiSingleItemService
  include HTTParty

  attr_reader :item_id

  def initialize(item_id:)
    @item_id ||= item_id
  end
  
  def call
    json_response
  end

  def update
    json_response

    update_item
  end

  def response
    @response ||= HTTParty.get("http://services.runescape.com/m=itemdb_oldschool/api/catalogue/detail.json?item=#{item_id}")
  end
  
  def json_response
    @json_response ||= JSON.parse response
  end
  
  def update_item
    item = Item.find_or_create_by(item_id: item_id)

    item.assign_attributes(
      current_change: json_response["item"]["current"],
      today_change: json_response["item"]["today"],
      day30_change: json_response["item"]["day30"],
      day90_change: json_response["item"]["day90"],
      day180_change: json_response["item"]["day180"],
      icon: json_response["item"]["icon"]
    )

    item.save if item.changed?
  end
end