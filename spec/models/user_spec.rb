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
      it "building_nameがnilでも登録できる" do
        @user.building_name = ""
        expect(@user).to be_valid
      end
    end

    context "新規登録できない時" do
      it "nicknameが空では登録できない" do
        
      end
      it "emailが空では登録できない" do
        
      end
      it "passwordが空では登録できない" do
        
      end
      it "password_confirmationが空では登録できない" do
        
      end
      it "passwordが6文字以上でないと登録できない" do
        
      end
      it "passwordが英語のみでは登録できない" do
        
      end
      it "passwordが数字のみでは登録できない" do
        
      end
      it "passwordに半角英数以外が入ると登録できない" do
        
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        
      end
      it "full_name_kanjiが空では登録できない" do
        
      end
      it "full_name_kanjiが漢字以外では登録できない" do
        
      end
      it "full_name_kanaが空では登録できない" do
        
      end
      it "full_name_kanaがカタカタ以外では登録できない" do
        
      end
      it "birthdayが空では登録できない" do
        
      end
      it "postal_codeが空では登録できない" do
        
      end
      it "postal_codeが" do
        
      end
      it "prefecture_idが1では登録できない" do
        
      end
      it "municipalityが空では登録できない" do
        
      end
      it "addressが空では登録できない" do
        
      end
      it "phone_numberが空では登録できない" do
        
      end
    end
  end
end
