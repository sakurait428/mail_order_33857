class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :user_birth_date
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :postal_code, format: { with: /\A[0-9]+\z/i, message: "is invalid."}
    validates :phone_number, format: { with: /\A[0-9]+\z/i, message: "is invalid."}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end

  validates :accepted, presence: {message: 'を入力してください'}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    params.delete(:password)
    params.delete(:password_confirmation)

    self.attributes = params
    result = self.save(validate: false)
    clean_up_passwords
    result
  end

end