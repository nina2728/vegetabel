class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  KANJI_REGEX    = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX     = /\A[ァ-ヶー－]+\z/.freeze
  POSTAL_REGEX   = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/

  validates :password,        format: { with: PASSWORD_REGEX }
  
  with_options presence: true do
      validates :nickname,        length: { maximum: 10 }
      validates :full_name_kanji, format: { with: KANJI_REGEX }
      validates :full_name_kana,  format: { with: KANA_REGEX }
      validates :postal_code,     format: { with: POSTAL_REGEX }
      validates :birthday
      validates :municipality
      validates :address
      validates :phone_number
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1, less_than_or_equal_to: 48 }

  has_many :purchase_items
end
