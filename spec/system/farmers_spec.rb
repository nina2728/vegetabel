require 'rails_helper'

RSpec.describe "生産者新規登録", type: :system do
  before do
    @farmer = FactoryBot.build(:farmer)
  end

  context "生産者登録できる時" do
    it "正しい値を入力すれば生産者登録できて、トップページへ遷移する" do
      # トップページへ移動する
      visit root_path
      # トップページにサインアップボタンがあることの確認
      expect(page).to have_content("生産者登録")
      # 生産者登録ページへ移動
      visit new_farmer_registration_path
      # 生産者情報入力
      fill_in "農園名", with: @farmer.name
      fill_in "メールアドレス", with: @farmer.email
      fill_in "パスワード", with: @farmer.password
      fill_in "パスワード(確認)", with: @farmer.password_confirmation
      fill_in "代表者お名前(全角)", with: @farmer.representative
      fill_in "代表者お名前カナ(全角)", with: @farmer.representative_kana
      fill_in "郵便番号(半角ハイフン含)", with: @farmer.postal_code
      select '埼玉県', from: '都道府県'
      fill_in "市区町村", with: @farmer.municipality
      fill_in "番地", with: @farmer.address
      fill_in "電話番号(半角数字ハイフン無)", with: @farmer.phone_number
      fill_in "ご経歴", with: @farmer.career
      fill_in "コメント", with: @farmer.comment
      fill_in "ポイント", with: @farmer.point
      select '1930',from: 'farmer[birthday(1i)]'
      select '12',from: 'farmer[birthday(2i)]'
      select '12',from: 'farmer[birthday(3i)]'
      # サインアップボタンを押すと生産者モデルのカウントが1上がることを確認
      expect{
        find('input[name="commit"]').click
      }.to change {Farmer.count }.by(1)
      # トップページへ遷移したことを確認
      expect(current_path).to eq(root_path)
      # ログアウトボタンがあることを確認
      expect(page).to have_content("ログアウト")
      # サインアップボタン、ログインボタンが表示されていないことを確認
      expect(page).to have_no_content("生産者ログイン")
      expect(page).to have_no_content("生産者登録")
    end
  end
  context "生産者登録できない時" do
    it "誤った値では生産者登録できずに、新規登録ページへ戻る" do
      # トップページへ移動する
      visit root_path
      # トップページにサインアップボタンがあることの確認
      expect(page).to have_content("生産者登録")
      # 生産者登録ページへ移動
      visit new_farmer_registration_path
      # 生産者情報入力
      fill_in "農園名", with: ""
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      fill_in "パスワード(確認)", with: ""
      fill_in "代表者お名前(全角)", with: ""
      fill_in "代表者お名前カナ(全角)", with: ""
      fill_in "郵便番号(半角ハイフン含)", with: ""
      fill_in "市区町村", with: ""
      fill_in "番地", with: ""
      fill_in "電話番号(半角数字ハイフン無)", with: ""
      fill_in "ご経歴", with: ""
      fill_in "コメント", with: ""
      fill_in "ポイント", with: ""
      # サインアップボタンを押しても生産者モデルのカウントが上がらないことを確認
      expect{
        find('input[name="commit"]').click
      }.to change { Farmer.count }.by(0)
      # 生産者登録ページへ戻されることを確認する
      expect(current_path).to eq farmer_registration_path
    end
  end
end