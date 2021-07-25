require 'rails_helper'

RSpec.describe Farmer, type: :model do
  before do
    @farmer = FactoryBot.build(:farmer)
  end

  describe "生産者登録" do
    context "生産者登録できる時" do
      it "正しい値を入力すれば登録できる" do
        expect(@farmer).to be_valid
      end
      it "building_nameが空でも登録できる" do
        @farmer.building_name = ""
        expect(@farmer).to be_valid
      end
    end

    context "生産者登録できない時" do
      it "emailが空では登録できない" do
        @farmer.email = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Emailを入力してください")
      end
      it "passwordが空では登録できない" do
        @farmer.password = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Passwordを入力してください")
      end
      it "password_confirmationが空では登録できない" do
        @farmer.password_confirmation = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it "passwordが6文字以上でないと登録できない" do
        @farmer.password = "aaa11"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
      it "passwordが英語のみでは登録できない" do
        @farmer.password = "abcdef"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Passwordは不正な値です")
      end
      it "passwordが数字のみでは登録できない" do
        @farmer.password = "123456"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Passwordは不正な値です")
      end
      it "passwordに半角英数以外が入ると登録できない" do
        @farmer.password = "パスワードだよ"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Passwordは不正な値です")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @farmer.password_confirmation = "aaa111"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it "nameが空では登録できない" do
        @farmer.name = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Nameを入力してください")
      end
      it "representativeが空では登録できない" do
        @farmer.representative = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Representativeは不正な値です")
      end
      it "representativeが漢字以外では登録できない" do
        @farmer.representative = "yamadaたろう"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Representativeは不正な値です")
      end
      it "representative_kanaが空では登録できない" do
        @farmer.representative_kana = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Representative kanaは不正な値です")
      end
      it "representative_kanaがカタカタ以外では登録できない" do
        @farmer.representative_kana = "yamada太郎"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Representative kanaは不正な値です")
      end
      it "birthdayが空では登録できない" do
        @farmer.birthday = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Birthdayを入力してください")
      end
      it "postal_codeが空では登録できない" do
        @farmer.postal_code = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it "postal_codeがハイフン無しでは登録できない" do
        @farmer.postal_code = "1234567"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it "prefecture_idが1では登録できない" do
        @farmer.prefecture_id = "1"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it "municipalityが空では登録できない" do
        @farmer.municipality = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Municipalityを入力してください")
      end
      it "addressが空では登録できない" do
        @farmer.address = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Addressを入力してください")
      end
      it "phone_numberが空では登録できない" do
        @farmer.phone_number = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "phone_numberがハイフンありだと登録できない" do
        @farmer.phone_number = "090-0909-0909"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "phone_numberが10桁、11桁以外では登録できない" do
        @farmer.phone_number = "123456789"
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "careerが空では登録できない" do
        @farmer.career = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Careerを入力してください")
      end
      it "commentが空では登録できない" do
        @farmer.comment = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Commentを入力してください")
      end
      it "pointが空では登録できない" do
        @farmer.point = ""
        @farmer.valid?
        expect(@farmer.errors.full_messages).to include("Pointを入力してください")
      end
    end
  end
end
