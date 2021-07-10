class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building_name
      t.references :purchase_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
