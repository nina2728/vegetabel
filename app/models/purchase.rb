class Purchase < ApplicationRecord
  belongs_to :purchase_item

  POSTAL_REGEX   = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/

  with_options presence: true do
    validates :postal_code,  format: { with: POSTAL_REGEX }
    validates :municipality
    validates :address
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    
  validates :prefecture_id, numericality: { other_than: 1, less_than_or_equal_to: 48 }
end
