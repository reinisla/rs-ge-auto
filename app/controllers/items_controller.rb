class ItemsController < ApplicationController
  def index
    @items = Item.favourited
  end

  def update_summary
    RsGeApiSummaryService.new.call
  end

  def update_item_changes
    Item.favourited.each do |item|
      next if item.item_id.nil?

      FetchLatestItemChangesJob.perform_async(item.item_id)
    end
  end

  private

  def fetch_single_item(item_id)
    RsGeApiSingleItemService.new(item_id: item_id).call
  end

  def fetch_summary
    RsGeApiSummaryService.new().call
  end
end
