require 'rails_helper'

RSpec.describe "ItemsController", type: :request do
  before do
    @item = FactoryBot.create(:item)
    @farmer = FactoryBot.create(:farmer)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに出品済みの商品が存在する" do
      get root_path
      expect(response.body).to include(@item.name)
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get item_path(@item)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに選択した商品が存在する" do
      get item_path(@item)
      expect(response.body).to include(@item.name)
    end
  end

  describe "GET #new" do
    it "非ログインでnewアクションにリクエストすると生産者ログインページへリダイレクトされる" do
      get new_item_path
      expect(response).to redirect_to new_farmer_session_path
    end
    it "ログイン状態でnewアクションにリクエストすると正常にレスポンスが返ってくる" do
      sign_in @farmer
      get new_item_path
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "非ログインでcreateアクションにリクエストすると生産者ログインページへリダイレクトされる" do
      post items_path
      expect(response).to redirect_to new_farmer_session_path
    end
    it "ログイン状態でcreateアクションにリクエストすると正常にレスポンスが返ってくる" do
      sign_in @farmer
      expect {
        post :create, params: {
          item: {
            name: "トマト"
            description: "美味しいトマト"
            contents: "トマト１kg"
            category_id: 2
            prefecture_id: 2
            delivery_id: 2
            shipping_id: 2
            price: 100
            farmer_id: 1
          }
        }
      }.to change { Item.count }.by(1)
    end
    it "正常に商品を出品できるとトップページへ遷移する" do
      sign_in @farmer
      post items_path
      expect(current_path).to redirect_to root_path
    end
  end

  describe "GET #edit" do
    it "非ログインでeditアクションにリクエストすると生産者ログインページへリダイレクトされる" do
      get edit_item_path
      expect(response).to redirect_to new_farmer_session_path
    end
    it "ログイン状態でも商品の出品者とログイン状態のユーザーが一致しないとトップページへリダイレクトされる" do
      sign_in @farmer
      expect(current_path).to redirect_to root_path
    end
    it "ログイン状態のユーザーと出品者が一致すれば正常にレスポンスが返ってくる" do
      sign_in @farmer
      expect(response.status).to eq 200
    end
    it "ログイン状態のユーザーと出品者が一致すればレスポンスに出品済みのアイテムの情報が存在する" do
      sign_in @farmer
      expect(response.body).to include(@item.name)
    end
  end

  describe "PUTCH/PUT #update" do
    
  end

  describe "DELETE #destroy" do
    
  end
end
