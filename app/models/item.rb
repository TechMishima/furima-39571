class Item < ApplicationRecord
  validates :name            , presence: true
  validates :description     , presence: true
  validates :price  , presence: true,
                      format: { with: /\A\d+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id     , presence: true
  validates :status_id       , presence: true
  validates :delivery_cost_id, presence: true
  validates :prefecture_id   , presence: true
  validates :shipping_day_id , presence: true
  validates :user            , presence: true

  belongs_to :user
end
