class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :token

  POSTAL_REGEX   = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: POSTAL_REGEX }
    validates :municipality
    validates :address
    validates :token
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1, less_than_or_equal_to: 48 }
end