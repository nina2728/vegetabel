require 'rails_helper'

RSpec.describe "Orders", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order)
  end

  context "商品購入できる時" do
    it "ログインしたユーザーは商品購入ができる" do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 出品済みの商品の詳細ページへ移動する
      visit item_path(@item.id)
      # 商品詳細ページに購入するボタンがあることを確認する
      expect(page).to have_content("購入")
      # 商品購入ページへ移動する
      visit new_item_purchase_item_path(@item)
      # フォームに情報を入力する
      fill_in "郵便番号", with: @order.postal_code
      select "埼玉県", from: "都道府県"
      fill_in "市区町村", with: @order.municipality
      fill_in "番地", with: @order.address
      find('#token', visible: false).set(@order.token)
      # 送信するとPurchase_itemモデル、Purchaseモデルのカウントが1あがることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Purchase.count }.by(1)
      # トップページへ移動することを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context "商品購入できない時" do
    it "ログインしていないユーザーは商品購入できない" do
      # 商品詳細ページへ移動
      visit item_path(@item.id)
      # 商品詳細ページに購入ボタンがないことを確認する
      expect(page).to have_no_content("購入する")
      # 直接パスを入力してもユーザーログインページへ戻されることを確認する
      visit new_item_purchase_item_path(@item)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
