class ItemsController < ApplicationController
  def index
    @items = []
    @item = fetch_item(2)['item']
  end

  def fetch_item(item_id)
    RsGeApiService.new(item_id: item_id).call
  end
end
