require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user) #FactoryBotの値を使用し、インスタンスを生成
  end

  describe 'ユーザー新規登録' do
  
  context "ユーザー登録ができる時" do
    it '各フォームが入力されていてば、登録が可能なこと' do
      expect(@user).to be_valid      
    end
  end

  context "ユーザー登録ができない時" do
    it '名字が必須であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it '名前が必須であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
    end
    it 'メールアドレスが必須であること' do
      @user.email = nil #emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)  #引数に”factory :user”を渡している
      another_user.email = @user.email #保存済みのemailを上書き
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'パスワードが全角では登録できないこと' do
      @user.password = 'ｐａｓｓｗｏｒｄ１２３'
      @user.password_confirmation = "ｐａｓｓｗｏｒｄ１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'パスワードが半角数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'パスワードが半角英語のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
    it 'パスワードが６文字以上でないと登録できないこと' do
      @user.password = 'ab12'
      @user.password_confirmation = "ab12"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = "abcd12"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = "123abc"
      @user.password_confirmation = "123abc4"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '生年月日が必須であること' do
      @user.user_birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    it '郵便番号が必須であること' do
      @user.postal_code = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号は半角数字で入力すること' do
      @user.postal_code = "１２３４５６７"
      @user.valid?
      expect(@user.errors.full_messages).to include("郵便番号は、ハイフンを含む、半角数字7桁で入力してください")
    end
    it '都道府県が選択されていること' do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("都道府県名を選択してください")
    end
    it '市町村が必須であること' do
      @user.city = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("市区町村名を入力してください")
    end
    it '番地が必須であること' do
      @user.block = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("番地・ビル名を入力してください")
    end
    it '電話番号が必須であること' do
      @user.phone_number = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号は半角数字で入力すること' do
      @user.phone_number = "０１２３４５６７８９０"
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号は、半角数字で入力して下さい")
    end
    it '電話番号は１１文字以内で入力すること' do
      @user.phone_number = "012345678901"
      @user.valid?
      expect(@user.errors.full_messages).to include("電話番号は、１１文字以内で入力して下さい")
    end
    it '会員規約に同意すること' do
      @user.accepted = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("会員規約に同意してください")
    end
  end
end
end