require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "ユーザー新規登録できる時" do
    it "正しい値を入力すればユーザー新規登録できて、トップページへ遷移する" do
      # トップページへ移動する
      visit root_path
      # トップページにサインアップボタンがあることの確認
      expect(page).to have_content("新規登録")
      # 新規登録ページへ移動
      visit new_user_registration_path
      # ユーザー情報入力
      fill_in "ニックネーム", with: @user.nickname
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      fill_in "パスワード(確認)", with: @user.password_confirmation
      fill_in "お名前(全角)", with: @user.full_name_kanji
      fill_in "お名前カナ(全角)", with: @user.full_name_kana
      fill_in "郵便番号(半角ハイフン含)", with: @user.postal_code
      select '埼玉県', from: '都道府県'
      fill_in "市区町村", with: @user.municipality
      fill_in "番地", with: @user.address
      fill_in "電話番号(半角数字ハイフン無)", with: @user.phone_number
      select '1930',from: 'user[birthday(1i)]'
      select '12',from: 'user[birthday(2i)]'
      select '12',from: 'user[birthday(3i)]'
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認
      expect{
        find('input[name="commit"]').click
      }.to change {User.count }.by(1)
      # トップページへ遷移したことを確認
      expect(current_path).to eq(root_path)
      # ログアウトボタンがあることを確認
      expect(page).to have_content("ログアウト")
      # サインアップボタン、ログインボタンが表示されていないことを確認
      expect(page).to have_no_content("ログイン")
      expect(page).to have_no_content("新規登録")
    end
  end
  context "ユーザー新規登録できない時" do
    it "誤った値ではユーザー新規登録できずに、新規登録ページへ戻る" do
      # トップページへ移動する
      visit root_path
      # トップページにサインアップボタンがあることの確認
      expect(page).to have_content("新規登録")
      # 新規登録ページへ移動
      visit new_user_registration_path
      # ユーザー情報入力
      fill_in "ニックネーム", with: ""
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      fill_in "パスワード(確認)", with: ""
      fill_in "お名前(全角)", with: ""
      fill_in "お名前カナ(全角)", with: ""
      fill_in "郵便番号(半角ハイフン含)", with: ""
      select '---', from: '都道府県'
      fill_in "市区町村", with: ""
      fill_in "番地", with: ""
      fill_in "電話番号(半角数字ハイフン無)", with: ""
      # サインアップボタンを押してもユーザーモデルのカウントが上がらないことを確認
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end
