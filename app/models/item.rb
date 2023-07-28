class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :name            , presence: true
  validates :description     , presence: true
  validates :price  , presence: true,
                      format: { with: /\A\d+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id     , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id       , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_cost_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id   , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :user            , presence: true
  validates :image           , presence: true

  belongs_to :user

# ActiveHashアソシエーション
  belongs_to :category
  belomgs_to :status
  belomgs_to :delivery_cost
  belomgs_to :prefecture
  belomgs_to :shipping_day
end