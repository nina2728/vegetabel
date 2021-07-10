class Purchase < ApplicationRecord
  belongs_to :purchase_item

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    
  validates :prefecture_id, numericality: { other_than: 1, less_than_or_equal_to: 48 }
end
