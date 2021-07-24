require 'rails_helper'

RSpec.describe "商品出品機能", type: :system do
  before do
    @farmer = FactoryBot.create(:farmer)
    @item = FactoryBot.build(:item)
  end

  context "商品出品できる時" do
    it "生産者ログインしたユーザーは出品できる" do
      # ログインする
      visit new_farmer_session_path
      fill_in "メールアドレス", with: @farmer.email
      fill_in "パスワード", with: @farmer.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 出品するボタンがあることを確認する
      expect(page).to have_content("出品する")
      # 出品ページへ移動する
      visit new_item_path
      # フォームに情報を入力する
      attach_file "商品画像", "#{Rails.root}/public/images/test_image.png"
      fill_in "商品名", with: @item.name
      fill_in "商品の説明", with: @item.description
      fill_in "内容量", with: @item.contents
      select '果菜類', from: 'カテゴリー'
      select '埼玉県', from: '産地'
      select '着払い(購入者負担)', from: '配送料の負担'
      select '1~2日で発送', from: '発送までの日数'
      fill_in "価格", with: @item.price
      # 送信するとItemモデルのカウントが1上がることを確認
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      # トップページへ移動することを確認
      expect(current_path).to eq(root_path)
      # トップページに先ほど出品した商品が存在することを確認(画像)
      expect(page).to have_selector("img[src$='test_image.png']")
      # トップページに先ほど出品した商品が存在することを確認(商品名)
      expect(page).to have_content(@item.name)
    end
  end
  context "商品出品できない時" do
    it "生産者ログインしていないユーザーは出品できない" do
      # トップページに移動
      visit root_path
      # 出品するボタンを押しても生産者ログインしていないと生産者ログインページへ移動することを確認
      click_link '出品する'
      expect(page).to have_content("生産者情報入力")
    end
  end
end
