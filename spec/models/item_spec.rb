require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
  
  context "商品登録ができる時" do
    it '各フォームが入力されていてば、登録が可能なこと' do
      expect(@item).to be_valid      
    end
  end

  context "ユーザー登録ができない時" do
    it '商品画像が必須であること' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品説明が必須であること' do
      @item.info_product = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it '価格が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end
    it 'サイズが必須であること' do
      @item.info_size = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("サイズを入力してください")
    end
    it '出品数が必須であること' do
      @item.stock_quantity = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品数を入力してください")
    end
    it 'カテゴリが必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
  end
end
end