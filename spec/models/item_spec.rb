require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品を出品できる時" do
      it "正しい値を入力すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品を出品できない時" do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end
      it "descriptionが空では出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Descriptionを入力してください")
      end
      it "contentsが空では出品できない" do
        @item.contents = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Contentsを入力してください")
      end
      it "priceが空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end
      it "priceが全角数字では出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
      it "priceが半角数字以外では出品できない" do
        @item.price = "abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
      it "prefecture_idが1では出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it "category_idが1では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it "delivery_idが1では出品できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryは1以外の値にしてください")
      end
      it "shipping_idが1では出品できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingは1以外の値にしてください")
      end
    end
  end
end
