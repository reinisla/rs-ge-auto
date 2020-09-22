class Item < ApplicationRecord
  default_scope { order(item_id: :asc) }

  scope :favourited, -> { where(favourited: true) }
end