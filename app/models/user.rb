class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :user_birth_date
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :block
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "は、ハイフンを含む、半角数字7桁で入力してください"}
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: ""}, length: { maximum: 11, message: "は、半角数字で入力して下さい" }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end

  validates :accepted, presence: {message: 'に同意してください'}
  
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