class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :token

  POSTAL_REGEX   = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
  
  validates :postal_code, format: { with: POSTAL_REGEX }
  validates :prefecture_id, numericality: { other_than: 1, less_than_or_equal_to: 48 }
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :token
  end

  def save
    purchase_item = PurchaseItem.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, purchase_item_id: purchase_item.id)
  end
end