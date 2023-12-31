class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :delivery_cost_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :image, presence: true

  belongs_to :user
  has_one :order
  # ActiveHashアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_day
end
