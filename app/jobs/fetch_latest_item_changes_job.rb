# frozen_string_literal: true

class FetchLatestItemChangesJob
  include Sidekiq::Worker

  def perform(item_id)
    RsGeApiSingleItemService.new(item_id: item_id).update
  end
end