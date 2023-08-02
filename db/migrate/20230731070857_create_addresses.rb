class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code            , null: false
      t.integer    :prefecture_id        , null: false
      t.string     :shipping_municipality, null: false
      t.string     :shipping_address     , null: false
      t.string     :shipping_building
      t.string     :buyer_phone_number   , null: false
      t.references :order                , null: false, foreign_key: true

      t.timestamps
    end
  end
end
