# frozen_string_literal: true

class RsGeApiSummaryService
  include HTTParty
  
  def call
    json_response.each do |item_id, item_details|
      UpdateSummaryJob.perform_async(item_id, item_details)
    end
  end

  def json_response
    @response ||= HTTParty.get("https://rsbuddy.com/exchange/summary.json")
  end
end