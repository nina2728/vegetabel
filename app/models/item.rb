class Item < ApplicationRecord
  belongs_to :farmer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :category
    belongs_to :delivery

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id, numericality: { less_than_or_equal_to: 48 }
    validates :category_id, numericality: { less_than_or_equal_to: 6 }
    validates :delivery_id, numericality: { less_than_or_equal_to: 3 }
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :contents
    validates :price
  end
end