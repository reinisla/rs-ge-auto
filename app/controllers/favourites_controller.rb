class FavouritesController < ApplicationController
  def index
    @items = Item.favourited
  end

  def update
    item = Item.where(item_id: params[:item][:item_id])

    if params[:remove]
      item.update_all(favourited: false)
    else
      item.update_all(favourited: true)
    end

    @items = Item.favourited

    respond_to do |format|
      format.js
    end
  end
end
