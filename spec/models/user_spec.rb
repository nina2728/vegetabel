require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "正しい値を入力すれば登録できる" do
        expect(@user).to be_valid
      end
      it "building_nameが空でも登録できる" do
        @user.building_name = ""
        expect(@user).to be_valid
      end
    end

    context "新規登録できない時" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordに半角英数以外が入ると登録できない" do
        @user.password = "パスワードだよ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "full_name_kanjiが空では登録できない" do
        @user.full_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kanjiは不正な値です")
      end
      it "full_name_kanjiが漢字以外では登録できない" do
        @user.full_name_kanji = "yamadaたろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kanjiは不正な値です")
      end
      it "full_name_kanaが空では登録できない" do
        @user.full_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kanaは不正な値です")
      end
      it "full_name_kanaがカタカタ以外では登録できない" do
        @user.full_name_kana = "yamada太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kanaは不正な値です")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
      it "postal_codeが空では登録できない" do
        @user.postal_code = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it "postal_codeがハイフン無しでは登録できない" do
        @user.postal_code = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it "prefecture_idが1では登録できない" do
        @user.prefecture_id = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it "municipalityが空では登録できない" do
        @user.municipality = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Municipalityを入力してください")
      end
      it "addressが空では登録できない" do
        @user.address = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Addressを入力してください")
      end
      it "phone_numberが空では登録できない" do
        @user.phone_number = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "phone_numberがハイフンありだと登録できない" do
        @user.phone_number = "090-0909-0909"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "phone_numberが10桁、11桁以外では登録できない" do
        @user.phone_number = "123456789"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone numberは不正な値です")
      end
    end
  end
end
