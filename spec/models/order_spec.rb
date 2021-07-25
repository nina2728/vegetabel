require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe "商品購入機能" do
    context "商品購入できる時" do
      it "正しい値を入力すれば商品購入できる" do
        expect(@order).to be_valid
      end
      it "building_nameを入力しなくても商品購入できる" do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context "商品購入できない時" do
      it "クレジットカード、又はクレジットカードの入力に不備がありPAYJPからトークンが発行されなければ購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "postal_codeが空では商品購入できない" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it "postal_codeがハイフン無しでは登録できない" do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it "prefecture_idが1では登録できない" do
        @order.prefecture_id = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it "municipalityが空では商品購入できない" do
        @order.municipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "addressが空では商品購入できない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it "ログイン状態でないと商品購入できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it "商品が存在しないと商品購入できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
